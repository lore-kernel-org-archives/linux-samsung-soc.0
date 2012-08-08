From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix compilation error with
 s3c2410_defconfig
Date: Wed, 8 Aug 2012 13:39:35 +0200
Message-ID: <20120808113935.GA20963@avionic-0098.mockup.avionic-design.de>
References: <1344333546-16995-1-git-send-email-tushar.behera@linaro.org>
 <098f01cd7488$0d66d630$28348290$%kim@samsung.com>
 <5020F568.5020204@linaro.org>
 <0a2d01cd7500$53e26c50$fba744f0$%kim@samsung.com>
 <20120808061102.GA22417@avionic-0098.mockup.avionic-design.de>
 <0abe01cd752f$4f96ad80$eec40880$%kim@samsung.com>
 <20120808065046.GA30832@avionic-0098.mockup.avionic-design.de>
 <0af001cd7550$1af66040$50e320c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:65272 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754825Ab2HHLjj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 07:39:39 -0400
Content-Disposition: inline
In-Reply-To: <0af001cd7550$1af66040$50e320c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 07:25:17PM +0900, Kukjin Kim wrote:
> So, how about following? If PWM is selected on Samsung SoCs, the PWM_SAMS=
UNG
> will be selected automatically. Of course, it can be de-selected in kernel
> menuconfig. Note that, I think, using 'bool <expr>' and 'depends on <expr=
>'
> is more clear than 'prompt <prompt> ["if" <expr>]'. However if any your
> preference here, please kindly let me know.
>=20
> ---
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 8fc3808..c74d055 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -58,14 +58,12 @@ config PWM_PXA
>  	will be called pwm-pxa.
>=20
>  config PWM_SAMSUNG
> -	tristate "Samsung pwm support"
> +	bool "Samsung PWM support"
>  	depends on PLAT_SAMSUNG
> +	default y
>  	help
>  	  Generic PWM framework driver for Samsung.
> =20
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called pwm-samsung.
> -
>  config PWM_TEGRA
>  	tristate "NVIDIA Tegra PWM support"
>  	depends on ARCH_TEGRA

Acked-by: Thierry Reding <thierry.reding@avionic-design.de>

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQIk/3AAoJEN0jrNd/PrOhvxUQAIBt2ijCeYKWoSUh6Y3PT+5t
HmCCkUyXfi6VNnKNDd5z8NNrO6PDdRw3QTAXbYJGoe32gH3ehPkKbE+SMvXmXduV
dUaTkHCX9fGVwNNHdHF079E0tdJ+n0Kt6pbA4ktAA+0oORqK8LF6uDyPGyU8h7z6
QFl4TgKqBDgGRxTK1mbZwo9EaN5mwm5X3ZvXWpANFfSmF/HP8d/LlTKJ6j4N5Roc
hecYq9b8ujvbHXvh/0Gi99Vdm0r4J0Q5wGM6ua3pITpU14y5BUpptkQuYKJ7Rn30
i8gD89NJt5zoahU4hblCmGb7bGyQQ4aFpN35sx+upPMIG3V87gH3W5bzu8DF4XMr
2D5MvsQhRmhwCaezbaa8Sobj74ifNIJhkEmnlr9TgiUE6OB6KNVj7YyRQ1VLx+Ku
ubpajGjzaEaWjMiwmMUbqLHIHFiMUEVsHIyFJYXml8LPl4H6TmlUMGQx/bJENnGF
Mlc2LCU9xTxPPbGNpLWKdNqtw3LZKWLgHCz7KCXrkS2xUGsg1EQ4778ZjAbjw7HO
yZMPcSn3wbWiLzZu+qdu1btr8FUjnoR9A3mrRaB2FgdqW1O1kLBWpYArC+Gx5Dhr
j7znpOB5EzmDEY+2aF+5glZL2aqGfj0M8fHtQSUU9DARe90gQvv3ByNS14UXRc2S
B9Qyfj0u8ciuKBtYO7+3
=bc1g
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
