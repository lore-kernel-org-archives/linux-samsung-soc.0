From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/7] mfd: cros_ec: Instantiate ChromeOS EC character
 device
Date: Fri, 23 Jan 2015 10:26:55 +0000
Message-ID: <20150123102655.GH9129@x1>
References: <1421954186-29764-1-git-send-email-javier.martinez@collabora.co.uk>
 <1421954186-29764-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:37976 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753295AbbAWK1B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 05:27:01 -0500
Received: by mail-ie0-f178.google.com with SMTP id rp18so6369131iec.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 02:27:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1421954186-29764-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 22 Jan 2015, Javier Martinez Canillas wrote:

> The ChromeOS EC character device is an user-space interface to
> allow applications to access the Embedded Controller.
>=20
> Add a cell for this device so it's spawned from the mfd driver.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v2:
>  - Rename the name to "cros-ec-ctl". Suggested by Lee Jones.
>=20
> Changes since v1: None, new patch.
> ---
>  drivers/mfd/cros_ec.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c872e1b0eaf8..c4aecc6f8373 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -118,6 +118,10 @@ static const struct mfd_cell cros_devs[] =3D {
>  		.id =3D 2,
>  		.of_compatible =3D "google,cros-ec-i2c-tunnel",
>  	},
> +	{
> +		.name =3D "cros-ec-ctl",
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
