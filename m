From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] MAX8952 PMIC Driver Initial Release
Date: Wed, 01 Sep 2010 19:27:11 +0900
Message-ID: <001101cb49c0$3fd715c0$bf854140$%kim@samsung.com>
References: <1282283036-12641-1-git-send-email-myungjoo.ham@samsung.com>
 <20100820095351.GD13668@rakim.wolfsonmicro.main>
 <1282301229.3084.152.camel@odin>
 <011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
 <20100901091519.GA17032@opensource.wolfsonmicro.com>
 <000801cb49ba$3e1e50f0$ba5af2d0$%kim@samsung.com>
 <AANLkTinUNXmDc=H16gS5EXEAdrGAU=zK4cjsHSh7UQ8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59650 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752155Ab0IAK1B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 06:27:01 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8200DMKD0ZYU80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Sep 2010 19:26:59 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L820020RD0ZS8@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Sep 2010 19:26:59 +0900 (KST)
In-reply-to: <AANLkTinUNXmDc=H16gS5EXEAdrGAU=zK4cjsHSh7UQ8Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Liam Girdwood' <lrg@slimlogic.co.uk>, linux-samsung-soc@vger.kernel.org, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, myungjoo.ham@gmail.com, linux-arm-kernel@lists.infradead.org, 'Changhwan Youn' <chaos.youn@samsung.com>

Kyungmin Park wrote:
>=20
> On Wed, Sep 1, 2010 at 6:44 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > Mark Brown wrote:
> >>
> >> On Wed, Sep 01, 2010 at 09:15:36AM +0900, Kukjin Kim wrote:
> >>
> >> > Seems almost same between the operation of max8649 and max8952 e=
xcept
> >> output
> >> > voltage range.
> >>
> >> > How do you think that can support max8952 with small modifying
max8649?
> >>
> >> Take a look at something like the WM831x drivers for how you can h=
andle
> >> multiple devices with one driver - you can register I2C IDs for
multiple
> >> devices and then select behaviour based on the name that was quote=
d.
> >
> > MM...but I'm not sure if I can submit other patch for max8952...
> > Actually, Mr. Ham's max8952 code has been applied by Liam.
> >
> > Anyway, could you please see below patch?
> > Basic functions are tested on the board...
> >
> >
> > From: Changhwan Youn <chaos.youn@samsung.com>
> > ---
> > diff --git a/drivers/regulator/max8649.c b/drivers/regulator/max864=
9.c
> > index 4520ace..a13bf1d 100644
> > --- a/drivers/regulator/max8649.c
> > +++ b/drivers/regulator/max8649.c

(snip)

> > @@ -311,13 +323,13 @@ static int __devinit
max8649_regulator_probe(struct
> > i2c_client *client,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> > =A0 =A0 =A0 =A0}
> >
> > - =A0 =A0 =A0 ret =3D max8649_reg_read(info->i2c, MAX8649_CHIP_ID1)=
;
> > + =A0 =A0 =A0 ret =3D max8649_reg_read(info->i2c, MAX8649_CHIP_ID2)=
;
> Why do you read the ID2? original code read the ID1. With this change
> don't brake the max8649?

It's no problem, because it is used only in the following printout.

And the reason of changing is that the CHIP_ID1 value of max8649 and ma=
x
8952 is same by 0x20.
So cannot distinguish them. If change to CHIP_ID2, can separate them in=
 the
printout.
(The CHIP_ID2 value of max 8649 is '0x0D', max8952 is '0x1A')

> > =A0 =A0 =A0 =A0if (ret < 0) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(info->dev, "Failed to detect=
 ID of MAX8649:%d\n",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> > =A0 =A0 =A0 =A0}
> > - =A0 =A0 =A0 dev_info(info->dev, "Detected MAX8649 (ID:%x)\n", ret=
);
> > + =A0 =A0 =A0 dev_info(info->dev, "Detected %s (ID:%x)\n", id->name=
, ret);
> >
> > =A0 =A0 =A0 =A0/* enable VID0 & VID1 */
> > =A0 =A0 =A0 =A0max8649_set_bits(info->i2c, MAX8649_CONTROL, MAX8649=
_VID_MASK,
> 0);
> > @@ -354,7 +366,7 @@ static int __devinit max8649_regulator_probe(st=
ruct
> > i2c_client *client,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> > =A0 =A0 =A0 =A0}
> >
> > - =A0 =A0 =A0 dev_info(info->dev, "Max8649 regulator device is dete=
cted.\n");
> > + =A0 =A0 =A0 dev_info(info->dev, "%s regulator device is detected.=
\n",
id->name);
> > =A0 =A0 =A0 =A0return 0;
> > =A0out:
> > =A0 =A0 =A0 =A0kfree(info);
> > @@ -376,6 +388,7 @@ static int __devexit max8649_regulator_remove(s=
truct
> > i2c_client *client)
> >
> > =A0static const struct i2c_device_id max8649_id[] =3D {
> > =A0 =A0 =A0 =A0{ "max8649", 0 },
> > + =A0 =A0 =A0 { "max8952", 0 },
> > =A0 =A0 =A0 =A0{ }
> > =A0};
> > =A0MODULE_DEVICE_TABLE(i2c, max8649_id);
> > --
> > 1.6.2.5
> >
> >


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
