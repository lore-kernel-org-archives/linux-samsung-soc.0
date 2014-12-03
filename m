From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: RE: [PATCH] mfd: max77686: Fix parent of rtc device
Date: Wed, 03 Dec 2014 14:32:02 +0530
Message-ID: <000001d00ed7$db623bb0$9226b310$%brar@samsung.com>
References: <1417523620-4311-1-git-send-email-yadi.brar@samsung.com>
 <1417524339-4604-1-git-send-email-yadi.brar@samsung.com>
 <547DBFAD.30605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18595 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650AbaLCJBc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 04:01:32 -0500
In-reply-to: <547DBFAD.30605@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Krzysztof_Koz=C5=82owski'?= <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lee.jones@linaro.org, sameo@linux.intel.com, akpm@linux-foundation.org, tomasz.figa@gmail.com, robh+dt@kernel.org, yadi.brar01@gmail.com



On Tuesday, December 02, 2014 7:04 PM, Krzysztof Koz=C5=82owski wrote:=20
> On 02.12.2014 13:45, Yadwinder Singh Brar wrote:
> > rtc have different i2c client than power(pmic) block. So rtc device
> > should sit under its own i2c client in device hierarchy, which
> reflects in sysfs also.
> > This patch modifies code to register rtc cell with rtc->dev as
> parent.
> >
> > Without this patch :
> > # ls /sys/class/i2c-adapter/i2c-0/0-0009/
> > driver         max77686-pmic  modalias       power          uevent
> > max77686-clk   max77686-rtc   name           subsystem
> >
> > After applying patch :
> > # ls /sys/class/i2c-adapter/i2c-0/0-0006/
> > driver/        modalias       power/         uevent
> > max77686-rtc/  name           subsystem/
> >
> > Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > ---
> >
> > Or Can we follow another (exhaustive but more cleaner) approach,
> which
> > will be more like code refactoring and cleanup rather than only fix=
:
> > Since rtc uses i2c client, which gets created using i2c_new_dummy()
> > and is not shared by any other cell of max77686. So we can covert r=
tc
> > platform driver itself to i2c client driver. It will also allow to
> > expilicitly describe max77686-rtc in DT which we can't do now.
> > It can be applicable to some other existing and new mfd pmic driver=
s.
> > Any suggestion/comments ?
>=20
> Hi,
>=20
> What kind of problem is solved by this patch?
>

Let me try to explain once again :)
After seeing a message "i2c i2c-0: .... , addr=3D0x06, .." in dmesg log=
,
I was not able to find any such device in sysfs as well as device tree.
There was no device under /sys/class/i2c-dev/i2c-0/device/0-0006/
Isn't something wrong or missing ?

This patch fixes that missing parent child relation, which IMO
should be correct always, though it causes any major problem or not.

Still I am thinking, 0-0006 slave device(rtc) shouldn't also appear in =
DT?
As DT should describe the hardware that we are using.

Warm regards,
Yadwinder

> Best regards,
> Krzysztof
>=20
>=20
> >
> > ---
> >  drivers/mfd/max77686.c |   22 ++++++++++++++++++++--
> >  1 files changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c index
> > 929795e..22c0948 100644
> > --- a/drivers/mfd/max77686.c
> > +++ b/drivers/mfd/max77686.c
> > @@ -39,10 +39,13 @@
> >
> >  static const struct mfd_cell max77686_devs[] =3D {
> >  	{ .name =3D "max77686-pmic", },
> > -	{ .name =3D "max77686-rtc", },
> >  	{ .name =3D "max77686-clk", },
> >  };
> >
> > +static const struct mfd_cell max77686_rtc_dev[] =3D {
> > +	{ .name =3D "max77686-rtc", },
> > +};
> > +
> >  static const struct mfd_cell max77802_devs[] =3D {
> >  	{ .name =3D "max77802-pmic", },
> >  	{ .name =3D "max77802-clk", },
> > @@ -332,14 +335,27 @@ static int max77686_i2c_probe(struct i2c_clie=
nt
> *i2c,
> >  		goto err_del_irqc;
> >  	}
> >
> > +	if (max77686->type =3D=3D TYPE_MAX77686) {
> > +		ret =3D mfd_add_devices(&max77686->rtc->dev, -1,
> max77686_rtc_dev,
> > +			1, NULL, 0, NULL);
> > +		if (ret < 0) {
> > +			dev_err(&max77686->rtc->dev,
> > +				"failed to add RTC device %d\n", ret);
> > +			goto err_del_rtc_irqc;
> > +		}
> > +	}
> > +
> >  	ret =3D mfd_add_devices(max77686->dev, -1, cells, n_devs, NULL, 0=
,
> NULL);
> >  	if (ret < 0) {
> >  		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
> > -		goto err_del_rtc_irqc;
> > +		goto err_del_rtc_dev;
> >  	}
> >
> >  	return 0;
> >
> > +err_del_rtc_dev:
> > +	if (max77686->type =3D=3D TYPE_MAX77686)
> > +		mfd_remove_devices(&max77686->rtc->dev);
> >  err_del_rtc_irqc:
> >  	regmap_del_irq_chip(max77686->irq, max77686->rtc_irq_data);
> >  err_del_irqc:
> > @@ -356,6 +372,8 @@ static int max77686_i2c_remove(struct i2c_clien=
t
> *i2c)
> >  	struct max77686_dev *max77686 =3D i2c_get_clientdata(i2c);
> >
> >  	mfd_remove_devices(max77686->dev);
> > +	if (max77686->type =3D=3D TYPE_MAX77686)
> > +		mfd_remove_devices(&max77686->rtc->dev);
> >
> >  	regmap_del_irq_chip(max77686->irq, max77686->rtc_irq_data);
> >  	regmap_del_irq_chip(max77686->irq, max77686->irq_data);
> >
