From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 08/12] clk: samsung: add clock controller driver for s3c2410,
 s3c2440 and s3c2442
Date: Sun, 09 Feb 2014 20:34:26 +0100
Message-ID: <52F7D842.5060609@gmail.com>
References: <201312131356.40755.heiko@sntech.de> <201312131401.52029.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:57719 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688AbaBITeg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Feb 2014 14:34:36 -0500
Received: by mail-ea0-f172.google.com with SMTP id l9so2188323eaj.31
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Feb 2014 11:34:35 -0800 (PST)
In-Reply-To: <201312131401.52029.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 13.12.2013 14:01, Heiko St=FCbner wrote:
> This driver can handle the clock controllers of the socs mentioned ab=
ove,
> as they share a common clock tree with only small differences.

[snip]

> diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/=
clk-s3c2410.c
> new file mode 100644
> index 0000000..8358cad
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-s3c2410.c

[snip]

> +static struct clk_div_table divslow_d[] =3D {
> +	{ .val =3D 0, .div =3D 1 },
> +	{ .val =3D 1, .div =3D 2 },
> +	{ .val =3D 2, .div =3D 4 },
> +	{ .val =3D 3, .div =3D 6 },
> +	{ .val =3D 4, .div =3D 8 },
> +	{ .val =3D 5, .div =3D 10 },
> +	{ .val =3D 6, .div =3D 12 },
> +	{ .val =3D 7, .div =3D 14 },
> +	{ .div =3D 0 },

nit: It might be just a matter of preference, but I'd say the more=20
common pattern is to define the last entry as:

	{ /* sentinel */ },

It will be initialized to all-zeroes anyway, but the comment will tell=20
its purpose.

> +};
> +
> +struct samsung_div_clock s3c2410_common_dividers[] __initdata =3D {
> +	DIV_T(0, "div_slow", "xti", CLKSLOW, 0, 3, divslow_d),
> +	DIV(PCLK, "pclk", "hclk", CLKDIVN, 0, 1),
> +};

[snip]

> +static struct samsung_pll_rate_table pll_s3c2410_12mhz_tbl[] __initd=
ata =3D {
> +	/* sorted in descending order */
> +	/* 2410A extras */
> +	PLL_35XX_RATE(270000000, 127, 1, 1),
> +	PLL_35XX_RATE(268000000, 126, 1, 1),
> +	PLL_35XX_RATE(266000000, 125, 1, 1),
> +	PLL_35XX_RATE(226000000, 105, 1, 1),
> +	PLL_35XX_RATE(210000000, 132, 2, 1),
> +	/* 2410 common */
> +	PLL_35XX_RATE(203000000, 161, 3, 1),
> +	PLL_35XX_RATE(192000000, 88, 1, 1),
> +	PLL_35XX_RATE(186000000, 85, 1, 1),
> +	PLL_35XX_RATE(180000000, 82, 1, 1),
> +	PLL_35XX_RATE(170000000, 77, 1, 1),
> +	PLL_35XX_RATE(158000000, 71, 1, 1),
> +	PLL_35XX_RATE(152000000, 68, 1, 1),
> +	PLL_35XX_RATE(147000000, 90, 2, 1),
> +	PLL_35XX_RATE(135000000, 82, 2, 1),
> +	PLL_35XX_RATE(124000000, 116, 1, 2),
> +	PLL_35XX_RATE(118000000, 150, 2, 2),
> +	PLL_35XX_RATE(113000000, 105, 1, 2),
> +	PLL_35XX_RATE(101000000, 127, 2, 2),
> +	PLL_35XX_RATE(90000000, 112, 2, 2),
> +	PLL_35XX_RATE(85000000, 105, 2, 2),
> +	PLL_35XX_RATE(79000000, 71, 1, 2),
> +	PLL_35XX_RATE(68000000, 82, 2, 2),
> +	PLL_35XX_RATE(56000000, 142, 2, 3),
> +	PLL_35XX_RATE(48000000, 120, 2, 3),
> +	PLL_35XX_RATE(51000000, 161, 3, 3),
> +	PLL_35XX_RATE(45000000, 82, 1, 3),
> +	PLL_35XX_RATE(34000000, 82, 2, 3),
> +	{ },

nit: The same comment about the sentinel as above.

> +};
> +
> +static struct samsung_pll_clock s3c2410_plls[] __initdata =3D {
> +	[mpll] =3D PLL(pll_s3c2410_mpll, MPLL, "mpll", "xti",
> +						LOCKTIME, MPLLCON, NULL),
> +	[upll] =3D PLL(pll_s3c2410_upll, UPLL, "upll", "xti",
> +						LOCKTIME, UPLLCON, NULL),
> +};

[snip]

