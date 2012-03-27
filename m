From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v4 2/2] regulator: add device tree support for max8997
Date: Tue, 27 Mar 2012 15:40:21 +0900
Message-ID: <CAJ0PZbR3n6Eq36VM23EHA41Y7ag9P1DaXE6cLLNUEntu1mWFcg@mail.gmail.com>
References: <1332582590-16382-1-git-send-email-thomas.abraham@linaro.org>
	<1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39756 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab2C0GkW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 02:40:22 -0400
In-Reply-To: <1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Rajendra Nayak <rnayak@ti.com>

On Sat, Mar 24, 2012 at 6:49 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Add device tree based discovery support for max8997.
>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Rajendra Nayak <rnayak@ti.com>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

> ---
> =A0.../devicetree/bindings/regulator/max8997-pmic.txt | =A0133 ++++++=
++++++++++++
> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 73 ++++++++++-
> =A0drivers/regulator/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0143 +++++++++++++++++++-
> =A0include/linux/mfd/max8997-private.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
> =A05 files changed, 347 insertions(+), 4 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/regulator/max=
8997-pmic.txt
>
> diff --git a/Documentation/devicetree/bindings/regulator/max8997-pmic=
=2Etxt b/Documentation/devicetree/bindings/regulator/max8997-pmic.txt
> new file mode 100644
> index 0000000..90a730b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/max8997-pmic.txt
> @@ -0,0 +1,133 @@
> +* Maxim MAX8997 Voltage and Current Regulator
> +
> +The Maxim MAX8997 is a multi-function device which includes volatage=
 and
> +current regulators, rtc, charger controller and other sub-blocks. It=
 is
> +interfaced to the host controller using a i2c interface. Each sub-bl=
ock is
> +addressed by the host system using different i2c slave address. This=
 document
> +describes the bindings for 'pmic' sub-block of max8997.
> +
> +Required properties:
> +- compatible: Should be "maxim,max8997-pmic".
> +- reg: Specifies the i2c slave address of the pmic block. It should =
be 0x66.
> +
> +- max8997,pmic-buck1-dvs-voltage: A set of 8 voltage values in micro=
-volt (uV)
> + =A0units for buck1 when changing voltage using gpio dvs. Refer to [=
1] below
> + =A0for additional information.
> +
> +- max8997,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro=
-volt (uV)
> + =A0units for buck2 when changing voltage using gpio dvs. Refer to [=
1] below
> + =A0for additional information.
> +
> +- max8997,pmic-buck5-dvs-voltage: A set of 8 voltage values in micro=
-volt (uV)
> + =A0units for buck5 when changing voltage using gpio dvs. Refer to [=
1] below
> + =A0for additional information.
> +
> +[1] If none of the 'max8997,pmic-buck[1/2/5]-uses-gpio-dvs' optional
> + =A0 =A0property is specified, the 'max8997,pmic-buck[1/2/5]-dvs-vol=
tage'
> + =A0 =A0property should specify atleast one voltage level (which wou=
ld be a
> + =A0 =A0safe operating voltage).
> +
> + =A0 =A0If either of the 'max8997,pmic-buck[1/2/5]-uses-gpio-dvs' op=
tional
> + =A0 =A0property is specified, then all the eigth voltage values for=
 the
> + =A0 =A0'max8997,pmic-buck[1/2/5]-dvs-voltage' should be specified.
> +
> +Optional properties:
> +- interrupt-parent: Specifies the phandle of the interrupt controlle=
r to which
> + =A0the interrupts from max8997 are delivered to.
> +- interrupts: Interrupt specifiers for two interrupt sources.
> + =A0- First interrupt specifier is for 'irq1' interrupt.
> + =A0- Second interrupt specifier is for 'alert' interrupt.
> +- max8997,pmic-buck1-uses-gpio-dvs: 'buck1' can be controlled by gpi=
o dvs.
> +- max8997,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpi=
o dvs.
> +- max8997,pmic-buck5-uses-gpio-dvs: 'buck5' can be controlled by gpi=
o dvs.
> +
> +Additional properties required if either of the optional properties =
are used:
> +- max8997,pmic-ignore-gpiodvs-side-effect: When GPIO-DVS mode is use=
d for
> + =A0multiple bucks, changing the voltage value of one of the bucks m=
ay affect
> + =A0that of another buck, which is the side effect of the change (se=
t_voltage).
> + =A0Use this property to ignore such side effects and change the vol=
tage.
> +
> +- max8997,pmic-buck125-default-dvs-idx: Default voltage setting sele=
cted from
> + =A0the possible 8 options selectable by the dvs gpios. The value of=
 this
