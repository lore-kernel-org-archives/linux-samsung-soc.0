From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: Add pinctrl-s3c24xx driver
Date: Wed, 10 Apr 2013 12:36:39 +0200
Message-ID: <1376906.qvoN3qK2gl@flatron>
References: <201304100135.12471.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201304100135.12471.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, linus.walleij@linaro.org, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Heiko,

Basically looks good to me, but please see my inline comments about =

handling of EINT0-3.

On Wednesday 10 of April 2013 01:35:12 Heiko St=FCbner wrote:
> The s3c24xx pins follow a similar pattern as the other Samsung SoCs and
> can therefore reuse the already introduced infrastructure.
> =

> The s3c24xx SoCs have one design oddity in that the first 4 external
> interrupts do not reside in the eint pending register but in the main
> interrupt controller instead. We solve this by forwarding the external
> interrupt from the main controller into the irq domain of the pin bank.
> The masking/acking of these interrupts is handled in the same way.
> =

> Furthermore the S3C2412/2413 SoCs contain another oddity in that they
> keep the same 4 eints in the main interrupt controller and eintpend
> register and requiring ack operations to happen in both. To solve this
> a ctrl_type enum is introduced which can keep the type of controller
> in the samsung_pin_ctrl struct for later retrieval.
> =

> The ctrl_type enum contains only S3C24XX and S3C2412 types, as the
> eint-speciality is currently the only use-case. But it can be expaned
> if other SoCs gain special handling requirements later on.
> =

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Depends on the s3c64xx pinctrl work from Tomasz Figa.
> =

> It also does not yet contain the pin-definitions for all s3c24xx SoCs,
> as I don't have datasheets for them.
> =

> Tested on a s3c2416 based board.
> =

>  .../bindings/pinctrl/samsung-pinctrl.txt           |    4 +
>  drivers/gpio/gpio-samsung.c                        |    4 +
>  drivers/pinctrl/Kconfig                            |    5 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-s3c24xx.c                  |  603
> ++++++++++++++++++++ drivers/pinctrl/pinctrl-samsung.c                 =

> |   10 +
>  drivers/pinctrl/pinctrl-samsung.h                  |   16 +
>  7 files changed, 643 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/pinctrl/pinctrl-s3c24xx.c
> =

> diff --git
> a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt index
> c70fca1..1d8fc3c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -7,6 +7,10 @@ on-chip controllers onto these pads.
> =

