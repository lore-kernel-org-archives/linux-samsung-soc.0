From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 2/7] clk: samsung: add plls used by the s3c2443
Date: Tue, 31 Dec 2013 21:03:16 +0100
Message-ID: <1561704.n1QFeDVIXH@phil>
References: <201312101614.29781.heiko@sntech.de> <201312101615.39088.heiko@sntech.de> <20131223200755.25490.91898@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:57166 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756510Ab3LaUD0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 15:03:26 -0500
In-Reply-To: <20131223200755.25490.91898@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com

Hi Mike,

Am Montag, 23. Dezember 2013, 12:07:55 schrieb Mike Turquette:
> Quoting Heiko St=FCbner (2013-12-10 07:15:38)
>=20
> > The s3c2443 uses different plls that are not present yet. Therefore
> > add the two needed types.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Acked-by: Tomasz Figa <t.figa@samsung.com>
>=20
> Acked-by: Mike Turquette <mturquette@linaro.org>

did you also take a look at the real clock driver too in
 "[4/7] clk: samsung: add clock-driver for s3c2416, s3c2443 and s3c2450=
"

because it looks like didn't get any response so far from you
(and I just saw you acking the later s3c2410 driver)


Thanks
Heiko

>=20
> > ---
> >=20
> >  drivers/clk/samsung/clk-pll.c |   72
> >  +++++++++++++++++++++++++++++++++++++++++ drivers/clk/samsung/clk-=
pll.h
> >  |    2 ++
> >  2 files changed, 74 insertions(+)
> >=20
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/cl=
k-pll.c
> > index c37d033..461a6bf 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -59,6 +59,72 @@ static long samsung_pll_round_rate(struct clk_hw=
 *hw,
> >=20
> >  }
> > =20
> >  /*
> >=20
> > + * PLL2126 Clock Type
> > + */
> > +
> > +#define PLL2126_MDIV_MASK      (0xff)
> > +#define PLL2126_PDIV_MASK      (0x3f)
> > +#define PLL2126_SDIV_MASK      (0x3)
> > +#define PLL2126_MDIV_SHIFT     (16)
> > +#define PLL2126_PDIV_SHIFT     (8)
> > +#define PLL2126_SDIV_SHIFT     (0)
> > +
> > +static unsigned long samsung_pll2126_recalc_rate(struct clk_hw *hw=
,
> > +                               unsigned long parent_rate)
> > +{
> > +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> > +       u32 pll_con, mdiv, pdiv, sdiv;
> > +       u64 fvco =3D parent_rate;
> > +
> > +       pll_con =3D __raw_readl(pll->con_reg);
> > +       mdiv =3D (pll_con >> PLL2126_MDIV_SHIFT) & PLL2126_MDIV_MAS=
K;
> > +       pdiv =3D (pll_con >> PLL2126_PDIV_SHIFT) & PLL2126_PDIV_MAS=
K;
> > +       sdiv =3D (pll_con >> PLL2126_SDIV_SHIFT) & PLL2126_SDIV_MAS=
K;
> > +
> > +       fvco *=3D (mdiv + 8);
> > +       do_div(fvco, (pdiv + 2) << sdiv);
> > +
> > +       return (unsigned long)fvco;
> > +}
> > +
> > +static const struct clk_ops samsung_pll2126_clk_ops =3D {
> > +       .recalc_rate =3D samsung_pll2126_recalc_rate,
> > +};
> > +
> > +/*
> > + * PLL3000 Clock Type
> > + */
> > +
> > +#define PLL3000_MDIV_MASK      (0xff)
> > +#define PLL3000_PDIV_MASK      (0x3)
> > +#define PLL3000_SDIV_MASK      (0x3)
> > +#define PLL3000_MDIV_SHIFT     (16)
> > +#define PLL3000_PDIV_SHIFT     (8)
> > +#define PLL3000_SDIV_SHIFT     (0)
> > +
> > +static unsigned long samsung_pll3000_recalc_rate(struct clk_hw *hw=
,
> > +                               unsigned long parent_rate)
> > +{
> > +       struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> > +       u32 pll_con, mdiv, pdiv, sdiv;
> > +       u64 fvco =3D parent_rate;
> > +
> > +       pll_con =3D __raw_readl(pll->con_reg);
> > +       mdiv =3D (pll_con >> PLL3000_MDIV_SHIFT) & PLL3000_MDIV_MAS=
K;
> > +       pdiv =3D (pll_con >> PLL3000_PDIV_SHIFT) & PLL3000_PDIV_MAS=
K;
> > +       sdiv =3D (pll_con >> PLL3000_SDIV_SHIFT) & PLL3000_SDIV_MAS=
K;
> > +
> > +       fvco *=3D (2 * (mdiv + 8));
> > +       do_div(fvco, pdiv << sdiv);
> > +
> > +       return (unsigned long)fvco;
> > +}
> > +
> > +static const struct clk_ops samsung_pll3000_clk_ops =3D {
> > +       .recalc_rate =3D samsung_pll3000_recalc_rate,
> > +};
> > +
> > +/*
> >=20
> >   * PLL35xx Clock Type
> >   */
> > =20
> >  /* Maximum lock time can be 270 * PDIV cycles */
> >=20
> > @@ -753,6 +819,12 @@ static void __init _samsung_clk_register_pll(s=
truct
> > samsung_pll_clock *pll_clk,>=20
> >         }
> >        =20
> >         switch (pll_clk->type) {
> >=20
> > +       case pll_2126:
> > +               init.ops =3D &samsung_pll2126_clk_ops;
> > +               break;
> > +       case pll_3000:
> > +               init.ops =3D &samsung_pll3000_clk_ops;
> > +               break;
> >=20
> >         /* clk_ops for 35xx and 2550 are similar */
> >         case pll_35xx:
> >=20
> >         case pll_2550:
> > diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/cl=
k-pll.h
> > index ddf9029..5b64bdb 100644
> > --- a/drivers/clk/samsung/clk-pll.h
> > +++ b/drivers/clk/samsung/clk-pll.h
> > @@ -13,6 +13,8 @@
> >=20
> >  #define __SAMSUNG_CLK_PLL_H
> > =20
> >  enum samsung_pll_type {
> >=20
> > +       pll_2126,
> > +       pll_3000,
> >=20
> >         pll_35xx,
> >         pll_36xx,
> >         pll_2550,
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
