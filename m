From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/7] clk: samsung: add plls used in s3c2416 and s3c2443
Date: Tue, 12 Mar 2013 13:10:42 +0100
Message-ID: <513F1B42.7000201@samsung.com>
References: <201303120141.31262.heiko@sntech.de>
 <201303120142.19842.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40280 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285Ab3CLMKp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 08:10:45 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJJ00JR9R2ALC80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 12:10:43 +0000 (GMT)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJJ007DKR5UUU40@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 12:10:43 +0000 (GMT)
In-reply-to: <201303120142.19842.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Hi,

On 03/12/2013 01:42 AM, Heiko St=C3=BCbner wrote:
> This adds support for pll2126x, pll3000x, pll6552x and pll6553x.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/samsung/clk-pll.c |  376 +++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/samsung/clk-pll.h |    8 +
>  2 files changed, 384 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-=
pll.c
> index 4b24511..b772f9e 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -400,6 +400,97 @@ struct clk * __init samsung_clk_register_pll46xx=
(const char *name,
=2E..
> +struct samsung_clk_pll2126x {
> +	struct clk_hw		hw;
> +	const void __iomem	*con_reg;
> +};
> +
> +#define to_clk_pll2126x(_hw) container_of(_hw, struct samsung_clk_pl=
l2126x, hw)
> +
> +static unsigned long samsung_pll2126x_recalc_rate(struct clk_hw *hw,
> +				unsigned long parent_rate)
> +{
> +	struct samsung_clk_pll2126x *pll =3D to_clk_pll2126x(hw);
> +	u32 pll_con, mdiv, pdiv, sdiv;
> +	u64 fvco =3D parent_rate;
> +
> +	pll_con =3D __raw_readl(pll->con_reg);
> +	mdiv =3D (pll_con >> PLL2126X_MDIV_SHIFT) & PLL2126X_MDIV_MASK;
> +	pdiv =3D (pll_con >> PLL2126X_PDIV_SHIFT) & PLL2126X_PDIV_MASK;
> +	sdiv =3D (pll_con >> PLL2126X_SDIV_SHIFT) & PLL2126X_SDIV_MASK;
> +
> +	fvco *=3D (mdiv + 8);
> +	do_div(fvco, (pdiv + 2) << sdiv);
> +
> +	return (unsigned long)fvco;
> +}
> +
> +/* todo: implement pll2126x clock round rate operation */
> +static long samsung_pll2126x_round_rate(struct clk_hw *hw,
> +				unsigned long drate, unsigned long *prate)
> +{
> +	return -ENOTSUPP;
> +}

If you look at __clk_round_rate() in drivers/clk/clk.c it calls
clk->ops->round_rate() recursively on the parent clock if
CLK_SET_RATE_PARENT flag is set. But if the clock provides round_rate
operation __clk_round_rate() will use it and will cast -ENOTSUPP
you return above to unsigned long. Unless you want to loose some hair
later and waste time on debugging I suggest to either remove all these
callbacks that return -ENOSUPP or implement them properly right away.

I'm just wondering why __clk_round_rate() return value type is unsigned=
 long
despite the struct clk_ops round_rate return long, which might indicate
the negative values round_rate might callback are properly handled by t=
he
clk core code.

Somewhat similar situation is with clk_mux_get_parent() in clk-mux.c
which can return -EINVAL which is then casted to u8.

I still have sending a patch for clk_mux_get_parent() on my todo list.
I guess we could just put a WARN_ON() there and return 0.

> +/* todo: implement pll2126x clock set rate */
> +static int samsung_pll2126x_set_rate(struct clk_hw *hw, unsigned lon=
g drate,
> +				unsigned long prate)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static const struct clk_ops samsung_pll2126x_clk_ops =3D {
> +	.recalc_rate =3D samsung_pll2126x_recalc_rate,
> +	.round_rate =3D samsung_pll2126x_round_rate,
> +	.set_rate =3D samsung_pll2126x_set_rate,
> +};

--

Thanks,
Sylwester
