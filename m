From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v3 1/2] mfd: Add support for MAX77686.
Date: Tue, 22 May 2012 19:17:24 +0530
Message-ID: <CAKew6eVZcW4NHJZAqmb940D3MKREUpLLc4gJfqSn3sMF2ZCHkA@mail.gmail.com>
References: <4fbb2ad2.63de440a.589d.78d6@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:36693 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752235Ab2EVNrZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 May 2012 09:47:25 -0400
In-Reply-To: <4fbb2ad2.63de440a.589d.78d6@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

CC' ing to maintainer.
(I forget to add maintainer in cc, sorry for noise).

On Tue, May 22, 2012 at 11:26 AM,  <yadi.brar01@gmail.com> wrote:
> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
>
> MAX77686 is a mulitifunction device with PMIC, RTC and Charger on chi=
p. Th
> driver provides common support for accessing the device. This is init=
ial
> version of this driver that supports to enable the chip with its prim=
ary I
> bus.It also includes IRQ and device tree support for MAX77686 chip.
>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> =A0Documentation/devicetree/bindings/mfd/max77686.txt | =A0 61 ++++
> =A0drivers/mfd/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 21 ++
> =A0drivers/mfd/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A01 +
> =A0drivers/mfd/max77686-irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0255 ++++++++++++++++
> =A0drivers/mfd/max77686.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0322 ++++++++++++++++++++
> =A0include/linux/mfd/max77686-private.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0282 +++++++++++++++++
> =A0include/linux/mfd/max77686.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0100 ++++++
> =A07 files changed, 1042 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/mfd/max77686.=
txt
> =A0create mode 100644 drivers/mfd/max77686-irq.c
> =A0create mode 100644 drivers/mfd/max77686.c
> =A0create mode 100644 include/linux/mfd/max77686-private.h
> =A0create mode 100644 include/linux/mfd/max77686.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> new file mode 100644
> index 0000000..78a47bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -0,0 +1,61 @@
> +Maxim MAX77686 multi-function device
> +
> +MAX77686 is a Mulitifunction device with PMIC, RTC and Charger on ch=
ip. It is
> +interfaced to host controller using i2c interface. PMIC and Charger =
submodules
> +are addressed using same i2c slave address where as RTC submodule us=
es
> +different slave address,presently for which we are statically creati=
ng i2c
> +client while probing.This document describes the binding for mfd dev=
ice and
> +PMIC submodule.
> +
> +Required properties:
> +- compatible : Must be "maxim,max77686";
> +- reg : Specifiec the i2c slave address of PMIC block.
> +- interrupts : This i2c device has an IRQ line connected to the main=
 SoC.
> +- interrupt-parent : The parent interrupt controller.
> +
> +Optional node:
> +- max77686,buck_ramp_delay : Ramp delay to be setup for buck2,3&4.
> +
> +- voltage-regulators : The regulators of max77686 have to be instant=
iated
> + =A0under subnode named "voltage-regulators" uing the following form=
at.
> +
> + =A0 =A0 =A0 regulator_name {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 standard regulator constraints....
> + =A0 =A0 =A0 };
> + =A0 =A0 =A0 refer Documentation/devicetree/bindings/regulator/regul=
ator.txt
> +
> + =A0The names of regulator should be as follow:
> +
> + =A0 =A0 =A0 -LDOn =A0 : =A0 =A0 =A0 for LDOs, where n can lie in ra=
nge 1 to 26.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 example: LDO1, LDO2, LD=
O26.
> + =A0 =A0 =A0 -BUCKn =A0: =A0 =A0 =A0 for BUCKs, where n can lie in r=
ange 1 to 9.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 example: BUCK1, BUCK5, =
BUCK9.
> +
> +
> +Example:
> +
> + =A0 =A0 =A0 max77686_pmic@09 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "maxim,max77686";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&wakeup_eint>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <26 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x09>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686,buck_ramp_delay =3D <2>; =A0 =A0=
 =A0 =A0 /* default */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 voltage-regulators {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldo11_reg: LDO11 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-name =3D "vdd_ldo11";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-min-microvolt =3D <1900000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-max-microvolt =3D <1900000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-always-on;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buck1_reg: BUCK1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-name =3D "vdd_mif";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-min-microvolt =3D <950000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-max-microvolt =3D <1300000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-always-on;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-boot-on;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 }
> +
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a4fd173..d8285e5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -442,6 +442,27 @@ config MFD_MAX8998
> =A0 =A0 =A0 =A0 =A0additional drivers must be enabled in order to use=
 the functionality
> =A0 =A0 =A0 =A0 =A0of the device.
>
> +config MFD_MAX77686
> + =A0 =A0 =A0 bool "Maxim Semiconductor MAX77686 PMIC Support"
> + =A0 =A0 =A0 depends on I2C=3Dy && GENERIC_HARDIRQS
> + =A0 =A0 =A0 select MFD_CORE
> + =A0 =A0 =A0 select REGMAP_I2C
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Say yes here to support for Maxim Semiconductor MAX=
77686.
> + =A0 =A0 =A0 =A0 This is a Power Management IC with RTC on chip.
> + =A0 =A0 =A0 =A0 This driver provides common support for accessing t=
he device;
> + =A0 =A0 =A0 =A0 additional drivers must be enabled in order to use =
the functionality
> + =A0 =A0 =A0 =A0 of the device.
> +
> +config DEBUG_MAX77686
> + =A0 =A0 =A0 bool "MAX77686 PMIC debugging"
> + =A0 =A0 =A0 depends on MFD_MAX77686
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Say yes, if you need enable debug messages in
> + =A0 =A0 =A0 =A0 MFD_MAX77686 driver.
> + =A0 =A0 =A0 =A0 Further for enabling/disabling particular type of d=
ebug
> + =A0 =A0 =A0 =A0 messages set max77686_debug_mask accordingly.
> +
> =A0config MFD_S5M_CORE
> =A0 =A0 =A0 =A0bool "SAMSUNG S5M Series Support"
> =A0 =A0 =A0 =A0depends on I2C=3Dy && GENERIC_HARDIRQS
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 05fa538..19ecca9 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -79,6 +79,7 @@ max8925-objs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D=
 max8925-core.o max8925-i2c.o
