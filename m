From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Move to using generic clksrc_clk for clock code
Date: Tue, 12 Jan 2010 04:20:10 +0000
Message-ID: <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40848 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753527Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006Zw-CX
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Remove the copy of the old s3c64xx struct clksrc_clk and use the new one
in plat-samsung. This eliminates a bug in the set_parent() call where it
failed to set the clk->parent after sucesfully updating the clock.

The script that was used to automate much of the process will be supplied
seperately.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s5pc1xx/Kconfig         |    1 +
 arch/arm/plat-s5pc1xx/s5pc100-clock.c |  388 ++++++++-------------------------
 2 files changed, 97 insertions(+), 292 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index b7b9e91..5d97b1c 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -11,6 +11,7 @@ config PLAT_S5PC1XX
 	select ARM_VIC
 	select NO_IOPORT
 	select ARCH_REQUIRE_GPIOLIB
+	select SAMSUNG_CLKSRC
 	select S3C_GPIO_TRACK
 	select S3C_GPIO_PULL_UPDOWN
 	select S3C_GPIO_CFG_S3C24XX
diff --git a/arch/arm/plat-s5pc1xx/s5pc100-clock.c b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
index 16f0b90..75cffca 100644
--- a/arch/arm/plat-s5pc1xx/s5pc100-clock.c
+++ b/arch/arm/plat-s5pc1xx/s5pc100-clock.c
@@ -29,6 +29,7 @@
 
 #include <plat/regs-clock.h>
 #include <plat/clock.h>
+#include <plat/clock-clksrc.h>
 #include <plat/cpu.h>
 #include <plat/pll.h>
 #include <plat/devs.h>
