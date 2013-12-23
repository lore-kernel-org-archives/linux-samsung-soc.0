From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 1/7] clk: samsung: add pll_6552 variant for s3c2416
Date: Mon, 23 Dec 2013 12:07:44 -0800
Message-ID: <20131223200744.25490.94481@quantum>
References: <201312101614.29781.heiko@sntech.de> <201312101615.10927.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f50.google.com ([209.85.213.50]:49872 "EHLO
	mail-yh0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757897Ab3LWUHr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 15:07:47 -0500
Received: by mail-yh0-f50.google.com with SMTP id b6so1301916yha.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2013 12:07:47 -0800 (PST)
In-Reply-To: <201312101615.10927.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com

Quoting Heiko St=C3=BCbner (2013-12-10 07:15:10)
> According to the manual s3c2416 and s3c2450 use a pll 6552 and 6553
> and while the pll_6553 matches exactly the one already implemented
> the pll_6552 differs to the one from the s3c64xx series.
>=20
> The change is solely in the bit locations of the mdiv and pdiv values=
=2E
> All calculations are the same for both implementatons and even the
> proposed divider-values for specific frequencies in the manuals are
> the same.
>=20
> Therefore implement a variant that simply uses the changed bit
> locations if necessary.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Tomasz Figa <t.figa@samsung.com>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/clk-pll.c |   12 ++++++++++--
>  drivers/clk/samsung/clk-pll.h |    1 +
>  2 files changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-=
pll.c
> index 529e11d..c37d033 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -564,7 +564,9 @@ static const struct clk_ops samsung_pll46xx_clk_m=
in_ops =3D {
>  #define PLL6552_PDIV_MASK      0x3f
>  #define PLL6552_SDIV_MASK      0x7
>  #define PLL6552_MDIV_SHIFT     16
> +#define PLL6552_MDIV_SHIFT_2416        14
>  #define PLL6552_PDIV_SHIFT     8
> +#define PLL6552_PDIV_SHIFT_2416        5
>  #define PLL6552_SDIV_SHIFT     0
> =20
>  static unsigned long samsung_pll6552_recalc_rate(struct clk_hw *hw,
> @@ -575,8 +577,13 @@ static unsigned long samsung_pll6552_recalc_rate=
(struct clk_hw *hw,
>         u64 fvco =3D parent_rate;
> =20
>         pll_con =3D __raw_readl(pll->con_reg);
> -       mdiv =3D (pll_con >> PLL6552_MDIV_SHIFT) & PLL6552_MDIV_MASK;
> -       pdiv =3D (pll_con >> PLL6552_PDIV_SHIFT) & PLL6552_PDIV_MASK;
> +       if (pll->type =3D=3D pll_6552_s3c2416) {
> +               mdiv =3D (pll_con >> PLL6552_MDIV_SHIFT_2416) & PLL65=
52_MDIV_MASK;
> +               pdiv =3D (pll_con >> PLL6552_PDIV_SHIFT_2416) & PLL65=
52_PDIV_MASK;
> +       } else {
> +               mdiv =3D (pll_con >> PLL6552_MDIV_SHIFT) & PLL6552_MD=
IV_MASK;
> +               pdiv =3D (pll_con >> PLL6552_PDIV_SHIFT) & PLL6552_PD=
IV_MASK;
> +       }
>         sdiv =3D (pll_con >> PLL6552_SDIV_SHIFT) & PLL6552_SDIV_MASK;
> =20
>         fvco *=3D mdiv;
> @@ -773,6 +780,7 @@ static void __init _samsung_clk_register_pll(stru=
ct samsung_pll_clock *pll_clk,
>                         init.ops =3D &samsung_pll36xx_clk_ops;
>                 break;
>         case pll_6552:
> +       case pll_6552_s3c2416:
>                 init.ops =3D &samsung_pll6552_clk_ops;
>                 break;
>         case pll_6553:
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-=
pll.h
> index 6c39030..ddf9029 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -24,6 +24,7 @@ enum samsung_pll_type {
>         pll_4650,
>         pll_4650c,
>         pll_6552,
> +       pll_6552_s3c2416,
>         pll_6553,
>  };
> =20
> --=20
> 1.7.10.4
>=20
