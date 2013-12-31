From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 06/12] clk: samsung: add plls used by the early s3c24xx cpus
Date: Tue, 31 Dec 2013 11:45:29 -0800
Message-ID: <20131231194529.12054.56504@quantum>
References: <201312131356.40755.heiko@sntech.de> <201312131400.55201.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f176.google.com ([209.85.161.176]:54623 "EHLO
	mail-gg0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756426Ab3LaTpp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 14:45:45 -0500
Received: by mail-gg0-f176.google.com with SMTP id l12so2561574gge.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2013 11:45:44 -0800 (PST)
In-Reply-To: <201312131400.55201.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Quoting Heiko St=C3=BCbner (2013-12-13 05:00:54)
> The manuals do not give them explicit names like in later socs, so mo=
re
> generic names with a s3c2410-prefix were used for them.
>=20
> As it was common to do so in the previous implementation, functionali=
ty
> to change the pll rate is already included.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/clk-pll.c |  182 +++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/samsung/clk-pll.h |    3 +
>  2 files changed, 185 insertions(+)
>=20
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-=
pll.c
> index 461a6bf..39573bd 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -11,6 +11,7 @@
> =20
>  #include <linux/errno.h>
>  #include <linux/hrtimer.h>
> +#include <linux/delay.h>
>  #include "clk.h"
>  #include "clk-pll.h"
> =20
> @@ -701,6 +702,169 @@ static const struct clk_ops samsung_pll6553_clk=
_ops =3D {
>  };
> =20
>  /*
> + * PLL Clock Type of S3C24XX before S3C2443
> + */
> +
> +#define PLLS3C2410_MDIV_MASK           (0xff)
> +#define PLLS3C2410_PDIV_MASK           (0x1f)
> +#define PLLS3C2410_SDIV_MASK           (0x3)
> +#define PLLS3C2410_MDIV_SHIFT          (12)
> +#define PLLS3C2410_PDIV_SHIFT          (4)
> +#define PLLS3C2410_SDIV_SHIFT          (0)
> +
> +#define PLLS3C2410_ENABLE_REG_OFFSET   0x10
> +
> +static unsigned long samsung_s3c2410_pll_recalc_rate(struct clk_hw *=
hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +       u32 pll_con, mdiv, pdiv, sdiv;
> +       u64 fvco =3D parent_rate;
> +
> +       pll_con =3D __raw_readl(pll->con_reg);
> +       mdiv =3D (pll_con >> PLLS3C2410_MDIV_SHIFT) & PLLS3C2410_MDIV=
_MASK;
> +       pdiv =3D (pll_con >> PLLS3C2410_PDIV_SHIFT) & PLLS3C2410_PDIV=
_MASK;
> +       sdiv =3D (pll_con >> PLLS3C2410_SDIV_SHIFT) & PLLS3C2410_SDIV=
_MASK;
> +
> +       fvco *=3D (mdiv + 8);
> +       do_div(fvco, (pdiv + 2) << sdiv);
> +
> +       return (unsigned int)fvco;
> +}
> +
> +static unsigned long samsung_s3c2440_mpll_recalc_rate(struct clk_hw =
*hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +       u32 pll_con, mdiv, pdiv, sdiv;
> +       u64 fvco =3D parent_rate;
> +
> +       pll_con =3D __raw_readl(pll->con_reg);
> +       mdiv =3D (pll_con >> PLLS3C2410_MDIV_SHIFT) & PLLS3C2410_MDIV=
_MASK;
> +       pdiv =3D (pll_con >> PLLS3C2410_PDIV_SHIFT) & PLLS3C2410_PDIV=
_MASK;
> +       sdiv =3D (pll_con >> PLLS3C2410_SDIV_SHIFT) & PLLS3C2410_SDIV=
_MASK;
> +
> +       fvco *=3D (2 * (mdiv + 8));
> +       do_div(fvco, (pdiv + 2) << sdiv);
> +
> +       return (unsigned int)fvco;
> +}
> +
> +static int samsung_s3c2410_pll_set_rate(struct clk_hw *hw, unsigned =
long drate,
> +                                       unsigned long prate)
> +{
> +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +       const struct samsung_pll_rate_table *rate;
> +       u32 tmp;
> +
> +       /* Get required rate settings from table */
> +       rate =3D samsung_get_pll_settings(pll, drate);
> +       if (!rate) {
> +               pr_err("%s: Invalid rate : %lu for pll clk %s\n", __f=
unc__,
> +                       drate, __clk_get_name(hw->clk));
> +               return -EINVAL;
> +       }
> +
> +       tmp =3D __raw_readl(pll->con_reg);
> +
> +       /* Change PLL PMS values */
> +       tmp &=3D ~((PLLS3C2410_MDIV_MASK << PLLS3C2410_MDIV_SHIFT) |
> +                       (PLLS3C2410_PDIV_MASK << PLLS3C2410_PDIV_SHIF=
T) |
> +                       (PLLS3C2410_SDIV_MASK << PLLS3C2410_SDIV_SHIF=
T));
> +       tmp |=3D (rate->mdiv << PLLS3C2410_MDIV_SHIFT) |
> +                       (rate->pdiv << PLLS3C2410_PDIV_SHIFT) |
> +                       (rate->sdiv << PLLS3C2410_SDIV_SHIFT);
> +       __raw_writel(tmp, pll->con_reg);
> +
> +       /* Time to settle according to the manual */
> +       udelay(300);
> +
> +       return 0;
> +}
> +
> +static int samsung_s3c2410_pll_enable(struct clk_hw *hw, int bit, bo=
ol enable)
> +{
> +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +       u32 pll_en =3D __raw_readl(pll->lock_reg + PLLS3C2410_ENABLE_=
REG_OFFSET);
> +       u32 pll_en_orig =3D pll_en;
> +
> +       if (enable)
> +               pll_en &=3D ~BIT(bit);
> +       else
> +               pll_en |=3D BIT(bit);
> +
> +       __raw_writel(pll_en, pll->lock_reg + PLLS3C2410_ENABLE_REG_OF=
=46SET);
> +
> +       /* if we started the UPLL, then allow to settle */
> +       if (enable && (pll_en_orig & BIT(bit)))
> +               udelay(300);
> +
> +       return 0;
> +}
> +
> +static int samsung_s3c2410_mpll_enable(struct clk_hw *hw)
> +{
> +       return samsung_s3c2410_pll_enable(hw, 5, true);
> +}
> +
> +static void samsung_s3c2410_mpll_disable(struct clk_hw *hw)
> +{
> +       samsung_s3c2410_pll_enable(hw, 5, false);
> +}
> +
> +static int samsung_s3c2410_upll_enable(struct clk_hw *hw)
> +{
> +       return samsung_s3c2410_pll_enable(hw, 7, true);
> +}
> +
> +static void samsung_s3c2410_upll_disable(struct clk_hw *hw)
> +{
> +       samsung_s3c2410_pll_enable(hw, 7, false);
> +}
> +
> +static const struct clk_ops samsung_s3c2410_mpll_clk_min_ops =3D {
> +       .recalc_rate =3D samsung_s3c2410_pll_recalc_rate,
> +       .enable =3D samsung_s3c2410_mpll_enable,
> +       .disable =3D samsung_s3c2410_mpll_disable,
> +};
> +
> +static const struct clk_ops samsung_s3c2410_upll_clk_min_ops =3D {
> +       .recalc_rate =3D samsung_s3c2410_pll_recalc_rate,
> +       .enable =3D samsung_s3c2410_upll_enable,
> +       .disable =3D samsung_s3c2410_upll_disable,
> +};
> +
> +static const struct clk_ops samsung_s3c2440_mpll_clk_min_ops =3D {
> +       .recalc_rate =3D samsung_s3c2440_mpll_recalc_rate,
> +       .enable =3D samsung_s3c2410_mpll_enable,
> +       .disable =3D samsung_s3c2410_mpll_disable,
> +};
> +
> +static const struct clk_ops samsung_s3c2410_mpll_clk_ops =3D {
> +       .recalc_rate =3D samsung_s3c2410_pll_recalc_rate,
> +       .enable =3D samsung_s3c2410_mpll_enable,
> +       .disable =3D samsung_s3c2410_mpll_disable,
> +       .round_rate =3D samsung_pll_round_rate,
> +       .set_rate =3D samsung_s3c2410_pll_set_rate,
> +};
> +
> +static const struct clk_ops samsung_s3c2410_upll_clk_ops =3D {
> +       .recalc_rate =3D samsung_s3c2410_pll_recalc_rate,
> +       .enable =3D samsung_s3c2410_upll_enable,
> +       .disable =3D samsung_s3c2410_upll_disable,
> +       .round_rate =3D samsung_pll_round_rate,
> +       .set_rate =3D samsung_s3c2410_pll_set_rate,
> +};
> +
> +static const struct clk_ops samsung_s3c2440_mpll_clk_ops =3D {
> +       .recalc_rate =3D samsung_s3c2440_mpll_recalc_rate,
> +       .enable =3D samsung_s3c2410_mpll_enable,
> +       .disable =3D samsung_s3c2410_mpll_disable,
> +       .round_rate =3D samsung_pll_round_rate,
> +       .set_rate =3D samsung_s3c2410_pll_set_rate,
> +};
> +
> +/*
>   * PLL2550x Clock Type
>   */
> =20
> @@ -866,6 +1030,24 @@ static void __init _samsung_clk_register_pll(st=
ruct samsung_pll_clock *pll_clk,
>                 else
>                         init.ops =3D &samsung_pll46xx_clk_ops;
>                 break;
> +       case pll_s3c2410_mpll:
> +               if (!pll->rate_table)
> +                       init.ops =3D &samsung_s3c2410_mpll_clk_min_op=
s;
> +               else
> +                       init.ops =3D &samsung_s3c2410_mpll_clk_ops;
> +               break;
> +       case pll_s3c2410_upll:
> +               if (!pll->rate_table)
> +                       init.ops =3D &samsung_s3c2410_upll_clk_min_op=
s;
> +               else
> +                       init.ops =3D &samsung_s3c2410_upll_clk_ops;
> +               break;
> +       case pll_s3c2440_mpll:
> +               if (!pll->rate_table)
> +                       init.ops =3D &samsung_s3c2440_mpll_clk_min_op=
s;
> +               else
> +                       init.ops =3D &samsung_s3c2440_mpll_clk_ops;
> +               break;
>         default:
>                 pr_warn("%s: Unknown pll type for pll clk %s\n",
>                         __func__, pll_clk->name);
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-=
pll.h
> index 5b64bdb..6428bcc 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -28,6 +28,9 @@ enum samsung_pll_type {
>         pll_6552,
>         pll_6552_s3c2416,
>         pll_6553,
> +       pll_s3c2410_mpll,
> +       pll_s3c2410_upll,
> +       pll_s3c2440_mpll,
>  };
> =20
>  #define PLL_35XX_RATE(_rate, _m, _p, _s)                       \
> --=20
> 1.7.10.4
>=20
