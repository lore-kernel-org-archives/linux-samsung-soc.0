From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 2/2] regulator: add device tree support for max8997
Date: Thu, 12 Jan 2012 16:09:46 +0530
Message-ID: <CAJuYYwQ2-my0JNSxJgei0Q8c7f3606xzDSHNgL_t+XypzehXoA@mail.gmail.com>
References: <1326353738-26864-1-git-send-email-thomas.abraham@linaro.org>
	<1326353738-26864-3-git-send-email-thomas.abraham@linaro.org>
	<CAJ0PZbSVKiyuZAxJ7-c6T2eM4Lmyj4KDDmx5JBSbwDRxME68Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:56678 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171Ab2ALKjr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jan 2012 05:39:47 -0500
In-Reply-To: <CAJ0PZbSVKiyuZAxJ7-c6T2eM4Lmyj4KDDmx5JBSbwDRxME68Tw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@gmail.com
Cc: linux-kernel@vger.kernel.org, rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rajendra Nayak <rnayak@ti.com>

Dear Mr. Ham,

On 12 January 2012 15:19, MyungJoo Ham <myungjoo.ham@samsung.com> wrote=
:
> On Thu, Jan 12, 2012 at 4:35 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>> Add device tree based discovery support for max8997.
>>
>> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Cc: Rajendra Nayak <rnayak@ti.com>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0.../devicetree/bindings/regulator/max8997-pmic.txt | =A0120 +++++=
+++++++++++
>> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 72 ++++++++++-
>> =A0drivers/regulator/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0143 +++++++++++++++++++-
>> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
>> =A04 files changed, 334 insertions(+), 2 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/regulator/ma=
x8997-pmic.txt
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/max8997-pmi=
c.txt b/Documentation/devicetree/bindings/regulator/max8997-pmic.txt
>> new file mode 100644
>> index 0000000..0c4559d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/max8997-pmic.txt
>> @@ -0,0 +1,120 @@
>> +* Maxim MAX8997 Voltage and Current Regulator
>> +
>> +The Maxim MAX8997 is a multi-function device which includes volatag=
e and
>> +current regulators, rtc, charger controller and other sub-blocks. I=
t is
>> +interfaced to the host controller using a i2c interface. Each sub-b=
lock is
>> +addressed by the host system using different i2c slave address. Thi=
s document
>> +describes the bindings for 'pmic' sub-block of max8997.
>> +
>> +Required properties:
>> +- compatible: Should be "maxim,max8997-pmic".
>> +- reg: Specifies the i2c slave address of the pmic block. It should=
 be 0x66.
>> +
>> +Optional properties:
>> +- interrupt-parent: Specifies the phandle of the interrupt controll=
er to which
>> + =A0the interrupts from max8997 are delivered to.
>> +- interrupts: Interrupt specifiers for two interrupt sources.
>> + =A0- First interrupt specifier is for 'irq1' interrupt.
>> + =A0- Second interrupt specifier is for 'alert' interrupt.
>> +- max8997,pmic-buck1-uses-gpio-dvs: 'buck1' can be controlled by gp=
io dvs.
>> +- max8997,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gp=
io dvs.
>> +- max8997,pmic-buck5-uses-gpio-dvs: 'buck5' can be controlled by gp=
io dvs.
>> +
>> +Additional properties required if either of the optional properties=
 are used:
>> +- max8997,pmic-ignore-gpiodvs-side-effect: When GPIO-DVS mode is us=
ed for
>> + =A0multiple bucks, changing the voltage value of one of the bucks =
may affect
>> + =A0that of another buck, which is the side effect of the change (s=
et_voltage).
>> + =A0Use this property to ignore such side effects and change the vo=
ltage.
>> +
>> +- max8997,pmic-buck125-default-dvs-idx: Default voltage setting sel=
ected from
>> + =A0the possible 8 options selectable by the dvs gpios. The value o=
f this
>> + =A0property should be between 0 and 7. If not specified or if out =
of range, the
>> + =A0default value of this property is set to 0.
>> +
>> +- max8997,pmic-buck125-dvs-gpios: GPIO specifiers for three host gp=
io's used
>> + =A0for dvs. The format of the gpio specifier depends in the gpio c=
ontroller.
>> +
>> +- max8997,pmic-buck1-dvs-voltage: A set of 8 voltage values in micr=
o-volt (uV)
>> + =A0units for buck1 when changing voltage using gpio dvs.
>> +
>> +- max8997,pmic-buck2-dvs-voltage: A set of 8 voltage values in micr=
o-volt (uV)
>> + =A0units for buck2 when changing voltage using gpio dvs.
>> +
>> +- max8997,pmic-buck5-dvs-voltage: A set of 8 voltage values in micr=
o-volt (uV)
>> + =A0units for buck5 when changing voltage using gpio dvs.
>> +
>
> These three values are _not_ optional.
>
> If they are omitted and at least one of buck1/2/5 is supplying
> critical power to the system, which they do in Exynos boards, system
> will not boot properly.
>
> In order to work properly, at least the first element of each array
> should have a proper value (preferrably the maximum safety voltage if
> this gpio-dvs feature is not used) if others are filled with zeros.
>
> If GPIO-DVS mode is enabled, all the 8 elements of each array should
> be filled with proper values.

Thanks for this information. I was not aware of that. I assumed that
if GPIO DVS is not used for BUCK 1/2/5, then there is no need to
supply the DVS voltage options. I will modify this accordingly.

>
>
> []
>> diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997=
=2Ec
>> index d26e864..053d0b7 100644
>> --- a/drivers/regulator/max8997.c
>> +++ b/drivers/regulator/max8997.c
> []
>> @@ -32,6 +33,7 @@
>> =A0struct max8997_data {
>> =A0 =A0 =A0 =A0struct device *dev;
>> @@ -958,6 +960,138 @@ static struct regulator_desc regulators[] =3D =
{
>> =A0 =A0 =A0 =A0},
>> =A0};
>>
>> +#if CONFIG_OF
>
> #ifdef?

Yes, I will fix this.

>
> []
>> +static int max8997_pmic_dt_parse_pdata(struct max8997_dev *iodev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct max8997_platform_data *pdata)
>> +{
> []
>> + =A0 =A0 =A0 if (pdata->buck1_gpiodvs) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32_array(pmic_np=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max89=
97,pmic-buck1-dvs-voltage",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata-=
>buck1_voltage, 8)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "b=
uck1 voltages not specified\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 if (pdata->buck2_gpiodvs) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32_array(pmic_np=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max89=
97,pmic-buck2-dvs-voltage",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata-=
>buck2_voltage, 8)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "b=
uck2 voltages not specified\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 if (pdata->buck5_gpiodvs) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32_array(pmic_np=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "max89=
97,pmic-buck5-dvs-voltage",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata-=
>buck5_voltage, 8)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "b=
uck5 voltages not specified\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>
> As mentioned above, these array should be loaded to probe function
> even if buck?_gpiodvs is false.

Ok.

Thanks for reviewing this patch.

Regards,
Thomas.

>
> []
>
>
>
> Cheers!
> MyungJoo
>
>
> --
> MyungJoo Ham, Ph.D.
> Mobile Software Platform Lab, DMC Business, Samsung Electronics