> +static struct samsung_pll_rate_table pll_s3c244x_12mhz_tbl[] __initd=
ata =3D {
> +	/* sorted in descending order */
> +	PLL_35XX_RATE(400000000, 0x5c, 1, 1),
> +	PLL_35XX_RATE(390000000, 0x7a, 2, 1),
> +	PLL_35XX_RATE(380000000, 0x57, 1, 1),
> +	PLL_35XX_RATE(370000000, 0xb1, 4, 1),
> +	PLL_35XX_RATE(360000000, 0x70, 2, 1),
> +	PLL_35XX_RATE(350000000, 0xa7, 4, 1),
> +	PLL_35XX_RATE(340000000, 0x4d, 1, 1),
> +	PLL_35XX_RATE(330000000, 0x66, 2, 1),
> +	PLL_35XX_RATE(320000000, 0x98, 4, 1),
> +	PLL_35XX_RATE(310000000, 0x93, 4, 1),
> +	PLL_35XX_RATE(300000000, 0x75, 3, 1),
> +	PLL_35XX_RATE(240000000, 0x70, 1, 2),
> +	PLL_35XX_RATE(230000000, 0x6b, 1, 2),
> +	PLL_35XX_RATE(220000000, 0x66, 1, 2),
> +	PLL_35XX_RATE(210000000, 0x84, 2, 2),
> +	PLL_35XX_RATE(200000000, 0x5c, 1, 2),
> +	PLL_35XX_RATE(190000000, 0x57, 1, 2),
> +	PLL_35XX_RATE(180000000, 0x70, 2, 2),
> +	PLL_35XX_RATE(170000000, 0x4d, 1, 2),
> +	PLL_35XX_RATE(160000000, 0x98, 4, 2),
> +	PLL_35XX_RATE(150000000, 0x75, 3, 2),
> +	PLL_35XX_RATE(120000000, 0x70, 1, 3),
> +	PLL_35XX_RATE(110000000, 0x66, 1, 3),
> +	PLL_35XX_RATE(100000000, 0x5c, 1, 3),
> +	PLL_35XX_RATE(90000000, 0x70, 2, 3),
> +	PLL_35XX_RATE(80000000, 0x98, 4, 3),
> +	PLL_35XX_RATE(75000000, 0x75, 3, 3),

Hmm, don't you need a sentinel here?

> +};
> +
> +static struct samsung_pll_clock s3c244x_common_plls[] __initdata =3D=
 {
> +	[mpll] =3D PLL(pll_s3c2440_mpll, MPLL, "mpll", "xti",
> +						LOCKTIME, MPLLCON, NULL),
> +	[upll] =3D PLL(pll_s3c2410_upll, UPLL, "upll", "xti",
> +						LOCKTIME, UPLLCON, NULL),
> +};
> +
> +PNAME(hclk_p) =3D { "fclk", "div_hclk_2", "div_hclk_4", "div_hclk_3"=
 };
> +PNAME(armclk_p) =3D { "fclk", "hclk" };
> +
> +struct samsung_mux_clock s3c244x_common_muxes[] __initdata =3D {
> +	MUX(HCLK, "hclk", hclk_p, CLKDIVN, 1, 2),
> +	MUX(ARMCLK, "armclk", armclk_p, CAMDIVN, 12, 1),
> +};
> +
> +struct samsung_fixed_factor_clock s3c244x_common_ffactor[] __initdat=
a =3D {
> +	FFACTOR(0, "div_hclk_2", "fclk", 1, 2, 0),
> +	FFACTOR(0, "ff_cam", "div_cam", 2, 1, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_div_table div_hclk_4_d[] =3D {
> +	{ .val =3D 0, .div =3D 4 },
> +	{ .val =3D 1, .div =3D 8 },

Missing sentinel?

> +};
> +
> +static struct clk_div_table div_hclk_3_d[] =3D {
> +	{ .val =3D 0, .div =3D 3 },
> +	{ .val =3D 1, .div =3D 6 },

Ditto.

> +};
> +
> +struct samsung_div_clock s3c244x_common_dividers[] __initdata =3D {
> +	DIV(UCLK, "uclk", "upll", CLKDIVN, 3, 1),
> +	DIV(0, "div_hclk", "fclk", CLKDIVN, 1, 1),
> +	DIV_T(0, "div_hclk_4", "fclk", CAMDIVN, 9, 1, div_hclk_4_d),
> +	DIV_T(0, "div_hclk_3", "fclk", CAMDIVN, 8, 1, div_hclk_3_d),
> +	DIV(0, "div_cam", "upll", CAMDIVN, 0, 3),
> +};

[snip]

> +/*
> + * fixed rate clocks generated outside the soc
> + * Only necessary until the devicetree-move is complete
> + */
> +struct samsung_fixed_rate_clock s3c2410_common_frate_clks[] __initda=
ta =3D {
> +	FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),

Do you need to assign this clock an ID? When DT is used, it's defined a=
s=20
a separate clock provider using fixed clock bindings, so it is not=20
provided by this driver.

> +};
> +
> +static void __init s3c2410_common_clk_register_fixed_ext(unsigned lo=
ng xti_f)
> +{
> +	struct samsung_clock_alias xti_alias =3D ALIAS(XTI, NULL, "xtal");
> +
> +	s3c2410_common_frate_clks[0].fixed_rate =3D xti_f;
> +	samsung_clk_register_fixed_rate(s3c2410_common_frate_clks,
> +				ARRAY_SIZE(s3c2410_common_frate_clks));
> +
> +	samsung_clk_register_alias(&xti_alias, 1);
> +}

[snip]

> diff --git a/include/dt-bindings/clock/samsung,s3c2410-clock.h b/incl=
ude/dt-bindings/clock/samsung,s3c2410-clock.h
> new file mode 100644
> index 0000000..66c278f
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,s3c2410-clock.h

I know this is nitpiccking, but I'd say that the name of this file coul=
d=20
be made a simple "s3c2410.h", as it's already located in "clock"=20
directory and "s3c2410" is specific enough to not add "samsung" prefix.

At the time of writing the s3c64xx CCF driver I went for full compatibl=
e=20
string as the file name, but at that time there was just a few DT=20
binding headers available and so no widely used naming convention. Now=20
looking at file names, other platforms seem to use just a simple name=20
and we decided to do the same for Exynos as well, so I think s3c24xx=20
should follow the same.

Best regards,
Tomasz
