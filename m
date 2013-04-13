From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v3] pinctrl: Add pinctrl-s3c24xx driver
Date: Sat, 13 Apr 2013 12:57:19 +0200
Message-ID: <51693A0F.30709@gmail.com>
References: <201304111409.01983.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:63902 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753007Ab3DMK5Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Apr 2013 06:57:24 -0400
Received: by mail-ea0-f171.google.com with SMTP id b15so1593845eae.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Apr 2013 03:57:22 -0700 (PDT)
In-Reply-To: <201304111409.01983.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

On 04/11/2013 02:09 PM, Heiko St=C3=BCbner wrote:
> The s3c24xx pins follow a similar pattern as the other Samsung SoCs a=
nd
> can therefore reuse the already introduced infrastructure.
>
> The s3c24xx SoCs have one design oddity in that the first 4 external
> interrupts do not reside in the eint pending register but in the main
> interrupt controller instead. We solve this by forwarding the externa=
l
> interrupt from the main controller into the irq domain of the pin ban=
k.
> The masking/acking of these interrupts is handled in the same way.
>
> Furthermore the S3C2412/2413 SoCs contain another oddity in that they
> keep the same 4 eints in the main interrupt controller and eintpend
> register and requiring ack operations to happen in both. This is solv=
ed
> by using different compatible properties for the wakeup eint node whi=
ch
> set a property accordingly.
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Just couple nitpicks below...

> ---
> changes since v2:
> - address more comments from Tomasz Figa:
>    * remove obsolete ctrl_type references
>    * remove redundant check for parent_chip
>    * update docs and commit message
>
> changes since v1:
> - address comments from Tomasz Figa:
>    * split handling functions for eints 0-3 for s3c2412 and all other=
s
>    * change the handling for s3c2412 eints 0-3 in that they now use
>      chained_irq_* for the outer parent interrupt
>
>   .../bindings/pinctrl/samsung-pinctrl.txt           |    8 +
>   drivers/gpio/gpio-samsung.c                        |    4 +
>   drivers/pinctrl/Kconfig                            |    5 +
>   drivers/pinctrl/Makefile                           |    1 +
>   drivers/pinctrl/pinctrl-s3c24xx.c                  |  664 +++++++++=
+++++++++++
>   drivers/pinctrl/pinctrl-samsung.c                  |   10 +
>   drivers/pinctrl/pinctrl-samsung.h                  |    4 +
>   7 files changed, 696 insertions(+), 0 deletions(-)
>   create mode 100644 drivers/pinctrl/pinctrl-s3c24xx.c
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index c70fca1..e4443e3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -7,6 +7,10 @@ on-chip controllers onto these pads.
>
>   Required Properties:
>   - compatible: should be one of the following.
> +  - "samsung,s3c2413-pinctrl": for S3C64xx-compatible pin-controller=
,
> +  - "samsung,s3c2416-pinctrl": for S3C64xx-compatible pin-controller=
,
> +  - "samsung,s3c2440-pinctrl": for S3C64xx-compatible pin-controller=
,
> +  - "samsung,s3c2450-pinctrl": for S3C64xx-compatible pin-controller=
,

Shouldn't "S3C64xx" be changed to match each SoC name ?

