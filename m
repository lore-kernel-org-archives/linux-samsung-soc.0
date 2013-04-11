From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] pinctrl: Add pinctrl-s3c24xx driver
Date: Thu, 11 Apr 2013 10:54:45 +0200
Message-ID: <3905101.tGGPWFz8Ff@amdc1227>
References: <201304110116.41525.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60070 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934340Ab3DKIzL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 04:55:11 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML3006VO23GGDE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Apr 2013 17:55:06 +0900 (KST)
In-reply-to: <201304110116.41525.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

Hi Heiko,

As previously, generally looks good to me, but see my comments inline.

On Thursday 11 of April 2013 01:16:41 Heiko St=FCbner wrote:
> The s3c24xx pins follow a similar pattern as the other Samsung SoCs a=
nd
> can therefore reuse the already introduced infrastructure.
>=20
> The s3c24xx SoCs have one design oddity in that the first 4 external
> interrupts do not reside in the eint pending register but in the main
> interrupt controller instead. We solve this by forwarding the externa=
l
> interrupt from the main controller into the irq domain of the pin ban=
k.
> The masking/acking of these interrupts is handled in the same way.
>=20
> Furthermore the S3C2412/2413 SoCs contain another oddity in that they
> keep the same 4 eints in the main interrupt controller and eintpend
> register and requiring ack operations to happen in both. To solve thi=
s
> a ctrl_type enum is introduced which can keep the type of controller

Hmm, I think you forgot to edit the commit message, since we decided to=
=20
replace ctrl_type with another compatible string.

> in the samsung_pin_ctrl struct for later retrieval.
>=20
> The ctrl_type enum contains only S3C24XX and S3C2412 types, as the
> eint-speciality is currently the only use-case. But it can be expaned
> if other SoCs gain special handling requirements later on.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes since v1:
> - address comments from Tomasz Figa:
>   * split handling functions for eints 0-3 for s3c2412 and all others
>   * change the handling for s3c2412 eints 0-3 in that they now use
>     chained_irq_* for the outer parent interrupt

OK, so you finally decided to use the way I suggested. Have you managed=
 to do=20
some testing on a S3C2412?

>=20
>  .../bindings/pinctrl/samsung-pinctrl.txt           |    8 +
>  drivers/gpio/gpio-samsung.c                        |    4 +
>  drivers/pinctrl/Kconfig                            |    5 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-s3c24xx.c                  |  664
> ++++++++++++++++++++ drivers/pinctrl/pinctrl-samsung.c               =
   | =20
