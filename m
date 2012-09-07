From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] gpio: samsung: add devicetree init for s3c24xx arches
Date: Fri, 07 Sep 2012 14:38:52 +0900
Message-ID: <243901cd8cbb$10ad0580$32071080$%kim@samsung.com>
References: <201208282355.44268.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <201208282355.44268.heiko@sntech.de>
Content-language: ko
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Rob Herring' <rob.herring@calxeda.com>, 'Rob Landley' <rob@landley.net>, 'Linus Walleij' <linus.walleij@stericsson.com>, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> Until now the Exynos-SoC was the only Samsung-SoC supporting the GPIO=
s
> via the device tree. This patch implements dt-support for the
> s3c24xx arches.
>=20
> The controllers contain only 3 cells, as the underlying gpio controll=
er
> does not support controlling the drive strength on a gpio level.
>=20
> Tested with the gpio-keys driver on a s3c2416 based machine.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---

[...]

> +#if defined(CONFIG_PLAT_S3C24XX) && defined(CONFIG_OF)

[...]

> +static __init void s3c24xx_gpiolib_attach_ofnode(struct samsung_gpio=
_chip
> *chip,
> +						 u64 base, u64 offset)
> +{

[...]

> +}
> +#elif defined(CONFIG_PLAT_S3C24XX)

Heiko, above line breaks building for other samsung stuff except s3c24x=
x. I fixed with following which has been amended in your patch. If any =
problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 5dcdcda..a006f0d 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -991,7 +991,7 @@ static __init void s3c24xx_gpiolib_attach_ofnode(st=
ruct samsun
 	gc->of_gpio_n_cells =3D 3;
 	gc->of_xlate =3D s3c24xx_gpio_xlate;
 }
-#elif defined(CONFIG_PLAT_S3C24XX)
+#else
 static __init void s3c24xx_gpiolib_attach_ofnode(struct samsung_gpio_c=
hip *chip,
 						u64 base, u64 offset)
 {

> +static __init void s3c24xx_gpiolib_attach_ofnode(struct samsung_gpio=
_chip
> *chip,
> +						 u64 base, u64 offset)
> +{
> +	return;
> +}
> +#endif /* defined(CONFIG_PLAT_S3C24XX) && defined(CONFIG_OF) */
> +
>  static void __init s3c24xx_gpiolib_add_chips(struct samsung_gpio_chi=
p
> *chip,
>  					     int nr_chips, void __iomem *base)
>  {
> @@ -962,6 +1023,8 @@ static void __init s3c24xx_gpiolib_add_chips(str=
uct
> samsung_gpio_chip *chip,
>  			gc->direction_output =3D samsung_gpiolib_2bit_output;
>=20
>  		samsung_gpiolib_add(chip);
> +
> +		s3c24xx_gpiolib_attach_ofnode(chip, S3C24XX_PA_GPIO, i *
> 0x10);
>  	}
>  }
>=20
> --
> 1.7.2.3

