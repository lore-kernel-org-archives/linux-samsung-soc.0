From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 6/7] mfd: cros_ec: Support multiple EC in a system
Date: Thu, 28 May 2015 15:26:09 +0100
Message-ID: <20150528142551.GU11677@x1>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432309340-13688-7-git-send-email-javier.martinez@collabora.co.uk>
 <20150527091154.GX11677@x1>
 <55671F8F.1090500@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:35038 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932081AbbE1O0Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 10:26:16 -0400
Received: by wgme6 with SMTP id e6so38011306wgm.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2015 07:26:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55671F8F.1090500@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

On Thu, 28 May 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> Thanks a lot for your feedback.
>=20
> On 05/27/2015 11:11 AM, Lee Jones wrote:
> > On Fri, 22 May 2015, Javier Martinez Canillas wrote:
> >=20
> >> From: Gwendal Grignou <gwendal@chromium.org>
> >>=20
> >> Chromebooks can have more than one Embedded Controller so the
> >> cros_ec device id has to be incremented for each EC registered.
> >>=20
> >> Add code to handle multiple EC. First ec found is cros-ec0,
> >> second cros-ec1 and so on.
> >>=20
> >> Add a new structure to represent multiple EC as different char
> >> devices (e.g: /dev/cros_ec, /dev/cros_pd). It connects to
> >> cros_ec_device and allows sysfs inferface for cros_pd.
> >>=20
> >> Also reduce number of allocated objects, make chromeos sysfs
> >> class object a static and add refcounting to prevent object
> >> deletion while command is in progress.
> >>=20
> >> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> >> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora=
=2Eco.uk>
> >> ---
> >>=20
> >> Changes since v2: None
> >>=20
> >> Changes since v1:
> >>   - Squash patch that adds support to represent EC's as different
> >>     char devices (e.g: /dev/cros_ec, /dev/cros_pd):
> >>     https://chromium-review.googlesource.com/#/c/217297/
> >>     Suggested by Gwendal Grignou
> >>   - Use cros_ec instead of cros-ec in the subject line to be consi=
stent.
> >>     Suggested by Gwendal Grignou
> >> ---
> >>  drivers/input/keyboard/cros_ec_keyb.c      |   2 +-
> >>  drivers/mfd/cros_ec.c                      |  66 +++++++++++++--
> >>  drivers/mfd/cros_ec_i2c.c                  |   1 -
> >>  drivers/mfd/cros_ec_spi.c                  |   1 -
> >>  drivers/platform/chrome/cros_ec_dev.c      | 128 ++++++++++++++++=
++++---------
> >>  drivers/platform/chrome/cros_ec_dev.h      |   7 --
> >>  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++-------=
-
> >>  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
> >>  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
> >>  include/linux/mfd/cros_ec.h                |  44 ++++++++--
> >>  10 files changed, 247 insertions(+), 126 deletions(-)

[...]

> >> @@ -52,14 +88,28 @@ int cros_ec_register(struct cros_ec_device *ec=
_dev)
> >> =20
> >>  	cros_ec_query_all(ec_dev);
> >> =20
> >> -	err =3D mfd_add_devices(dev, 0, cros_devs,
> >> -			      ARRAY_SIZE(cros_devs),
> >> -			      NULL, ec_dev->irq, NULL);
> >> +	err =3D cros_ec_dev_register(ec_dev, dev_id++, 0);
> >>  	if (err) {
> >> -		dev_err(dev, "failed to add mfd devices\n");
> >> +		dev_err(dev, "failed to add ec\n");
> >>  		return err;
> >>  	}
> >> =20
> >> +	if (ec_dev->max_passthru) {
> >> +		/*
> >> +		 * Register a PD device as well on top of this device.
> >> +		 * We make the following assumptions:
> >> +		 * - behind an EC, we have a pd
> >> +		 * - only one device added.
> >> +		 * - the EC is responsive at init time (it is not true for a
> >> +		 *   sensor hub.
> >> +		 */
> >> +		err =3D cros_ec_dev_register(ec_dev, dev_id++, 1);
> >=20
> > I don't really like this devidx business.  Just keep it simple and
> > define more than one mfd_cell structure.
>=20
> I explained to you that this is done because the number of cells depe=
nds on
> the system. I can have an array of mfd_cell structures and use the in=
dex to
> register but I don't think that is easier to understand.

Keep it simple.  Create a static struct for each and:

mfd_add_devices(ec_cell)

if (ec_dev->max_passthru)
   mfd_add_devices(ec_pd_cell)

> >> +		if (err) {
> >> +			dev_err(dev, "failed to add additional ec\n");
> >> +			return err;
> >> +		}
> >> +	}
> >> +
> >>  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> >>  		err =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
> >>  		if (err) {
> >=20
>=20
> Best regards,
> Javier

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
