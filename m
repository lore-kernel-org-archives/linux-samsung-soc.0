From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2] MAX8952 PMIC Driver Initial Release
Date: Wed, 1 Sep 2010 19:12:41 +0900
Message-ID: <AANLkTinUNXmDc=H16gS5EXEAdrGAU=zK4cjsHSh7UQ8Q@mail.gmail.com>
References: <1282283036-12641-1-git-send-email-myungjoo.ham@samsung.com>
	<20100820095351.GD13668@rakim.wolfsonmicro.main>
	<1282301229.3084.152.camel@odin>
	<011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
	<20100901091519.GA17032@opensource.wolfsonmicro.com>
	<000801cb49ba$3e1e50f0$ba5af2d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:32859 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752767Ab0IAKMy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 06:12:54 -0400
Received: by wwb17 with SMTP id 17so1230328wwb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2010 03:12:53 -0700 (PDT)
In-Reply-To: <000801cb49ba$3e1e50f0$ba5af2d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, myungjoo.ham@gmail.com, linux-arm-kernel@lists.infradead.org, Changhwan Youn <chaos.youn@samsung.com>

On Wed, Sep 1, 2010 at 6:44 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Mark Brown wrote:
>>
>> On Wed, Sep 01, 2010 at 09:15:36AM +0900, Kukjin Kim wrote:
>>
>> > Seems almost same between the operation of max8649 and max8952 exc=
ept
>> output
>> > voltage range.
>>
>> > How do you think that can support max8952 with small modifying max=
8649?
>>
>> Take a look at something like the WM831x drivers for how you can han=
dle
>> multiple devices with one driver - you can register I2C IDs for mult=
iple
>> devices and then select behaviour based on the name that was quoted.
>
> MM...but I'm not sure if I can submit other patch for max8952...
> Actually, Mr. Ham's max8952 code has been applied by Liam.
>
> Anyway, could you please see below patch?
> Basic functions are tested on the board...
>
>
> From: Changhwan Youn <chaos.youn@samsung.com>
> ---
> diff --git a/drivers/regulator/max8649.c b/drivers/regulator/max8649.=
c
> index 4520ace..a13bf1d 100644
> --- a/drivers/regulator/max8649.c
> +++ b/drivers/regulator/max8649.c
> @@ -22,6 +22,9 @@
> =A0#define MAX8649_DCDC_STEP =A0 =A0 =A010000 =A0 =A0 =A0 =A0 =A0 /* =
uV */
> =A0#define MAX8649_VOL_MASK =A0 =A0 =A0 0x3f
>
> +/* difference between voltages of max8649 and max8952 */
> +#define DIFF_DCDC_VOL =A0 =A0 =A0 =A0 =A020000 =A0 =A0 =A0 =A0 =A0 /=
* uV */
> +
> =A0/* Registers */
> =A0#define MAX8649_MODE0 =A0 =A0 =A0 =A0 =A00x00
> =A0#define MAX8649_MODE1 =A0 =A0 =A0 =A0 =A00x01
> @@ -138,7 +141,12 @@ static inline int check_range(int min_uV, int ma=
x_uV)
>
> =A0static int max8649_list_voltage(struct regulator_dev *rdev, unsign=
ed index)
> =A0{
> - =A0 =A0 =A0 return (MAX8649_DCDC_VMIN + index * MAX8649_DCDC_STEP);
> + =A0 =A0 =A0 struct max8649_regulator_info *info =3D rdev_get_drvdat=
a(rdev);
> + =A0 =A0 =A0 int ret =3D MAX8649_DCDC_VMIN + index * MAX8649_DCDC_ST=
EP;
> +
> + =A0 =A0 =A0 if (!strcmp(info->i2c->name, "max8952"))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret +=3D DIFF_DCDC_VOL;
> + =A0 =A0 =A0 return ret;
> =A0}
>
> =A0static int max8649_get_voltage(struct regulator_dev *rdev)
> @@ -160,6 +168,11 @@ static int max8649_set_voltage(struct regulator_=
dev
> *rdev,
> =A0 =A0 =A0 =A0struct max8649_regulator_info *info =3D rdev_get_drvda=
ta(rdev);
> =A0 =A0 =A0 =A0unsigned char data, mask;
>
> + =A0 =A0 =A0 if (!strcmp(info->i2c->name, "max8952")) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 min_uV -=3D DIFF_DCDC_VOL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max_uV -=3D DIFF_DCDC_VOL;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0if (check_range(min_uV, max_uV)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(info->dev, "invalid voltage ra=
nge (%d, %d) uV\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0min_uV, max_uV);
> @@ -263,7 +276,6 @@ static struct regulator_ops max8649_dcdc_ops =3D =
{
> =A0 =A0 =A0 =A0.enable_time =A0 =A0=3D max8649_enable_time,
> =A0 =A0 =A0 =A0.set_mode =A0 =A0 =A0 =3D max8649_set_mode,
> =A0 =A0 =A0 =A0.get_mode =A0 =A0 =A0 =3D max8649_get_mode,
> -
> =A0};
>
> =A0static struct regulator_desc dcdc_desc =3D {
> @@ -311,13 +323,13 @@ static int __devinit max8649_regulator_probe(st=
ruct
> i2c_client *client,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 ret =3D max8649_reg_read(info->i2c, MAX8649_CHIP_ID1);
> + =A0 =A0 =A0 ret =3D max8649_reg_read(info->i2c, MAX8649_CHIP_ID2);
Why do you read the ID2? original code read the ID1. With this change
don't brake the max8649?
> =A0 =A0 =A0 =A0if (ret < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(info->dev, "Failed to detect I=
D of MAX8649:%d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 dev_info(info->dev, "Detected MAX8649 (ID:%x)\n", ret);
> + =A0 =A0 =A0 dev_info(info->dev, "Detected %s (ID:%x)\n", id->name, =
ret);
>
> =A0 =A0 =A0 =A0/* enable VID0 & VID1 */
> =A0 =A0 =A0 =A0max8649_set_bits(info->i2c, MAX8649_CONTROL, MAX8649_V=
ID_MASK, 0);
> @@ -354,7 +366,7 @@ static int __devinit max8649_regulator_probe(stru=
ct
> i2c_client *client,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 dev_info(info->dev, "Max8649 regulator device is detect=
ed.\n");
> + =A0 =A0 =A0 dev_info(info->dev, "%s regulator device is detected.\n=
", id->name);
> =A0 =A0 =A0 =A0return 0;
> =A0out:
> =A0 =A0 =A0 =A0kfree(info);
> @@ -376,6 +388,7 @@ static int __devexit max8649_regulator_remove(str=
uct
> i2c_client *client)
>
> =A0static const struct i2c_device_id max8649_id[] =3D {
> =A0 =A0 =A0 =A0{ "max8649", 0 },
> + =A0 =A0 =A0 { "max8952", 0 },
> =A0 =A0 =A0 =A0{ }
> =A0};
> =A0MODULE_DEVICE_TABLE(i2c, max8649_id);
> --
> 1.6.2.5
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
