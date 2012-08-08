From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix compilation error with
 s3c2410_defconfig
Date: Wed, 8 Aug 2012 08:11:02 +0200
Message-ID: <20120808061102.GA22417@avionic-0098.mockup.avionic-design.de>
References: <1344333546-16995-1-git-send-email-tushar.behera@linaro.org>
 <098f01cd7488$0d66d630$28348290$%kim@samsung.com>
 <5020F568.5020204@linaro.org>
 <0a2d01cd7500$53e26c50$fba744f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0a2d01cd7500$53e26c50$fba744f0$%kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 09:54:13AM +0900, Kukjin Kim wrote:
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 7aca31c..dcdfb77 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -403,7 +403,7 @@ config S5P_DEV_USB_EHCI
> =20
>  config S3C24XX_PWM
>  	bool "PWM device support"
> -	select HAVE_PWM
> +	select PWM
>  	help
>  	  Support for exporting the PWM timer blocks via the pwm device
>  	  system

You could add

	select PWM_SAMSUNG

here to side-step the issue below.

> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 8fc3808..34c8ec1 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -59,7 +59,7 @@ config PWM_PXA
> =20
>  config PWM_SAMSUNG
>  	tristate "Samsung pwm support"
> -	depends on PLAT_SAMSUNG
> +	def_bool PLAT_SAMSUNG

tristate and def_bool conflict, don't they? I think the easiest way to
solve this problem would be to add a default line, like so:

	default PLAT_SAMSUNG

I've checked this with a s3c2410_defconfig and this causes PWM_SAMSUNG
to be selected =3Dy, which I guess is what you want.

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQIgL2AAoJEN0jrNd/PrOhN7oP+wQ7NLlEROotXlnefUf1Hs+M
ANRtdLlnnbiHxGEjKjKYh0g87b52aIPIz8rcNsO0ivfszHTqVJQc5KgiGPWK9HmS
ij5ri9/kA57PsQEWROEdhNHESycrktGaW27OkV9+TZP7PmQKA13Qn1MLKHGPwyqQ
hzFPHQQXK7Ekj426rptEjER1EBObSTBUzJj4uRvcTLJVY6euHtNRRwOYUPtjwK+M
30y2VlymWsZjPsGLyCLJx6YIb3ewwr+q1ftdwRO3lC5Cgyhmd4DA2yfvozJACcOj
nqH5kt9+Qth97qEnHpK71OdL4or8G721Fuwa3rX5RswKgJ83rRHuHPucuB6yugM2
TOmjiQa0VjMNtm2mTbDaW5ya0Z6ynXjgpHb7btrXqi5W/0W8dD9xrsTr41gf9r6b
mtwD36EzalesqRAMLGUhHTuQKBZMXK8i8lbhjpsxtfraRFfBFUXBlfAdbCt7Zg5b
4ah3R3R4WhV/6/2fEB1JAiRtPyJHLn8eMb3wTo80DbFJiyeYHbtSdYv4g65uc3J4
QQbLqquKJNlUFXscrlNuKHTdfxgVFUM9ppkWEafuWAYxT06g5zgGoQEEuXjZvWYm
UbO17aCPkKvL3kALKZep6naPB4Wc6Y0Jrs6DXTJL4SEcVD7Y7tTQU1vcRtNSgUCM
R+Z/ChvmlJ/y0FuCVWCk
=Ny56
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
