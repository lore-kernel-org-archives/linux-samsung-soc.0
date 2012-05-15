From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 2/2] regulator: Add support for MAX77686.
Date: Tue, 15 May 2012 19:17:11 +0530
Message-ID: <CAKew6eVZuOUH8RHQbffCGX7i=6dM-qOJXojoKrOsM3V5ugEjHA@mail.gmail.com>
References: <1336580695-1184-1-git-send-email-yadi.brar@samsung.com>
	<1336580695-1184-3-git-send-email-yadi.brar@samsung.com>
	<20120509184709.GC32037@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:45550 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758966Ab2EONrM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 09:47:12 -0400
In-Reply-To: <20120509184709.GC32037@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Yadwinder Singh <yadi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Mark,

On Thu, May 10, 2012 at 12:17 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, May 09, 2012 at 09:54:55PM +0530, Yadwinder Singh wrote:
>
>> +/* Voltage maps in mV */
>> +static const struct voltage_map_desc ldo_voltage_map_desc =3D {
>> + =A0 =A0 .min =3D 800, =A0 =A0 .max =3D 3950, =A0 =A0.step =3D 50, =
=A0 =A0 .n_bits =3D 6,
>> +}; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* LDO3 ~ 5,=
 9 ~ 14, 16 ~ 26 */
>
> Hrm, funnily enough I was just thinking about factoring this stuff ou=
t
> into the core after a conversation with Graeme Gregory the other week=
=2E
> Let's do that...
>
>> + =A0 =A0 [MAX77686_EN32KHZ_AP] =3D NULL,
>> + =A0 =A0 [MAX77686_EN32KHZ_CP] =3D NULL,
>
> Now that the generic clock API is in mainline these should be moved o=
ver
> to use it.
>
>> +static int max77686_get_voltage_unit(int rid)
>> +{
>> + =A0 =A0 int unit =3D 0;
>> +
>> + =A0 =A0 switch (rid) {
>> + =A0 =A0 case MAX77686_BUCK2...MAX77686_BUCK4:
>> + =A0 =A0 =A0 =A0 =A0 =A0 unit =3D 1; =A0 =A0 =A0 /* BUCK2,3,4 is uV=
 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 unit =3D 1000;
>
> Why not just list everything in uV?
>
>> +static int max77686_get_voltage(struct regulator_dev *rdev)
>> +{
>
> Implement get_voltage_sel().
>
>> +static inline int max77686_get_voltage_proper_val(const struct volt=
age_map_desc
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 *desc, int min_vol,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 int max_vol)
>> +{
>> + =A0 =A0 int i =3D 0;
>> +
>> + =A0 =A0 if (desc =3D=3D NULL)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 if (max_vol < desc->min || min_vol > desc->max)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 while (desc->min + desc->step * i < min_vol &&
>> + =A0 =A0 =A0 =A0 =A0 =A0desc->min + desc->step * i < desc->max)
>> + =A0 =A0 =A0 =A0 =A0 =A0 i++;
>
> Why are you iterating here? =A0Calculate! =A0Though like I say let's =
factor
> this out anyway.
>
>> + =A0 =A0 if (rid =3D=3D MAX77686_BUCK2 || rid =3D=3D MAX77686_BUCK3=
 ||
>> + =A0 =A0 =A0 =A0 rid =3D=3D MAX77686_BUCK4) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* If the voltage is increasing */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (org < i)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(DIV_ROUND_UP(desc->=
step * (i - org),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 ramp[max77686->ramp_delay]));
>> + =A0 =A0 }
>
> Don't do this, implement set_voltage_time_sel().
>
>> + =A0 =A0 .enable =3D max77686_reg_enable,
>> + =A0 =A0 .disable =3D max77686_reg_disable,
>> + =A0 =A0 .set_suspend_enable =3D max77686_reg_enable,
>> + =A0 =A0 .set_suspend_disable =3D max77686_reg_disable,
>
> You've got the same ops for suspend and non-suspend cases here, this =
is
> clearly buggy.
>
>> +/* count the number of regulators to be supported in pmic */
>> + =A0 =A0 pdata->num_regulators =3D 0;
>
> Coding style.
>
>> + =A0 =A0 if (iodev->dev->of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D max77686_pmic_dt_parse_pdata(iodev=
, pdata);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>
> This ought to use of_regulator_match().
>

While using it I am seeing that though it reduces few lines of code in
our driver , it adds a huge array(of_regulator_match[])in which we
have to populate the strings(name) which we already have in
regulator_desc[ ], Isn't it overhead ?

>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (!pdata) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "platform data not fou=
nd\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 }
>
> This should be totally fine.
>
>> + =A0 =A0 max77686 =3D kzalloc(sizeof(struct max77686_data), GFP_KER=
NEL);
>> + =A0 =A0 if (!max77686)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>
> devm_kzalloc().
>
>> + =A0 =A0 if (pdata->ramp_delay) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 max77686->ramp_delay =3D pdata->ramp_delay=
;
>> + =A0 =A0 =A0 =A0 =A0 =A0 max77686_update_reg(i2c, MAX77686_REG_BUCK=
2CTRL1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RAMP_VALUE, RAMP_MASK);
>
> This appears not to actually use the value passed in as platform_data=
=2E
>
>> +
>> + =A0 =A0 for (i =3D 0; i < pdata->num_regulators; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 const struct voltage_map_desc *desc;
>> + =A0 =A0 =A0 =A0 =A0 =A0 int id =3D pdata->regulators[i].id;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc =3D reg_voltage_map[id];
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (desc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulators[id].n_voltages =
=3D
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (desc->max - desc-=
>min) / desc->step + 1;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 rdev[i] =3D regulator_register(&regulators=
[id], max77686->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0pdata->regulators[i].initdata,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0max77686, NULL);
>
> No, you should unconditionally register all regulators the device
> physically has. =A0This is useful for debug and simplifies the code.
>

If we have to use only 2 or 3 regulators on our board out off 36 or
lets take a case if our chip supports 50/100 regulators, I think i
will a overhead to register all unused regulators as well as
populating all the regulators in DT or platform data.

Regards,
Yadwinder.
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
