From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 3/6] clk: samsung: add plls used in s3c2416 and s3c2443
Date: Thu, 11 Jul 2013 10:50:39 +0200
Message-ID: <201307111050.39878.heiko@sntech.de>
References: <201307100057.06061.heiko@sntech.de> <201307100059.08621.heiko@sntech.de> <1525015.XUBJYYqnvA@thinkpad>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33485 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755897Ab3GKIus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 04:50:48 -0400
In-Reply-To: <1525015.XUBJYYqnvA@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Russell King <linux@arm.linux.org.uk>

Am Donnerstag, 11. Juli 2013, 10:16:41 schrieb Tomasz Figa:
> Hi Heiko,
>=20
> On Wednesday 10 of July 2013 00:59:08 Heiko St=FCbner wrote:
> > This adds support for pll2126x, pll3000x, pll6552x and pll6553x.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  drivers/clk/samsung/clk-pll.c |  280
> >=20
> > +++++++++++++++++++++++++++++++++++++++++ drivers/clk/samsung/clk-p=
ll.h |
> >=20
> >  8 ++
> >  2 files changed, 288 insertions(+)
>=20
> Generally the patch looks good, but I have some comments to the part
> related to 655xx PLLs.
>=20
> I had a patch adding support for them too, but we can go with yours, =
since
> the way of registration has been changed by Yadwinder's patches and m=
ine
> would have to be updated anyway.
>=20
> > diff --git a/drivers/clk/samsung/clk-pll.c
> > b/drivers/clk/samsung/clk-pll.c index 0afaec6..35c15a1 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -323,6 +323,73 @@ struct clk * __init
> > samsung_clk_register_pll46xx(const char *name, }
> >=20
> >  /*
> >=20
> > + * PLL2126x Clock Type
> > + */
> > +
> > +#define PLL2126X_MDIV_MASK	(0xFF)
> > +#define PLL2126X_PDIV_MASK	(0x3)
> > +#define PLL2126X_SDIV_MASK	(0x3)
> > +#define PLL2126X_MDIV_SHIFT	(16)
> > +#define PLL2126X_PDIV_SHIFT	(8)
> > +#define PLL2126X_SDIV_SHIFT	(0)


+#define PLL2126X_PDIV_MASK	(0x3F)

is the correct value.


> > +
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
> > +static const struct clk_ops samsung_pll2126x_clk_ops =3D {
> > +	.recalc_rate =3D samsung_pll2126x_recalc_rate,
> > +};
> > +
> > +struct clk * __init samsung_clk_register_pll2126x(const char *name=
,
> > +			const char *pname, const void __iomem *con_reg)
> > +{
> > +	struct samsung_clk_pll2126x *pll;
> > +	struct clk *clk;
> > +	struct clk_init_data init;
> > +
> > +	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> > +	if (!pll)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init.name =3D name;
> > +	init.ops =3D &samsung_pll2126x_clk_ops;
> > +	init.flags =3D CLK_GET_RATE_NOCACHE;
> > +	init.parent_names =3D &pname;
> > +	init.num_parents =3D 1;
> > +
> > +	pll->hw.init =3D &init;
> > +	pll->con_reg =3D con_reg;
> > +
> > +	clk =3D samsung_register_pll(&pll->hw);
> > +	if (IS_ERR(clk))
> > +		kfree(pll);
> > +
> > +	return clk;
> > +}
> > +
> > +/*
> >=20
> >   * PLL2550x Clock Type
> >   */
> >=20
> > @@ -396,3 +463,216 @@ struct clk * __init
> > samsung_clk_register_pll2550x(const char *name,
> >=20
> >  	return clk;
> > =20
> >  }
> >=20
> > +
> > +/*
> > + * PLL3000x Clock Type
> > + */
> > +
> > +#define PLL3000X_MDIV_MASK	(0xFF)
> > +#define PLL3000X_PDIV_MASK	(0x3)
> > +#define PLL3000X_SDIV_MASK	(0x3)
> > +#define PLL3000X_MDIV_SHIFT	(16)
> > +#define PLL3000X_PDIV_SHIFT	(8)
> > +#define PLL3000X_SDIV_SHIFT	(0)

these are correct.