> 10 +
>  drivers/pinctrl/pinctrl-samsung.h                  |   16 +
>  7 files changed, 708 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/pinctrl/pinctrl-s3c24xx.c
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctr=
l.txt
> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt index
> c70fca1..e4443e3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -7,6 +7,10 @@ on-chip controllers onto these pads.
>=20
>  Required Properties:
>  - compatible: should be one of the following.
> +  - "samsung,s3c2413-pinctrl": for S3C64xx-compatible pin-controller=
,
> +  - "samsung,s3c2416-pinctrl": for S3C64xx-compatible pin-controller=
,
> +  - "samsung,s3c2440-pinctrl": for S3C64xx-compatible pin-controller=
,
> +  - "samsung,s3c2450-pinctrl": for S3C64xx-compatible pin-controller=
,
>    - "samsung,s3c64xx-pinctrl": for S3C64xx-compatible pin-controller=
,
>    - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-cont=
roller.
> - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-control=
ler.
> @@ -106,6 +110,10 @@ B. External Wakeup Interrupts: For supporting ex=
ternal
> wakeup interrupts, a
>=20
>     - compatible: identifies the type of the external wakeup interrup=
t
> controller The possible values are:
> +     - samsung,s3c2410-wakeup-eint: represents wakeup interrupt cont=
roller
> +       found on Samsung S3C24xx SoCs except S3C2412 and S3C2413,
> +     - samsung,s3c2412-wakeup-eint: represents wakeup interrupt cont=
roller
> +       found on Samsung S3C2412 and S3C2413 SoCs,
>       - samsung,s3c64xx-wakeup-eint: represents wakeup interrupt cont=
roller
>         found on Samsung S3C64xx SoCs,
>       - samsung,exynos4210-wakeup-eint: represents wakeup interrupt
> controller diff --git a/drivers/gpio/gpio-samsung.c
> b/drivers/gpio/gpio-samsung.c index dc06a6f..73017b9 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -3026,6 +3026,10 @@ static __init int samsung_gpiolib_init(void)
>  	*/
>  	struct device_node *pctrl_np;
>  	static const struct of_device_id exynos_pinctrl_ids[] =3D {
> +		{ .compatible =3D "samsung,s3c2413-pinctrl", },
> +		{ .compatible =3D "samsung,s3c2416-pinctrl", },
> +		{ .compatible =3D "samsung,s3c2440-pinctrl", },
> +		{ .compatible =3D "samsung,s3c2450-pinctrl", },
>  		{ .compatible =3D "samsung,s3c64xx-pinctrl", },
>  		{ .compatible =3D "samsung,exynos4210-pinctrl", },
>  		{ .compatible =3D "samsung,exynos4x12-pinctrl", },
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 7402ac9..58d73ac 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -226,6 +226,11 @@ config PINCTRL_EXYNOS5440
>  	select PINMUX
>  	select PINCONF
>=20
> +config PINCTRL_S3C24XX
> +	bool "Samsung S3C24XX SoC pinctrl driver"
> +	depends on ARCH_S3C24XX
> +	select PINCTRL_SAMSUNG
> +
>  config PINCTRL_S3C64XX
>  	bool "Samsung S3C64XX SoC pinctrl driver"
>  	depends on ARCH_S3C64XX
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 21d34c2..1ccdfd8 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_PINCTRL_COH901)	+=3D pinctrl-coh901.o
>  obj-$(CONFIG_PINCTRL_SAMSUNG)	+=3D pinctrl-samsung.o
>  obj-$(CONFIG_PINCTRL_EXYNOS)	+=3D pinctrl-exynos.o
>  obj-$(CONFIG_PINCTRL_EXYNOS5440)	+=3D pinctrl-exynos5440.o
> +obj-$(CONFIG_PINCTRL_S3C24XX)	+=3D pinctrl-s3c24xx.o
>  obj-$(CONFIG_PINCTRL_S3C64XX)	+=3D pinctrl-s3c64xx.o
>  obj-$(CONFIG_PINCTRL_XWAY)	+=3D pinctrl-xway.o
>  obj-$(CONFIG_PINCTRL_LANTIQ)	+=3D pinctrl-lantiq.o
> diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c
> b/drivers/pinctrl/pinctrl-s3c24xx.c new file mode 100644
> index 0000000..8dffa2a
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-s3c24xx.c
> @@ -0,0 +1,664 @@
> +/*
> + * S3C24XX specific support for Samsung pinctrl/gpiolib driver.
> + *
> + * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This file contains the SamsungS3C24XX specific information requir=
ed by
> the + * the Samsung pinctrl/gpiolib driver. It also includes the
> implementation of + * external gpio and wakeup interrupt support.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irq.h>
> +#include <linux/of_irq.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +
> +#include <asm/mach/irq.h>
> +
> +#include "pinctrl-samsung.h"
> +
> +#define NUM_EINT	24
> +#define NUM_EINT_IRQ	6
> +#define EINT_MAX_PER_GROUP	8
> +
> +#define EINTPEND_REG	0xa8
> +#define EINTMASK_REG	0xa4
> +
> +#define EINT_GROUP(i)		((int)((i) / EINT_MAX_PER_GROUP))
> +#define EINT_REG(i)		((EINT_GROUP(i) * 4) + 0x88)
> +#define EINT_OFFS(i)		((i) % EINT_MAX_PER_GROUP * 4)
> +
> +#define EINT_LEVEL_LOW		0
> +#define EINT_LEVEL_HIGH		1
> +#define EINT_EDGE_FALLING	2
> +#define EINT_EDGE_RISING	4
> +#define EINT_EDGE_BOTH		6
> +#define EINT_MASK		0xf
> +
> +static struct samsung_pin_bank_type bank_type_1bit =3D {
> +	.fld_width =3D { 1, 1, },
> +	.reg_offset =3D { 0x00, 0x04, },
> +};
> +
> +static struct samsung_pin_bank_type bank_type_2bit =3D {
> +	.fld_width =3D { 2, 1, 2, },
> +	.reg_offset =3D { 0x00, 0x04, 0x08, },
> +};
> +
> +#define PIN_BANK_A(pins, reg, id)		\
> +	{						\
> +		.type		=3D &bank_type_1bit,	\
> +		.pctl_offset	=3D reg,			\
> +		.nr_pins	=3D pins,			\
> +		.eint_type	=3D EINT_TYPE_NONE,	\
> +		.name		=3D id			\
> +	}
> +
> +#define PIN_BANK_2BIT(pins, reg, id)		\
> +	{						\
> +		.type		=3D &bank_type_2bit,	\
> +		.pctl_offset	=3D reg,			\
> +		.nr_pins	=3D pins,			\
> +		.eint_type	=3D EINT_TYPE_NONE,	\
> +		.name		=3D id			\
> +	}
> +
> +#define PIN_BANK_2BIT_EINTW(pins, reg, id, eoffs, emask)\
> +	{						\
> +		.type		=3D &bank_type_2bit,	\
> +		.pctl_offset	=3D reg,			\
> +		.nr_pins	=3D pins,			\
> +		.eint_type	=3D EINT_TYPE_WKUP,	\
> +		.eint_func	=3D 2,			\
> +		.eint_mask	=3D emask,		\
> +		.eint_offset	=3D eoffs,		\
> +		.name		=3D id			\
> +	}
> +
> +/**
> + * struct s3c24xx_eint_data: EINT common data
> + * @drvdata: pin controller driver data
> + * @domains: IRQ domains of particular EINT interrupts

@parents:

> + */
> +struct s3c24xx_eint_data {
> +	struct samsung_pinctrl_drv_data *drvdata;
> +	struct irq_domain *domains[NUM_EINT];
> +	int parents[NUM_EINT_IRQ];
> +};
> +

