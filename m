From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 3/8] mfd: cros_ec: Instantiate sub-devices from
 device tree
Date: Tue, 5 May 2015 11:53:24 +0100
Message-ID: <20150505105324.GA4047@x1>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
 <1428336906-14906-4-git-send-email-javier.martinez@collabora.co.uk>
 <20150429103943.GV9169@x1>
 <55488BA6.9030500@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:34835 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757934AbbEEKx3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 06:53:29 -0400
Received: by wgyo15 with SMTP id o15so178351541wgy.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2015 03:53:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55488BA6.9030500@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 05 May 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 04/29/2015 12:39 PM, Lee Jones wrote:
> > On Mon, 06 Apr 2015, Javier Martinez Canillas wrote:
> >=20
> >> From: Todd Broch <tbroch@chromium.org>
> >>=20
> >> If the EC device tree node has sub-nodes, try to instantiate them =
as
> >> MFD sub-devices.  We can configure the EC features provided by the=
 board.
> >>=20
> >> Signed-off-by: Todd Broch <tbroch@chromium.org>
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora=
=2Eco.uk>
> >> ---
> >>  drivers/mfd/cros_ec.c | 22 +++++++++++-----------
> >>  1 file changed, 11 insertions(+), 11 deletions(-)
> >>=20
> >> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> >> index c4aecc6f8373..8aa83b91e25c 100644
> >> --- a/drivers/mfd/cros_ec.c
> >> +++ b/drivers/mfd/cros_ec.c
> >> @@ -17,6 +17,7 @@
> >>   * battery charging and regulator control, firmware update.
> >>   */
> >> =20
> >> +#include <linux/of_platform.h>
> >>  #include <linux/interrupt.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/module.h>
> >> @@ -109,18 +110,8 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer);
> >> =20
> >>  static const struct mfd_cell cros_devs[] =3D {
> >>  	{
> >> -		.name =3D "cros-ec-keyb",
> >> -		.id =3D 1,
> >> -		.of_compatible =3D "google,cros-ec-keyb",
> >> -	},
> >> -	{
> >> -		.name =3D "cros-ec-i2c-tunnel",
> >> -		.id =3D 2,
> >> -		.of_compatible =3D "google,cros-ec-i2c-tunnel",
> >> -	},
> >> -	{
> >>  		.name =3D "cros-ec-ctl",
> >> -		.id =3D 3,
> >> +		.id =3D 1,
> >=20
> > Can't you use PLATFORM_DEVID_AUTO?
> >
>=20
> Yes, I think that will work as well so I'll change it.
> =20
> >>  	},
> >>  };
> >> =20
> >> @@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *e=
c_dev)
> >>  		return err;
> >>  	}
> >> =20
> >> +#ifdef CONFIG_OF
> >> +	err =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
> >> +	if (err) {
> >> +		mfd_remove_devices(dev);
> >> +		dev_err(dev, "Failed to register sub-devices\n");
> >> +		return err;
> >> +	}
> >> +#endif
> >=20
> > And if we don't support OF?
> >
>=20
> These sub-devices are only present on machines that support OF so
> is more flexible to use of_platform_populate() to register those.
>=20
> Both machines using and not using DT, register a cros-ec-ctl which
> is still a mfd_cell in the cros_devs array.

I'm not really a fan of #ifdiffery if it can be avoided.

How about?

if (np)
   cros_ec_of_register();

> >>  	dev_info(dev, "Chrome EC device registered\n");
> >> =20
> >>  	return 0;
> >=20
>=20
> Best regards,
> Javier

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
