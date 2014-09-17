From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Wed, 17 Sep 2014 09:31:14 -0700
Message-ID: <20140917163114.GL30918@lee--X1>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410428289-18229-7-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andreas Faerber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 11 Sep 2014, Javier Martinez Canillas wrote:

> From: Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> If the EC device tree node has sub-nodes, try to instantiate them as
> MFD sub-devices.  We can configure the EC features provided by the bo=
ard.
>=20
> Signed-off-by: Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8rSCDK34cm6iQ@public.gmane.org=
=2Euk>
> ---
>=20
> Changes since v2:
>  - Drop if guards since of_node is unconditionally built. Suggested b=
y Lee Jones
>  - Drop unneeded comment about of_platform_populate(). Suggested by L=
ee Jones.
>  - Fix error message if of_platform_populate() fails. Suggested by Le=
e Jones.
>=20
> Changes since v1:
>  - Don't leave an empty struct mfd_cell array. Suggested by Lee Jones=
=2E
>  - Just use of_platform_populate() instead of manually iterating thro=
ugh
>    sub-devices and calling mfd_add_devices. Suggested by Lee Jones.
> ---
>  drivers/mfd/cros_ec.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index 751af0b..7c533d2 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -21,6 +21,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/mfd/core.h>
> +#include <linux/of_platform.h>
>  #include <linux/mfd/cros_ec.h>
>  #include <linux/mfd/cros_ec_commands.h>
>  #include <linux/delay.h>
> @@ -109,22 +110,10 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_=
dev,
>  }
>  EXPORT_SYMBOL(cros_ec_cmd_xfer);
> =20
> -static const struct mfd_cell cros_devs[] =3D {
> -	{
> -		.name =3D "cros-ec-keyb",
> -		.id =3D 1,
> -		.of_compatible =3D "google,cros-ec-keyb",
> -	},
> -	{
> -		.name =3D "cros-ec-i2c-tunnel",
> -		.id =3D 2,
> -		.of_compatible =3D "google,cros-ec-i2c-tunnel",
> -	},
> -};
> -
>  int cros_ec_register(struct cros_ec_device *ec_dev)
>  {
>  	struct device *dev =3D ec_dev->dev;
> +	struct device_node *node =3D dev->of_node;
>  	int err =3D 0;
> =20
>  	if (ec_dev->din_size) {
> @@ -140,12 +129,12 @@ int cros_ec_register(struct cros_ec_device *ec_=
dev)
> =20
>  	mutex_init(&ec_dev->lock);
> =20
> -	err =3D mfd_add_devices(dev, 0, cros_devs,
> -			      ARRAY_SIZE(cros_devs),
> -			      NULL, ec_dev->irq, NULL);
> -	if (err) {
> -		dev_err(dev, "failed to add mfd devices\n");
> -		return err;

So these devices will only ever probe with DT now ...

> +	if (node) {

So it would be wrong for dev->of_node not to be populated.

> +		err =3D of_platform_populate(node, NULL, NULL, dev);
> +		if (err) {
> +			dev_err(dev, "Failed to register subordinate devices");
> +			return err;
> +		}
>  	}
> =20
>  	dev_info(dev, "Chrome EC device registered\n");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
