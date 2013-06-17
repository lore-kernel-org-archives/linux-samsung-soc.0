From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] gpio: samsung: add PINCTRL_S3C24XX to exclude options
Date: Mon, 17 Jun 2013 15:19:59 +0200
Message-ID: <1825186.C6XXUYx8Nl@amdc1227>
References: <201306140044.15568.heiko@sntech.de>
 <201306140045.27744.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29571 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756204Ab3FQNUJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 09:20:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00JVTH1JWQ20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 14:20:07 +0100 (BST)
In-reply-to: <201306140045.27744.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linus.walleij@linaro.org

Hi Heiko,

On Friday 14 of June 2013 00:45:27 Heiko St=FCbner wrote:
> When a pinctrl driver is loaded legacy gpio support has to be disable=
d.
> The code checking for the pinctrl presence is contained in an #ifdef
> checking for the presence of a valid samsung pinctrl driver.
>=20
> There the new PINCTRL_S3C24XX was missing resulting in the check neve=
r
> being run and the gpio being enabled breaking the pinctrl driver.
>=20
> Fix this by adding the missing CONFIG_PINCTRL_S3C24XX
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/gpio/gpio-samsung.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.=
c
> index a1392f4..c84503e 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -2949,7 +2949,8 @@ static __init int samsung_gpiolib_init(void)
>  	int i, nr_chips;
>  	int group =3D 0;
>=20
> -#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5=
440)
> +#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5=
440) ||
> \ +    defined(CONFIG_PINCTRL_S3C24XX)

I wonder if this wouldn't be simply covered by PINCTRL_SAMSUNG (except=20
PINCTRL_EXYNOS5440 which doesn't use the common part).

Best regards,
Tomasz

>  	/*
>  	* This gpio driver includes support for device tree support and the=
re
>  	* are platforms using it. In order to maintain compatibility with t=
hose
