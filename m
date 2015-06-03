From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 7/9] mfd: cros_ec: Support multiple EC in a system
Date: Wed, 3 Jun 2015 14:49:51 +0100
Message-ID: <20150603134951.GD12304@x1>
References: <1433336644-20532-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433336644-20532-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:37932 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753921AbbFCNt5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 09:49:57 -0400
Received: by wibdt2 with SMTP id dt2so13725998wib.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 06:49:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1433336644-20532-8-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

On Wed, 03 Jun 2015, Javier Martinez Canillas wrote:

> From: Gwendal Grignou <gwendal@chromium.org>
>=20
> Chromebooks can have more than one Embedded Controller so the
> cros_ec device id has to be incremented for each EC registered.
>=20
> Add a new structure to represent multiple EC as different char
> devices (e.g: /dev/cros_ec, /dev/cros_pd). It connects to
> cros_ec_device and allows sysfs inferface for cros_pd.
>=20
> Also reduce number of allocated objects, make chromeos sysfs
> class object a static and add refcounting to prevent object
> deletion while command is in progress.
>=20
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>=20
> Changes since v4:
>  - Use cros-ec-name DT property instead of devname. Suggested by Lee =
Jones.
>  - Pass PLATFORM_DEVID_AUTO directly to mfd_add_devices().
>    Suggested by Lee Jones.
>  - Add Heiko Stuebner tested-by tag.
>  - Fix get_version by passing the cmd_offset to EC_CMD_GET_VERSION.
>=20
> Changes since v3:
>  - Add defines for the EC and PD index constants.
>  - Remove cros_ec_dev_register() and declare the mfd_cells as static =
structs.
>    Suggested by Lee Jones.
>=20
> Changes since v2: None
>=20
> Changes since v1:
>   - Squash patch that adds support to represent EC's as different
>     char devices (e.g: /dev/cros_ec, /dev/cros_pd):
>     https://chromium-review.googlesource.com/#/c/217297/
>     Suggested by Gwendal Grignou
>   - Use cros_ec instead of cros-ec in the subject line to be consiste=
nt.
>     Suggested by Gwendal Grignou
> ---
>  drivers/input/keyboard/cros_ec_keyb.c      |   2 +-
>  drivers/mfd/cros_ec.c                      |  57 +++++++++++--
>  drivers/mfd/cros_ec_i2c.c                  |   1 -
>  drivers/mfd/cros_ec_spi.c                  |   1 -
>  drivers/platform/chrome/cros_ec_dev.c      | 130 +++++++++++++++++++=
+---------
>  drivers/platform/chrome/cros_ec_dev.h      |   7 --
>  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
>  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
>  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
>  include/linux/mfd/cros_ec.h                |  44 ++++++++--
>  10 files changed, 239 insertions(+), 127 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/ke=
yboard/cros_ec_keyb.c
> index 974154a74505..b01966dc7eb3 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -275,7 +275,7 @@ static int cros_ec_keyb_probe(struct platform_dev=
ice *pdev)
>  	ckdev->dev =3D dev;
>  	dev_set_drvdata(&pdev->dev, ckdev);
> =20
> -	idev->name =3D ec->ec_name;
> +	idev->name =3D CROS_EC_DEV_NAME;
>  	idev->phys =3D ec->phys_name;
>  	__set_bit(EV_REP, idev->evbit);
> =20
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 08d82bfc5268..6935f385992e 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -24,11 +24,27 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/cros_ec.h>
> =20
> -static const struct mfd_cell cros_devs[] =3D {
> -	{
> -		.name =3D "cros-ec-ctl",
> -		.id =3D PLATFORM_DEVID_AUTO,
> -	},
> +#define CROS_EC_DEV_EC_INDEX 0
> +#define CROS_EC_DEV_PD_INDEX 1
> +
> +struct cros_ec_platform ec_p =3D {
> +	.cmd_offset =3D EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_EC_INDEX),
> +};
> +
> +struct cros_ec_platform pd_p =3D {
> +	.cmd_offset =3D EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX),
> +};
> +
> +struct mfd_cell ec_cell =3D {
> +	.name =3D "cros-ec-ctl",
> +	.platform_data =3D &ec_p,
> +	.pdata_size =3D sizeof(ec_p),
> +};
> +
> +struct mfd_cell ec_pd_cell =3D {
> +	.name =3D "cros-ec-ctl",
> +	.platform_data =3D &pd_p,
> +	.pdata_size =3D sizeof(pd_p),
>  };
> =20
>  int cros_ec_register(struct cros_ec_device *ec_dev)
> @@ -52,14 +68,39 @@ int cros_ec_register(struct cros_ec_device *ec_de=
v)
> =20
>  	cros_ec_query_all(ec_dev);
> =20
> -	err =3D mfd_add_devices(dev, 0, cros_devs,
> -			      ARRAY_SIZE(cros_devs),
> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
> +		ec_p.ec_name =3D of_get_property(dev->of_node,
> +					       "google,cros-ec-name", NULL);

NACK

You either need to obtain this another way, or have a chat with the DT
Maintainers and explain why this platform is special enough to break
the normal conventions.

HINT: I different compatible string is normally more amenable, but
this will also require a DT ACK for me to take it through.

> +	if (!ec_p.ec_name)
> +		ec_p.ec_name =3D CROS_EC_DEV_NAME;
> +
> +	err =3D mfd_add_devices(ec_dev->dev, PLATFORM_DEVID_AUTO, &ec_cell,=
 1,
>  			      NULL, ec_dev->irq, NULL);
>  	if (err) {
> -		dev_err(dev, "failed to add mfd devices\n");
> +		dev_err(dev, "failed to add ec\n");

Might be nice to expand 'ec' so your users have half a chance in
deciphering what just went wrong.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