> + =A0property should be between 0 and 7. If not specified or if out o=
f range, the
> + =A0default value of this property is set to 0.
> +
> +- max8997,pmic-buck125-dvs-gpios: GPIO specifiers for three host gpi=
o's used
> + =A0for dvs. The format of the gpio specifier depends in the gpio co=
ntroller.
> +
> +
> +Regulators: The regulators of max8997 that have to be instantiated s=
hould be
> +included in a sub-node named 'regulators'. Regulator nodes included =
in this
> +sub-node should be of the format as below. Note: The 'n' in LDOn and=
 BUCKn
> +represents the LDO or BUCK number as per the datasheet of max8997.
> +
> + =A0 =A0For LDO's:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 LDOn {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 standard regulator bind=
ings here
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0For BUCK's:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUCKn {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 standard regulator bind=
ings here
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> +The bindings inside the regulator nodes use the standard regulator b=
indings
> +which are documented elsewhere.
> +
> +Example:
> +
> + =A0 =A0 =A0 max8997_pmic@66 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "maxim,max8997-pmic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&wakeup_eint>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x66>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4 0>, <3 0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck1-uses-gpio-dvs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck2-uses-gpio-dvs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck5-uses-gpio-dvs;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-ignore-gpiodvs-side-effect=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck125-default-dvs-idx =3D=
 <0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck125-dvs-gpios =3D <&gp=
