From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 5/7] mfd: cros_ec: Instantiate ChromeOS EC
 character device
Date: Tue, 20 Jan 2015 08:20:13 +0000
Message-ID: <20150120082013.GU21886@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420205572-2640-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 02 Jan 2015, Javier Martinez Canillas wrote:

> The ChromeOS EC character device is an user-space interface to
> allow applications to access the Embedded Controller.
>=20
> Add a cell for this device so it's spawned from the mfd driver.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v1: None, new patch.
>=20
>  drivers/mfd/cros_ec.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c872e1b..70f9ed5 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -118,6 +118,10 @@ static const struct mfd_cell cros_devs[] =3D {
>  		.id =3D 2,
>  		.of_compatible =3D "google,cros-ec-i2c-tunnel",
>  	},
> +	{
> +		.name =3D "cros-ec-dev",

*-dev is seldom suitable for naming things.

Please be more imaginative/descriptive in your naming.

> +		.id =3D 3,
> +	},
>  };
> =20
>  int cros_ec_register(struct cros_ec_device *ec_dev)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