I wonder if this struct should be documented as well.

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
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return trigger;
> +}
> +
> +static void s3c24xx_eint_set_handler(unsigned int irq, unsigned int =
type)
> +{
> +	/* Edge- and level-triggered interrupts need different handlers */
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		__irq_set_handler_locked(irq, handle_edge_irq);
> +	else
> +		__irq_set_handler_locked(irq, handle_level_irq);
> +}
> +
> +static void s3c24xx_eint_set_function(struct samsung_pinctrl_drv_dat=
a *d,
> +					struct samsung_pin_bank *bank, int pin)
> +{
> +	struct samsung_pin_bank_type *bank_type =3D bank->type;
> +	unsigned long flags;
> +	void __iomem *reg;
> +	u8 shift;
> +	u32 mask;
> +	u32 val;
> +
> +	/* Make sure that pin is configured as interrupt */
> +	reg =3D d->virt_base + bank->pctl_offset;
> +	shift =3D pin * bank_type->fld_width[PINCFG_TYPE_FUNC];
> +	mask =3D (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
> +
> +	spin_lock_irqsave(&bank->slock, flags);
> +
> +	val =3D readl(reg);
> +	val &=3D ~(mask << shift);
> +	val |=3D bank->eint_func << shift;
> +	writel(val, reg);
> +
> +	spin_unlock_irqrestore(&bank->slock, flags);
> +}
> +
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
> +	if (trigger < 0) {
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
> +	val &=3D ~(EINT_MASK << shift);
> +	val |=3D trigger << shift;
> +	writel(val, reg);
> +
> +	s3c24xx_eint_set_function(d, bank, data->hwirq);
> +
> +	return 0;
> +}
> +
> +/* handling of EINTs 0-3 on all except S3C2412 and S3C2413 */
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
> +	if (likely(parent_chip))

Hmm, is it possible that there is no parent chip here?

> +		parent_chip->irq_ack(irq_get_irq_data(parent_irq));
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
> +	if (likely(parent_chip))

Ditto.

> +		parent_chip->irq_mask(irq_get_irq_data(parent_irq));
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
> +	if (likely(parent_chip))

Ditto.

> +		parent_chip->irq_unmask(irq_get_irq_data(parent_irq));
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
> +	BUG_ON(!virq);
> +
> +	generic_handle_irq(virq);
> +}
> +
> +/* handling of EINTs 0-3 on S3C2412 and S3C2413 */
> +
> +static void s3c2412_eint0_3_ack(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +
> +	unsigned long bitval =3D 1UL << data->hwirq;
> +	writel(bitval, d->virt_base + EINTPEND_REG);
> +}
> +
> +static void s3c2412_eint0_3_mask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	unsigned long mask;
> +
> +	mask =3D readl(d->virt_base + EINTMASK_REG);
> +	mask |=3D (1UL << data->hwirq);
> +	writel(mask, d->virt_base + EINTMASK_REG);
> +}
> +
> +static void s3c2412_eint0_3_unmask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	unsigned long mask;
> +
> +	mask =3D readl(d->virt_base + EINTMASK_REG);
> +	mask &=3D ~(1UL << data->hwirq);
> +	writel(mask, d->virt_base + EINTMASK_REG);
> +}
> +
> +static struct irq_chip s3c2412_eint0_3_chip =3D {
> +	.name		=3D "s3c2412-eint0_3",
> +	.irq_ack	=3D s3c2412_eint0_3_ack,
> +	.irq_mask	=3D s3c2412_eint0_3_mask,
> +	.irq_unmask	=3D s3c2412_eint0_3_unmask,
> +	.irq_set_type	=3D s3c24xx_eint_type,
> +};
> +
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
> +
> +static void s3c24xx_eint_ack(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	unsigned char index =3D bank->eint_offset + data->hwirq;
> +
> +	writel(1UL << index, d->virt_base + EINTPEND_REG);
> +}
> +
> +static void s3c24xx_eint_mask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	unsigned char index =3D bank->eint_offset + data->hwirq;
> +	unsigned long mask;
> +
> +	mask =3D readl(d->virt_base + EINTMASK_REG);
> +	mask |=3D (1UL << index);
> +	writel(mask, d->virt_base + EINTMASK_REG);
> +}
> +
> +static void s3c24xx_eint_unmask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	unsigned char index =3D bank->eint_offset + data->hwirq;
> +	unsigned long mask;
> +
> +	mask =3D readl(d->virt_base + EINTMASK_REG);
> +	mask &=3D ~(1UL << index);
> +	writel(mask, d->virt_base + EINTMASK_REG);
> +}
> +
> +static struct irq_chip s3c24xx_eint_chip =3D {
> +	.name		=3D "s3c-eint",
> +	.irq_ack	=3D s3c24xx_eint_ack,
> +	.irq_mask	=3D s3c24xx_eint_mask,
> +	.irq_unmask	=3D s3c24xx_eint_unmask,
> +	.irq_set_type	=3D s3c24xx_eint_type,
> +};
> +
> +static inline void s3c24xx_demux_eint(unsigned int irq, struct irq_d=
esc
> *desc, +				      u32 offset, u32 range)
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
> +	pend &=3D ~mask;
> +	pend &=3D range;
> +
> +	while (pend) {
> +		unsigned int virq;
> +
> +		irq =3D __ffs(pend);
> +		pend &=3D ~(1 << irq);
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
> +
> +static void s3c24xx_demux_eint4_7(unsigned int irq, struct irq_desc =
*desc)
> +{
> +	s3c24xx_demux_eint(irq, desc, 0, 0xf0);
> +}
> +
> +static void s3c24xx_demux_eint8_23(unsigned int irq, struct irq_desc=
 *desc)
> +{
> +	s3c24xx_demux_eint(irq, desc, 8, 0xffff00);
> +}
> +
> +static irq_flow_handler_t s3c2410_eint_handlers[NUM_EINT_IRQ] =3D {
> +	s3c2410_demux_eint0_3,
> +	s3c2410_demux_eint0_3,
> +	s3c2410_demux_eint0_3,
> +	s3c2410_demux_eint0_3,
> +	s3c24xx_demux_eint4_7,
> +	s3c24xx_demux_eint8_23,
> +};
> +
> +static irq_flow_handler_t s3c2412_eint_handlers[NUM_EINT_IRQ] =3D {
> +	s3c2412_demux_eint0_3,
> +	s3c2412_demux_eint0_3,
> +	s3c2412_demux_eint0_3,
> +	s3c2412_demux_eint0_3,
> +	s3c24xx_demux_eint4_7,
> +	s3c24xx_demux_eint8_23,
> +};
> +
> +static int s3c24xx_gpf_irq_map(struct irq_domain *h, unsigned int vi=
rq,
> +					irq_hw_number_t hw)
> +{
> +	struct s3c24xx_eint_domain_data *ddata =3D h->host_data;
> +	struct samsung_pin_bank *bank =3D ddata->bank;
> +
> +	if (!(bank->eint_mask & (1 << (bank->eint_offset + hw))))
> +		return -EINVAL;
> +
> +	if (hw <=3D 3) {
> +		if (ddata->eint0_3_parent_only)
> +			irq_set_chip_and_handler(virq, &s3c2410_eint0_3_chip,
> +						 handle_edge_irq);
> +		else
> +			irq_set_chip_and_handler(virq, &s3c2412_eint0_3_chip,
> +						 handle_edge_irq);
> +	} else {
> +		irq_set_chip_and_handler(virq, &s3c24xx_eint_chip,
> +					 handle_edge_irq);
> +	}
> +	irq_set_chip_data(virq, bank);
> +	set_irq_flags(virq, IRQF_VALID);
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops s3c24xx_gpf_irq_ops =3D {
> +	.map	=3D s3c24xx_gpf_irq_map,
> +	.xlate	=3D irq_domain_xlate_twocell,
> +};
> +
> +static int s3c24xx_gpg_irq_map(struct irq_domain *h, unsigned int vi=
rq,
> +					irq_hw_number_t hw)
> +{
> +	struct s3c24xx_eint_domain_data *ddata =3D h->host_data;
> +	struct samsung_pin_bank *bank =3D ddata->bank;
> +
> +	if (!(bank->eint_mask & (1 << (bank->eint_offset + hw))))
> +		return -EINVAL;
> +
> +	irq_set_chip_and_handler(virq, &s3c24xx_eint_chip, handle_edge_irq)=
;
> +	irq_set_chip_data(virq, bank);
> +	set_irq_flags(virq, IRQF_VALID);
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops s3c24xx_gpg_irq_ops =3D {
> +	.map	=3D s3c24xx_gpg_irq_map,
> +	.xlate	=3D irq_domain_xlate_twocell,
> +};
> +
> +static const struct of_device_id s3c24xx_eint_irq_ids[] =3D {
> +	{ .compatible =3D "samsung,s3c2410-wakeup-eint", .data =3D (void *)=
1 },
> +	{ .compatible =3D "samsung,s3c2412-wakeup-eint", .data =3D (void *)=
0 },
> +	{ }
> +};
> +
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
> +		return -ENOMEM;
> +	}
> +	eint_data->drvdata =3D d;
> +
> +	handlers =3D eint0_3_parent_only ? s3c2410_eint_handlers
> +				       : s3c2412_eint_handlers;
> +	for (i =3D 0; i < NUM_EINT_IRQ; ++i) {
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
> +	for (i =3D 0; i < d->ctrl->nr_banks; ++i, ++bank) {
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
> +			return -ENOMEM;
> +		}
> +		ddata->bank =3D bank;
> +		ddata->eint_data =3D eint_data;
> +		ddata->eint0_3_parent_only =3D eint0_3_parent_only;
> +
> +		ops =3D (bank->eint_offset =3D=3D 0) ? &s3c24xx_gpf_irq_ops
> +					       : &s3c24xx_gpg_irq_ops;
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
> +		for (pin =3D 0; mask; ++pin, mask >>=3D 1) {
> +			if (irq > NUM_EINT)
> +				break;
> +			if (!(mask & 1))
> +				continue;
> +			eint_data->domains[irq] =3D bank->irq_domain;
> +			++irq;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct samsung_pin_bank s3c2413_pin_banks[] =3D {
> +	PIN_BANK_A(23, 0x000, "gpa"),
> +	PIN_BANK_2BIT(11, 0x010, "gpb"),
> +	PIN_BANK_2BIT(16, 0x020, "gpc"),
> +	PIN_BANK_2BIT(16, 0x030, "gpd"),
> +	PIN_BANK_2BIT(16, 0x040, "gpe"),
> +	PIN_BANK_2BIT_EINTW(8, 0x050, "gpf", 0, 0xff),
> +	PIN_BANK_2BIT_EINTW(16, 0x060, "gpg", 8, 0xffff00),
> +	PIN_BANK_2BIT(11, 0x070, "gph"),
> +	PIN_BANK_2BIT(13, 0x080, "gpj"),
> +};
> +
> +struct samsung_pin_ctrl s3c2413_pin_ctrl[] =3D {
> +	{
> +		.pin_banks	=3D s3c2413_pin_banks,
> +		.nr_banks	=3D ARRAY_SIZE(s3c2413_pin_banks),
> +		.eint_wkup_init =3D s3c24xx_eint_init,
> +		.label		=3D "S3C2413-GPIO",
> +		.type		=3D S3C2412,

This should be removed as well, shouldn't it?

> +	},
> +};
> +
> +static struct samsung_pin_bank s3c2416_pin_banks[] =3D {
> +	PIN_BANK_A(27, 0x000, "gpa"),
> +	PIN_BANK_2BIT(11, 0x010, "gpb"),
> +	PIN_BANK_2BIT(16, 0x020, "gpc"),
> +	PIN_BANK_2BIT(16, 0x030, "gpd"),
> +	PIN_BANK_2BIT(16, 0x040, "gpe"),
> +	PIN_BANK_2BIT_EINTW(8, 0x050, "gpf", 0, 0xff),
> +	PIN_BANK_2BIT_EINTW(8, 0x060, "gpg", 8, 0xff00),
> +	PIN_BANK_2BIT(15, 0x070, "gph"),
> +	PIN_BANK_2BIT(16, 0x0e0, "gpk"),
> +	PIN_BANK_2BIT(14, 0x0f0, "gpl"),
> +	PIN_BANK_2BIT(2, 0x100, "gpm"),
> +};
> +
> +struct samsung_pin_ctrl s3c2416_pin_ctrl[] =3D {
> +	{
> +		.pin_banks	=3D s3c2416_pin_banks,
> +		.nr_banks	=3D ARRAY_SIZE(s3c2416_pin_banks),
> +		.eint_wkup_init =3D s3c24xx_eint_init,
> +		.label		=3D "S3C2416-GPIO",
> +		.type		=3D S3C24XX,

Ditto.

> +	},
> +};
> +
> +static struct samsung_pin_bank s3c2440_pin_banks[] =3D {
> +	PIN_BANK_A(25, 0x000, "gpa"),
> +	PIN_BANK_2BIT(11, 0x010, "gpb"),
> +	PIN_BANK_2BIT(16, 0x020, "gpc"),
> +	PIN_BANK_2BIT(16, 0x030, "gpd"),
> +	PIN_BANK_2BIT(16, 0x040, "gpe"),
> +	PIN_BANK_2BIT_EINTW(8, 0x050, "gpf", 0, 0xff),
> +	PIN_BANK_2BIT_EINTW(16, 0x060, "gpg", 8, 0xffff00),
> +	PIN_BANK_2BIT(11, 0x070, "gph"),
> +	PIN_BANK_2BIT(13, 0x0d0, "gpj"),
> +};
> +
> +struct samsung_pin_ctrl s3c2440_pin_ctrl[] =3D {
> +	{
> +		.pin_banks	=3D s3c2440_pin_banks,
> +		.nr_banks	=3D ARRAY_SIZE(s3c2440_pin_banks),
> +		.eint_wkup_init =3D s3c24xx_eint_init,
> +		.label		=3D "S3C2440-GPIO",
> +		.type		=3D S3C24XX,

Ditto.

> +	},
> +};
> +
> +static struct samsung_pin_bank s3c2450_pin_banks[] =3D {
> +	PIN_BANK_A(28, 0x000, "gpa"),
> +	PIN_BANK_2BIT(11, 0x010, "gpb"),
> +	PIN_BANK_2BIT(16, 0x020, "gpc"),
> +	PIN_BANK_2BIT(16, 0x030, "gpd"),
> +	PIN_BANK_2BIT(16, 0x040, "gpe"),
> +	PIN_BANK_2BIT_EINTW(8, 0x050, "gpf", 0, 0xff),
> +	PIN_BANK_2BIT_EINTW(16, 0x060, "gpg", 8, 0xffff00),
> +	PIN_BANK_2BIT(15, 0x070, "gph"),
> +	PIN_BANK_2BIT(16, 0x0d0, "gpj"),
> +	PIN_BANK_2BIT(16, 0x0e0, "gpk"),
> +	PIN_BANK_2BIT(15, 0x0f0, "gpl"),
> +	PIN_BANK_2BIT(2, 0x100, "gpm"),
> +};
> +
> +struct samsung_pin_ctrl s3c2450_pin_ctrl[] =3D {
> +	{
> +		.pin_banks	=3D s3c2450_pin_banks,
> +		.nr_banks	=3D ARRAY_SIZE(s3c2450_pin_banks),
> +		.eint_wkup_init =3D s3c24xx_eint_init,
> +		.label		=3D "S3C2450-GPIO",
> +		.type		=3D S3C24XX,

Ditto.

> +	},
> +};
> diff --git a/drivers/pinctrl/pinctrl-samsung.c
> b/drivers/pinctrl/pinctrl-samsung.c index e836135..234c32f 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -977,6 +977,16 @@ static const struct of_device_id
> samsung_pinctrl_dt_match[] =3D { { .compatible =3D "samsung,s3c64xx-p=
inctrl",
>  		.data =3D s3c64xx_pin_ctrl },
>  #endif
> +#ifdef CONFIG_PINCTRL_S3C24XX
> +	{ .compatible =3D "samsung,s3c2413-pinctrl",
> +		.data =3D s3c2413_pin_ctrl },
> +	{ .compatible =3D "samsung,s3c2416-pinctrl",
> +		.data =3D s3c2416_pin_ctrl },
> +	{ .compatible =3D "samsung,s3c2440-pinctrl",
> +		.data =3D s3c2440_pin_ctrl },
> +	{ .compatible =3D "samsung,s3c2450-pinctrl",
> +		.data =3D s3c2450_pin_ctrl },
> +#endif
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
> diff --git a/drivers/pinctrl/pinctrl-samsung.h
> b/drivers/pinctrl/pinctrl-samsung.h index 7c7f9eb..8bd317c 100644
> --- a/drivers/pinctrl/pinctrl-samsung.h
> +++ b/drivers/pinctrl/pinctrl-samsung.h
> @@ -81,6 +81,16 @@ enum eint_type {
>  	EINT_TYPE_WKUP_MUX,
>  };
>=20
> +/**
> + * enum ctrl_type - variances of a pin controller type
> + * @S3C24XX: generic s3c24xx pin handling
> + * @S3C2412: s3c2412-type eints, existing in the main and eint contr=
ollers
> + */
> +enum ctrl_type {
> +	S3C24XX,
> +	S3C2412,
> +};

Diito.

> +
>  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
>  #define PIN_NAME_LENGTH	10
>=20
> @@ -164,6 +174,7 @@ struct samsung_pin_bank {
>   * @eint_wkup_init: platform specific callback to setup the external=
 wakeup
> *	interrupts for the controller.
>   * @label: for debug information.
> + * @type: type of pin-controller
>   */
>  struct samsung_pin_ctrl {
>  	struct samsung_pin_bank	*pin_banks;
> @@ -185,6 +196,7 @@ struct samsung_pin_ctrl {
>  	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
>  	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
>  	char		*label;
> +	enum ctrl_type	type;

Ditto.

Best regards,
--
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework

>  };
>=20
>  /**
> @@ -246,5 +258,9 @@ extern struct samsung_pin_ctrl exynos4210_pin_ctr=
l[];
>  extern struct samsung_pin_ctrl exynos4x12_pin_ctrl[];
>  extern struct samsung_pin_ctrl exynos5250_pin_ctrl[];
>  extern struct samsung_pin_ctrl s3c64xx_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2413_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2416_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2440_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2450_pin_ctrl[];
>=20
>  #endif /* __PINCTRL_SAMSUNG_H */