> > +
> > +struct samsung_clk_pll3000x {
> > +	struct clk_hw		hw;
> > +	const void __iomem	*con_reg;
> > +};
> > +
> > +#define to_clk_pll3000x(_hw) container_of(_hw, struct
> > samsung_clk_pll3000x, hw) +
> > +static unsigned long samsung_pll3000x_recalc_rate(struct clk_hw *h=
w,
> > +				unsigned long parent_rate)
> > +{
> > +	struct samsung_clk_pll3000x *pll =3D to_clk_pll3000x(hw);
> > +	u32 pll_con, mdiv, pdiv, sdiv;
> > +	u64 fvco =3D parent_rate;
> > +
> > +	pll_con =3D __raw_readl(pll->con_reg);
> > +	mdiv =3D (pll_con >> PLL3000X_MDIV_SHIFT) & PLL3000X_MDIV_MASK;
> > +	pdiv =3D (pll_con >> PLL3000X_PDIV_SHIFT) & PLL3000X_PDIV_MASK;
> > +	sdiv =3D (pll_con >> PLL3000X_SDIV_SHIFT) & PLL3000X_SDIV_MASK;
> > +
> > +	fvco *=3D (2 * (mdiv + 8));
> > +	do_div(fvco, pdiv << sdiv);
> > +
> > +	return (unsigned long)fvco;
> > +}
> > +
> > +static const struct clk_ops samsung_pll3000x_clk_ops =3D {
> > +	.recalc_rate =3D samsung_pll3000x_recalc_rate,
> > +};
> > +
> > +struct clk * __init samsung_clk_register_pll3000x(const char *name=
,
> > +			const char *pname, const void __iomem *con_reg)
> > +{
> > +	struct samsung_clk_pll3000x *pll;
> > +	struct clk *clk;
> > +	struct clk_init_data init;
> > +
> > +	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> > +	if (!pll)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init.name =3D name;
> > +	init.ops =3D &samsung_pll3000x_clk_ops;
> > +	init.flags =3D CLK_GET_RATE_NOCACHE;
> > +	init.parent_names =3D &pname;
> > +	init.num_parents =3D 1;
> > +
> > +	pll->hw.init =3D &init;
> > +	pll->con_reg =3D con_reg;
> > +
> > +	clk =3D samsung_register_pll(&pll->hw);
> > +	if (IS_ERR(clk))
> > +		kfree(pll);
> > +
> > +	return clk;
> > +}
> > +
> > +/*
> > + * PLL6552x Clock Type
> > + */
> > +
> > +#define PLL6552X_MDIV_MASK	(0x3FF)
> > +#define PLL6552X_PDIV_MASK	(0x3F)
> > +#define PLL6552X_SDIV_MASK	(0x7)
> > +#define PLL6552X_MDIV_SHIFT	(14)
> > +#define PLL6552X_PDIV_SHIFT	(5)
> > +#define PLL6552X_SDIV_SHIFT	(0)
>=20
> Are you sure about those bitfields?
>=20
> In S3C6410 User's Manual they are different. You can look at my patch=
 for a
> comparison:
>=20
> http://thread.gmane.org/gmane.linux.usb.general/87571/focus=3D88344

The numbers where taken from the previous pll code, but I now again che=
cked=20
them against the datasheet of the s3c2416 and the s3c2450.

When comparing with your patch, it really seems that the bit offsets in=
 the=20
register are different for the pdiv and mdiv - the above values are cor=
rect=20
according the the datasheet (and also produce the expected results in t=
he=20
clock tree).



> > +struct samsung_clk_pll6552x {
> > +	struct clk_hw		hw;
> > +	const void __iomem	*con_reg;
> > +};
> > +
> > +#define to_clk_pll6552x(_hw) container_of(_hw, struct
> > samsung_clk_pll6552x, hw) +
> > +static unsigned long samsung_pll6552x_recalc_rate(struct clk_hw *h=
w,
> > +				unsigned long parent_rate)
> > +{
> > +	struct samsung_clk_pll6552x *pll =3D to_clk_pll6552x(hw);
> > +	u32 pll_con, mdiv, pdiv, sdiv;
> > +	u64 fvco =3D parent_rate;
> > +
> > +	pll_con =3D __raw_readl(pll->con_reg);
> > +	mdiv =3D (pll_con >> PLL6552X_MDIV_SHIFT) & PLL6552X_MDIV_MASK;
> > +	pdiv =3D (pll_con >> PLL6552X_PDIV_SHIFT) & PLL6552X_PDIV_MASK;
> > +	sdiv =3D (pll_con >> PLL6552X_SDIV_SHIFT) & PLL6552X_SDIV_MASK;
> > +
> > +	fvco *=3D mdiv;
> > +	do_div(fvco, (pdiv << sdiv));
> > +
> > +	return (unsigned long)fvco;
> > +}
> > +
> > +static const struct clk_ops samsung_pll6552x_clk_ops =3D {
> > +	.recalc_rate =3D samsung_pll6552x_recalc_rate,
> > +};
> > +
> > +struct clk * __init samsung_clk_register_pll6552x(const char *name=
,
> > +			const char *pname, const void __iomem *con_reg)
> > +{
> > +	struct samsung_clk_pll6552x *pll;
> > +	struct clk *clk;
> > +	struct clk_init_data init;
> > +
> > +	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> > +	if (!pll)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init.name =3D name;
> > +	init.ops =3D &samsung_pll6552x_clk_ops;
> > +	init.flags =3D CLK_GET_RATE_NOCACHE;
> > +	init.parent_names =3D &pname;
> > +	init.num_parents =3D 1;
> > +
> > +	pll->hw.init =3D &init;
> > +	pll->con_reg =3D con_reg;
> > +
> > +	clk =3D samsung_register_pll(&pll->hw);
> > +	if (IS_ERR(clk))
> > +		kfree(pll);
> > +
> > +	return clk;
> > +}
> > +
> > +/*
> > + * PLL6553x Clock Type
> > + */
> > +
> > +#define PLL6553X_MDIV_MASK	(0x7F)
> > +#define PLL6553X_PDIV_MASK	(0x1F)
> > +#define PLL6553X_SDIV_MASK	(0x3)
> > +#define PLL6553X_KDIV_MASK	(0xFFFF)
> > +#define PLL6553X_MDIV_SHIFT	(16)
> > +#define PLL6553X_PDIV_SHIFT	(8)
> > +#define PLL6553X_SDIV_SHIFT	(0)
>=20
> Same about those bitfields. They seem to be different on S3C64xx.

Here it seems the values were off in the original code. According to th=
e=20
datasheet the values in your patch are correct. Thanks for the catch.

+#define PLL6553X_MDIV_MASK	(0xFF)
+#define PLL6553X_PDIV_MASK	(0x3F)
+#define PLL6553X_SDIV_MASK	(0x7)


This leaves the problem on what to do with the 6552X and its different =
bit=20
offsets. Is the pll in question really a 6552X? In the s3c2416 manual i=
ts name=20
is explicitly stated.


Thanks
Heiko