x0 0 1 0 0>, /* SET1 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpx0 1 1 0 0>, /* SET2 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpx0 2 1 0 0>; /* SET3 */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck1-dvs-voltage =3D <135=
0000>, <1300000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1250000>, <1200000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1150000>, <1100000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1000000>, <950000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck2-dvs-voltage =3D <110=
0000>, <1100000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1100000>, <1100000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1000000>, <1000000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1000000>, <1000000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997,pmic-buck5-dvs-voltage =3D <120=
0000>, <1200000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1200000>, <1200000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1200000>, <1200000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1200000>, <1200000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulators {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldo1_reg: LDO1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-name =3D "VDD_ABB_3.3V";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-min-microvolt =3D <3300000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-max-microvolt =3D <3300000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldo2_reg: LDO2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-name =3D "VDD_ALIVE_1.1V";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-min-microvolt =3D <1100000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-max-microvolt =3D <1100000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-always-on;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buck1_reg: BUCK1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-name =3D "VDD_ARM_1.2V";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-min-microvolt =3D <950000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-max-microvolt =3D <1350000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-always-on;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulat=
or-boot-on;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index 20ecad3..1c38e98 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -21,8 +21,10 @@
> =A0* This driver is based on max8998.c
> =A0*/
>
> +#include <linux/err.h>
> =A0#include <linux/slab.h>
> =A0#include <linux/i2c.h>
> +#include <linux/of_irq.h>
> =A0#include <linux/interrupt.h>
> =A0#include <linux/pm_runtime.h>
> =A0#include <linux/module.h>
> @@ -47,6 +49,13 @@ static struct mfd_cell max8997_devs[] =3D {
> =A0 =A0 =A0 =A0{ .name =3D "max8997-led", .id =3D 2 },
> =A0};
>
> +#ifdef CONFIG_OF
> +static struct of_device_id __devinitdata max8997_pmic_dt_match[] =3D=
 {
> + =A0 =A0 =A0 { .compatible =3D "maxim,max8997-pmic", .data =3D TYPE_=
MAX8997 },
> + =A0 =A0 =A0 {},
> +};
> +#endif
> +
> =A0int max8997_read_reg(struct i2c_client *i2c, u8 reg, u8 *dest)
> =A0{
> =A0 =A0 =A0 =A0struct max8997_dev *max8997 =3D i2c_get_clientdata(i2c=
);
> @@ -123,6 +132,58 @@ int max8997_update_reg(struct i2c_client *i2c, u=
8 reg, u8 val, u8 mask)
> =A0}
> =A0EXPORT_SYMBOL_GPL(max8997_update_reg);
>
> +#ifdef CONFIG_OF
> +/*
> + * Only the common platform data elements for max8997 are parsed her=
e from the
> + * device tree. Other sub-modules of max8997 such as pmic, rtc and o=
thers have
> + * to parse their own platform data elements from device tree.
> + *
> + * The max8997 platform data structure is instantiated here and the =
drivers for
> + * the sub-modules need not instantiate another instance while parsi=
ng their
> + * platform data.
> + */
> +static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct device *dev)
> +{
> + =A0 =A0 =A0 struct max8997_platform_data *pd;
> +
> + =A0 =A0 =A0 pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> + =A0 =A0 =A0 if (!pd) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "could not allocate memory=
 for pdata\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pd->ono =3D irq_of_parse_and_map(dev->of_node, 1);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* ToDo: the 'wakeup' member in the platform data is =
more of a linux
> + =A0 =A0 =A0 =A0* specfic information. Hence, there is no binding fo=
r that yet and
> + =A0 =A0 =A0 =A0* not parsed here.
> + =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 return pd;
> +}
> +#else
> +static int max8997_i2c_parse_dt_pdata(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct max8997_platform_data **pdata)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +#endif
> +
> +static inline int max8997_i2c_get_driver_data(struct i2c_client *i2c=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 const struct i2c_device_id *id)
> +{
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 if (i2c->dev.of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(max8997_pmic_dt=
_match, i2c->dev.of_node);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return (int)match->data;
> + =A0 =A0 =A0 }
> +#endif
> + =A0 =A0 =A0 return (int)id->driver_data;
> +}
> +
> =A0static int max8997_i2c_probe(struct i2c_client *i2c,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct i=
2c_device_id *id)
> =A0{
> @@ -137,12 +198,21 @@ static int max8997_i2c_probe(struct i2c_client =
*i2c,
> =A0 =A0 =A0 =A0i2c_set_clientdata(i2c, max8997);
> =A0 =A0 =A0 =A0max8997->dev =3D &i2c->dev;
> =A0 =A0 =A0 =A0max8997->i2c =3D i2c;
> - =A0 =A0 =A0 max8997->type =3D id->driver_data;
> + =A0 =A0 =A0 max8997->type =3D max8997_i2c_get_driver_data(i2c, id);
> =A0 =A0 =A0 =A0max8997->irq =3D i2c->irq;
>
> + =A0 =A0 =A0 if (max8997->dev->of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D max8997_i2c_parse_dt_pdata(ma=
x8997->dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(pdata)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0if (!pdata)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
> + =A0 =A0 =A0 max8997->pdata =3D pdata;
> =A0 =A0 =A0 =A0max8997->ono =3D pdata->ono;
>
> =A0 =A0 =A0 =A0mutex_init(&max8997->iolock);
> @@ -434,6 +504,7 @@ static struct i2c_driver max8997_i2c_driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "max8997",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =3D THIS_MODULE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =3D &max8997_pm,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.of_match_table =3D of_match_ptr=
(max8997_pmic_dt_match),
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.probe =3D max8997_i2c_probe,
> =A0 =A0 =A0 =A0.remove =3D max8997_i2c_remove,
> diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.=
c
> index 9657929..dce8aaf 100644
> --- a/drivers/regulator/max8997.c
> +++ b/drivers/regulator/max8997.c
> @@ -25,6 +25,7 @@
> =A0#include <linux/delay.h>
> =A0#include <linux/err.h>
> =A0#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> =A0#include <linux/slab.h>
> =A0#include <linux/module.h>
> =A0#include <linux/platform_device.h>
> @@ -32,6 +33,7 @@
> =A0#include <linux/regulator/machine.h>
> =A0#include <linux/mfd/max8997.h>
> =A0#include <linux/mfd/max8997-private.h>
> +#include <linux/regulator/of_regulator.h>
>
> =A0struct max8997_data {
> =A0 =A0 =A0 =A0struct device *dev;
> @@ -953,21 +955,155 @@ static struct regulator_desc regulators[] =3D =
{
> =A0 =A0 =A0 =A0},
> =A0};
>
> +#ifdef CONFIG_OF
> +static int max8997_pmic_dt_parse_dvs_gpio(struct max8997_dev *iodev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct max8997_platform=
_data *pdata,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *pmi=
c_np)
> +{
> + =A0 =A0 =A0 int i, gpio;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < 3; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio =3D of_get_named_gpio(pmic_np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "max8997,pmic-buck125-dvs-gpios", i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!gpio_is_valid(gpio)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "in=
valid gpio[%d]: %d\n", i, gpio);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->buck125_gpios[i] =3D gpio;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int max8997_pmic_dt_parse_pdata(struct max8997_dev *iodev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct max8997_platform_data *pdata)
> +{
> + =A0 =A0 =A0 struct device_node *pmic_np, *regulators_np, *reg_np;
> + =A0 =A0 =A0 struct max8997_regulator_data *rdata;
> + =A0 =A0 =A0 unsigned int i, dvs_voltage_nr =3D 1, ret;
> +
> + =A0 =A0 =A0 pmic_np =3D iodev->dev->of_node;
> + =A0 =A0 =A0 if (!pmic_np) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "could not find pmi=
c sub-node\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 regulators_np =3D of_find_node_by_name(pmic_np, "regula=
tors");
> + =A0 =A0 =A0 if (!regulators_np) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "could not find reg=
ulators sub-node\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* count the number of regulators to be supported in pm=
ic */
> + =A0 =A0 =A0 pdata->num_regulators =3D 0;
> + =A0 =A0 =A0 for_each_child_of_node(regulators_np, reg_np)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->num_regulators++;
> +
> + =A0 =A0 =A0 rdata =3D devm_kzalloc(iodev->dev, sizeof(*rdata) *
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
num_regulators, GFP_KERNEL);
> + =A0 =A0 =A0 if (!rdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "could not allocate=
 memory for "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 "regulator data\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pdata->regulators =3D rdata;
> + =A0 =A0 =A0 for_each_child_of_node(regulators_np, reg_np) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(regulators=
); i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!of_node_cmp(reg_np=
->name, regulators[i].name))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdata->id =3D i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdata->initdata =3D of_get_regulator_in=
it_data(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 iodev->dev, reg_np);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdata->reg_node =3D reg_np;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdata++;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (of_get_property(pmic_np, "max8997,pmic-buck1-uses-g=
pio-dvs", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->buck1_gpiodvs =3D true;
> +
> + =A0 =A0 =A0 if (of_get_property(pmic_np, "max8997,pmic-buck2-uses-g=
pio-dvs", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->buck2_gpiodvs =3D true;
> +
> + =A0 =A0 =A0 if (of_get_property(pmic_np, "max8997,pmic-buck5-uses-g=
pio-dvs", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->buck5_gpiodvs =3D true;
> +
> + =A0 =A0 =A0 if (pdata->buck1_gpiodvs || pdata->buck2_gpiodvs ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 pdata->buck5_gpiodvs) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D max8997_pmic_dt_parse_dvs_gpio(=
iodev, pdata, pmic_np);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(pmic_np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max899=
7,pmic-buck125-default-dvs-idx",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &pdata-=
>buck125_default_idx)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->buck125_default_=
idx =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pdata->buck125_defa=
ult_idx >=3D 8) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
buck125_default_idx =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_inf=
o(iodev->dev, "invalid value for "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "defaul=
t dvs index, using 0 instead\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_get_property(pmic_np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max8997,pmic-ignore-gp=
iodvs-side-effect", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->ignore_gpiodvs_s=
ide_effect =3D true;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dvs_voltage_nr =3D 8;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (of_property_read_u32_array(pmic_np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max899=
7,pmic-buck1-dvs-voltage",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
buck1_voltage, dvs_voltage_nr)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "buck1 voltages not=
 specified\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (of_property_read_u32_array(pmic_np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max899=
7,pmic-buck2-dvs-voltage",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
buck2_voltage, dvs_voltage_nr)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "buck2 voltages not=
 specified\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (of_property_read_u32_array(pmic_np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max899=
7,pmic-buck5-dvs-voltage",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
buck5_voltage, dvs_voltage_nr)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "buck5 voltages not=
 specified\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +#else
> +static int max8997_pmic_dt_parse_pdata(struct max8997_dev *iodev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct max8997_platform_data *pdata)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +#endif /* CONFIG_OF */
> +
> =A0static __devinit int max8997_pmic_probe(struct platform_device *pd=
ev)
> =A0{
> =A0 =A0 =A0 =A0struct max8997_dev *iodev =3D dev_get_drvdata(pdev->de=
v.parent);
> - =A0 =A0 =A0 struct max8997_platform_data *pdata =3D dev_get_platdat=
a(iodev->dev);
> + =A0 =A0 =A0 struct max8997_platform_data *pdata =3D iodev->pdata;
> =A0 =A0 =A0 =A0struct regulator_dev **rdev;
> =A0 =A0 =A0 =A0struct max8997_data *max8997;
> =A0 =A0 =A0 =A0struct i2c_client *i2c;
> =A0 =A0 =A0 =A0int i, ret, size;
> =A0 =A0 =A0 =A0u8 max_buck1 =3D 0, max_buck2 =3D 0, max_buck5 =3D 0;
>
> - =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 if (IS_ERR_OR_NULL(pdata)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(pdev->dev.parent, "No platform=
 init data supplied.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 if (iodev->dev->of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D max8997_pmic_dt_parse_pdata(iod=
ev, pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0max8997 =3D kzalloc(sizeof(struct max8997_data), GFP_K=
ERNEL);
> =A0 =A0 =A0 =A0if (!max8997)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> @@ -1141,7 +1277,8 @@ static __devinit int max8997_pmic_probe(struct =
platform_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0regulators[id].n_volta=
ges =3D 16;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rdev[i] =3D regulator_register(&regula=
tors[id], max8997->dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
regulators[i].initdata, max8997, NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
regulators[i].initdata, max8997,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->=
regulators[i].reg_node);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (IS_ERR(rdev[i])) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D PTR_ERR(rdev[i=
]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(max8997->dev, =
"regulator init failed for %d\n",
> diff --git a/include/linux/mfd/max8997-private.h b/include/linux/mfd/=
max8997-private.h
> index 830152c..6ae21bf 100644
> --- a/include/linux/mfd/max8997-private.h
> +++ b/include/linux/mfd/max8997-private.h
> @@ -316,6 +316,7 @@ enum max8997_irq {
> =A0#define MAX8997_NUM_GPIO =A0 =A0 =A0 12
> =A0struct max8997_dev {
> =A0 =A0 =A0 =A0struct device *dev;
> + =A0 =A0 =A0 struct max8997_platform_data *pdata;
> =A0 =A0 =A0 =A0struct i2c_client *i2c; /* 0xcc / PMIC, Battery Contro=
l, and FLASH */
> =A0 =A0 =A0 =A0struct i2c_client *rtc; /* slave addr 0x0c */
> =A0 =A0 =A0 =A0struct i2c_client *haptic; /* slave addr 0x90 */
> diff --git a/include/linux/mfd/max8997.h b/include/linux/mfd/max8997.=
h
> index 818486c..ba92375 100644
> --- a/include/linux/mfd/max8997.h
> +++ b/include/linux/mfd/max8997.h
> @@ -75,6 +75,7 @@ enum max8998_regulators {
> =A0struct max8997_regulator_data {
> =A0 =A0 =A0 =A0int id;
> =A0 =A0 =A0 =A0struct regulator_init_data *initdata;
> + =A0 =A0 =A0 struct device_node *reg_node;
> =A0};
>
> =A0enum max8997_muic_usb_type {
> --
> 1.6.6.rc2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