> =A0obj-$(CONFIG_MFD_MAX8925) =A0 =A0 =A0+=3D max8925.o
> =A0obj-$(CONFIG_MFD_MAX8997) =A0 =A0 =A0+=3D max8997.o max8997-irq.o
> =A0obj-$(CONFIG_MFD_MAX8998) =A0 =A0 =A0+=3D max8998.o max8998-irq.o
> +obj-$(CONFIG_MFD_MAX77686) =A0 =A0 +=3D max77686.o max77686-irq.o
>
> =A0pcf50633-objs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D pcf50633-cor=
e.o pcf50633-irq.o
> =A0obj-$(CONFIG_MFD_PCF50633) =A0 =A0 +=3D pcf50633.o
> diff --git a/drivers/mfd/max77686-irq.c b/drivers/mfd/max77686-irq.c
> new file mode 100644
> index 0000000..f57b96e
> --- /dev/null
> +++ b/drivers/mfd/max77686-irq.c
> @@ -0,0 +1,255 @@
> +/*
> + * max77686-irq.c - Interrupt controller support for MAX77686
> + *
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + * Chiwoong Byun <woong.byun@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A002111=
-1307 =A0USA
> + *
> + * This driver is based on max8997-irq.c
> + */
> +
> +#include <linux/err.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/max77686.h>
> +#include <linux/mfd/max77686-private.h>
> +#include <linux/irqdomain.h>
> +
> +#define IRQ_GRP (data->hwirq >> 3)
> +#define IRQ_MASK (1 << (data->hwirq & 7))
> +
> +int max77686_debug_mask =3D MAX77686_DEBUG_INFO; /* enable debug pri=
nts */
> +
> +static const int max77686_mask_reg[] =3D {
> + =A0 =A0 =A0 [PMIC_INT1] =A0 =A0 =3D MAX77686_REG_INT1MSK,
> + =A0 =A0 =A0 [PMIC_INT2] =A0 =A0 =3D MAX77686_REG_INT2MSK,
> + =A0 =A0 =A0 [RTC_INT] =A0 =A0 =A0 =3D MAX77686_RTC_INTM,
> +};
> +
> +static struct i2c_client *max77686_get_i2c(struct max77686_dev *max7=
7686,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0enum max77686_irq_source src)
> +{
> + =A0 =A0 =A0 switch (src) {
> + =A0 =A0 =A0 case PMIC_INT1...PMIC_INT2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return max77686->i2c;
> + =A0 =A0 =A0 case RTC_INT:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return max77686->rtc;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-EINVAL);
> + =A0 =A0 =A0 }
> +}
> +
> +static void max77686_irq_lock(struct irq_data *data)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D irq_get_chip_data(dat=
a->irq);
> +
> + =A0 =A0 =A0 mutex_lock(&max77686->irqlock);
> +}
> +
> +static void max77686_irq_sync_unlock(struct irq_data *data)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D irq_get_chip_data(dat=
a->irq);
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < MAX77686_IRQ_GROUP_NR; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int mask_reg =3D max77686_mask_reg[i];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct i2c_client *i2c =3D max77686_get=
_i2c(max77686, i);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dbg_mask("%s: mask_reg[%d]=3D0x%x, cur=3D=
0x%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, i, mask_reg, =
max77686->irq_masks_cur[i]);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mask_reg =3D=3D MAX77686_REG_INVALI=
D || IS_ERR_OR_NULL(i2c))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686->irq_masks_cache[i] =3D max776=
86->irq_masks_cur[i];
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686_write_reg(i2c, max77686_mask_r=
eg[i],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
max77686->irq_masks_cur[i]);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 mutex_unlock(&max77686->irqlock);
> +}
> +
> +static void max77686_irq_mask(struct irq_data *data)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D irq_get_chip_data(dat=
a->irq);
> +
> + =A0 =A0 =A0 max77686->irq_masks_cur[IRQ_GRP] |=3D IRQ_MASK;
> + =A0 =A0 =A0 dbg_mask("%s: group=3D%x, cur=3D0x%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, IRQ_GRP,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686->irq_masks_cur[IRQ_GRP]);
> +
> +}
> +
> +static void max77686_irq_unmask(struct irq_data *data)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D irq_get_chip_data(dat=
a->irq);
> +
> + =A0 =A0 =A0 max77686->irq_masks_cur[IRQ_GRP] &=3D ~IRQ_MASK;
> + =A0 =A0 =A0 dbg_mask("%s: group=3D%x, cur=3D0x%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, IRQ_GRP,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686->irq_masks_cur[IRQ_GRP]);
> +
> +}
> +
> +static struct irq_chip max77686_irq_chip =3D {
> + =A0 =A0 =A0 .name =3D "max77686",
> + =A0 =A0 =A0 .irq_bus_lock =3D max77686_irq_lock,
> + =A0 =A0 =A0 .irq_bus_sync_unlock =3D max77686_irq_sync_unlock,
> + =A0 =A0 =A0 .irq_mask =3D max77686_irq_mask,
> + =A0 =A0 =A0 .irq_unmask =3D max77686_irq_unmask,
> +};
> +
> +static irqreturn_t max77686_irq_thread(int irq, void *data)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D data;
> + =A0 =A0 =A0 int irq_reg[MAX77686_IRQ_GROUP_NR] =3D { };
> + =A0 =A0 =A0 int irq_src;
> + =A0 =A0 =A0 int ret, grp, i, cur_irq;
> +
> + =A0 =A0 =A0 ret =3D max77686_read_reg(max77686->i2c, MAX77686_REG_I=
NTSRC, &irq_src);
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "Failed to read =
interrupt source: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D max77686_bulk_read(max77686->i2c, MAX77686_REG_=
INT1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02, i=
rq_reg);
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Failed to read pmic in=
terrupt: %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dbg_int("%s: int1=3D0x%x, int2=3D0x%x\n", __func__,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_reg[PMIC_INT1], irq_reg[PMIC_INT2])=
;
> +
> + =A0 =A0 =A0 if (irq_src & MAX77686_IRQSRC_RTC) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D max77686_read_reg(max77686->rtc=
, MAX77686_RTC_INT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 &irq_reg[RTC_INT]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Failed=
 to read rtc interrupt: %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dbg_int("%s: rtc int=3D0x%x\n", __func_=
_,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_reg[RTC_INT]);
> +
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 for (grp =3D 0; grp < MAX77686_IRQ_GROUP_NR; grp++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_reg[grp] &=3D ~max77686->irq_masks_=
cur[grp];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (irq_reg[grp]) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (irq_reg[grp] & (1 <=
< i)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cur_irq=
 =3D irq_find_mapping(max77686->irq_domain,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 grp*8 + i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cur=
_irq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 handle_nested_irq(cur_irq);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_reg=
[grp] &=3D ~(1 << i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dbg_int=
("%s: Handled irq:%x from group:%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 __func__, i, grp);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dbg_info("%s returning\n", __func__);
> +
> + =A0 =A0 =A0 return IRQ_HANDLED;
> +}
> +
> +int max77686_irq_resume(struct max77686_dev *max77686)
> +{
> + =A0 =A0 =A0 if (max77686->irq && max77686->irq_domain)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686_irq_thread(0, max77686);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int max77686_irq_domain_map(struct irq_domain *d, unsigned in=
t irq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 irq_hw_number_t hw)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D d->host_data;
> +
> + =A0 =A0 =A0 irq_set_chip_data(irq, max77686);
> + =A0 =A0 =A0 irq_set_chip_and_handler(irq, &max77686_irq_chip, handl=
e_edge_irq);
> + =A0 =A0 =A0 irq_set_nested_thread(irq, 1);
> + =A0 =A0 =A0 set_irq_flags(irq, IRQF_VALID);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct irq_domain_ops max77686_irq_domain_ops =3D {
> + =A0 =A0 =A0 .map =3D max77686_irq_domain_map,
> +};
> +
> +int max77686_irq_init(struct max77686_dev *max77686)
> +{
> + =A0 =A0 =A0 int i, ret;
> + =A0 =A0 =A0 struct irq_domain *domain;
> +
> + =A0 =A0 =A0 if (!max77686->irq) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"No =
interrupt specified.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 mutex_init(&max77686->irqlock);
> +
> + =A0 =A0 =A0 /* Mask individual interrupt sources */
> + =A0 =A0 =A0 for (i =3D 0; i < MAX77686_IRQ_GROUP_NR; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct i2c_client *i2c;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686->irq_masks_cur[i] =3D 0xff;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686->irq_masks_cache[i] =3D 0xff;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c =3D max77686_get_i2c(max77686, i);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR_OR_NULL(i2c))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (max77686_mask_reg[i] =3D=3D MAX7768=
6_REG_INVALID)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686_write_reg(i2c, max77686_mask_r=
eg[i], 0xff);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 domain =3D irq_domain_add_linear(NULL, MAX77686_IRQ_NR,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 &max77686_irq_domain_ops, &max77686);
> + =A0 =A0 =A0 if (!domain) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "could not creat=
e irq domain\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D request_threaded_irq(max77686->irq, NULL, max77=
686_irq_thread,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
"max77686-irq", max77686);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "Failed to reque=
st IRQ %d: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 max77686->irq, ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dbg_info("%s : done\n", __func__);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +void max77686_irq_exit(struct max77686_dev *max77686)
> +{
> + =A0 =A0 =A0 if (max77686->irq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_irq(max77686->irq, max77686);
> +}
> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> new file mode 100644
> index 0000000..e36fb9b
> --- /dev/null
> +++ b/drivers/mfd/max77686.c
> @@ -0,0 +1,322 @@
> +/*
> + * max77686.c - mfd core driver for the Maxim 77686
> + *
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd.
> + * Chiwoong Byun <woong.byun@samsung.com>
> + * Yadwinder Singh Brar <yadi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A002111=
-1307 =A0USA
> + *
> + * This driver is based on max8997.c
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/err.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/mutex.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/max77686.h>
> +#include <linux/mfd/max77686-private.h>
> +
> +#define I2C_ADDR_RTC =A0 =A0(0x0C >> 1)
> +
> +#ifdef CONFIG_OF
> +static struct of_device_id __devinitdata max77686_pmic_dt_match[] =3D=
 {
> + =A0 =A0 =A0 {.compatible =3D "maxim,max77686", =A0 =A0 =A0 =A0.data=
 =3D 0},
> + =A0 =A0 =A0 {},
> +};
> +#endif
> +
> +static struct mfd_cell max77686_devs[] =3D {
> + =A0 =A0 =A0 {.name =3D "max77686-pmic",},
> + =A0 =A0 =A0 {.name =3D "max77686-rtc",},
> +};
> +
> +struct regmap_config pmic_regmap_config =3D {
> + =A0 =A0 =A0 .reg_bits =3D 8,
> + =A0 =A0 =A0 .val_bits =3D 8,
> + =A0 =A0 =A0 .max_register =3D MAX77686_REG_32KHZ,
> +};
> +
> +struct regmap_config rtc_regmap_config =3D {
> + =A0 =A0 =A0 .reg_bits =3D 8,
> + =A0 =A0 =A0 .val_bits =3D 8,
> + =A0 =A0 =A0 .max_register =3D MAX77686_ALARM2_DATE,
> +};
> +
> +int max77686_read_reg(struct i2c_client *i2c, int reg, int *buf)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> +
> + =A0 =A0 =A0 if (i2c =3D=3D max77686->i2c)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_read(max77686->regmap, re=
g, buf);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_read(max77686->rtc_regmap=
, reg, buf);
> +}
> +EXPORT_SYMBOL_GPL(max77686_read_reg);
> +
> +int max77686_bulk_read(struct i2c_client *i2c, int reg, int count,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int *buf)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> +
> + =A0 =A0 =A0 if (i2c =3D=3D max77686->i2c)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_bulk_read(max77686->regma=
p, reg, buf, count);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_bulk_read(max77686->rtc_r=
egmap, reg, buf, count);
> +}
> +EXPORT_SYMBOL_GPL(max77686_bulk_read);
> +
> +int max77686_write_reg(struct i2c_client *i2c, int reg, int buf)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> + =A0 =A0 =A0 if (i2c =3D=3D max77686->i2c)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_write(max77686->regmap, r=
eg, buf);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_write(max77686->rtc_regma=
p, reg, buf);
> +}
> +EXPORT_SYMBOL_GPL(max77686_write_reg);
> +
> +int max77686_bulk_write(struct i2c_client *i2c, =A0 =A0 =A0 =A0int r=
eg, int count,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int *buf)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> +
> + =A0 =A0 =A0 if (i2c =3D=3D max77686->i2c)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_bulk_write(max77686->regm=
ap, reg, buf, count);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_bulk_write(max77686->rtc_=
regmap, reg, buf, count);
> +}
> +EXPORT_SYMBOL_GPL(max77686_bulk_write);
> +
> +int max77686_update_reg(struct i2c_client *i2c, int reg, int val, in=
t mask)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> + =A0 =A0 =A0 if (i2c =3D=3D max77686->i2c)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_update_bits(max77686->reg=
map, reg, mask, val);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return regmap_update_bits(max77686->rtc=
_regmap, reg, mask, val);
> +}
> +EXPORT_SYMBOL_GPL(max77686_update_reg);
> +
> +#ifdef CONFIG_OF
> +static struct max77686_platform_data *max77686_i2c_parse_dt_pdata(st=
ruct device
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *dev)
> +{
> + =A0 =A0 =A0 struct max77686_platform_data *pd;
> +
> + =A0 =A0 =A0 pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> + =A0 =A0 =A0 if (!pd) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "could not allocate memory=
 for pdata\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return pd;
> +}
> +#else
> +static struct max77686_platform_data *max77686_i2c_parse_dt_pdata(st=
ruct device
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *dev)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +#endif
> +
> +static inline int max77686_i2c_get_driver_data(struct i2c_client *i2=
c,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0const struct i2c_device_id *id)
> +{
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 if (i2c->dev.of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(max77686_pmic_d=
t_match,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->de=
v.of_node);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return (int)match->data;
> + =A0 =A0 =A0 }
> +#endif
> + =A0 =A0 =A0 return (int)id->driver_data;
> +}
> +
> +static int max77686_i2c_probe(struct i2c_client *i2c,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struc=
t i2c_device_id *id)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686;
> + =A0 =A0 =A0 struct max77686_platform_data *pdata =3D i2c->dev.platf=
orm_data;
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int data;
> +
> + =A0 =A0 =A0 max77686 =3D devm_kzalloc(&i2c->dev, sizeof(struct max7=
7686_dev),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KER=
NEL);
> + =A0 =A0 =A0 if (max77686 =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "could not alloc=
ate memory\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 max77686->dev =3D &i2c->dev;
> +
> + =A0 =A0 =A0 if (max77686->dev->of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D max77686_i2c_parse_dt_pdata(m=
ax77686->dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(pdata)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, =
"Unable to parse device tree\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "No platform dat=
a found\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 i2c_set_clientdata(i2c, max77686);
> + =A0 =A0 =A0 max77686->i2c =3D i2c;
> + =A0 =A0 =A0 max77686->irq =3D i2c->irq;
> + =A0 =A0 =A0 max77686->type =3D max77686_i2c_get_driver_data(i2c, id=
);
> +
> + =A0 =A0 =A0 max77686->pdata =3D pdata;
> + =A0 =A0 =A0 max77686->regmap =3D devm_regmap_init_i2c(max77686->i2c=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 &pmic_regmap_config);
> + =A0 =A0 =A0 if (IS_ERR(max77686->regmap)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "Failed to alloc=
ate register map: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(max77686->regmap);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 max77686->rtc =3D i2c_new_dummy(i2c->adapter, I2C_ADDR_=
RTC);
> + =A0 =A0 =A0 i2c_set_clientdata(max77686->rtc, max77686);
> + =A0 =A0 =A0 max77686->rtc_regmap =3D devm_regmap_init_i2c(max77686-=
>rtc,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 &rtc_regmap_config);
> + =A0 =A0 =A0 if (IS_ERR(max77686->rtc_regmap)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "rtc register ma=
pping failed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(max77686->rtc_regmap);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_i2c;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D max77686_read_reg(i2c, MAX77686_REG_DEVICE_ID, =
&data);
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "device not foun=
d on this channel\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_i2c;
> + =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (data & CHIP_REV)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(max77686->dev,=
 "device found with id:0x%x\n"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 , data)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, =
"inappropriate dev id\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_i2c;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D mfd_add_devices(max77686->dev, -1, max77686_dev=
s,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(=
max77686_devs), NULL, 0);
> +
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "mfd_add_devices=
 failed\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_i2c;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D max77686_irq_init(max77686);
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "max77686_irq_in=
it failed\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_mfd;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pm_runtime_set_active(max77686->dev);
> + =A0 =A0 =A0 device_init_wakeup(max77686->dev, true);
> +
> + =A0 =A0 =A0 return ret;
> +
> + err_mfd:
> + =A0 =A0 =A0 mfd_remove_devices(max77686->dev);
> + err_i2c:
> + =A0 =A0 =A0 i2c_unregister_device(max77686->rtc);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int max77686_i2c_remove(struct i2c_client *i2c)
> +{
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> +
> + =A0 =A0 =A0 device_init_wakeup(max77686->dev, 0);
> + =A0 =A0 =A0 pm_runtime_set_suspended(max77686->dev);
> + =A0 =A0 =A0 max77686_irq_exit(max77686);
> + =A0 =A0 =A0 mfd_remove_devices(max77686->dev);
> + =A0 =A0 =A0 i2c_unregister_device(max77686->rtc);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static const struct i2c_device_id max77686_i2c_id[] =3D {
> + =A0 =A0 =A0 {"max77686", 0},
> + =A0 =A0 =A0 {}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, max77686_i2c_id);
> +
> +static int max77686_suspend(struct device *dev)
> +{
> + =A0 =A0 =A0 struct i2c_client *i2c =3D container_of(dev, struct i2c=
_client, dev);
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> +
> + =A0 =A0 =A0 if (device_may_wakeup(dev))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 enable_irq_wake(max77686->irq);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int max77686_resume(struct device *dev)
> +{
> + =A0 =A0 =A0 struct i2c_client *i2c =3D container_of(dev, struct i2c=
_client, dev);
> + =A0 =A0 =A0 struct max77686_dev *max77686 =3D i2c_get_clientdata(i2=
c);
> +
> + =A0 =A0 =A0 if (device_may_wakeup(dev))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_irq_wake(max77686->irq);
> +
> + =A0 =A0 =A0 max77686_irq_resume(max77686);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +const struct dev_pm_ops max77686_pm =3D {
> + =A0 =A0 =A0 .suspend =3D max77686_suspend,
> + =A0 =A0 =A0 .resume =3D max77686_resume,
> +};
> +
> +static struct i2c_driver max77686_i2c_driver =3D {
> + =A0 =A0 =A0 .driver =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "max77686",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pm =3D &max77686_pm,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.of_match_table =3D of_match_ptr=
(max77686_pmic_dt_match),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> + =A0 =A0 =A0 .probe =3D max77686_i2c_probe,
> + =A0 =A0 =A0 .remove =3D max77686_i2c_remove,
> + =A0 =A0 =A0 .id_table =3D max77686_i2c_id,
> +};
> +
> +static int __init max77686_i2c_init(void)
> +{
> + =A0 =A0 =A0 return i2c_add_driver(&max77686_i2c_driver);
> +}
> +
> +static void __exit max77686_i2c_exit(void)
> +{
> + =A0 =A0 =A0 i2c_del_driver(&max77686_i2c_driver);
> +}
> +
> +subsys_initcall(max77686_i2c_init);
> +module_exit(max77686_i2c_exit);
> +
> +MODULE_DESCRIPTION("MAXIM 77686 multi-function core driver");
> +MODULE_AUTHOR("Chiwoong Byun <woong.byun@samsung.com>");
> +MODULE_AUTHOR("Yadwinder Singh Brar <yadi.brar@samsung.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/max77686-private.h b/include/linux/mfd=
/max77686-private.h
> new file mode 100644
> index 0000000..7abb331
> --- /dev/null
> +++ b/include/linux/mfd/max77686-private.h
> @@ -0,0 +1,282 @@
> +/*
> + * max77686.h - Voltage regulator driver for the Maxim 77686
> + *
> + * =A0Copyright (C) 2011 Samsung Electrnoics
> + * =A0Chiwoong Byun <woong.byun@samsung.com>
> + * =A0Yadwinder Singh Brar <yadi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A002111=
-1307 =A0USA
> + */
> +
> +#ifndef __LINUX_MFD_MAX77686_PRIV_H
> +#define __LINUX_MFD_MAX77686_PRIV_H
> +
> +#include <linux/i2c.h>
> +
> +#define MAX77686_REG_INVALID =A0 =A0 =A0 =A0 =A0 (0xff)
> +#define RAMP_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xc0)
> +#define CHIP_REV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x03)
> +
> +enum max77686_pmic_reg {
> + =A0 =A0 =A0 MAX77686_REG_DEVICE_ID =A0 =A0 =A0 =A0 =A0=3D 0x00,
> + =A0 =A0 =A0 MAX77686_REG_INTSRC =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x01,
> + =A0 =A0 =A0 MAX77686_REG_INT1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x02,
> + =A0 =A0 =A0 MAX77686_REG_INT2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x03,
> +
> + =A0 =A0 =A0 MAX77686_REG_INT1MSK =A0 =A0 =A0 =A0 =A0 =A0=3D 0x04,
> + =A0 =A0 =A0 MAX77686_REG_INT2MSK =A0 =A0 =A0 =A0 =A0 =A0=3D 0x05,
> +
> + =A0 =A0 =A0 MAX77686_REG_STATUS1 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x06,
> + =A0 =A0 =A0 MAX77686_REG_STATUS2 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x07,
> +
> + =A0 =A0 =A0 MAX77686_REG_PWRON =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x08,
> + =A0 =A0 =A0 MAX77686_REG_ONOFF_DELAY =A0 =A0 =A0 =A0=3D 0x09,
> + =A0 =A0 =A0 MAX77686_REG_MRSTB =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x0A,
> + =A0 =A0 =A0 /* Reserved: 0x0B-0x0F */
> +
> + =A0 =A0 =A0 MAX77686_REG_BUCK1CTRL =A0 =A0 =A0 =A0 =A0=3D 0x10,
> + =A0 =A0 =A0 MAX77686_REG_BUCK1OUT =A0 =A0 =A0 =A0 =A0 =3D 0x11,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2CTRL1 =A0 =A0 =A0 =A0 =3D 0x12,
> + =A0 =A0 =A0 MAX77686_REG_BUCK234FREQ =A0 =A0 =A0 =A0=3D 0x13,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS1 =A0 =A0 =A0 =A0 =A0=3D 0x14,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS2 =A0 =A0 =A0 =A0 =A0=3D 0x15,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS3 =A0 =A0 =A0 =A0 =A0=3D 0x16,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS4 =A0 =A0 =A0 =A0 =A0=3D 0x17,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS5 =A0 =A0 =A0 =A0 =A0=3D 0x18,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS6 =A0 =A0 =A0 =A0 =A0=3D 0x19,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS7 =A0 =A0 =A0 =A0 =A0=3D 0x1A,
> + =A0 =A0 =A0 MAX77686_REG_BUCK2DVS8 =A0 =A0 =A0 =A0 =A0=3D 0x1B,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3CTRL1 =A0 =A0 =A0 =A0 =3D 0x1C,
> + =A0 =A0 =A0 /* Reserved: 0x1D */
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS1 =A0 =A0 =A0 =A0 =A0=3D 0x1E,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS2 =A0 =A0 =A0 =A0 =A0=3D 0x1F,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS3 =A0 =A0 =A0 =A0 =A0=3D 0x20,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS4 =A0 =A0 =A0 =A0 =A0=3D 0x21,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS5 =A0 =A0 =A0 =A0 =A0=3D 0x22,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS6 =A0 =A0 =A0 =A0 =A0=3D 0x23,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS7 =A0 =A0 =A0 =A0 =A0=3D 0x24,
> + =A0 =A0 =A0 MAX77686_REG_BUCK3DVS8 =A0 =A0 =A0 =A0 =A0=3D 0x25,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4CTRL1 =A0 =A0 =A0 =A0 =3D 0x26,
> + =A0 =A0 =A0 /* Reserved: 0x27 */
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS1 =A0 =A0 =A0 =A0 =A0=3D 0x28,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS2 =A0 =A0 =A0 =A0 =A0=3D 0x29,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS3 =A0 =A0 =A0 =A0 =A0=3D 0x2A,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS4 =A0 =A0 =A0 =A0 =A0=3D 0x2B,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS5 =A0 =A0 =A0 =A0 =A0=3D 0x2C,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS6 =A0 =A0 =A0 =A0 =A0=3D 0x2D,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS7 =A0 =A0 =A0 =A0 =A0=3D 0x2E,
> + =A0 =A0 =A0 MAX77686_REG_BUCK4DVS8 =A0 =A0 =A0 =A0 =A0=3D 0x2F,
> + =A0 =A0 =A0 MAX77686_REG_BUCK5CTRL =A0 =A0 =A0 =A0 =A0=3D 0x30,
> + =A0 =A0 =A0 MAX77686_REG_BUCK5OUT =A0 =A0 =A0 =A0 =A0 =3D 0x31,
> + =A0 =A0 =A0 MAX77686_REG_BUCK6CTRL =A0 =A0 =A0 =A0 =A0=3D 0x32,
> + =A0 =A0 =A0 MAX77686_REG_BUCK6OUT =A0 =A0 =A0 =A0 =A0 =3D 0x33,
> + =A0 =A0 =A0 MAX77686_REG_BUCK7CTRL =A0 =A0 =A0 =A0 =A0=3D 0x34,
> + =A0 =A0 =A0 MAX77686_REG_BUCK7OUT =A0 =A0 =A0 =A0 =A0 =3D 0x35,
> + =A0 =A0 =A0 MAX77686_REG_BUCK8CTRL =A0 =A0 =A0 =A0 =A0=3D 0x36,
> + =A0 =A0 =A0 MAX77686_REG_BUCK8OUT =A0 =A0 =A0 =A0 =A0 =3D 0x37,
> + =A0 =A0 =A0 MAX77686_REG_BUCK9CTRL =A0 =A0 =A0 =A0 =A0=3D 0x38,
> + =A0 =A0 =A0 MAX77686_REG_BUCK9OUT =A0 =A0 =A0 =A0 =A0 =3D 0x39,
> + =A0 =A0 =A0 /* Reserved: 0x3A-0x3F */
> +
> + =A0 =A0 =A0 MAX77686_REG_LDO1CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x40,
> + =A0 =A0 =A0 MAX77686_REG_LDO2CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x41,
> + =A0 =A0 =A0 MAX77686_REG_LDO3CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x42,
> + =A0 =A0 =A0 MAX77686_REG_LDO4CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x43,
> + =A0 =A0 =A0 MAX77686_REG_LDO5CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x44,
> + =A0 =A0 =A0 MAX77686_REG_LDO6CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x45,
> + =A0 =A0 =A0 MAX77686_REG_LDO7CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x46,
> + =A0 =A0 =A0 MAX77686_REG_LDO8CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x47,
> + =A0 =A0 =A0 MAX77686_REG_LDO9CTRL1 =A0 =A0 =A0 =A0 =A0=3D 0x48,
> + =A0 =A0 =A0 MAX77686_REG_LDO10CTRL1 =A0 =A0 =A0 =A0 =3D 0x49,
> + =A0 =A0 =A0 MAX77686_REG_LDO11CTRL1 =A0 =A0 =A0 =A0 =3D 0x4A,
> + =A0 =A0 =A0 MAX77686_REG_LDO12CTRL1 =A0 =A0 =A0 =A0 =3D 0x4B,
> + =A0 =A0 =A0 MAX77686_REG_LDO13CTRL1 =A0 =A0 =A0 =A0 =3D 0x4C,
> + =A0 =A0 =A0 MAX77686_REG_LDO14CTRL1 =A0 =A0 =A0 =A0 =3D 0x4D,
> + =A0 =A0 =A0 MAX77686_REG_LDO15CTRL1 =A0 =A0 =A0 =A0 =3D 0x4E,
> + =A0 =A0 =A0 MAX77686_REG_LDO16CTRL1 =A0 =A0 =A0 =A0 =3D 0x4F,
> + =A0 =A0 =A0 MAX77686_REG_LDO17CTRL1 =A0 =A0 =A0 =A0 =3D 0x50,
> + =A0 =A0 =A0 MAX77686_REG_LDO18CTRL1 =A0 =A0 =A0 =A0 =3D 0x51,
> + =A0 =A0 =A0 MAX77686_REG_LDO19CTRL1 =A0 =A0 =A0 =A0 =3D 0x52,
> + =A0 =A0 =A0 MAX77686_REG_LDO20CTRL1 =A0 =A0 =A0 =A0 =3D 0x53,
> + =A0 =A0 =A0 MAX77686_REG_LDO21CTRL1 =A0 =A0 =A0 =A0 =3D 0x54,
> + =A0 =A0 =A0 MAX77686_REG_LDO22CTRL1 =A0 =A0 =A0 =A0 =3D 0x55,
> + =A0 =A0 =A0 MAX77686_REG_LDO23CTRL1 =A0 =A0 =A0 =A0 =3D 0x56,
> + =A0 =A0 =A0 MAX77686_REG_LDO24CTRL1 =A0 =A0 =A0 =A0 =3D 0x57,
> + =A0 =A0 =A0 MAX77686_REG_LDO25CTRL1 =A0 =A0 =A0 =A0 =3D 0x58,
> + =A0 =A0 =A0 MAX77686_REG_LDO26CTRL1 =A0 =A0 =A0 =A0 =3D 0x59,
> + =A0 =A0 =A0 /* Reserved: 0x5A-0x5F */
> + =A0 =A0 =A0 MAX77686_REG_LDO1CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x60,
> + =A0 =A0 =A0 MAX77686_REG_LDO2CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x61,
> + =A0 =A0 =A0 MAX77686_REG_LDO3CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x62,
> + =A0 =A0 =A0 MAX77686_REG_LDO4CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x63,
> + =A0 =A0 =A0 MAX77686_REG_LDO5CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x64,
> + =A0 =A0 =A0 MAX77686_REG_LDO6CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x65,
> + =A0 =A0 =A0 MAX77686_REG_LDO7CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x66,
> + =A0 =A0 =A0 MAX77686_REG_LDO8CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x67,
> + =A0 =A0 =A0 MAX77686_REG_LDO9CTRL2 =A0 =A0 =A0 =A0 =A0=3D 0x68,
> + =A0 =A0 =A0 MAX77686_REG_LDO10CTRL2 =A0 =A0 =A0 =A0 =3D 0x69,
> + =A0 =A0 =A0 MAX77686_REG_LDO11CTRL2 =A0 =A0 =A0 =A0 =3D 0x6A,
> + =A0 =A0 =A0 MAX77686_REG_LDO12CTRL2 =A0 =A0 =A0 =A0 =3D 0x6B,
> + =A0 =A0 =A0 MAX77686_REG_LDO13CTRL2 =A0 =A0 =A0 =A0 =3D 0x6C,
> + =A0 =A0 =A0 MAX77686_REG_LDO14CTRL2 =A0 =A0 =A0 =A0 =3D 0x6D,
> + =A0 =A0 =A0 MAX77686_REG_LDO15CTRL2 =A0 =A0 =A0 =A0 =3D 0x6E,
> + =A0 =A0 =A0 MAX77686_REG_LDO16CTRL2 =A0 =A0 =A0 =A0 =3D 0x6F,
> + =A0 =A0 =A0 MAX77686_REG_LDO17CTRL2 =A0 =A0 =A0 =A0 =3D 0x70,
> + =A0 =A0 =A0 MAX77686_REG_LDO18CTRL2 =A0 =A0 =A0 =A0 =3D 0x71,
> + =A0 =A0 =A0 MAX77686_REG_LDO19CTRL2 =A0 =A0 =A0 =A0 =3D 0x72,
> + =A0 =A0 =A0 MAX77686_REG_LDO20CTRL2 =A0 =A0 =A0 =A0 =3D 0x73,
> + =A0 =A0 =A0 MAX77686_REG_LDO21CTRL2 =A0 =A0 =A0 =A0 =3D 0x74,
> + =A0 =A0 =A0 MAX77686_REG_LDO22CTRL2 =A0 =A0 =A0 =A0 =3D 0x75,
> + =A0 =A0 =A0 MAX77686_REG_LDO23CTRL2 =A0 =A0 =A0 =A0 =3D 0x76,
> + =A0 =A0 =A0 MAX77686_REG_LDO24CTRL2 =A0 =A0 =A0 =A0 =3D 0x77,
> + =A0 =A0 =A0 MAX77686_REG_LDO25CTRL2 =A0 =A0 =A0 =A0 =3D 0x78,
> + =A0 =A0 =A0 MAX77686_REG_LDO26CTRL2 =A0 =A0 =A0 =A0 =3D 0x79,
> + =A0 =A0 =A0 /* Reserved: 0x7A-0x7D */
> +
> + =A0 =A0 =A0 MAX77686_REG_BBAT_CHG =A0 =A0 =A0 =A0 =A0 =3D 0x7E,
> + =A0 =A0 =A0 MAX77686_REG_32KHZ =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x7F,
> +
> + =A0 =A0 =A0 MAX77686_REG_PMIC_END =A0 =A0 =A0 =A0 =A0 =3D 0x80,
> +};
> +
> +enum max77686_rtc_reg {
> + =A0 =A0 =A0 MAX77686_RTC_INT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x0=
0,
> + =A0 =A0 =A0 MAX77686_RTC_INTM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x01,
> + =A0 =A0 =A0 MAX77686_RTC_CONTROLM =A0 =A0 =A0 =A0 =A0 =3D 0x02,
> + =A0 =A0 =A0 MAX77686_RTC_CONTROL =A0 =A0 =A0 =A0 =A0 =A0=3D 0x03,
> + =A0 =A0 =A0 MAX77686_RTC_UPDATE0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x04,
> + =A0 =A0 =A0 /* Reserved: 0x5 */
> + =A0 =A0 =A0 MAX77686_WTSR_SMPL_CNTL =A0 =A0 =A0 =A0 =3D 0x06,
> + =A0 =A0 =A0 MAX77686_RTC_SEC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x0=
7,
> + =A0 =A0 =A0 MAX77686_RTC_MIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x0=
8,
> + =A0 =A0 =A0 MAX77686_RTC_HOUR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x09,
> + =A0 =A0 =A0 MAX77686_RTC_WEEKDAY =A0 =A0 =A0 =A0 =A0 =A0=3D 0x0A,
> + =A0 =A0 =A0 MAX77686_RTC_MONTH =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0x0B,
> + =A0 =A0 =A0 MAX77686_RTC_YEAR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x0C,
> + =A0 =A0 =A0 MAX77686_RTC_DATE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x0D,
> + =A0 =A0 =A0 MAX77686_ALARM1_SEC =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x0E,
> + =A0 =A0 =A0 MAX77686_ALARM1_MIN =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x0F,
> + =A0 =A0 =A0 MAX77686_ALARM1_HOUR =A0 =A0 =A0 =A0 =A0 =A0=3D 0x10,
> + =A0 =A0 =A0 MAX77686_ALARM1_WEEKDAY =A0 =A0 =A0 =A0 =3D 0x11,
> + =A0 =A0 =A0 MAX77686_ALARM1_MONTH =A0 =A0 =A0 =A0 =A0 =3D 0x12,
> + =A0 =A0 =A0 MAX77686_ALARM1_YEAR =A0 =A0 =A0 =A0 =A0 =A0=3D 0x13,
> + =A0 =A0 =A0 MAX77686_ALARM1_DATE =A0 =A0 =A0 =A0 =A0 =A0=3D 0x14,
> + =A0 =A0 =A0 MAX77686_ALARM2_SEC =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x15,
> + =A0 =A0 =A0 MAX77686_ALARM2_MIN =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x16,
> + =A0 =A0 =A0 MAX77686_ALARM2_HOUR =A0 =A0 =A0 =A0 =A0 =A0=3D 0x17,
> + =A0 =A0 =A0 MAX77686_ALARM2_WEEKDAY =A0 =A0 =A0 =A0 =3D 0x18,
> + =A0 =A0 =A0 MAX77686_ALARM2_MONTH =A0 =A0 =A0 =A0 =A0 =3D 0x19,
> + =A0 =A0 =A0 MAX77686_ALARM2_YEAR =A0 =A0 =A0 =A0 =A0 =A0=3D 0x1A,
> + =A0 =A0 =A0 MAX77686_ALARM2_DATE =A0 =A0 =A0 =A0 =A0 =A0=3D 0x1B,
> +};
> +
> +#define MAX77686_IRQSRC_PMIC =A0 =A0 =A0 =A0 =A0 (0)
> +#define MAX77686_IRQSRC_RTC =A0 =A0 =A0 =A0 =A0 =A0(1 << 0)
> +
> +enum max77686_irq_source {
> + =A0 =A0 =A0 PMIC_INT1 =3D 0,
> + =A0 =A0 =A0 PMIC_INT2,
> + =A0 =A0 =A0 RTC_INT,
> +
> + =A0 =A0 =A0 MAX77686_IRQ_GROUP_NR,
> +};
> +
> +enum max77686_irq {
> + =A0 =A0 =A0 MAX77686_PMICIRQ_PWRONF =3D 0,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_PWRONR,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_JIGONBF,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_JIGONBR,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_ACOKBF,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_ACOKBR,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_ONKEY1S,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_MRSTB,
> +
> + =A0 =A0 =A0 MAX77686_PMICIRQ_140C,
> + =A0 =A0 =A0 MAX77686_PMICIRQ_120C,
> +
> + =A0 =A0 =A0 MAX77686_RTCIRQ_RTC60S =3D 16,
> + =A0 =A0 =A0 MAX77686_RTCIRQ_RTCA1,
> + =A0 =A0 =A0 MAX77686_RTCIRQ_RTCA2,
> + =A0 =A0 =A0 MAX77686_RTCIRQ_SMPL,
> + =A0 =A0 =A0 MAX77686_RTCIRQ_RTC1S,
> + =A0 =A0 =A0 MAX77686_RTCIRQ_WTSR,
> +
> + =A0 =A0 =A0 MAX77686_IRQ_NR,
> +};
> +
> +struct max77686_dev {
> + =A0 =A0 =A0 struct device *dev;
> + =A0 =A0 =A0 struct i2c_client *i2c; /* 0xcc / PMIC, Battery Control=
, and FLASH */
> + =A0 =A0 =A0 struct i2c_client *rtc; /* slave addr 0x0c */
> + =A0 =A0 =A0 struct regmap *regmap;
> + =A0 =A0 =A0 struct regmap *rtc_regmap;
> + =A0 =A0 =A0 int type;
> + =A0 =A0 =A0 int irq;
> + =A0 =A0 =A0 struct mutex irqlock;
> + =A0 =A0 =A0 int irq_masks_cur[MAX77686_IRQ_GROUP_NR];
> + =A0 =A0 =A0 int irq_masks_cache[MAX77686_IRQ_GROUP_NR];
> + =A0 =A0 =A0 struct irq_domain *irq_domain;
> + =A0 =A0 =A0 struct max77686_platform_data *pdata;
> +};
> +
> +extern int max77686_irq_init(struct max77686_dev *max77686);
> +extern void max77686_irq_exit(struct max77686_dev *max77686);
> +extern int max77686_irq_resume(struct max77686_dev *max77686);
> +
> +extern int max77686_read_reg(struct i2c_client *i2c, int reg, int *d=
est);
> +extern int max77686_bulk_read(struct i2c_client *i2c, int reg, int c=
ount,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int *bu=
f);
> +extern int max77686_write_reg(struct i2c_client *i2c, int reg, int v=
alue);
> +extern int max77686_bulk_write(struct i2c_client *i2c, int reg, int =
count,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int *bu=
f);
> +extern int max77686_update_reg(struct i2c_client *i2c, int reg, int =
val,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int mas=
k);
> +
> +extern int max77686_debug_mask; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* en=
ables debug prints */
> +
> +enum {
> + =A0 =A0 =A0 MAX77686_DEBUG_INFO =3D 1 << 0,
> + =A0 =A0 =A0 MAX77686_DEBUG_MASK =3D 1 << 1,
> + =A0 =A0 =A0 MAX77686_DEBUG_INT =3D 1 << 2,
> +};
> +
> +#ifndef CONFIG_DEBUG_MAX77686
> +
> +#define dbg_mask(fmt, ...) do { } while (0)
> +#define dbg_info(fmt, ...) do { } while (0)
> +#define dbg_int(fmt, ...) do { } while (0)
> +
> +#else
> +
> +#define dbg_mask(fmt, ...) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> +do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 if (max77686_debug_mask & MAX77686_DEBUG_MASK) =A0 =A0 =
=A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO pr_fmt(fmt), ##__VA_AR=
GS__); =A0 \
> +} while (0)
> +
> +#define dbg_info(fmt, ...) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> +do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 if (max77686_debug_mask & MAX77686_DEBUG_INFO) =A0 =A0 =
=A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO pr_fmt(fmt), ##__VA_AR=
GS__); =A0 \
> +} while (0)
> +
> +#define dbg_int(fmt, ...) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> +do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 if (max77686_debug_mask & MAX77686_DEBUG_INT) =A0 =A0 =A0=
 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO pr_fmt(fmt), ##__VA_AR=
GS__); =A0 \
> +} while (0)
> +#endif /* DEBUG_MAX77686 */
> +
> +#endif /* =A0__LINUX_MFD_MAX77686_PRIV_H */
> diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max7768=
6.h
> new file mode 100644
> index 0000000..104cc82
> --- /dev/null
> +++ b/include/linux/mfd/max77686.h
> @@ -0,0 +1,100 @@
> +/*
> + * max77686.h - Driver for the Maxim 77686
> + *
> + * =A0Copyright (C) 2011 Samsung Electrnoics
> + * =A0Chiwoong Byun <woong.byun@samsung.com>
> + * =A0Yadwinder Singh Brar <yadi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A002111=
-1307 =A0USA
> + *
> + * This driver is based on max8997.h
> + *
> + * MAX77686 has PMIC, RTC devices.
> + * The devices share the same I2C bus and included in
> + * this mfd driver.
> + */
> +
> +#ifndef __LINUX_MFD_MAX77686_H
> +#define __LINUX_MFD_MAX77686_H
> +
> +#include <linux/regulator/consumer.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +/* MAX77686 regulator IDs */
> +enum max77686_regulators {
> + =A0 =A0 =A0 MAX77686_LDO1 =3D 0,
> + =A0 =A0 =A0 MAX77686_LDO2,
> + =A0 =A0 =A0 MAX77686_LDO3,
> + =A0 =A0 =A0 MAX77686_LDO4,
> + =A0 =A0 =A0 MAX77686_LDO5,
> + =A0 =A0 =A0 MAX77686_LDO6,
> + =A0 =A0 =A0 MAX77686_LDO7,
> + =A0 =A0 =A0 MAX77686_LDO8,
> + =A0 =A0 =A0 MAX77686_LDO9,
> + =A0 =A0 =A0 MAX77686_LDO10,
> + =A0 =A0 =A0 MAX77686_LDO11,
> + =A0 =A0 =A0 MAX77686_LDO12,
> + =A0 =A0 =A0 MAX77686_LDO13,
> + =A0 =A0 =A0 MAX77686_LDO14,
> + =A0 =A0 =A0 MAX77686_LDO15,
> + =A0 =A0 =A0 MAX77686_LDO16,
> + =A0 =A0 =A0 MAX77686_LDO17,
> + =A0 =A0 =A0 MAX77686_LDO18,
> + =A0 =A0 =A0 MAX77686_LDO19,
> + =A0 =A0 =A0 MAX77686_LDO20,
> + =A0 =A0 =A0 MAX77686_LDO21,
> + =A0 =A0 =A0 MAX77686_LDO22,
> + =A0 =A0 =A0 MAX77686_LDO23,
> + =A0 =A0 =A0 MAX77686_LDO24,
> + =A0 =A0 =A0 MAX77686_LDO25,
> + =A0 =A0 =A0 MAX77686_LDO26,
> + =A0 =A0 =A0 MAX77686_BUCK1,
> + =A0 =A0 =A0 MAX77686_BUCK2,
> + =A0 =A0 =A0 MAX77686_BUCK3,
> + =A0 =A0 =A0 MAX77686_BUCK4,
> + =A0 =A0 =A0 MAX77686_BUCK5,
> + =A0 =A0 =A0 MAX77686_BUCK6,
> + =A0 =A0 =A0 MAX77686_BUCK7,
> + =A0 =A0 =A0 MAX77686_BUCK8,
> + =A0 =A0 =A0 MAX77686_BUCK9,
> + =A0 =A0 =A0 MAX77686_EN32KHZ_AP,
> + =A0 =A0 =A0 MAX77686_EN32KHZ_CP,
> + =A0 =A0 =A0 MAX77686_P32KH,
> +
> + =A0 =A0 =A0 MAX77686_REG_MAX,
> +};
> +
> +enum max77686_ramp_rate {
> + =A0 =A0 =A0 MAX77686_RAMP_RATE_13MV =3D 1,
> + =A0 =A0 =A0 MAX77686_RAMP_RATE_27MV, =A0 =A0 =A0 =A0/* default */
> + =A0 =A0 =A0 MAX77686_RAMP_RATE_55MV,
> + =A0 =A0 =A0 MAX77686_RAMP_RATE_100MV,
> +};
> +
> +struct max77686_platform_data {
> + =A0 =A0 =A0 bool wakeup;
> + =A0 =A0 =A0 u8 ramp_delay;
> + =A0 =A0 =A0 struct of_regulator_match *regulators;
> + =A0 =A0 =A0 int num_regulators;
> + =A0 =A0 =A0 struct max77686_opmode_data *opmode_data;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* GPIO-DVS feature is not enabled with the current v=
ersion of
> + =A0 =A0 =A0 =A0* MAX77686 driver. Buck2/3/4_voltages[0] is used as =
the default
> + =A0 =A0 =A0 =A0* voltage at probe.
> + =A0 =A0 =A0 =A0*/
> +};
> +
> +#endif /* __LINUX_MFD_MAX77686_H */
> --
> 1.7.0.4
>
