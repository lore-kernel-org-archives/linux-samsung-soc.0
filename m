From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 01/10] mfd: max77686: Convert to use regmap_irq
Date: Tue, 17 Jun 2014 21:32:02 +0100
Message-ID: <20140617203202.GX29841@lee--X1>
References: <1402941758-11216-1-git-send-email-javier.martinez@collabora.co.uk>
 <1402941758-11216-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:52203 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933527AbaFQUcK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 16:32:10 -0400
Received: by mail-ig0-f172.google.com with SMTP id hn18so1460901igb.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Jun 2014 13:32:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1402941758-11216-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Jun 2014, Javier Martinez Canillas wrote:

> By using the generic IRQ support in the Register map API, it
> is possible to get rid of max77686-irq.c and simplify the code.
>=20
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>  drivers/mfd/Kconfig                  |   1 +
>  drivers/mfd/Makefile                 |   2 +-
>  drivers/mfd/max77686-irq.c           | 319 -------------------------=
----------
>  drivers/mfd/max77686.c               |  93 +++++++++-
>  drivers/rtc/rtc-max77686.c           |  27 +--
>  include/linux/mfd/max77686-private.h |  26 ++-
>  include/linux/mfd/max77686.h         |   2 -
>  7 files changed, 119 insertions(+), 351 deletions(-)
>  delete mode 100644 drivers/mfd/max77686-irq.c

Nice patch - great diff.

I assume we have to wait for some of the other patches in the set, but
for now:

  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ee8204c..0916447 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -371,6 +371,7 @@ config MFD_MAX77686