@@ -51,23 +52,6 @@ static struct clk clk_ext_xtal_mux = {
 #define clk_fout_mpll	clk_mpll
 #define clk_vclk_54m	clk_54m
 
-struct clk_sources {
-	unsigned int	nr_sources;
-	struct clk	**sources;
-};
-
-struct clksrc_clk {
-	struct clk		clk;
-	unsigned int		mask;
-	unsigned int		shift;
-
-	struct clk_sources	*sources;
-
-	unsigned int		divider_shift;
-	void __iomem		*reg_divider;
-	void __iomem		*reg_source;
-};
-
 /* APLL */
 static struct clk clk_fout_apll = {
 	.name		= "fout_apll",
@@ -80,7 +64,7 @@ static struct clk *clk_src_apll_list[] = {
 	[1] = &clk_fout_apll,
 };
 
-static struct clk_sources clk_src_apll = {
+static struct clksrc_sources clk_src_apll = {
 	.sources	= clk_src_apll_list,
 	.nr_sources	= ARRAY_SIZE(clk_src_apll_list),
 };
@@ -90,10 +74,8 @@ static struct clksrc_clk clk_mout_apll = {
 		.name		= "mout_apll",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC0_APLL_SHIFT,
-	.mask		= S5PC100_CLKSRC0_APLL_MASK,
 	.sources	= &clk_src_apll,
-	.reg_source	= S5PC100_CLKSRC0,
+	.reg_src = { .reg = S5PC100_CLKSRC0, .shift = 0, .size = 1, },
 };
 
 static unsigned long s5pc100_clk_dout_apll_get_rate(struct clk *clk)
@@ -240,7 +222,7 @@ static struct clk *clk_src_mpll_list[] = {
 	[1] = &clk_fout_mpll,
 };
 
-static struct clk_sources clk_src_mpll = {
+static struct clksrc_sources clk_src_mpll = {
 	.sources	= clk_src_mpll_list,
 	.nr_sources	= ARRAY_SIZE(clk_src_mpll_list),
 };
@@ -250,10 +232,8 @@ static struct clksrc_clk clk_mout_mpll = {
 		.name		= "mout_mpll",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC0_MPLL_SHIFT,
-	.mask		= S5PC100_CLKSRC0_MPLL_MASK,
 	.sources	= &clk_src_mpll,
-	.reg_source	= S5PC100_CLKSRC0,
+	.reg_src = { .reg = S5PC100_CLKSRC0, .shift = 4, .size = 1, },
 };
 
 static struct clk *clkset_am_list[] = {
@@ -261,7 +241,7 @@ static struct clk *clkset_am_list[] = {
 	[1] = &clk_dout_apll2,
 };
 
-static struct clk_sources clk_src_am = {
+static struct clksrc_sources clk_src_am = {
 	.sources	= clkset_am_list,
 	.nr_sources	= ARRAY_SIZE(clkset_am_list),
 };
@@ -271,10 +251,8 @@ static struct clksrc_clk clk_mout_am = {
 		.name		= "mout_am",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC0_AMMUX_SHIFT,
-	.mask		= S5PC100_CLKSRC0_AMMUX_MASK,
 	.sources	= &clk_src_am,
-	.reg_source	= S5PC100_CLKSRC0,
+	.reg_src = { .reg = S5PC100_CLKSRC0, .shift = 16, .size = 1, },
 };
 
 static unsigned long s5pc100_clk_dout_d1_bus_get_rate(struct clk *clk)
@@ -304,7 +282,7 @@ static struct clk *clkset_onenand_list[] = {
 	[1] = &clk_dout_d1_bus,
 };
 
-static struct clk_sources clk_src_onenand = {
+static struct clksrc_sources clk_src_onenand = {
 	.sources	= clkset_onenand_list,
 	.nr_sources	= ARRAY_SIZE(clkset_onenand_list),
 };
@@ -314,10 +292,8 @@ static struct clksrc_clk clk_mout_onenand = {
 		.name		= "mout_onenand",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC0_ONENAND_SHIFT,
-	.mask		= S5PC100_CLKSRC0_ONENAND_MASK,
 	.sources	= &clk_src_onenand,
-	.reg_source	= S5PC100_CLKSRC0,
+	.reg_src = { .reg = S5PC100_CLKSRC0, .shift = 24, .size = 1, },
 };
 
 static unsigned long s5pc100_clk_dout_pclkd1_get_rate(struct clk *clk)
@@ -419,7 +395,7 @@ static struct clk *clk_src_epll_list[] = {
 	[1] = &clk_fout_epll,
 };
 
-static struct clk_sources clk_src_epll = {
+static struct clksrc_sources clk_src_epll = {
 	.sources	= clk_src_epll_list,
 	.nr_sources	= ARRAY_SIZE(clk_src_epll_list),
 };
@@ -429,10 +405,8 @@ static struct clksrc_clk clk_mout_epll = {
 		.name		= "mout_epll",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC0_EPLL_SHIFT,
-	.mask		= S5PC100_CLKSRC0_EPLL_MASK,
-	.sources	= &clk_src_epll,
-	.reg_source	= S5PC100_CLKSRC0,
+	.sources = &clk_src_epll,
+	.reg_src = { .reg = S5PC100_CLKSRC0, .shift = 8, .size = 1, },
 };
 
 /* HPLL */
@@ -446,7 +420,7 @@ static struct clk *clk_src_hpll_list[] = {
 	[1] = &clk_fout_hpll,
 };
 
-static struct clk_sources clk_src_hpll = {
+static struct clksrc_sources clk_src_hpll = {
 	.sources	= clk_src_hpll_list,
 	.nr_sources	= ARRAY_SIZE(clk_src_hpll_list),
 };
@@ -456,10 +430,8 @@ static struct clksrc_clk clk_mout_hpll = {
 		.name		= "mout_hpll",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC0_HPLL_SHIFT,
-	.mask		= S5PC100_CLKSRC0_HPLL_MASK,
-	.sources	= &clk_src_hpll,
-	.reg_source	= S5PC100_CLKSRC0,
+	.sources = &clk_src_hpll,
+	.reg_src = { .reg = S5PC100_CLKSRC0, .shift = 12, .size = 1, },
 };
 
 /* Peripherals */
@@ -474,99 +446,6 @@ static struct clksrc_clk clk_mout_hpll = {
  * have a common parent divisor so are not included here.
  */
 
-static inline struct clksrc_clk *to_clksrc(struct clk *clk)
-{
-	return container_of(clk, struct clksrc_clk, clk);
-}
-
-static unsigned long s5pc100_getrate_clksrc(struct clk *clk)
-{
-	struct clksrc_clk *sclk = to_clksrc(clk);
-	unsigned long rate = clk_get_rate(clk->parent);
-	u32 clkdiv = __raw_readl(sclk->reg_divider);
-
-	clkdiv >>= sclk->divider_shift;
-	clkdiv &= 0xf;
-	clkdiv++;
-
-	rate /= clkdiv;
-	return rate;
-}
-
-static int s5pc100_setrate_clksrc(struct clk *clk, unsigned long rate)
-{
-	struct clksrc_clk *sclk = to_clksrc(clk);
-	void __iomem *reg = sclk->reg_divider;
-	unsigned int div;
-	u32 val;
-
-	rate = clk_round_rate(clk, rate);
-	div = clk_get_rate(clk->parent) / rate;
-	if (div > 16)
-		return -EINVAL;
-
-	val = __raw_readl(reg);
-	val &= ~(0xf << sclk->divider_shift);
-	val |= (div - 1) << sclk->divider_shift;
-	__raw_writel(val, reg);
-
-	return 0;
-}
-
-static int s5pc100_setparent_clksrc(struct clk *clk, struct clk *parent)
-{
-	struct clksrc_clk *sclk = to_clksrc(clk);
-	struct clk_sources *srcs = sclk->sources;
-	u32 clksrc = __raw_readl(sclk->reg_source);
-	int src_nr = -1;
-	int ptr;
-
-	for (ptr = 0; ptr < srcs->nr_sources; ptr++)
-		if (srcs->sources[ptr] == parent) {
-			src_nr = ptr;
-			break;
-		}
-
-	if (src_nr >= 0) {
-		clksrc &= ~sclk->mask;
-		clksrc |= src_nr << sclk->shift;
-
-		__raw_writel(clksrc, sclk->reg_source);
-		return 0;
-	}
-
-	return -EINVAL;
-}
-
-static unsigned long s5pc100_roundrate_clksrc(struct clk *clk,
-					      unsigned long rate)
-{
-	unsigned long parent_rate = clk_get_rate(clk->parent);
-	int div;
-
-	if (rate > parent_rate)
-		rate = parent_rate;
-	else {
-		div = rate / parent_rate;
-
-		if (div == 0)
-			div = 1;
-		if (div > 16)
-			div = 16;
-
-		rate = parent_rate / div;
-	}
-
-	return rate;
-}
-
-static struct clk_ops s5pc100_clksrc_ops = {
-	.set_parent	= s5pc100_setparent_clksrc,
-	.get_rate	= s5pc100_getrate_clksrc,
-	.set_rate	= s5pc100_setrate_clksrc,
-	.round_rate	= s5pc100_roundrate_clksrc,
-};
-
 static struct clk *clkset_spi_list[] = {
 	&clk_mout_epll.clk,
 	&clk_dout_mpll2,
@@ -574,7 +453,7 @@ static struct clk *clkset_spi_list[] = {
 	&clk_mout_hpll.clk,
 };
 
-static struct clk_sources clkset_spi = {
+static struct clksrc_sources clkset_spi = {
 	.sources	= clkset_spi_list,
 	.nr_sources	= ARRAY_SIZE(clkset_spi_list),
 };
@@ -587,12 +466,9 @@ static struct clksrc_clk clk_spi0 = {
 		.enable		= s5pc100_sclk0_ctrl,
 
 	},
-	.shift		= S5PC100_CLKSRC1_SPI0_SHIFT,
-	.mask		= S5PC100_CLKSRC1_SPI0_MASK,
-	.sources	= &clkset_spi,
-	.divider_shift	= S5PC100_CLKDIV2_SPI0_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV2,
-	.reg_source	= S5PC100_CLKSRC1,
+	.sources = &clkset_spi,
+	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 4, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 4, .size = 2, },
 };
 
 static struct clksrc_clk clk_spi1 = {
@@ -601,14 +477,10 @@ static struct clksrc_clk clk_spi1 = {
 		.id		= 1,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI1,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC1_SPI1_SHIFT,
-	.mask		= S5PC100_CLKSRC1_SPI1_MASK,
-	.sources	= &clkset_spi,
-	.divider_shift	= S5PC100_CLKDIV2_SPI1_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV2,
-	.reg_source	= S5PC100_CLKSRC1,
+	.sources = &clkset_spi,
+	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 8, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 8, .size = 2, },
 };
 
 static struct clksrc_clk clk_spi2 = {
@@ -617,14 +489,10 @@ static struct clksrc_clk clk_spi2 = {
 		.id		= 2,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK0_SPI2,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC1_SPI2_SHIFT,
-	.mask		= S5PC100_CLKSRC1_SPI2_MASK,
-	.sources	= &clkset_spi,
-	.divider_shift	= S5PC100_CLKDIV2_SPI2_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV2,
-	.reg_source	= S5PC100_CLKSRC1,
+	.sources = &clkset_spi,
+	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 12, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 12, .size = 2, },
 };
 
 static struct clk *clkset_uart_list[] = {
@@ -632,7 +500,7 @@ static struct clk *clkset_uart_list[] = {
 	&clk_dout_mpll,
 };
 
-static struct clk_sources clkset_uart = {
+static struct clksrc_sources clkset_uart = {
 	.sources	= clkset_uart_list,
 	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
 };
@@ -643,14 +511,10 @@ static struct clksrc_clk clk_uart_uclk1 = {
 		.id		= -1,
 		.ctrlbit        = S5PC100_CLKGATE_SCLK0_UART,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC1_UART_SHIFT,
-	.mask		= S5PC100_CLKSRC1_UART_MASK,
-	.sources	= &clkset_uart,
-	.divider_shift	= S5PC100_CLKDIV2_UART_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV2,
-	.reg_source	= S5PC100_CLKSRC1,
+	.sources = &clkset_uart,
+	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 0, .size = 3, },
+	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 0, .size = 1, },
 };
 
 static struct clk clk_iis_cd0 = {
@@ -687,7 +551,7 @@ static struct clk *clkset_audio0_list[] = {
 	&clk_mout_hpll.clk,
 };
 
-static struct clk_sources clkset_audio0 = {
+static struct clksrc_sources clkset_audio0 = {
 	.sources	= clkset_audio0_list,
 	.nr_sources	= ARRAY_SIZE(clkset_audio0_list),
 };
@@ -698,14 +562,10 @@ static struct clksrc_clk clk_audio0 = {
 		.id		= 0,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO0,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC3_AUDIO0_SHIFT,
-	.mask		= S5PC100_CLKSRC3_AUDIO0_MASK,
-	.sources	= &clkset_audio0,
-	.divider_shift	= S5PC100_CLKDIV4_AUDIO0_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV4,
-	.reg_source	= S5PC100_CLKSRC3,
+	.sources = &clkset_audio0,
+	.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 12, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 12, .size = 3, },
 };
 
 static struct clk *clkset_audio1_list[] = {
@@ -717,7 +577,7 @@ static struct clk *clkset_audio1_list[] = {
 	&clk_mout_hpll.clk,
 };
 
-static struct clk_sources clkset_audio1 = {
+static struct clksrc_sources clkset_audio1 = {
 	.sources	= clkset_audio1_list,
 	.nr_sources	= ARRAY_SIZE(clkset_audio1_list),
 };
@@ -728,14 +588,10 @@ static struct clksrc_clk clk_audio1 = {
 		.id		= 1,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO1,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC3_AUDIO1_SHIFT,
-	.mask		= S5PC100_CLKSRC3_AUDIO1_MASK,
-	.sources	= &clkset_audio1,
-	.divider_shift	= S5PC100_CLKDIV4_AUDIO1_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV4,
-	.reg_source	= S5PC100_CLKSRC3,
+	.sources = &clkset_audio1,
+	.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 16, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 16, .size = 3, },
 };
 
 static struct clk *clkset_audio2_list[] = {
@@ -746,7 +602,7 @@ static struct clk *clkset_audio2_list[] = {
 	&clk_mout_hpll.clk,
 };
 
-static struct clk_sources clkset_audio2 = {
+static struct clksrc_sources clkset_audio2 = {
 	.sources	= clkset_audio2_list,
 	.nr_sources	= ARRAY_SIZE(clkset_audio2_list),
 };
@@ -757,14 +613,10 @@ static struct clksrc_clk clk_audio2 = {
 		.id		= 2,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_AUDIO2,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC3_AUDIO2_SHIFT,
-	.mask		= S5PC100_CLKSRC3_AUDIO2_MASK,
-	.sources	= &clkset_audio2,
-	.divider_shift	= S5PC100_CLKDIV4_AUDIO2_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV4,
-	.reg_source	= S5PC100_CLKSRC3,
+	.sources = &clkset_audio2,
+	.reg_div = { .reg = S5PC100_CLKDIV4, .shift = 20, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 20, .size = 3, },
 };
 
 static struct clk *clkset_spdif_list[] = {
@@ -773,7 +625,7 @@ static struct clk *clkset_spdif_list[] = {
 	&clk_audio2.clk,
 };
 
-static struct clk_sources clkset_spdif = {
+static struct clksrc_sources clkset_spdif = {
 	.sources	= clkset_spdif_list,
 	.nr_sources	= ARRAY_SIZE(clkset_spdif_list),
 };
@@ -783,10 +635,8 @@ static struct clksrc_clk clk_spdif = {
 		.name		= "spdif",
 		.id		= -1,
 	},
-	.shift		= S5PC100_CLKSRC3_SPDIF_SHIFT,
-	.mask		= S5PC100_CLKSRC3_SPDIF_MASK,
 	.sources	= &clkset_spdif,
-	.reg_source	= S5PC100_CLKSRC3,
+	.reg_src = { .reg = S5PC100_CLKSRC3, .shift = 24, .size = 2, },
 };
 
 static struct clk *clkset_lcd_fimc_list[] = {
@@ -796,7 +646,7 @@ static struct clk *clkset_lcd_fimc_list[] = {
 	&clk_vclk_54m,
 };
 
-static struct clk_sources clkset_lcd_fimc = {
+static struct clksrc_sources clkset_lcd_fimc = {
 	.sources	= clkset_lcd_fimc_list,
 	.nr_sources	= ARRAY_SIZE(clkset_lcd_fimc_list),
 };
@@ -807,14 +657,10 @@ static struct clksrc_clk clk_lcd = {
 		.id		= -1,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_LCD,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_LCD_SHIFT,
-	.mask		= S5PC100_CLKSRC2_LCD_MASK,
-	.sources	= &clkset_lcd_fimc,
-	.divider_shift	= S5PC100_CLKDIV3_LCD_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.sources = &clkset_lcd_fimc,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 12, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 12, .size = 2, },
 };
 
 static struct clksrc_clk clk_fimc0 = {
@@ -823,14 +669,10 @@ static struct clksrc_clk clk_fimc0 = {
 		.id		= 0,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC0,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_FIMC0_SHIFT,
-	.mask		= S5PC100_CLKSRC2_FIMC0_MASK,
-	.sources	= &clkset_lcd_fimc,
-	.divider_shift	= S5PC100_CLKDIV3_FIMC0_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.sources = &clkset_lcd_fimc,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 16, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 16, .size = 2, },
 };
 
 static struct clksrc_clk clk_fimc1 = {
@@ -839,14 +681,10 @@ static struct clksrc_clk clk_fimc1 = {
 		.id		= 1,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC1,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_FIMC1_SHIFT,
-	.mask		= S5PC100_CLKSRC2_FIMC1_MASK,
 	.sources	= &clkset_lcd_fimc,
-	.divider_shift	= S5PC100_CLKDIV3_FIMC1_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 20, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 20, .size = 2, },
 };
 
 static struct clksrc_clk clk_fimc2 = {
@@ -855,14 +693,10 @@ static struct clksrc_clk clk_fimc2 = {
 		.id		= 2,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK1_FIMC2,
 		.enable		= s5pc100_sclk1_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_FIMC2_SHIFT,
-	.mask		= S5PC100_CLKSRC2_FIMC2_MASK,
-	.sources	= &clkset_lcd_fimc,
-	.divider_shift	= S5PC100_CLKDIV3_FIMC2_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.sources = &clkset_lcd_fimc,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 24, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 24, .size = 2, },
 };
 
 static struct clk *clkset_mmc_list[] = {
@@ -872,7 +706,7 @@ static struct clk *clkset_mmc_list[] = {
 	&clk_mout_hpll.clk ,
 };
 
-static struct clk_sources clkset_mmc = {
+static struct clksrc_sources clkset_mmc = {
 	.sources	= clkset_mmc_list,
 	.nr_sources	= ARRAY_SIZE(clkset_mmc_list),
 };
@@ -883,14 +717,10 @@ static struct clksrc_clk clk_mmc0 = {
 		.id		= 0,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC0,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_MMC0_SHIFT,
-	.mask		= S5PC100_CLKSRC2_MMC0_MASK,
-	.sources	= &clkset_mmc,
-	.divider_shift	= S5PC100_CLKDIV3_MMC0_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.sources = &clkset_mmc,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 0, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 0, .size = 2, },
 };
 
 static struct clksrc_clk clk_mmc1 = {
@@ -899,14 +729,10 @@ static struct clksrc_clk clk_mmc1 = {
 		.id		= 1,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC1,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_MMC1_SHIFT,
-	.mask		= S5PC100_CLKSRC2_MMC1_MASK,
-	.sources	= &clkset_mmc,
-	.divider_shift	= S5PC100_CLKDIV3_MMC1_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.sources = &clkset_mmc,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 4, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 4, .size = 2, },
 };
 
 static struct clksrc_clk clk_mmc2 = {
@@ -915,14 +741,10 @@ static struct clksrc_clk clk_mmc2 = {
 		.id		= 2,
 		.ctrlbit	= S5PC100_CLKGATE_SCLK0_MMC2,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC2_MMC2_SHIFT,
-	.mask		= S5PC100_CLKSRC2_MMC2_MASK,
 	.sources	= &clkset_mmc,
-	.divider_shift	= S5PC100_CLKDIV3_MMC2_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV3,
-	.reg_source	= S5PC100_CLKSRC2,
+	.reg_div = { .reg = S5PC100_CLKDIV3, .shift = 8, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC2, .shift = 8, .size = 2, },
 };
 
 
@@ -933,7 +755,7 @@ static struct clk *clkset_usbhost_list[] = {
 	&clk_48m,
 };
 
-static struct clk_sources clkset_usbhost = {
+static struct clksrc_sources clkset_usbhost = {
 	.sources	= clkset_usbhost_list,
 	.nr_sources	= ARRAY_SIZE(clkset_usbhost_list),
 };
@@ -944,14 +766,10 @@ static struct clksrc_clk clk_usbhost = {
 		.id		= -1,
 		.ctrlbit        = S5PC100_CLKGATE_SCLK0_USBHOST,
 		.enable		= s5pc100_sclk0_ctrl,
-		.ops		= &s5pc100_clksrc_ops,
 	},
-	.shift		= S5PC100_CLKSRC1_UHOST_SHIFT,
-	.mask		= S5PC100_CLKSRC1_UHOST_MASK,
-	.sources	= &clkset_usbhost,
-	.divider_shift	= S5PC100_CLKDIV2_UHOST_SHIFT,
-	.reg_divider	= S5PC100_CLKDIV2,
-	.reg_source	= S5PC100_CLKSRC1,
+	.sources = &clkset_usbhost,
+	.reg_div = { .reg = S5PC100_CLKDIV2, .shift = 20, .size = 4, },
+	.reg_src = { .reg = S5PC100_CLKSRC1, .shift = 20, .size = 2, },
 };
 
 /* Clock initialisation code */
@@ -981,27 +799,6 @@ static struct clksrc_clk *init_parents[] = {
 	&clk_usbhost,
 };
 
-static void __init_or_cpufreq s5pc100_set_clksrc(struct clksrc_clk *clk)
-{
-	struct clk_sources *srcs = clk->sources;
-	u32 clksrc = __raw_readl(clk->reg_source);
-
-	clksrc &= clk->mask;
-	clksrc >>= clk->shift;
-
-	if (clksrc > srcs->nr_sources || !srcs->sources[clksrc]) {
-		printk(KERN_ERR "%s: bad source %d\n",
-		       clk->clk.name, clksrc);
-		return;
-	}
-
-	clk->clk.parent = srcs->sources[clksrc];
-
-	printk(KERN_INFO "%s: source is %s (%d), rate is %ld.%03ld MHz\n",
-		clk->clk.name, clk->clk.parent->name, clksrc,
-		print_mhz(clk_get_rate(&clk->clk)));
-}
-
 #define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SHIFT) + 1)
 
 void __init_or_cpufreq s5pc100_setup_clocks(void)
@@ -1065,50 +862,54 @@ void __init_or_cpufreq s5pc100_setup_clocks(void)
 	clk_f.rate = armclk;
 
 	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
-		s5pc100_set_clksrc(init_parents[ptr]);
+	  s3c_set_clksrc(init_parents[ptr], true);
 }
 
 static struct clk *clks[] __initdata = {
 	&clk_ext_xtal_mux,
-	&clk_mout_apll.clk,
 	&clk_dout_apll,
 	&clk_dout_d0_bus,
 	&clk_dout_pclkd0,
 	&clk_dout_apll2,
-	&clk_mout_mpll.clk,
 	&clk_mout_am.clk,
 	&clk_dout_d1_bus,
-	&clk_mout_onenand.clk,
 	&clk_dout_pclkd1,
 	&clk_dout_mpll2,
 	&clk_dout_cam,
 	&clk_dout_mpll,
-	&clk_mout_epll.clk,
 	&clk_fout_epll,
 	&clk_iis_cd0,
 	&clk_iis_cd1,
 	&clk_iis_cd2,
 	&clk_pcm_cd0,
 	&clk_pcm_cd1,
-	&clk_spi0.clk,
-	&clk_spi1.clk,
-	&clk_spi2.clk,
-	&clk_uart_uclk1.clk,
-	&clk_audio0.clk,
-	&clk_audio1.clk,
-	&clk_audio2.clk,
-	&clk_spdif.clk,
-	&clk_lcd.clk,
-	&clk_fimc0.clk,
-	&clk_fimc1.clk,
-	&clk_fimc2.clk,
-	&clk_mmc0.clk,
-	&clk_mmc1.clk,
-	&clk_mmc2.clk,
-	&clk_usbhost.clk,
 	&clk_arm,
 };
 
+/* simplest change - will aggregate clocks later */
+static struct clksrc_clk *clks_src[] = {
+	&clk_mout_apll,
+	&clk_mout_mpll,
+	&clk_mout_onenand,
+	&clk_mout_epll,
+	&clk_spi0,
+	&clk_spi1,
+	&clk_spi2,
+	&clk_uart_uclk1,
+	&clk_audio0,
+	&clk_audio1,
+	&clk_audio2,
+	&clk_spdif,
+	&clk_lcd,
+	&clk_fimc0,
+	&clk_fimc1,
+	&clk_fimc2,
+	&clk_mmc0,
+	&clk_mmc1,
+	&clk_mmc2,
+	&clk_usbhost,
+};
+
 void __init s5pc100_register_clocks(void)
 {
 	struct clk *clkp;
@@ -1123,4 +924,7 @@ void __init s5pc100_register_clocks(void)
 			       clkp->name, ret);
 		}
 	}
+
+	for (ptr = 0; ptr < ARRAY_SIZE(clks_src); ptr++)
+		s3c_register_clksrc(clks_src[ptr], 1);
 }
-- 
1.6.0.4