>     - "samsung,s3c64xx-pinctrl": for S3C64xx-compatible pin-controlle=
r,
>     - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-con=
troller.
>     - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-con=
troller.
> @@ -106,6 +110,10 @@ B. External Wakeup Interrupts: For supporting ex=
ternal wakeup interrupts, a
>
>      - compatible: identifies the type of the external wakeup interru=
pt controller
>        The possible values are:
> +     - samsung,s3c2410-wakeup-eint: represents wakeup interrupt cont=
roller
> +       found on Samsung S3C24xx SoCs except S3C2412 and S3C2413,
> +     - samsung,s3c2412-wakeup-eint: represents wakeup interrupt cont=
roller
> +       found on Samsung S3C2412 and S3C2413 SoCs,
>        - samsung,s3c64xx-wakeup-eint: represents wakeup interrupt con=
troller
>          found on Samsung S3C64xx SoCs,
>        - samsung,exynos4210-wakeup-eint: represents wakeup interrupt =
controller
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.=
c
> index dc06a6f..73017b9 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -3026,6 +3026,10 @@ static __init int samsung_gpiolib_init(void)
>   	*/
>   	struct device_node *pctrl_np;
>   	static const struct of_device_id exynos_pinctrl_ids[] =3D {
> +		{ .compatible =3D "samsung,s3c2413-pinctrl", },
> +		{ .compatible =3D "samsung,s3c2416-pinctrl", },
> +		{ .compatible =3D "samsung,s3c2440-pinctrl", },
> +		{ .compatible =3D "samsung,s3c2450-pinctrl", },
>   		{ .compatible =3D "samsung,s3c64xx-pinctrl", },
>   		{ .compatible =3D "samsung,exynos4210-pinctrl", },
>   		{ .compatible =3D "samsung,exynos4x12-pinctrl", },
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 7402ac9..58d73ac 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -226,6 +226,11 @@ config PINCTRL_EXYNOS5440
>   	select PINMUX
>   	select PINCONF
>
> +config PINCTRL_S3C24XX
> +	bool "Samsung S3C24XX SoC pinctrl driver"
> +	depends on ARCH_S3C24XX
> +	select PINCTRL_SAMSUNG
> +
>   config PINCTRL_S3C64XX
>   	bool "Samsung S3C64XX SoC pinctrl driver"
>   	depends on ARCH_S3C64XX
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 21d34c2..1ccdfd8 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_PINCTRL_COH901)	+=3D pinctrl-coh901.o
>   obj-$(CONFIG_PINCTRL_SAMSUNG)	+=3D pinctrl-samsung.o
>   obj-$(CONFIG_PINCTRL_EXYNOS)	+=3D pinctrl-exynos.o
>   obj-$(CONFIG_PINCTRL_EXYNOS5440)	+=3D pinctrl-exynos5440.o
> +obj-$(CONFIG_PINCTRL_S3C24XX)	+=3D pinctrl-s3c24xx.o
>   obj-$(CONFIG_PINCTRL_S3C64XX)	+=3D pinctrl-s3c64xx.o
>   obj-$(CONFIG_PINCTRL_XWAY)	+=3D pinctrl-xway.o
>   obj-$(CONFIG_PINCTRL_LANTIQ)	+=3D pinctrl-lantiq.o
> diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c b/drivers/pinctrl/pinc=
trl-s3c24xx.c
> new file mode 100644
> index 0000000..4b03c8f
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-s3c24xx.c
> @@ -0,0 +1,664 @@
> +/*
> + * S3C24XX specific support for Samsung pinctrl/gpiolib driver.
> + *
> + * Copyright (c) 2013 Heiko Stuebner<heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This file contains the SamsungS3C24XX specific information requir=
ed by the
> + * the Samsung pinctrl/gpiolib driver. It also includes the implemen=
tation of

s/the Samsung/Samsung

> + * external gpio and wakeup interrupt support.
> + */
> +
[...]
> +/**
> + * struct s3c24xx_eint_domain_data: per irq-domain data
> + * @bank

Missing description.

> + * @eint_data: common data
> + * eint0_3_parent_only: live eints 0-3 only in the main intc
> + */
> +struct s3c24xx_eint_domain_data {
> +	struct samsung_pin_bank *bank;
> +	struct s3c24xx_eint_data *eint_data;
> +	bool eint0_3_parent_only;
> +};
> +
> +static int s3c24xx_eint_get_trigger(unsigned int type)
> +{
> +	int trigger;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		trigger =3D EINT_EDGE_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		trigger =3D EINT_EDGE_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		trigger =3D EINT_EDGE_BOTH;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		trigger =3D EINT_LEVEL_HIGH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		trigger =3D EINT_LEVEL_LOW;
> +		break;

EINT_* could be directly returned above, and the local variable is not
needed then. That's presumably just a matter of personal preference tho=
ugh.

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return trigger;
> +}

