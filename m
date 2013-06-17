From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] gpio: samsung: add PINCTRL_S3C24XX to exclude options
Date: Mon, 17 Jun 2013 22:13:00 +0900
Message-ID: <1a1701ce6b5c$651c4d80$2f54e880$%kim@samsung.com>
References: <201306140044.15568.heiko@sntech.de>
 <201306140045.27744.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27902 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756153Ab3FQNNE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 09:13:04 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOJ00JK0GPPQHR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 22:13:02 +0900 (KST)
In-reply-to: <201306140045.27744.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@linaro.org>, linus.walleij@linaro.org

Heiko St=C3=BCbner wrote:
>=20
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
440)
> || \
> +    defined(CONFIG_PINCTRL_S3C24XX)
>  	/*
>  	* This gpio driver includes support for device tree support and
> there
>  	* are platforms using it. In order to maintain compatibility with
> those
> --
> 1.7.10.4

Yeah, this is needed :-)

Linus, shall I take this into samsung tree? Or since the pinctrl-s3c24x=
x already merged into arm-soc, this could be picked into your tree...

Thanks,
- Kukjin
