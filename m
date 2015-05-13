From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 03/10] mfd: cros_ec: Instantiate sub-devices from
 device tree
Date: Wed, 13 May 2015 13:10:35 +0100
Message-ID: <20150513121035.GL3394@x1>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
 <1431166241-15775-4-git-send-email-javier.martinez@collabora.co.uk>
 <20150513113200.GJ3394@x1>
 <555338F3.8030507@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:38147 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754606AbbEMMKl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 08:10:41 -0400
Received: by wicnf17 with SMTP id nf17so53074833wic.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2015 05:10:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <555338F3.8030507@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 13 May 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 05/13/2015 01:32 PM, Lee Jones wrote:
> > On Sat, 09 May 2015, Javier Martinez Canillas wrote:
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
> >> Tested-by: Heiko Stuebner <heiko@sntech.de>
> >> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> >> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> >> ---
> >>=20
> >> Changes since v1:
> >>   - Added Heiko Stuebner and Gwendal Grignou Tested-by tag
> >>   - Added Gwendal Grignou Reviewed-by tag
> >>   - Use automatic device ID instead of 1 as suggested by Lee Jones
> >>   - Remove #ifdeffery and check for of_node to register sub-device=
s
> >>     Suggested by Lee Jones
> >> ---
> >>  drivers/mfd/cros_ec.c | 22 +++++++++++-----------
> >>  1 file changed, 11 insertions(+), 11 deletions(-)
> >>=20
> >> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> >> index c4aecc6f8373..1574a9352a6d 100644
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
> >> +		.id =3D PLATFORM_DEVID_AUTO,
> >>  	},
> >>  };
> >> =20
> >> @@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *e=
c_dev)
> >>  		return err;
> >>  	}
> >> =20
> >> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> >=20
> > You don't need to check for OF.  of_node will be NULL if OF isn't
> > enabled.
> >
>=20
> Yes, you don't need it but IS_ENABLED(CONFIG_OF) causes the check to =
be
> optimized away by the compiler if CONFIG_OF is not enabled AFAIK.
>=20
> Without the IS_ENABLED(CONFIG_OF) check, this becomes a pointless poi=
nter
> check that will always evaluate to false on systems without CONFIG_OF
> since as you said of_node will be present when CONFIG_OF is not enabl=
ed.
> But the compiler has no way to know it will always be NULL to optimiz=
e it
> away AFAICT.

Yes, you're absolutely right.  You passed the test. ;)

Acked-by: Lee Jones <lee.jones@linaro.org>

> >> +		err =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
> >> +		if (err) {
> >> +			mfd_remove_devices(dev);
> >> +			dev_err(dev, "Failed to register sub-devices\n");
> >> +			return err;
> >> +		}
> >> +	}
> >> +
> >>  	dev_info(dev, "Chrome EC device registered\n");
> >> =20
> >>  	return 0;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
