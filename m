From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] gpio: samsung: more generic pinctrl exclude ifdef
Date: Thu, 11 Jul 2013 12:23:13 +0200
Message-ID: <2059841.SxvZmAMDu5@thinkpad>
References: <201307090212.31422.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:57048 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868Ab3GKKXi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 06:23:38 -0400
Received: by mail-bk0-f47.google.com with SMTP id jg1so3249465bkc.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 03:23:37 -0700 (PDT)
In-Reply-To: <201307090212.31422.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On Tuesday 09 of July 2013 02:12:31 Heiko St=FCbner wrote:
> The exclude check should run any time when either the PINCTRL_SAMSUNG
> or PINCTRL_EXYNOS5440 are selected.
>=20
> As the real check for the presence of a pinctrl driver is done via a
> dt lookup it's not necessary to specifiy every pinctrl option in the
> ifdef individually.
>=20
> This fixes a breakage on s3c2416, when both the legacy and
> dt boards are selected.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Extracted from Tomasz pinctrl series, as it fixes a bug in the curren=
t
> 3.11 development.
>=20
>  drivers/gpio/gpio-samsung.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.=
c
> index a1392f4..ceb7971 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -2949,7 +2949,7 @@ static __init int samsung_gpiolib_init(void)
>  	int i, nr_chips;
>  	int group =3D 0;
>=20
> -#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5=
440)
> +#if defined(CONFIG_PINCTRL_SAMSUNG) || defined(CONFIG_PINCTRL_EXYNOS=
5440)
>  	/*
>  	* This gpio driver includes support for device tree support and the=
re
>  	* are platforms using it. In order to maintain compatibility with t=
hose

I think we can simplify this even more now, since when booting with DT =
pinctrl=20
driver is always used. What about just removing the whole check, includ=
ing the=20
ifdef and looking for compatible nodes and replacing them with:

	if (of_have_populated_dt())
		return -ENODEV;

Best regards,
Tomasz