>  Required Properties:
>  - compatible: should be one of the following.
> +  - "samsung,s3c2413-pinctrl": for S3C64xx-compatible pin-controller,
> +  - "samsung,s3c2416-pinctrl": for S3C64xx-compatible pin-controller,
> +  - "samsung,s3c2440-pinctrl": for S3C64xx-compatible pin-controller,
> +  - "samsung,s3c2450-pinctrl": for S3C64xx-compatible pin-controller,
>    - "samsung,s3c64xx-pinctrl": for S3C64xx-compatible pin-controller,
>    - "samsung,exynos4210-pinctrl": for Exynos4210 compatible
> pin-controller. - "samsung,exynos4x12-pinctrl": for Exynos4x12
> compatible pin-controller. diff --git a/drivers/gpio/gpio-samsung.c
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
> =

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
> @@ -45,6 +45,7 @@ obj-$(CONFIG_PINCTRL_COH901)	+=3D pinctrl-
coh901.o
>  obj-$(CONFIG_PINCTRL_SAMSUNG)	+=3D pinctrl-samsung.o
>  obj-$(CONFIG_PINCTRL_EXYNOS)	+=3D pinctrl-exynos.o
>  obj-$(CONFIG_PINCTRL_EXYNOS5440)	+=3D pinctrl-exynos5440.o
> +obj-$(CONFIG_PINCTRL_S3C24XX)	+=3D pinctrl-s3c24xx.o
>  obj-$(CONFIG_PINCTRL_S3C64XX)	+=3D pinctrl-s3c64xx.o
>  obj-$(CONFIG_PINCTRL_XWAY)	+=3D pinctrl-xway.o
>  obj-$(CONFIG_PINCTRL_LANTIQ)	+=3D pinctrl-lantiq.o
> diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c
> b/drivers/pinctrl/pinctrl-s3c24xx.c new file mode 100644
> index 0000000..6b05519
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-s3c24xx.c
> @@ -0,0 +1,603 @@
> +/*
> + * Exynos specific support for Samsung pinctrl/gpiolib driver with eint
> support. + *
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + * Copyright (c) 2012 Linaro Ltd
> + *		http://www.linaro.org
> + *
> + * Author: Thomas Abraham <thomas.ab@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published
> by + * the Free Software Foundation; either version 2 of the License,
> or + * (at your option) any later version.
> + *
> + * This file contains the Samsung Exynos specific information required
> by the + * the Samsung pinctrl/gpiolib driver. It also includes the
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
> + */
> +struct s3c24xx_eint_data {
> +	struct samsung_pinctrl_drv_data *drvdata;
> +	struct irq_domain *domains[NUM_EINT];
> +	int parents[NUM_EINT_IRQ];
> +};
> +
> +struct s3c24xx_eint_domain_data {
> +	struct samsung_pin_bank *bank;
> +	struct s3c24xx_eint_data *eint_data;

What about:

+	bool eint0_3_parent_only;

(or whatever name would be more appropriate), which would store the =

information about the s3c24xx-specific quirk in 24xx-specific data =

structure, without the need to add another field to the generic =

samsung_pinctrl_drv_data structure?

See my further comments on how I would see using this field in interrupt =

handling code.

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
> +static void s3c24xx_eint_set_handler(unsigned int irq, unsigned int
> type) +{
> +	/* Edge- and level-triggered interrupts need different handlers */
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		__irq_set_handler_locked(irq, handle_edge_irq);
> +	else
> +		__irq_set_handler_locked(irq, handle_level_irq);
> +}
> +
> +static void s3c24xx_eint_set_function(struct samsung_pinctrl_drv_data
> *d, +					struct samsung_pin_bank *bank, int =

pin)
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
> +static int s3c24xx_eint_type(struct irq_data *data, unsigned int type)
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

Now I would split the following 3 functions into two sets of 3 functions, =

one set for s3c2412 and other for remaining SoCs and make separate EINT0-3 =

IRQ chips for both cases.

> +
> +static void s3c24xx_eint0_3_ack(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain-
>host_data;
> +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> +	int parent_irq =3D eint_data->parents[data->hwirq];
> +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> +
> +	if (d->ctrl->type =3D=3D S3C2412) {
> +		unsigned long bitval =3D 1UL << data->hwirq;
> +		writel(bitval, d->virt_base + EINTPEND_REG);
> +	}
> +
> +	if (parent_chip->irq_ack)
> +		parent_chip->irq_ack(irq_get_irq_data(parent_irq));

Btw. Is this parent level acking really needed here?

> +}
> +
> +static void s3c24xx_eint0_3_mask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain-
>host_data;
> +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> +	int parent_irq =3D eint_data->parents[data->hwirq];
> +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> +
> +	if (d->ctrl->type =3D=3D S3C2412) {
> +		unsigned long mask;
> +		mask =3D readl(d->virt_base + EINTMASK_REG);
> +		mask |=3D (1UL << data->hwirq);
> +		writel(mask, d->virt_base + EINTMASK_REG);
> +	}
> +
> +	if (parent_chip->irq_mask)
> +		parent_chip->irq_mask(irq_get_irq_data(parent_irq));
> +}
> +
> +static void s3c24xx_eint0_3_unmask(struct irq_data *data)
> +{
> +	struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(data);
> +	struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> +	struct s3c24xx_eint_domain_data *ddata =3D bank->irq_domain-
>host_data;
> +	struct s3c24xx_eint_data *eint_data =3D ddata->eint_data;
> +	int parent_irq =3D eint_data->parents[data->hwirq];
> +	struct irq_chip *parent_chip =3D irq_get_chip(parent_irq);
> +
> +	if (d->ctrl->type =3D=3D S3C2412) {
> +		unsigned long mask;
> +		mask =3D readl(d->virt_base + EINTMASK_REG);
> +		mask &=3D ~(1UL << data->hwirq);
> +		writel(mask, d->virt_base + EINTMASK_REG);
> +	}
> +
> +	if (parent_chip->irq_unmask)
> +		parent_chip->irq_unmask(irq_get_irq_data(parent_irq));
> +}
> +
> +static struct irq_chip s3c24xx_eint0_3_chip =3D {
> +	.name		=3D "s3c-eint0_3",
> +	.irq_ack	=3D s3c24xx_eint0_3_ack,
> +	.irq_mask	=3D s3c24xx_eint0_3_mask,
> +	.irq_unmask	=3D s3c24xx_eint0_3_unmask,
> +	.irq_set_type	=3D s3c24xx_eint_type,
> +};
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
> +static void s3c24xx_demux_eint0_3(unsigned int irq, struct irq_desc
> *desc) +{
> +	struct irq_data *data =3D irq_desc_get_irq_data(desc);
> +	struct s3c24xx_eint_data *eint_data =3D irq_get_handler_data(irq);
> +	unsigned int virq;
> +

Instead of acking the interrupt at parent chip from ack callback of =

EINT0_3 chip, I would rather use chained_irq_enter() here...

> +	/* the first 4 eints have a simple 1 to 1 mapping */
> +	virq =3D irq_linear_revmap(eint_data->domains[data->hwirq],
> data->hwirq); +	/* Something must be really wrong if an unmapped =

EINT
> +	 * was unmasked...
> +	 */
> +	BUG_ON(!virq);
> +
> +	generic_handle_irq(virq);

...and chained_irq_exit() here.

> +}
> +
> +static inline void s3c24xx_demux_eint(unsigned int irq, struct irq_desc
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
> +		virq =3D irq_linear_revmap(data->domains[irq], irq - =

offset);
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
> +static void s3c24xx_demux_eint4_7(unsigned int irq, struct irq_desc
> *desc) +{
> +	s3c24xx_demux_eint(irq, desc, 0, 0xf0);
> +}
> +
> +static void s3c24xx_demux_eint8_23(unsigned int irq, struct irq_desc
> *desc) +{
> +	s3c24xx_demux_eint(irq, desc, 8, 0xffff00);
> +}
> +
> +static irq_flow_handler_t s3c24xx_eint_handlers[NUM_EINT_IRQ] =3D {
> +	s3c24xx_demux_eint0_3,
> +	s3c24xx_demux_eint0_3,
> +	s3c24xx_demux_eint0_3,
> +	s3c24xx_demux_eint0_3,
> +	s3c24xx_demux_eint4_7,
> +	s3c24xx_demux_eint8_23,
> +};
> +
> +static int s3c24xx_gpf_irq_map(struct irq_domain *h, unsigned int virq,
> +					irq_hw_number_t hw)
> +{
> +	struct s3c24xx_eint_domain_data *ddata =3D h->host_data;
> +	struct samsung_pin_bank *bank =3D ddata->bank;
> +
> +	if (!(bank->eint_mask & (1 << (bank->eint_offset + hw))))
> +		return -EINVAL;
> +
> +	if (hw <=3D 3) {

Now here I would check ddata->eint0_3_parent_only and set the chip =

conditionally, either to s3c24xx or s3c2412 variant.

> +		irq_set_chip_and_handler(virq, &s3c24xx_eint0_3_chip,
> +					 handle_edge_irq);
> +		irq_set_chip_data(virq, bank);
> +	} else {
> +		irq_set_chip_and_handler(virq, &s3c24xx_eint_chip,
> +					 handle_edge_irq);
> +		irq_set_chip_data(virq, bank);
> +	}
> +	set_irq_flags(virq, IRQF_VALID);
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops s3c24xx_gpf_irq_ops =3D {
> +	.map	=3D s3c24xx_gpf_irq_map,
> +	.xlate	=3D irq_domain_xlate_twocell,
> +};
> +
> +static int s3c24xx_gpg_irq_map(struct irq_domain *h, unsigned int virq,
> +					irq_hw_number_t hw)
> +{
> +	struct s3c24xx_eint_domain_data *ddata =3D h->host_data;
> +	struct samsung_pin_bank *bank =3D ddata->bank;
> +
> +	if (!(bank->eint_mask & (1 << (bank->eint_offset + hw))))
> +		return -EINVAL;
> +
> +	irq_set_chip_and_handler(virq, &s3c24xx_eint_chip, =

handle_edge_irq);
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
> +	{ .compatible =3D "samsung,s3c24xx-wakeup-eint", },
> +	{ }
> +};
> +
> +static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
> +{
> +	struct device *dev =3D d->dev;
> +	struct device_node *eint_np =3D NULL;
> +	struct device_node *np;
> +	struct samsung_pin_bank *bank;
> +	struct s3c24xx_eint_data *eint_data;
> +	const struct irq_domain_ops *ops;
> +	unsigned int i;
> +
> +	for_each_child_of_node(dev->of_node, np) {
> +		if (of_match_node(s3c24xx_eint_irq_ids, np)) {
> +			eint_np =3D np;
> +			break;
> +		}
> +	}
> +	if (!eint_np)
> +		return -ENODEV;
> +
> +	eint_data =3D devm_kzalloc(dev, sizeof(*eint_data), GFP_KERNEL);
> +	if (!eint_data) {
> +		dev_err(dev, "could not allocate memory for wkup eint =

data\n");
> +		return -ENOMEM;
> +	}
> +	eint_data->drvdata =3D d;
> +
> +	for (i =3D 0; i < NUM_EINT_IRQ; ++i) {
> +		unsigned int irq;
> +
> +		irq =3D irq_of_parse_and_map(eint_np, i);
> +		if (!irq) {
> +			dev_err(dev, "failed to get wakeup EINT IRQ %d\n", =

i);
> +			return -ENXIO;
> +		}
> +
> +		eint_data->parents[i] =3D irq;
> +		irq_set_chained_handler(irq, s3c24xx_eint_handlers[i]);
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

Here the eint0_3_parent_only field can be set based on compatible string =

of the EINT controller.

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

And then finally you shouldn't need this type field anymore.

Best regards,
Tomasz

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
> +	},
> +};
> diff --git a/drivers/pinctrl/pinctrl-samsung.c
> b/drivers/pinctrl/pinctrl-samsung.c index e836135..234c32f 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -977,6 +977,16 @@ static const struct of_device_id
> samsung_pinctrl_dt_match[] =3D { { .compatible =3D
> "samsung,s3c64xx-pinctrl",
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
> =

> +/**
> + * enum ctrl_type - variances of a pin controller type
> + * @S3C24XX: generic s3c24xx pin handling
> + * @S3C2412: s3c2412-type eints, existing in the main and eint
> controllers + */
> +enum ctrl_type {
> +	S3C24XX,
> +	S3C2412,
> +};
> +
>  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
>  #define PIN_NAME_LENGTH	10
> =

> @@ -164,6 +174,7 @@ struct samsung_pin_bank {
>   * @eint_wkup_init: platform specific callback to setup the external
> wakeup *	interrupts for the controller.
>   * @label: for debug information.
> + * @type: type of pin-controller
>   */
>  struct samsung_pin_ctrl {
>  	struct samsung_pin_bank	*pin_banks;
> @@ -185,6 +196,7 @@ struct samsung_pin_ctrl {
>  	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data =

*);
>  	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data =

*);
>  	char		*label;
> +	enum ctrl_type	type;
>  };
> =

>  /**
> @@ -246,5 +258,9 @@ extern struct samsung_pin_ctrl
> exynos4210_pin_ctrl[]; extern struct samsung_pin_ctrl
> exynos4x12_pin_ctrl[];
>  extern struct samsung_pin_ctrl exynos5250_pin_ctrl[];
>  extern struct samsung_pin_ctrl s3c64xx_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2413_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2416_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2440_pin_ctrl[];
> +extern struct samsung_pin_ctrl s3c2450_pin_ctrl[];
> =

>  #endif /* __PINCTRL_SAMSUNG_H */