> +static int s3c24xx_eint_type(struct irq_data *data, unsigned int typ=
e)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	int index =3D bank->eint_offset + data->hwirq;
> +	void __iomem *reg;
> +	int trigger;
> +	u8 shift;
> +	u32 val;
> +
> +	trigger =3D s3c24xx_eint_get_trigger(type);
> +	if (trigger<  0) {
> +		dev_err(d->dev, "unsupported external interrupt type\n");
> +		return -EINVAL;
> +	}
> +
> +	s3c24xx_eint_set_handler(data->irq, type);
> +
> +	/* Set up interrupt trigger */
> +	reg =3D d->virt_base + EINT_REG(index);
> +	shift =3D EINT_OFFS(index);
> +
> +	val =3D readl(reg);
> +	val&=3D ~(EINT_MASK<<  shift);
> +	val |=3D trigger<<  shift;
> +	writel(val, reg);
> +
> +	s3c24xx_eint_set_function(d, bank, data->hwirq);
> +
> +	return 0;
> +}
> +
> +/* handling of EINTs 0-3 on all except S3C2412 and S3C2413 */

s/handling/Handling ?

> +
> +static void s3c2410_eint0_3_ack(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain->host_d=
ata;
> +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> +	int parent_irq =3D eint_data->parents[data->hwirq];
> +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> +
> +	parent_chip->irq_ack(irq_get_irq_data(parent_irq));
> +}
> +
> +static void s3c2410_eint0_3_mask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain->host_d=
ata;
> +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> +	int parent_irq =3D eint_data->parents[data->hwirq];
> +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> +
> +	parent_chip->irq_mask(irq_get_irq_data(parent_irq));
> +}
> +
> +static void s3c2410_eint0_3_unmask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain->host_d=
ata;
> +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> +	int parent_irq =3D eint_data->parents[data->hwirq];
> +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> +
> +	parent_chip->irq_unmask(irq_get_irq_data(parent_irq));
> +}
> +
> +static struct irq_chip s3c2410_eint0_3_chip =3D {
> +	.name		=3D "s3c2410-eint0_3",
> +	.irq_ack	=3D s3c2410_eint0_3_ack,
> +	.irq_mask	=3D s3c2410_eint0_3_mask,
> +	.irq_unmask	=3D s3c2410_eint0_3_unmask,
> +	.irq_set_type	=3D s3c24xx_eint_type,
> +};
> +
> +static void s3c2410_demux_eint0_3(unsigned int irq, struct irq_desc =
*desc)
> +{
> +	struct irq_data *data =3D irq_desc_get_irq_data(desc);
> +	struct s3c24xx_eint_data *eint_data =3D irq_get_handler_data(irq);
> +	unsigned int virq;
> +
> +	/* the first 4 eints have a simple 1 to 1 mapping */
> +	virq =3D irq_linear_revmap(eint_data->domains[data->hwirq], data->h=
wirq);
> +	/* Something must be really wrong if an unmapped EINT
> +	 * was unmasked...
> +	 */

Not a proper multi line comment style.

> +	BUG_ON(!virq);
> +
> +	generic_handle_irq(virq);
> +}
> +
> +/* handling of EINTs 0-3 on S3C2412 and S3C2413 */

s/handling/Handling ?

