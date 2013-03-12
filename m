From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/7] clk: samsung: add plls used in s3c2416 and s3c2443
Date: Tue, 12 Mar 2013 13:21:34 +0100
Message-ID: <201303121321.34338.heiko@sntech.de>
References: <201303120141.31262.heiko@sntech.de> <201303120142.19842.heiko@sntech.de> <513F1B42.7000201@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:46486 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752944Ab3CLMVi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 08:21:38 -0400
In-Reply-To: <513F1B42.7000201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Am Dienstag, 12. M=C3=A4rz 2013, 13:10:42 schrieb Sylwester Nawrocki:
> Hi,
>=20
> On 03/12/2013 01:42 AM, Heiko St=C3=BCbner wrote:
> > This adds support for pll2126x, pll3000x, pll6552x and pll6553x.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  drivers/clk/samsung/clk-pll.c |  376
> >  +++++++++++++++++++++++++++++++++++++++++ drivers/clk/samsung/clk-=
pll.h
> >  |    8 +
> >  2 files changed, 384 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/drivers/clk/samsung/clk-pll.c
> > b/drivers/clk/samsung/clk-pll.c index 4b24511..b772f9e 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -400,6 +400,97 @@ struct clk * __init
> > samsung_clk_register_pll46xx(const char *name,
>=20
> ...
>=20
> > +struct samsung_clk_pll2126x {
> > +	struct clk_hw		hw;
> > +	const void __iomem	*con_reg;
> > +};
> > +
> > +#define to_clk_pll2126x(_hw) container_of(_hw, struct
> > samsung_clk_pll2126x, hw) +
> > +static unsigned long samsung_pll2126x_recalc_rate(struct clk_hw *h=
w,
> > +				unsigned long parent_rate)
> > +{
> > +	struct samsung_clk_pll2126x *pll =3D to_clk_pll2126x(hw);
> > +	u32 pll_con, mdiv, pdiv, sdiv;
> > +	u64 fvco =3D parent_rate;
> > +
> > +	pll_con =3D __raw_readl(pll->con_reg);
> > +	mdiv =3D (pll_con >> PLL2126X_MDIV_SHIFT) & PLL2126X_MDIV_MASK;
> > +	pdiv =3D (pll_con >> PLL2126X_PDIV_SHIFT) & PLL2126X_PDIV_MASK;
> > +	sdiv =3D (pll_con >> PLL2126X_SDIV_SHIFT) & PLL2126X_SDIV_MASK;
> > +
> > +	fvco *=3D (mdiv + 8);
> > +	do_div(fvco, (pdiv + 2) << sdiv);
> > +
> > +	return (unsigned long)fvco;
> > +}
> > +
> > +/* todo: implement pll2126x clock round rate operation */
> > +static long samsung_pll2126x_round_rate(struct clk_hw *hw,
> > +				unsigned long drate, unsigned long *prate)
> > +{
> > +	return -ENOTSUPP;
> > +}
>=20
> If you look at __clk_round_rate() in drivers/clk/clk.c it calls
> clk->ops->round_rate() recursively on the parent clock if
> CLK_SET_RATE_PARENT flag is set. But if the clock provides round_rate
> operation __clk_round_rate() will use it and will cast -ENOTSUPP
> you return above to unsigned long. Unless you want to loose some hair
> later and waste time on debugging I suggest to either remove all thes=
e
> callbacks that return -ENOSUPP or implement them properly right away.

Thanks for the hint ... this is what I rightfully get for mindlessly co=
pying=20
from the other plls in the file;-) .

What about the other plls in the pll-file, they should be affected in t=
he same=20
way, right?


> I'm just wondering why __clk_round_rate() return value type is unsign=
ed
> long despite the struct clk_ops round_rate return long, which might
> indicate the negative values round_rate might callback are properly
> handled by the clk core code.
>=20
> Somewhat similar situation is with clk_mux_get_parent() in clk-mux.c
> which can return -EINVAL which is then casted to u8.
>=20
> I still have sending a patch for clk_mux_get_parent() on my todo list=
=2E
> I guess we could just put a WARN_ON() there and return 0.
>=20
> > +/* todo: implement pll2126x clock set rate */
> > +static int samsung_pll2126x_set_rate(struct clk_hw *hw, unsigned l=
ong
> > drate, +				unsigned long prate)
> > +{
> > +	return -ENOTSUPP;
> > +}
> > +
> > +static const struct clk_ops samsung_pll2126x_clk_ops =3D {
> > +	.recalc_rate =3D samsung_pll2126x_recalc_rate,
> > +	.round_rate =3D samsung_pll2126x_round_rate,
> > +	.set_rate =3D samsung_pll2126x_set_rate,
> > +};
>=20
> --
>=20
> Thanks,
> Sylwester
