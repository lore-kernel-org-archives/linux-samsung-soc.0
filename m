From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: max77693: Allow building as a module
Date: Mon, 11 Apr 2016 09:00:30 +0100
Message-ID: <20160411080030.GB4592@x1>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:33474 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752387AbcDKIAf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2016 04:00:35 -0400
Received: by mail-wm0-f49.google.com with SMTP id f198so134107886wme.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2016 01:00:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Mon, 04 Apr 2016, Krzysztof Kozlowski wrote:

> The consumer of max77693 regulators on Trats2 board (samsung-usb2-phy
> driver) supports deferred probing so the max77693 main MFD driver can=
 be
> built now as a module. This gives more flexibility and removes manual
> ordering of init calls.
>=20
> Suggested-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/Kconfig    |  4 ++--
>  drivers/mfd/max77693.c | 14 ++------------
>  2 files changed, 4 insertions(+), 14 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index eea61e349e26..aa1e7c3f82ee 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -543,8 +543,8 @@ config MFD_MAX77686
>  	  of the device.
> =20
>  config MFD_MAX77693
> -	bool "Maxim Semiconductor MAX77693 PMIC Support"
> -	depends on I2C=3Dy
> +	tristate "Maxim Semiconductor MAX77693 PMIC Support"
> +	depends on I2C
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index b83b7a7da1ae..78e501feb96c 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -368,6 +368,7 @@ static const struct of_device_id max77693_dt_matc=
h[] =3D {
>  	{ .compatible =3D "maxim,max77693" },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, max77693_dt_match);
>  #endif
> =20
>  static struct i2c_driver max77693_i2c_driver =3D {
> @@ -381,18 +382,7 @@ static struct i2c_driver max77693_i2c_driver =3D=
 {
>  	.id_table =3D max77693_i2c_id,
>  };
> =20
> -static int __init max77693_i2c_init(void)
> -{
> -	return i2c_add_driver(&max77693_i2c_driver);
> -}
> -/* init early so consumer devices can complete system boot */
> -subsys_initcall(max77693_i2c_init);
> -
> -static void __exit max77693_i2c_exit(void)
> -{
> -	i2c_del_driver(&max77693_i2c_driver);
> -}
> -module_exit(max77693_i2c_exit);
> +module_i2c_driver(max77693_i2c_driver);
> =20
>  MODULE_DESCRIPTION("MAXIM 77693 multi-function core driver");
>  MODULE_AUTHOR("SangYoung, Son <hello.son@samsung.com>");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