> +static void s3c2412_demux_eint0_3(unsigned int irq, struct irq_desc =
*desc)
> +{
> +	struct irq_chip *chip =3D irq_get_chip(irq);
> +	struct irq_data *data =3D irq_desc_get_irq_data(desc);
> +	struct s3c24xx_eint_data *eint_data =3D irq_get_handler_data(irq);
> +	unsigned int virq;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	/* the first 4 eints have a simple 1 to 1 mapping */
> +	virq =3D irq_linear_revmap(eint_data->domains[data->hwirq], data->h=
wirq);
> +	/* Something must be really wrong if an unmapped EINT
> +	 * was unmasked...
> +	 */
> +	BUG_ON(!virq);
> +
> +	generic_handle_irq(virq);
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +/* handling of all other eints */

s/handling/Handling ?

> +static inline void s3c24xx_demux_eint(unsigned int irq, struct irq_d=
esc *desc,
> +				      u32 offset, u32 range)
> +{
> +	struct irq_chip *chip =3D irq_get_chip(irq);
> +	struct s3c24xx_eint_data *data =3D irq_get_handler_data(irq);
> +	struct samsung_pinctrl_drv_data *d =3D data->drvdata;
> +	unsigned int pend, mask;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	pend =3D readl(d->virt_base + EINTPEND_REG);
> +	mask =3D readl(d->virt_base + EINTMASK_REG);
> +
> +	pend&=3D ~mask;
> +	pend&=3D range;
> +
> +	while (pend) {
> +		unsigned int virq;
> +
> +		irq =3D __ffs(pend);
> +		pend&=3D ~(1<<  irq);
> +		virq =3D irq_linear_revmap(data->domains[irq], irq - offset);
> +		/* Something must be really wrong if an unmapped EINT
> +		 * was unmasked...
> +		 */
> +		BUG_ON(!virq);
> +
> +		generic_handle_irq(virq);
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}

> +static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
> +{
> +	struct device *dev =3D d->dev;
> +	const struct of_device_id *match;
> +	struct device_node *eint_np =3D NULL;
> +	struct device_node *np;
> +	struct samsung_pin_bank *bank;
> +	struct s3c24xx_eint_data *eint_data;
> +	const struct irq_domain_ops *ops;
> +	unsigned int i;
> +	bool eint0_3_parent_only;
> +	irq_flow_handler_t *handlers;
> +
> +	for_each_child_of_node(dev->of_node, np) {
> +		match =3D of_match_node(s3c24xx_eint_irq_ids, np);
> +		if (match) {
> +			eint_np =3D np;
> +			eint0_3_parent_only =3D (bool)match->data;
> +			break;
> +		}
> +	}
> +	if (!eint_np)
> +		return -ENODEV;
> +
> +	eint_data =3D devm_kzalloc(dev, sizeof(*eint_data), GFP_KERNEL);
> +	if (!eint_data) {
> +		dev_err(dev, "could not allocate memory for wkup eint data\n");

k*alloc functions already log any errors, you could just return -ENOMEM=
,
without printing anything.

> +		return -ENOMEM;
> +	}
> +	eint_data->drvdata =3D d;
> +
> +	handlers =3D eint0_3_parent_only ? s3c2410_eint_handlers
> +				       : s3c2412_eint_handlers;
> +	for (i =3D 0; i<  NUM_EINT_IRQ; ++i) {
> +		unsigned int irq;
> +
> +		irq =3D irq_of_parse_and_map(eint_np, i);
> +		if (!irq) {
> +			dev_err(dev, "failed to get wakeup EINT IRQ %d\n", i);
> +			return -ENXIO;
> +		}
> +
> +		eint_data->parents[i] =3D irq;
> +		irq_set_chained_handler(irq, handlers[i]);
> +		irq_set_handler_data(irq, eint_data);
> +	}
> +
> +	bank =3D d->ctrl->pin_banks;
> +	for (i =3D 0; i<  d->ctrl->nr_banks; ++i, ++bank) {
> +		struct s3c24xx_eint_domain_data *ddata;
> +		unsigned int mask;
> +		unsigned int irq;
> +		unsigned int pin;
> +
> +		if (bank->eint_type !=3D EINT_TYPE_WKUP)
> +			continue;
> +
> +		ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +		if (!ddata) {
> +			dev_err(dev, "failed to allocate domain data\n");

Ditto.

> +			return -ENOMEM;
> +		}
> +		ddata->bank =3D bank;
> +		ddata->eint_data =3D eint_data;
> +		ddata->eint0_3_parent_only =3D eint0_3_parent_only;
> +
> +		ops =3D (bank->eint_offset =3D=3D 0) ?&s3c24xx_gpf_irq_ops
> +					       :&s3c24xx_gpg_irq_ops;
> +
> +		bank->irq_domain =3D irq_domain_add_linear(bank->of_node,
> +				bank->nr_pins, ops, ddata);
> +		if (!bank->irq_domain) {
> +			dev_err(dev, "wkup irq domain add failed\n");
> +			return -ENXIO;
> +		}
> +
> +		irq =3D bank->eint_offset;
> +		mask =3D bank->eint_mask;
> +		for (pin =3D 0; mask; ++pin, mask>>=3D 1) {
> +			if (irq>  NUM_EINT)
> +				break;
> +			if (!(mask&  1))
> +				continue;
> +			eint_data->domains[irq] =3D bank->irq_domain;
> +			++irq;
> +		}
> +	}
> +
> +	return 0;
> +}

Regards,
Sylwester
