From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 2/7] clk: samsung: add plls used by the s3c2443
Date: Mon, 23 Dec 2013 12:07:55 -0800
Message-ID: <20131223200755.25490.91898@quantum>
References: <201312101614.29781.heiko@sntech.de> <201312101615.39088.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f169.google.com ([209.85.161.169]:54214 "EHLO
	mail-gg0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757468Ab3LWUH6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 15:07:58 -0500
Received: by mail-gg0-f169.google.com with SMTP id f4so1249384ggn.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2013 12:07:58 -0800 (PST)
In-Reply-To: <201312101615.39088.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com

Quoting Heiko St=C3=BCbner (2013-12-10 07:15:38)
> The s3c2443 uses different plls that are not present yet. Therefore
> add the two needed types.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Tomasz Figa <t.figa@samsung.com>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/clk-pll.c |   72 +++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/samsung/clk-pll.h |    2 ++
>  2 files changed, 74 insertions(+)
>=20
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-=
pll.c
> index c37d033..461a6bf 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -59,6 +59,72 @@ static long samsung_pll_round_rate(struct clk_hw *=
hw,
>  }
> =20
>  /*
> + * PLL2126 Clock Type
> + */
> +
> +#define PLL2126_MDIV_MASK      (0xff)
> +#define PLL2126_PDIV_MASK      (0x3f)
> +#define PLL2126_SDIV_MASK      (0x3)
> +#define PLL2126_MDIV_SHIFT     (16)
> +#define PLL2126_PDIV_SHIFT     (8)
> +#define PLL2126_SDIV_SHIFT     (0)
> +
> +static unsigned long samsung_pll2126_recalc_rate(struct clk_hw *hw,
> +                               unsigned long parent_rate)
> +{
> +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +       u32 pll_con, mdiv, pdiv, sdiv;
> +       u64 fvco =3D parent_rate;
> +
> +       pll_con =3D __raw_readl(pll->con_reg);
> +       mdiv =3D (pll_con >> PLL2126_MDIV_SHIFT) & PLL2126_MDIV_MASK;
> +       pdiv =3D (pll_con >> PLL2126_PDIV_SHIFT) & PLL2126_PDIV_MASK;
> +       sdiv =3D (pll_con >> PLL2126_SDIV_SHIFT) & PLL2126_SDIV_MASK;
> +
> +       fvco *=3D (mdiv + 8);
> +       do_div(fvco, (pdiv + 2) << sdiv);
> +
> +       return (unsigned long)fvco;
> +}
> +
> +static const struct clk_ops samsung_pll2126_clk_ops =3D {
> +       .recalc_rate =3D samsung_pll2126_recalc_rate,
> +};
> +
> +/*
> + * PLL3000 Clock Type
> + */
> +
> +#define PLL3000_MDIV_MASK      (0xff)
> +#define PLL3000_PDIV_MASK      (0x3)
> +#define PLL3000_SDIV_MASK      (0x3)
> +#define PLL3000_MDIV_SHIFT     (16)
> +#define PLL3000_PDIV_SHIFT     (8)
> +#define PLL3000_SDIV_SHIFT     (0)
> +
> +static unsigned long samsung_pll3000_recalc_rate(struct clk_hw *hw,
> +                               unsigned long parent_rate)
> +{
> +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +       u32 pll_con, mdiv, pdiv, sdiv;
> +       u64 fvco =3D parent_rate;
> +
> +       pll_con =3D __raw_readl(pll->con_reg);
> +       mdiv =3D (pll_con >> PLL3000_MDIV_SHIFT) & PLL3000_MDIV_MASK;
> +       pdiv =3D (pll_con >> PLL3000_PDIV_SHIFT) & PLL3000_PDIV_MASK;
> +       sdiv =3D (pll_con >> PLL3000_SDIV_SHIFT) & PLL3000_SDIV_MASK;
> +
> +       fvco *=3D (2 * (mdiv + 8));
> +       do_div(fvco, pdiv << sdiv);
> +
> +       return (unsigned long)fvco;
> +}
> +
> +static const struct clk_ops samsung_pll3000_clk_ops =3D {
> +       .recalc_rate =3D samsung_pll3000_recalc_rate,
> +};
> +
> +/*
>   * PLL35xx Clock Type
>   */
>  /* Maximum lock time can be 270 * PDIV cycles */
> @@ -753,6 +819,12 @@ static void __init _samsung_clk_register_pll(str=
uct samsung_pll_clock *pll_clk,
>         }
> =20
>         switch (pll_clk->type) {
> +       case pll_2126:
> +               init.ops =3D &samsung_pll2126_clk_ops;
> +               break;
> +       case pll_3000:
> +               init.ops =3D &samsung_pll3000_clk_ops;
> +               break;
>         /* clk_ops for 35xx and 2550 are similar */
>         case pll_35xx:
>         case pll_2550:
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-=
pll.h
> index ddf9029..5b64bdb 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -13,6 +13,8 @@
>  #define __SAMSUNG_CLK_PLL_H
> =20
>  enum samsung_pll_type {
> +       pll_2126,
> +       pll_3000,
>         pll_35xx,
>         pll_36xx,
>         pll_2550,
> --=20
> 1.7.10.4
>=20
