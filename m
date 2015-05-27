From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 6/7] mfd: cros_ec: Support multiple EC in a system
Date: Wed, 27 May 2015 10:11:54 +0100
Message-ID: <20150527091154.GX11677@x1>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432309340-13688-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432309340-13688-7-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 22 May 2015, Javier Martinez Canillas wrote:

> From: Gwendal Grignou <gwendal@chromium.org>
>=20
> Chromebooks can have more than one Embedded Controller so the
> cros_ec device id has to be incremented for each EC registered.
>=20
> Add code to handle multiple EC. First ec found is cros-ec0,
> second cros-ec1 and so on.
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
> ---
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
>  drivers/mfd/cros_ec.c                      |  66 +++++++++++++--
>  drivers/mfd/cros_ec_i2c.c                  |   1 -
>  drivers/mfd/cros_ec_spi.c                  |   1 -
>  drivers/platform/chrome/cros_ec_dev.c      | 128 +++++++++++++++++++=
+---------
>  drivers/platform/chrome/cros_ec_dev.h      |   7 --
>  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
>  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
>  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
>  include/linux/mfd/cros_ec.h                |  44 ++++++++--
>  10 files changed, 247 insertions(+), 126 deletions(-)
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
> index 08d82bfc5268..99292bc2fe5f 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -24,12 +24,48 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/cros_ec.h>
> =20
> -static const struct mfd_cell cros_devs[] =3D {
> -	{
> +static int dev_id;
> +
> +static int cros_ec_dev_register(struct cros_ec_device *ec_dev,
> +				int dev_id, int devidx)

What's the difference between dev_id and devidx.

Confusing don't you think?

> +{
> +	struct device *dev =3D ec_dev->dev;
> +	struct cros_ec_platform ec_p =3D {
> +		.cmd_offset =3D 0,
> +	};
> +
> +	struct mfd_cell ec_cell =3D {
>  		.name =3D "cros-ec-ctl",
>  		.id =3D PLATFORM_DEVID_AUTO,
> -	},
> -};
> +		.platform_data =3D &ec_p,
> +		.pdata_size =3D sizeof(ec_p),
> +	};

Why have you bought this into here?  The convention is usually to have
this at the top of the file, outside any functions.  Declaring and
initialising structs inside functions makes things looks messy IMHO.



> +	switch (devidx) {
> +	case 0:

Please define these.  I have no idea what devidx 0 or 1 is.

> +		if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> +			ec_p.ec_name =3D of_get_property(dev->of_node, "devname",
> +						       NULL);
> +			if (ec_p.ec_name =3D=3D NULL) {

if (!ec_p.ec_name)

> +				dev_dbg(dev,
> +					"Device name not found, using default");
> +				ec_p.ec_name =3D CROS_EC_DEV_NAME;
> +			}
> +		} else {
> +			ec_p.ec_name =3D CROS_EC_DEV_NAME;
> +		}

I'd save yourself a few lines and do:

if (OF)
   name =3D get_name();

if (!name)
   name =3D DEFAULT_NAME;

Then rid the 'else'.  Rid the dev_dbg() too if you can.

> +		break;
> +	case 1:
> +		ec_p.ec_name =3D CROS_EC_DEV_PD_NAME;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ec_p.cmd_offset =3D EC_CMD_PASSTHRU_OFFSET(devidx);

'\n' here.

> +	return mfd_add_devices(dev, dev_id, &ec_cell, 1,
> +			       NULL, ec_dev->irq, NULL);
> +}
> =20
>  int cros_ec_register(struct cros_ec_device *ec_dev)
>  {
> @@ -52,14 +88,28 @@ int cros_ec_register(struct cros_ec_device *ec_de=
v)
> =20
>  	cros_ec_query_all(ec_dev);
> =20
> -	err =3D mfd_add_devices(dev, 0, cros_devs,
> -			      ARRAY_SIZE(cros_devs),
> -			      NULL, ec_dev->irq, NULL);
> +	err =3D cros_ec_dev_register(ec_dev, dev_id++, 0);
>  	if (err) {
> -		dev_err(dev, "failed to add mfd devices\n");
> +		dev_err(dev, "failed to add ec\n");
>  		return err;
>  	}
> =20
> +	if (ec_dev->max_passthru) {
> +		/*
> +		 * Register a PD device as well on top of this device.
> +		 * We make the following assumptions:
> +		 * - behind an EC, we have a pd
> +		 * - only one device added.
> +		 * - the EC is responsive at init time (it is not true for a
> +		 *   sensor hub.
> +		 */
> +		err =3D cros_ec_dev_register(ec_dev, dev_id++, 1);

I don't really like this devidx business.  Just keep it simple and
define more than one mfd_cell structure.

> +		if (err) {
> +			dev_err(dev, "failed to add additional ec\n");
> +			return err;
> +		}
> +	}
> +
>  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>  		err =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
>  		if (err) {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