>  	depends on I2C=3Dy
>  	select MFD_CORE
>  	select REGMAP_I2C
> +	select REGMAP_IRQ
>  	select IRQ_DOMAIN
>  	help
>  	  Say yes here to add support for Maxim Semiconductor MAX77686.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 8afedba..3b3b408 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -115,7 +115,7 @@ da9063-objs			:=3D da9063-core.o da9063-irq.o da9=
063-i2c.o
>  obj-$(CONFIG_MFD_DA9063)	+=3D da9063.o
> =20
>  obj-$(CONFIG_MFD_MAX14577)	+=3D max14577.o
> -obj-$(CONFIG_MFD_MAX77686)	+=3D max77686.o max77686-irq.o
> +obj-$(CONFIG_MFD_MAX77686)	+=3D max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+=3D max77693.o max77693-irq.o
>  obj-$(CONFIG_MFD_MAX8907)	+=3D max8907.o
>  max8925-objs			:=3D max8925-core.o max8925-i2c.o
> diff --git a/drivers/mfd/max77686-irq.c b/drivers/mfd/max77686-irq.c
> deleted file mode 100644
> index cdc3280..0000000
> --- a/drivers/mfd/max77686-irq.c
> +++ /dev/null
> @@ -1,319 +0,0 @@
> -/*
> - * max77686-irq.c - Interrupt controller support for MAX77686
> - *
> - * Copyright (C) 2012 Samsung Electronics Co.Ltd
> - * Chiwoong Byun <woong.byun@samsung.com>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License as published=
 by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1=
307  USA
> - *
> - * This driver is based on max8997-irq.c
> - */
> -
> -#include <linux/err.h>
> -#include <linux/irq.h>
> -#include <linux/interrupt.h>
> -#include <linux/gpio.h>
> -#include <linux/mfd/max77686.h>
> -#include <linux/mfd/max77686-private.h>
> -#include <linux/irqdomain.h>
> -#include <linux/regmap.h>
> -
> -enum {
> -	MAX77686_DEBUG_IRQ_INFO =3D 1 << 0,
> -	MAX77686_DEBUG_IRQ_MASK =3D 1 << 1,
> -	MAX77686_DEBUG_IRQ_INT =3D 1 << 2,
> -};
> -
> -static int debug_mask =3D 0;
> -module_param(debug_mask, int, 0);
> -MODULE_PARM_DESC(debug_mask, "Set debug_mask : 0x0=3Doff 0x1=3DIRQ_I=
NFO  0x2=3DIRQ_MASK 0x4=3DIRQ_INI)");
> -
> -static const u8 max77686_mask_reg[] =3D {
> -	[PMIC_INT1] =3D MAX77686_REG_INT1MSK,
> -	[PMIC_INT2] =3D MAX77686_REG_INT2MSK,
> -	[RTC_INT] =3D MAX77686_RTC_INTM,
> -};
> -
> -static struct regmap *max77686_get_regmap(struct max77686_dev *max77=
686,
> -				enum max77686_irq_source src)
> -{
> -	switch (src) {
> -	case PMIC_INT1 ... PMIC_INT2:
> -		return max77686->regmap;
> -	case RTC_INT:
> -		return max77686->rtc_regmap;
> -	default:
> -		return ERR_PTR(-EINVAL);
> -	}
> -}
> -
> -struct max77686_irq_data {
> -	int mask;
> -	enum max77686_irq_source group;
> -};
> -
> -#define DECLARE_IRQ(idx, _group, _mask)		\
> -	[(idx)] =3D { .group =3D (_group), .mask =3D (_mask) }
> -static const struct max77686_irq_data max77686_irqs[] =3D {
> -	DECLARE_IRQ(MAX77686_PMICIRQ_PWRONF,	PMIC_INT1, 1 << 0),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_PWRONR,	PMIC_INT1, 1 << 1),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_JIGONBF,	PMIC_INT1, 1 << 2),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_JIGONBR,	PMIC_INT1, 1 << 3),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_ACOKBF,	PMIC_INT1, 1 << 4),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_ACOKBR,	PMIC_INT1, 1 << 5),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_ONKEY1S,	PMIC_INT1, 1 << 6),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_MRSTB,		PMIC_INT1, 1 << 7),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_140C,		PMIC_INT2, 1 << 0),
> -	DECLARE_IRQ(MAX77686_PMICIRQ_120C,		PMIC_INT2, 1 << 1),
> -	DECLARE_IRQ(MAX77686_RTCIRQ_RTC60S,		RTC_INT, 1 << 0),
> -	DECLARE_IRQ(MAX77686_RTCIRQ_RTCA1,		RTC_INT, 1 << 1),
> -	DECLARE_IRQ(MAX77686_RTCIRQ_RTCA2,		RTC_INT, 1 << 2),
> -	DECLARE_IRQ(MAX77686_RTCIRQ_SMPL,		RTC_INT, 1 << 3),
> -	DECLARE_IRQ(MAX77686_RTCIRQ_RTC1S,		RTC_INT, 1 << 4),
> -	DECLARE_IRQ(MAX77686_RTCIRQ_WTSR,		RTC_INT, 1 << 5),
> -};
> -
> -static void max77686_irq_lock(struct irq_data *data)
> -{
> -	struct max77686_dev *max77686 =3D irq_get_chip_data(data->irq);
> -
> -	if (debug_mask & MAX77686_DEBUG_IRQ_MASK)
> -		pr_info("%s\n", __func__);
> -
> -	mutex_lock(&max77686->irqlock);
> -}
> -
> -static void max77686_irq_sync_unlock(struct irq_data *data)
> -{
> -	struct max77686_dev *max77686 =3D irq_get_chip_data(data->irq);
> -	int i;
> -
> -	for (i =3D 0; i < MAX77686_IRQ_GROUP_NR; i++) {
> -		u8 mask_reg =3D max77686_mask_reg[i];
> -		struct regmap *map =3D max77686_get_regmap(max77686, i);
> -
> -		if (debug_mask & MAX77686_DEBUG_IRQ_MASK)
> -			pr_debug("%s: mask_reg[%d]=3D0x%x, cur=3D0x%x\n",
> -			__func__, i, mask_reg, max77686->irq_masks_cur[i]);
> -
> -		if (mask_reg =3D=3D MAX77686_REG_INVALID ||
> -				IS_ERR_OR_NULL(map))
> -			continue;
> -
> -		max77686->irq_masks_cache[i] =3D max77686->irq_masks_cur[i];
> -
> -		regmap_write(map, max77686_mask_reg[i],
> -				max77686->irq_masks_cur[i]);
> -	}
> -
> -	mutex_unlock(&max77686->irqlock);
> -}
> -
> -static const inline struct max77686_irq_data *to_max77686_irq(int ir=
q)
> -{
> -	struct irq_data *data =3D irq_get_irq_data(irq);
> -	return &max77686_irqs[data->hwirq];
> -}
> -
> -static void max77686_irq_mask(struct irq_data *data)
> -{
> -	struct max77686_dev *max77686 =3D irq_get_chip_data(data->irq);
> -	const struct max77686_irq_data *irq_data =3D to_max77686_irq(data->=
irq);
> -
> -	max77686->irq_masks_cur[irq_data->group] |=3D irq_data->mask;
> -
> -	if (debug_mask & MAX77686_DEBUG_IRQ_MASK)
> -		pr_info("%s: group=3D%d, cur=3D0x%x\n",
> -			__func__, irq_data->group,
> -			max77686->irq_masks_cur[irq_data->group]);
> -}
> -
> -static void max77686_irq_unmask(struct irq_data *data)
> -{
> -	struct max77686_dev *max77686 =3D irq_get_chip_data(data->irq);
> -	const struct max77686_irq_data *irq_data =3D to_max77686_irq(data->=
irq);
> -
> -	max77686->irq_masks_cur[irq_data->group] &=3D ~irq_data->mask;
> -
> -	if (debug_mask & MAX77686_DEBUG_IRQ_MASK)
> -		pr_info("%s: group=3D%d, cur=3D0x%x\n",
> -			__func__, irq_data->group,
> -			max77686->irq_masks_cur[irq_data->group]);
> -}
> -
> -static struct irq_chip max77686_irq_chip =3D {
> -	.name			=3D "max77686",
> -	.irq_bus_lock		=3D max77686_irq_lock,
> -	.irq_bus_sync_unlock	=3D max77686_irq_sync_unlock,
> -	.irq_mask		=3D max77686_irq_mask,
> -	.irq_unmask		=3D max77686_irq_unmask,
> -};
> -
> -static irqreturn_t max77686_irq_thread(int irq, void *data)
> -{
> -	struct max77686_dev *max77686 =3D data;
> -	unsigned int irq_reg[MAX77686_IRQ_GROUP_NR] =3D {};
> -	unsigned int irq_src;
> -	int ret;
> -	int i, cur_irq;
> -
> -	ret =3D regmap_read(max77686->regmap,  MAX77686_REG_INTSRC, &irq_sr=
c);
> -	if (ret < 0) {
> -		dev_err(max77686->dev, "Failed to read interrupt source: %d\n",
> -				ret);
> -		return IRQ_NONE;
> -	}
> -
> -	if (debug_mask & MAX77686_DEBUG_IRQ_INT)
> -		pr_info("%s: irq_src=3D0x%x\n", __func__, irq_src);
> -
> -	if (irq_src =3D=3D MAX77686_IRQSRC_PMIC) {
> -		ret =3D regmap_bulk_read(max77686->regmap,
> -					 MAX77686_REG_INT1, irq_reg, 2);
> -		if (ret < 0) {
> -			dev_err(max77686->dev, "Failed to read interrupt source: %d\n",
> -					ret);
> -			return IRQ_NONE;
> -		}
> -
> -		if (debug_mask & MAX77686_DEBUG_IRQ_INT)
> -			pr_info("%s: int1=3D0x%x, int2=3D0x%x\n", __func__,
> -				 irq_reg[PMIC_INT1], irq_reg[PMIC_INT2]);
> -	}
> -
> -	if (irq_src & MAX77686_IRQSRC_RTC) {
> -		ret =3D regmap_read(max77686->rtc_regmap,
> -					MAX77686_RTC_INT, &irq_reg[RTC_INT]);
> -		if (ret < 0) {
> -			dev_err(max77686->dev, "Failed to read interrupt source: %d\n",
> -					ret);
> -			return IRQ_NONE;
> -		}
> -
> -		if (debug_mask & MAX77686_DEBUG_IRQ_INT)
> -			pr_info("%s: rtc int=3D0x%x\n", __func__,
> -							 irq_reg[RTC_INT]);
> -
> -	}
> -
> -	for (i =3D 0; i < MAX77686_IRQ_GROUP_NR; i++)
> -		irq_reg[i] &=3D ~max77686->irq_masks_cur[i];
> -
> -	for (i =3D 0; i < MAX77686_IRQ_NR; i++) {
> -		if (irq_reg[max77686_irqs[i].group] & max77686_irqs[i].mask) {
> -			cur_irq =3D irq_find_mapping(max77686->irq_domain, i);
> -			if (cur_irq)
> -				handle_nested_irq(cur_irq);
> -		}
> -	}
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static int max77686_irq_domain_map(struct irq_domain *d, unsigned in=
t irq,
> -					irq_hw_number_t hw)
> -{
> -	struct max77686_dev *max77686 =3D d->host_data;
> -
> -	irq_set_chip_data(irq, max77686);
> -	irq_set_chip_and_handler(irq, &max77686_irq_chip, handle_edge_irq);
> -	irq_set_nested_thread(irq, 1);
> -#ifdef CONFIG_ARM
> -	set_irq_flags(irq, IRQF_VALID);
> -#else
> -	irq_set_noprobe(irq);
> -#endif
> -	return 0;
> -}
> -
> -static struct irq_domain_ops max77686_irq_domain_ops =3D {
> -	.map =3D max77686_irq_domain_map,
> -};
> -
> -int max77686_irq_init(struct max77686_dev *max77686)
> -{
> -	struct irq_domain *domain;
> -	int i;
> -	int ret;
> -	int val;
> -	struct regmap *map;
> -
> -	mutex_init(&max77686->irqlock);
> -
> -	if (max77686->irq_gpio && !max77686->irq) {
> -		max77686->irq =3D gpio_to_irq(max77686->irq_gpio);
> -
> -		if (debug_mask & MAX77686_DEBUG_IRQ_INT) {
> -			ret =3D gpio_request(max77686->irq_gpio, "pmic_irq");
> -			if (ret < 0) {
> -				dev_err(max77686->dev,
> -					"Failed to request gpio %d with ret:"
> -					"%d\n",	max77686->irq_gpio, ret);
> -				return IRQ_NONE;
> -			}
> -
> -			gpio_direction_input(max77686->irq_gpio);
> -			val =3D gpio_get_value(max77686->irq_gpio);
> -			gpio_free(max77686->irq_gpio);
> -			pr_info("%s: gpio_irq=3D%x\n", __func__, val);
> -		}
> -	}
> -
> -	if (!max77686->irq) {
> -		dev_err(max77686->dev, "irq is not specified\n");
> -		return -ENODEV;
> -	}
> -
> -	/* Mask individual interrupt sources */
> -	for (i =3D 0; i < MAX77686_IRQ_GROUP_NR; i++) {
> -		max77686->irq_masks_cur[i] =3D 0xff;
> -		max77686->irq_masks_cache[i] =3D 0xff;
> -		map =3D max77686_get_regmap(max77686, i);
> -
> -		if (IS_ERR_OR_NULL(map))
> -			continue;
> -		if (max77686_mask_reg[i] =3D=3D MAX77686_REG_INVALID)
> -			continue;
> -
> -		regmap_write(map, max77686_mask_reg[i], 0xff);
> -	}
> -	domain =3D irq_domain_add_linear(NULL, MAX77686_IRQ_NR,
> -					&max77686_irq_domain_ops, max77686);
> -	if (!domain) {
> -		dev_err(max77686->dev, "could not create irq domain\n");
> -		return -ENODEV;
> -	}
> -	max77686->irq_domain =3D domain;
> -
> -	ret =3D request_threaded_irq(max77686->irq, NULL, max77686_irq_thre=
ad,
> -				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -				   "max77686-irq", max77686);
> -
> -	if (ret)
> -		dev_err(max77686->dev, "Failed to request IRQ %d: %d\n",
> -			max77686->irq, ret);
> -
> -
> -	if (debug_mask & MAX77686_DEBUG_IRQ_INFO)
> -		pr_info("%s-\n", __func__);
> -
> -	return 0;
> -}
> -
> -void max77686_irq_exit(struct max77686_dev *max77686)
> -{
> -	if (max77686->irq)
> -		free_irq(max77686->irq, max77686);
> -}
> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index ce869ac..42eacb16 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -25,6 +25,8 @@
>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/module.h>
>  #include <linux/mfd/core.h>
> @@ -46,6 +48,54 @@ static struct regmap_config max77686_regmap_config=
 =3D {
>  	.val_bits =3D 8,
>  };
> =20
> +static struct regmap_config max77686_rtc_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static const struct regmap_irq max77686_irqs[] =3D {
> +	/* INT1 interrupts */
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_PWRONF_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_PWRONR_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_JIGONBF_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_JIGONBR_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_ACOKBF_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_ACOKBR_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_ONKEY1S_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_INT1_MRSTB_MSK, },
> +	/* INT2 interrupts */
> +	{ .reg_offset =3D 1, .mask =3D MAX77686_INT2_140C_MSK, },
> +	{ .reg_offset =3D 1, .mask =3D MAX77686_INT2_120C_MSK, },
> +};
> +
> +static const struct regmap_irq_chip max77686_irq_chip =3D {
> +	.name			=3D "max77686-pmic",
> +	.status_base		=3D MAX77686_REG_INT1,
> +	.mask_base		=3D MAX77686_REG_INT1MSK,
> +	.num_regs		=3D 2,
> +	.irqs			=3D max77686_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(max77686_irqs),
> +};
> +
> +static const struct regmap_irq max77686_rtc_irqs[] =3D {
> +	/* RTC interrupts */
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_RTCINT_RTC60S_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_RTCINT_RTCA1_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_RTCINT_RTCA2_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_RTCINT_SMPL_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_RTCINT_RTC1S_MSK, },
> +	{ .reg_offset =3D 0, .mask =3D MAX77686_RTCINT_WTSR_MSK, },
> +};
> +
> +static const struct regmap_irq_chip max77686_rtc_irq_chip =3D {
> +	.name			=3D "max77686-rtc",
> +	.status_base		=3D MAX77686_RTC_INT,
> +	.mask_base		=3D MAX77686_RTC_INTM,
> +	.num_regs		=3D 1,
> +	.irqs			=3D max77686_rtc_irqs,
> +	.num_irqs		=3D ARRAY_SIZE(max77686_rtc_irqs),
> +};
> +
>  #ifdef CONFIG_OF
>  static const struct of_device_id max77686_pmic_dt_match[] =3D {
>  	{.compatible =3D "maxim,max77686", .data =3D NULL},
> @@ -101,7 +151,6 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
>  	max77686->type =3D id->driver_data;
> =20
>  	max77686->wakeup =3D pdata->wakeup;
> -	max77686->irq_gpio =3D pdata->irq_gpio;
>  	max77686->irq =3D i2c->irq;
> =20
>  	max77686->regmap =3D devm_regmap_init_i2c(i2c, &max77686_regmap_con=
fig);
> @@ -117,8 +166,7 @@ static int max77686_i2c_probe(struct i2c_client *=
i2c,
>  		dev_err(max77686->dev,
>  			"device not found on this channel (this is not an error)\n");
>  		return -ENODEV;
> -	} else
> -		dev_info(max77686->dev, "device found\n");
> +	}
> =20
>  	max77686->rtc =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
>  	if (!max77686->rtc) {
> @@ -127,15 +175,48 @@ static int max77686_i2c_probe(struct i2c_client=
 *i2c,
>  	}
>  	i2c_set_clientdata(max77686->rtc, max77686);
> =20
> -	max77686_irq_init(max77686);
> +	max77686->rtc_regmap =3D devm_regmap_init_i2c(max77686->rtc,
> +						    &max77686_rtc_regmap_config);
> +	if (IS_ERR(max77686->rtc_regmap)) {
> +		ret =3D PTR_ERR(max77686->rtc_regmap);
> +		dev_err(max77686->dev, "failed to allocate RTC regmap: %d\n",
> +			ret);
> +		goto err_unregister_i2c;
> +	}
> +
> +	ret =3D regmap_add_irq_chip(max77686->regmap, max77686->irq,
> +				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
> +				  IRQF_SHARED, 0, &max77686_irq_chip,
> +				  &max77686->irq_data);
> +	if (ret !=3D 0) {
> +		dev_err(&i2c->dev, "failed to add PMIC irq chip: %d\n", ret);
> +		goto err_unregister_i2c;
> +	}
> +	ret =3D regmap_add_irq_chip(max77686->rtc_regmap, max77686->irq,
> +				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
> +				  IRQF_SHARED, 0, &max77686_rtc_irq_chip,
> +				  &max77686->rtc_irq_data);
> +	if (ret !=3D 0) {
> +		dev_err(&i2c->dev, "failed to add RTC irq chip: %d\n", ret);
> +		goto err_del_irqc;
> +	}
> =20
>  	ret =3D mfd_add_devices(max77686->dev, -1, max77686_devs,
>  			      ARRAY_SIZE(max77686_devs), NULL, 0, NULL);
>  	if (ret < 0) {
> -		mfd_remove_devices(max77686->dev);
> -		i2c_unregister_device(max77686->rtc);
> +		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
> +		goto err_del_rtc_irqc;
>  	}
> =20
> +	return 0;
> +
> +err_del_rtc_irqc:
> +	regmap_del_irq_chip(max77686->irq, max77686->rtc_irq_data);
> +err_del_irqc:
> +	regmap_del_irq_chip(max77686->irq, max77686->irq_data);
> +err_unregister_i2c:
> +	i2c_unregister_device(max77686->rtc);
> +
>  	return ret;
>  }
> =20
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 9efe118..d20a7f0 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -492,16 +492,11 @@ static int max77686_rtc_init_reg(struct max7768=
6_rtc_info *info)
>  	return ret;
>  }
> =20
> -static struct regmap_config max77686_rtc_regmap_config =3D {
> -	.reg_bits =3D 8,
> -	.val_bits =3D 8,
> -};
> -
>  static int max77686_rtc_probe(struct platform_device *pdev)
>  {
>  	struct max77686_dev *max77686 =3D dev_get_drvdata(pdev->dev.parent)=
;
>  	struct max77686_rtc_info *info;
> -	int ret, virq;
> +	int ret;
> =20
>  	dev_info(&pdev->dev, "%s\n", __func__);
> =20
> @@ -514,14 +509,7 @@ static int max77686_rtc_probe(struct platform_de=
vice *pdev)
>  	info->dev =3D &pdev->dev;
>  	info->max77686 =3D max77686;
>  	info->rtc =3D max77686->rtc;
> -	info->max77686->rtc_regmap =3D devm_regmap_init_i2c(info->max77686-=
>rtc,
> -					 &max77686_rtc_regmap_config);
> -	if (IS_ERR(info->max77686->rtc_regmap)) {
> -		ret =3D PTR_ERR(info->max77686->rtc_regmap);
> -		dev_err(info->max77686->dev, "Failed to allocate register map: %d\=
n",
> -				ret);
> -		return ret;
> -	}
> +
>  	platform_set_drvdata(pdev, info);
> =20
>  	ret =3D max77686_rtc_init_reg(info);
> @@ -550,15 +538,16 @@ static int max77686_rtc_probe(struct platform_d=
evice *pdev)
>  			ret =3D -EINVAL;
>  		goto err_rtc;
>  	}
> -	virq =3D irq_create_mapping(max77686->irq_domain, MAX77686_RTCIRQ_R=
TCA1);
> -	if (!virq) {
> +
> +	info->virq =3D regmap_irq_get_virq(max77686->rtc_irq_data,
> +					 MAX77686_RTCIRQ_RTCA1);
> +	if (!info->virq) {
>  		ret =3D -ENXIO;
>  		goto err_rtc;
>  	}
> -	info->virq =3D virq;
> =20
> -	ret =3D devm_request_threaded_irq(&pdev->dev, virq, NULL,
> -				max77686_rtc_alarm_irq, 0, "rtc-alarm0", info);
> +	ret =3D devm_request_threaded_irq(&pdev->dev, info->virq, NULL,
> +				max77686_rtc_alarm_irq, 0, "rtc-alarm1", info);
>  	if (ret < 0)
>  		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
>  			info->virq, ret);
> diff --git a/include/linux/mfd/max77686-private.h b/include/linux/mfd=
/max77686-private.h
> index 8c75a9c..3a810b1 100644
> --- a/include/linux/mfd/max77686-private.h
> +++ b/include/linux/mfd/max77686-private.h
> @@ -205,7 +205,7 @@ enum max77686_irq {
>  	MAX77686_PMICIRQ_140C,
>  	MAX77686_PMICIRQ_120C,
> =20
> -	MAX77686_RTCIRQ_RTC60S,
> +	MAX77686_RTCIRQ_RTC60S =3D 0,
>  	MAX77686_RTCIRQ_RTCA1,
>  	MAX77686_RTCIRQ_RTCA2,
>  	MAX77686_RTCIRQ_SMPL,
> @@ -215,6 +215,25 @@ enum max77686_irq {
>  	MAX77686_IRQ_NR,
>  };
> =20
> +#define MAX77686_INT1_PWRONF_MSK	BIT(0)
> +#define MAX77686_INT1_PWRONR_MSK	BIT(1)
> +#define MAX77686_INT1_JIGONBF_MSK	BIT(2)
> +#define MAX77686_INT1_JIGONBR_MSK	BIT(3)
> +#define MAX77686_INT1_ACOKBF_MSK	BIT(4)
> +#define MAX77686_INT1_ACOKBR_MSK	BIT(5)
> +#define MAX77686_INT1_ONKEY1S_MSK	BIT(6)
> +#define MAX77686_INT1_MRSTB_MSK		BIT(7)
> +
> +#define MAX77686_INT2_140C_MSK		BIT(0)
> +#define MAX77686_INT2_120C_MSK		BIT(1)
> +
> +#define MAX77686_RTCINT_RTC60S_MSK	BIT(0)
> +#define MAX77686_RTCINT_RTCA1_MSK	BIT(1)
> +#define MAX77686_RTCINT_RTCA2_MSK	BIT(2)
> +#define MAX77686_RTCINT_SMPL_MSK	BIT(3)
> +#define MAX77686_RTCINT_RTC1S_MSK	BIT(4)
> +#define MAX77686_RTCINT_WTSR_MSK	BIT(5)
> +
>  struct max77686_dev {
>  	struct device *dev;
>  	struct i2c_client *i2c; /* 0xcc / PMIC, Battery Control, and FLASH =
*/
> @@ -224,11 +243,10 @@ struct max77686_dev {
> =20
>  	struct regmap *regmap;		/* regmap for mfd */
>  	struct regmap *rtc_regmap;	/* regmap for rtc */
> -
> -	struct irq_domain *irq_domain;
> +	struct regmap_irq_chip_data *irq_data;
> +	struct regmap_irq_chip_data *rtc_irq_data;
> =20
>  	int irq;
> -	int irq_gpio;
>  	bool wakeup;
>  	struct mutex irqlock;
>  	int irq_masks_cur[MAX77686_IRQ_GROUP_NR];
> diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max7768=
6.h
> index 46c0f32..4cbcc13 100644
> --- a/include/linux/mfd/max77686.h
> +++ b/include/linux/mfd/max77686.h
> @@ -89,8 +89,6 @@ struct max77686_opmode_data {
>  };
> =20
>  struct max77686_platform_data {
> -	/* IRQ */
> -	int irq_gpio;
>  	int ono;
>  	int wakeup;
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
