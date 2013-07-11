From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 2/6] clk: samsung: fix error handling in pll register functions
Date: Thu, 11 Jul 2013 09:50:16 +0200
Message-ID: <1418034.CJ7vtBLiog@thinkpad>
References: <201307100057.06061.heiko@sntech.de> <201307100058.13941.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:53148 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755747Ab3GKHuW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 03:50:22 -0400
Received: by mail-we0-f179.google.com with SMTP id w59so6520080wes.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 00:50:21 -0700 (PDT)
In-Reply-To: <201307100058.13941.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Russell King <linux@arm.linux.org.uk>

Hi Heiko,

On Wednesday 10 of July 2013 00:58:13 Heiko St=FCbner wrote:
> kmalloc has its own error reporting when the allocation fails and
> the register functions also should return the correct ERR_PTR(-ENOMEM=
)
> when it happens.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/samsung/clk-pll.c |   30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)

This patch looks pretty good, but I'm not sure if this problem still ex=
ists=20
after applying Yadwinder's patches that completely changes the way of P=
LL=20
registration.

Best regards,
Tomasz

> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-=
pll.c
> index 9153e46..0afaec6 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -79,10 +79,8 @@ struct clk * __init samsung_clk_register_pll35xx(c=
onst
> char *name, struct clk_init_data init;
>=20
>  	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> -	if (!pll) {
> -		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> -		return NULL;
> -	}
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
>=20
>  	init.name =3D name;
>  	init.ops =3D &samsung_pll35xx_clk_ops;
> @@ -153,10 +151,8 @@ struct clk * __init samsung_clk_register_pll36xx=
(const
> char *name, struct clk_init_data init;
>=20
>  	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> -	if (!pll) {
> -		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> -		return NULL;
> -	}
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
>=20
>  	init.name =3D name;
>  	init.ops =3D &samsung_pll36xx_clk_ops;
> @@ -227,10 +223,8 @@ struct clk * __init samsung_clk_register_pll45xx=
(const
> char *name, struct clk_init_data init;
>=20
>  	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> -	if (!pll) {
> -		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> -		return NULL;
> -	}
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
>=20
>  	init.name =3D name;
>  	init.ops =3D &samsung_pll45xx_clk_ops;
> @@ -308,10 +302,8 @@ struct clk * __init samsung_clk_register_pll46xx=
(const
> char *name, struct clk_init_data init;
>=20
>  	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> -	if (!pll) {
> -		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> -		return NULL;
> -	}
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
>=20
>  	init.name =3D name;
>  	init.ops =3D &samsung_pll46xx_clk_ops;
> @@ -385,10 +377,8 @@ struct clk * __init samsung_clk_register_pll2550=
x(const
> char *name, struct clk_init_data init;
>=20
>  	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> -	if (!pll) {
> -		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
> -		return NULL;
> -	}
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
>=20
>  	init.name =3D name;
>  	init.ops =3D &samsung_pll2550x_clk_ops;
