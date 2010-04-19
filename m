From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P6440: Add new clock definitions.
Date: Mon, 19 Apr 2010 20:02:59 +0900
Message-ID: <1271674979-31943-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47208 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753908Ab0DSLH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Apr 2010 07:07:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas@localhost.localdomain>, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas@localhost.localdomain>

Add additional clock definitions for Samsung's S5P6440 SoC. Additionally,
modifies the clock code to adhere to the Samsung's clock API.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/clock.c                   |  462 +++++++++++++++--------
 arch/arm/mach-s5p6440/include/mach/regs-clock.h |   21 +-
 2 files changed, 321 insertions(+), 162 deletions(-)

diff --git a/arch/arm/mach-s5p6440/clock.c b/arch/arm/mach-s5p6440/clock.c
index b2672e1..e2eb3ae 100644
--- a/arch/arm/mach-s5p6440/clock.c
+++ b/arch/arm/mach-s5p6440/clock.c
@@ -32,16 +32,6 @@
 #include <plat/pll.h>
 #include <plat/s5p6440.h>
 
-/* APLL Mux output clock */
-static struct clksrc_clk clk_mout_apll = {
-	.clk    = {
-		.name           = "mout_apll",
-		.id             = -1,
-	},
-	.sources        = &clk_src_apll,
-	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
-};
-
 static int s5p6440_epll_enable(struct clk *clk, int enable)
 {
 	unsigned int ctrlbit = clk->ctrlbit;
@@ -116,15 +106,17 @@ static struct clk_ops s5p6440_epll_ops = {
 	.set_rate = s5p6440_epll_set_rate,
 };
 
-static struct clksrc_clk clk_mout_epll = {
+/* APLL Mux output clock */
+static struct clksrc_clk clk_mout_apll = {
 	.clk    = {
-		.name           = "mout_epll",
+		.name           = "mout_apll",
 		.id             = -1,
 	},
-	.sources        = &clk_src_epll,
-	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 2, .size = 1 },
+	.sources        = &clk_src_apll,
+	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
 };
 
+/* MPLL Mux Output clock */
 static struct clksrc_clk clk_mout_mpll = {
 	.clk = {
 		.name           = "mout_mpll",
@@ -134,22 +126,14 @@ static struct clksrc_clk clk_mout_mpll = {
 	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 1, .size = 1 },
 };
 
-static struct clk clk_h_low = {
-	.name		= "hclk_low",
-	.id		= -1,
-	.rate		= 0,
-	.parent		= NULL,
-	.ctrlbit	= 0,
-	.ops		= &clk_ops_def_setrate,
-};
-
-static struct clk clk_p_low = {
-	.name		= "pclk_low",
-	.id		= -1,
-	.rate		= 0,
-	.parent		= NULL,
-	.ctrlbit	= 0,
-	.ops		= &clk_ops_def_setrate,
+/* EPLL Mux output clock */
+static struct clksrc_clk clk_mout_epll = {
+	.clk    = {
+		.name           = "mout_epll",
+		.id             = -1,
+	},
+	.sources        = &clk_src_epll,
+	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 2, .size = 1 },
 };
 
 enum perf_level {
@@ -201,7 +185,6 @@ static int s5p6440_armclk_set_rate(struct clk *clk, unsigned long rate)
 	if (round_tmp == cur_rate)
 		return 0;
 
-
 	for (iter = 0 ; iter < ARRAY_SIZE(clock_table) ; iter++) {
 		if (round_tmp == clock_table[iter][0])
 			break;
@@ -233,7 +216,7 @@ static int s5p6440_armclk_set_rate(struct clk *clk, unsigned long rate)
 		clk_div0_tmp = __raw_readl(ARM_CLK_DIV) & ~(ARM_DIV_MASK);
 		clk_div0_tmp |= clock_table[iter][1];
 		__raw_writel(clk_div0_tmp, ARM_CLK_DIV);
-		}
+	}
 	local_irq_restore(flags);
 
 	clk->rate = clock_table[iter][0];
@@ -247,25 +230,6 @@ static struct clk_ops s5p6440_clkarm_ops = {
 	.round_rate	= s5p6440_armclk_round_rate,
 };
 
-static unsigned long s5p6440_clk_doutmpll_get_rate(struct clk *clk)
-{
-	unsigned long rate = clk_get_rate(clk->parent);
-
-	if (__raw_readl(S5P_CLK_DIV0) & S5P_CLKDIV0_MPLL_MASK)
-		rate /= 2;
-
-	return rate;
-}
-
-static struct clk clk_dout_mpll = {
-	.name		= "dout_mpll",
-	.id		= -1,
-	.parent		= &clk_mout_mpll.clk,
-	.ops            = &(struct clk_ops) {
-		.get_rate	= s5p6440_clk_doutmpll_get_rate,
-	},
-};
-
 int s5p6440_clk48m_ctrl(struct clk *clk, int enable)
 {
 	unsigned long flags;
@@ -287,6 +251,72 @@ int s5p6440_clk48m_ctrl(struct clk *clk, int enable)
 	return 0;
 }
 
+static struct clksrc_clk clk_armclk = {
+	.clk	= {
+		.name	= "armclk",
+		.id	= -1,
+		.parent	= &clk_mout_apll.clk,
+		.ops	= &s5p6440_clkarm_ops,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk clk_hclk = {
+	.clk	= {
+		.name	= "clk_hclk",
+		.id	= -1,
+		.parent	= &clk_armclk.clk,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 8, .size = 4 },
+};
+
+static struct clksrc_clk clk_pclk = {
+	.clk	= {
+		.name	= "clk_pclk",
+		.id	= -1,
+		.parent	= &clk_hclk.clk,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 12, .size = 4 },
+};
+
+static struct clk *clkset_hclklow_list[] = {
+	&clk_mout_apll.clk,
+	&clk_mout_mpll.clk,
+};
+
+static struct clksrc_sources clkset_hclklow = {
+	.sources	= clkset_hclklow_list,
+	.nr_sources	= ARRAY_SIZE(clkset_hclklow_list),
+};
+
+static struct clksrc_clk clk_hclk_low = {
+	.clk	= {
+		.name		= "hclk_low",
+		.id		= -1,
+	},
+	.sources = &clkset_hclklow,
+	.reg_src = { .reg = S5P_SYS_OTHERS, .shift = 6, .size = 1 },
+	.reg_div = { .reg = S5P_CLK_DIV3, .shift = 8, .size = 4 },
+};
+
+static struct clksrc_clk clk_pclk_low = {
+	.clk	= {
+		.name	= "pclk_low",
+		.id	= -1,
+		.parent	= &clk_hclk_low.clk,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV3, .shift = 12, .size = 4 },
+};
+
+static struct clksrc_clk clk_dout_mpll = {
+	.clk = {
+		.name		= "dout_mpll",
+		.id		= -1,
+		.parent		= &clk_mout_mpll.clk,
+	},
+	.reg_div = { .reg = S5P_CLK_DIV0, .shift = 4, .size = 1 },
+};
+
 static int s5p6440_pclk_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLK_GATE_PCLK, clk, enable);
@@ -302,11 +332,16 @@ static int s5p6440_hclk1_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLK_GATE_HCLK1, clk, enable);
 }
 
-static int s5p6440_sclk_ctrl(struct clk *clk, int enable)
+static int s5p6440_sclk0_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLK_GATE_SCLK0, clk, enable);
 }
 
+static int s5p6440_sclk1_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLK_GATE_SCLK1, clk, enable);
+}
+
 static int s5p6440_mem_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLK_GATE_MEM0, clk, enable);
@@ -321,124 +356,184 @@ static struct clk init_clocks_disable[] = {
 	{
 		.name		= "nand",
 		.id		= -1,
-		.parent		= &clk_h,
+		.parent		= &clk_hclk.clk,
 		.enable		= s5p6440_mem_ctrl,
 		.ctrlbit	= S5P_CLKCON_MEM0_HCLK_NFCON,
 	}, {
 		.name		= "adc",
 		.id		= -1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_TSADC,
 	}, {
 		.name		= "i2c",
-		.id		= -1,
-		.parent		= &clk_p_low,
+		.id		= 1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_IIC1,
+	}, {
+		.name		= "i2c",
+		.id		= 0,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_IIC0,
 	}, {
 		.name		= "i2s_v40",
 		.id		= 0,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_IIS2,
 	}, {
 		.name		= "spi",
 		.id		= 0,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_SPI0,
 	}, {
 		.name		= "spi",
 		.id		= 1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_SPI1,
 	}, {
-		.name		= "sclk_spi_48",
-		.id		= 0,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_SPI0_48,
-	}, {
-		.name		= "sclk_spi_48",
-		.id		= 1,
-		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
-		.ctrlbit	= S5P_CLKCON_SCLK0_SPI1_48,
-	}, {
 		.name		= "mmc_48m",
 		.id		= 0,
 		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
+		.enable		= s5p6440_sclk0_ctrl,
 		.ctrlbit	= S5P_CLKCON_SCLK0_MMC0_48,
 	}, {
 		.name		= "mmc_48m",
 		.id		= 1,
 		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
+		.enable		= s5p6440_sclk0_ctrl,
 		.ctrlbit	= S5P_CLKCON_SCLK0_MMC1_48,
 	}, {
 		.name		= "mmc_48m",
 		.id		= 2,
 		.parent		= &clk_48m,
-		.enable		= s5p6440_sclk_ctrl,
+		.enable		= s5p6440_sclk0_ctrl,
 		.ctrlbit	= S5P_CLKCON_SCLK0_MMC2_48,
 	}, {
-		.name    	= "otg",
-		.id	   	= -1,
-		.parent  	= &clk_h_low,
-		.enable  	= s5p6440_hclk0_ctrl,
-		.ctrlbit 	= S5P_CLKCON_HCLK0_USB
+		.name		= "otg",
+		.id		= -1,
+		.parent		= &clk_hclk_low.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_USB
 	}, {
-		.name    	= "post",
-		.id	   	= -1,
-		.parent  	= &clk_h_low,
-		.enable  	= s5p6440_hclk0_ctrl,
-		.ctrlbit 	= S5P_CLKCON_HCLK0_POST0
+		.name		= "post",
+		.id		= -1,
+		.parent		= &clk_hclk_low.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_POST0
+	}, {
+		.name		= "hclk_fimgvg",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk1_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK1_FIMGVG,
 	}, {
 		.name		= "lcd",
 		.id		= -1,
-		.parent		= &clk_h_low,
+		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p6440_hclk1_ctrl,
 		.ctrlbit	= S5P_CLKCON_HCLK1_DISPCON,
 	}, {
+		.name		= "tsi",
+		.id		= -1,
+		.parent		= &clk_hclk_low.clk,
+		.enable		= s5p6440_hclk1_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK1_TSI,
+	}, {
 		.name		= "hsmmc",
 		.id		= 0,
-		.parent		= &clk_h_low,
+		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p6440_hclk0_ctrl,
 		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC0,
 	}, {
 		.name		= "hsmmc",
 		.id		= 1,
-		.parent		= &clk_h_low,
+		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p6440_hclk0_ctrl,
 		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC1,
 	}, {
 		.name		= "hsmmc",
 		.id		= 2,
-		.parent		= &clk_h_low,
+		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p6440_hclk0_ctrl,
 		.ctrlbit	= S5P_CLKCON_HCLK0_HSMMC2,
 	}, {
 		.name		= "rtc",
 		.id		= -1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_RTC,
 	}, {
 		.name		= "watchdog",
 		.id		= -1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_WDT,
 	}, {
 		.name		= "timers",
 		.id		= -1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_PWM,
-	}
+	}, {
+		.name		= "pclk_fimgvg",
+		.id		= -1,
+		.parent		= &clk_pclk.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_FIMGVG,
+	}, {
+		.name		= "dmc0",
+		.id		= -1,
+		.parent		= &clk_pclk.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_DMC0,
+	}, {
+		.name		= "etm",
+		.id		= -1,
+		.parent		= &clk_pclk.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_ETM,
+	}, {
+		.name		= "dsim",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_DSIM,
+	}, {
+		.name		= "gps",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_GPS,
+	}, {
+		.name		= "pcm",
+		.id		= -1,
+		.parent		= &clk_pclk_low.clk,
+		.enable		= s5p6440_pclk_ctrl,
+		.ctrlbit	= S5P_CLKCON_PCLK_PCM0,
+	}, {
+		.name		= "irom",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_IROM,
+	}, {
+		.name		= "dma",
+		.id		= -1,
+		.parent		= &clk_hclk_low.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_DMA0,
+	}, {
+		.name		= "2d",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_2D,
+	},
 };
 
 /*
@@ -448,34 +543,46 @@ static struct clk init_clocks[] = {
 	{
 		.name		= "gpio",
 		.id		= -1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_GPIO,
 	}, {
 		.name		= "uart",
 		.id		= 0,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_UART0,
 	}, {
 		.name		= "uart",
 		.id		= 1,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_UART1,
 	}, {
 		.name		= "uart",
 		.id		= 2,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_UART2,
 	}, {
 		.name		= "uart",
 		.id		= 3,
-		.parent		= &clk_p_low,
+		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p6440_pclk_ctrl,
 		.ctrlbit	= S5P_CLKCON_PCLK_UART3,
-	}
+	}, {
+		.name		= "mem",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_MEM0,
+	}, {
+		.name		= "intc",
+		.id		= -1,
+		.parent		= &clk_hclk.clk,
+		.enable		= s5p6440_hclk0_ctrl,
+		.ctrlbit	= S5P_CLKCON_HCLK0_INTC,
+	},
 };
 
 static struct clk clk_iis_cd_v40 = {
@@ -488,20 +595,20 @@ static struct clk clk_pcm_cd = {
 	.id		= -1,
 };
 
-static struct clk *clkset_spi_mmc_list[] = {
+static struct clk *clkset_group1_list[] = {
 	&clk_mout_epll.clk,
-	&clk_dout_mpll,
+	&clk_dout_mpll.clk,
 	&clk_fin_epll,
 };
 
-static struct clksrc_sources clkset_spi_mmc = {
-	.sources	= clkset_spi_mmc_list,
-	.nr_sources	= ARRAY_SIZE(clkset_spi_mmc_list),
+static struct clksrc_sources clkset_group1 = {
+	.sources	= clkset_group1_list,
+	.nr_sources	= ARRAY_SIZE(clkset_group1_list),
 };
 
 static struct clk *clkset_uart_list[] = {
 	&clk_mout_epll.clk,
-	&clk_dout_mpll
+	&clk_dout_mpll.clk,
 };
 
 static struct clksrc_sources clkset_uart = {
@@ -509,43 +616,56 @@ static struct clksrc_sources clkset_uart = {
 	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
 };
 
+static struct clk *clkset_audio_list[] = {
+	&clk_mout_epll.clk,
+	&clk_dout_mpll.clk,
+	&clk_fin_epll,
+	&clk_iis_cd_v40,
+	&clk_pcm_cd,
+};
+
+static struct clksrc_sources clkset_audio = {
+	.sources	= clkset_audio_list,
+	.nr_sources	= ARRAY_SIZE(clkset_audio_list),
+};
+
 static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "mmc_bus",
 			.id		= 0,
-			.ctrlbit        = S5P_CLKCON_SCLK0_MMC0,
-			.enable		= s5p6440_sclk_ctrl,
+			.ctrlbit	= S5P_CLKCON_SCLK0_MMC0,
+			.enable		= s5p6440_sclk0_ctrl,
 		},
-		.sources = &clkset_spi_mmc,
+		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 18, .size = 2 },
 		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 0, .size = 4 },
 	}, {
 		.clk	= {
 			.name		= "mmc_bus",
 			.id		= 1,
-			.ctrlbit        = S5P_CLKCON_SCLK0_MMC1,
-			.enable		= s5p6440_sclk_ctrl,
+			.ctrlbit	= S5P_CLKCON_SCLK0_MMC1,
+			.enable		= s5p6440_sclk0_ctrl,
 		},
-		.sources = &clkset_spi_mmc,
+		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 20, .size = 2 },
 		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 4, .size = 4 },
 	}, {
 		.clk	= {
 			.name		= "mmc_bus",
 			.id		= 2,
-			.ctrlbit        = S5P_CLKCON_SCLK0_MMC2,
-			.enable		= s5p6440_sclk_ctrl,
+			.ctrlbit	= S5P_CLKCON_SCLK0_MMC2,
+			.enable		= s5p6440_sclk0_ctrl,
 		},
-		.sources = &clkset_spi_mmc,
+		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 22, .size = 2 },
 		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 8, .size = 4 },
 	}, {
 		.clk	= {
 			.name		= "uclk1",
 			.id		= -1,
-			.ctrlbit        = S5P_CLKCON_SCLK0_UART,
-			.enable		= s5p6440_sclk_ctrl,
+			.ctrlbit	= S5P_CLKCON_SCLK0_UART,
+			.enable		= s5p6440_sclk0_ctrl,
 		},
 		.sources = &clkset_uart,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 13, .size = 1 },
@@ -554,30 +674,75 @@ static struct clksrc_clk clksrcs[] = {
 		.clk	= {
 			.name		= "spi_epll",
 			.id		= 0,
-			.ctrlbit        = S5P_CLKCON_SCLK0_SPI0,
-			.enable		= s5p6440_sclk_ctrl,
+			.ctrlbit	= S5P_CLKCON_SCLK0_SPI0,
+			.enable		= s5p6440_sclk0_ctrl,
 		},
-		.sources = &clkset_spi_mmc,
+		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 14, .size = 2 },
 		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 0, .size = 4 },
 	}, {
 		.clk	= {
 			.name		= "spi_epll",
 			.id		= 1,
-			.ctrlbit        = S5P_CLKCON_SCLK0_SPI1,
-			.enable		= s5p6440_sclk_ctrl,
+			.ctrlbit	= S5P_CLKCON_SCLK0_SPI1,
+			.enable		= s5p6440_sclk0_ctrl,
 		},
-		.sources = &clkset_spi_mmc,
+		.sources = &clkset_group1,
 		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 16, .size = 2 },
 		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 4, .size = 4 },
-	}
+	}, {
+		.clk	= {
+			.name		= "sclk_post",
+			.id		= 0,
+			.ctrlbit	= S5P_CLKCON_SCLK0_POST0,
+			.enable		= s5p6440_sclk0_ctrl,
+		},
+		.sources = &clkset_group1,
+		.reg_src = { .reg = S5P_CLK_SRC0, .shift = 26, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 12, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "sclk_dispcon",
+			.id		= 0,
+			.ctrlbit	= S5P_CLKCON_SCLK1_DISPCON,
+			.enable		= s5p6440_sclk1_ctrl,
+		},
+		.sources = &clkset_group1,
+		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 4, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 0, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "sclk_fimgvg",
+			.id		= 0,
+			.ctrlbit	= S5P_CLKCON_SCLK1_FIMGVG,
+			.enable		= s5p6440_sclk1_ctrl,
+		},
+		.sources = &clkset_group1,
+		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 8, .size = 2 },
+		.reg_div = { .reg = S5P_CLK_DIV3, .shift = 4, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "sclk_audio2",
+			.id		= 0,
+			.ctrlbit	= S5P_CLKCON_SCLK0_AUDIO2,
+			.enable		= s5p6440_sclk0_ctrl,
+		},
+		.sources = &clkset_audio,
+		.reg_src = { .reg = S5P_CLK_SRC1, .shift = 0, .size = 3 },
+		.reg_div = { .reg = S5P_CLK_DIV2, .shift = 24, .size = 4 },
+	},
 };
 
 /* Clock initialisation code */
-static struct clksrc_clk *init_parents[] = {
+static struct clksrc_clk *sysclks[] = {
 	&clk_mout_apll,
 	&clk_mout_epll,
 	&clk_mout_mpll,
+	&clk_hclk,
+	&clk_pclk,
+	&clk_hclk_low,
+	&clk_pclk_low,
+	&clk_dout_mpll,
 };
 
 void __init_or_cpufreq s5p6440_setup_clocks(void)
@@ -593,67 +758,46 @@ void __init_or_cpufreq s5p6440_setup_clocks(void)
 	unsigned long apll;
 	unsigned long mpll;
 	unsigned int ptr;
-	u32 clkdiv0;
-	u32 clkdiv3;
 
 	/* Set S5P6440 functions for clk_fout_epll */
 	clk_fout_epll.enable = s5p6440_epll_enable;
 	clk_fout_epll.ops = &s5p6440_epll_ops;
 
-	/* Set S5P6440 functions for arm clock */
-	clk_arm.parent = &clk_mout_apll.clk;
-	clk_arm.ops = &s5p6440_clkarm_ops;
 	clk_48m.enable = s5p6440_clk48m_ctrl;
 
-	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
-	clkdiv3 = __raw_readl(S5P_CLK_DIV3);
-
 	xtal_clk = clk_get(NULL, "ext_xtal");
 	BUG_ON(IS_ERR(xtal_clk));
 
 	xtal = clk_get_rate(xtal_clk);
 	clk_put(xtal_clk);
 
+	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4502);
+	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
 	epll = s5p_get_pll90xx(xtal, __raw_readl(S5P_EPLL_CON),
 				__raw_readl(S5P_EPLL_CON_K));
-	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
-	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4502);
+
+	clk_fout_mpll.rate = mpll;
+	clk_fout_epll.rate = epll;
+	clk_fout_apll.rate = apll;
 
 	printk(KERN_INFO "S5P6440: PLL settings, A=%ld.%ldMHz, M=%ld.%ldMHz," \
 			" E=%ld.%ldMHz\n",
 			print_mhz(apll), print_mhz(mpll), print_mhz(epll));
 
-	fclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_ARM);
-	hclk = fclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK);
-	pclk = hclk / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK);
-
-	if (__raw_readl(S5P_OTHERS) & S5P_OTHERS_HCLK_LOW_SEL_MPLL) {
-		/* Asynchronous mode */
-		hclk_low = mpll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
-	} else {
-		/* Synchronous mode */
-		hclk_low = apll / GET_DIV(clkdiv3, S5P_CLKDIV3_HCLK_LOW);
-	}
-
-	pclk_low = hclk_low / GET_DIV(clkdiv3, S5P_CLKDIV3_PCLK_LOW);
+	fclk = clk_get_rate(&clk_armclk.clk);
+	hclk = clk_get_rate(&clk_hclk.clk);
+	pclk = clk_get_rate(&clk_pclk.clk);
+	hclk_low = clk_get_rate(&clk_hclk_low.clk);
+	pclk_low = clk_get_rate(&clk_pclk_low.clk);
 
 	printk(KERN_INFO "S5P6440: HCLK=%ld.%ldMHz, HCLK_LOW=%ld.%ldMHz," \
 			" PCLK=%ld.%ldMHz, PCLK_LOW=%ld.%ldMHz\n",
 			print_mhz(hclk), print_mhz(hclk_low),
 			print_mhz(pclk), print_mhz(pclk_low));
 
-	clk_fout_mpll.rate = mpll;
-	clk_fout_epll.rate = epll;
-	clk_fout_apll.rate = apll;
-
 	clk_f.rate = fclk;
 	clk_h.rate = hclk;
 	clk_p.rate = pclk;
-	clk_h_low.rate = hclk_low;
-	clk_p_low.rate = pclk_low;
-
-	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
-		s3c_set_clksrc(init_parents[ptr], true);
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
 		s3c_set_clksrc(&clksrcs[ptr], true);
@@ -661,13 +805,8 @@ void __init_or_cpufreq s5p6440_setup_clocks(void)
 
 static struct clk *clks[] __initdata = {
 	&clk_ext,
-	&clk_mout_epll.clk,
-	&clk_mout_mpll.clk,
-	&clk_dout_mpll,
 	&clk_iis_cd_v40,
 	&clk_pcm_cd,
-	&clk_p_low,
-	&clk_h_low,
 };
 
 void __init s5p6440_register_clocks(void)
@@ -680,6 +819,9 @@ void __init s5p6440_register_clocks(void)
 	if (ret > 0)
 		printk(KERN_ERR "Failed to register %u clocks\n", ret);
 
+	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
+		s3c_register_clksrc(sysclks[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
diff --git a/arch/arm/mach-s5p6440/include/mach/regs-clock.h b/arch/arm/mach-s5p6440/include/mach/regs-clock.h
index c783ecc..11341f6 100644
--- a/arch/arm/mach-s5p6440/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5p6440/include/mach/regs-clock.h
@@ -76,22 +76,37 @@
 #define S5P_CLKDIV3_HCLK_LOW_SHIFT	(8)
 
 /* HCLK0 GATE Registers */
+#define S5P_CLKCON_HCLK0_IROM		(1<<25)
+#define S5P_CLKCON_HCLK0_MEM0		(1<<21)
 #define S5P_CLKCON_HCLK0_USB		(1<<20)
 #define S5P_CLKCON_HCLK0_HSMMC2		(1<<19)
 #define S5P_CLKCON_HCLK0_HSMMC1		(1<<18)
 #define S5P_CLKCON_HCLK0_HSMMC0		(1<<17)
+#define S5P_CLKCON_HCLK0_DMA0		(1<<12)
+#define S5P_CLKCON_HCLK0_2D		(1<<8)
 #define S5P_CLKCON_HCLK0_POST0		(1<<5)
+#define S5P_CLKCON_HCLK0_INTC		(1<<1)
 
 /* HCLK1 GATE Registers */
+#define S5P_CLKCON_HCLK1_FIMGVG		(1<<2)
 #define S5P_CLKCON_HCLK1_DISPCON	(1<<1)
+#define S5P_CLKCON_HCLK1_TSI		(1<<0)
 
 /* PCLK GATE Registers */
+#define S5P_CLKCON_PCLK_FIMGVG		(1<<31)
+#define S5P_CLKCON_PCLK_DMC0		(1<<30)
+#define S5P_CLKCON_PCLK_ETM		(1<<29)
+#define S5P_CLKCON_PCLK_DSIM		(1<<28)
+#define S5P_CLKCON_PCLK_IIC1		(1<<27)
 #define S5P_CLKCON_PCLK_IIS2		(1<<26)
+#define S5P_CLKCON_PCLK_GPS		(1<<25)
+#define S5P_CLKCON_PCLK_CHIPID		(1<<23)
 #define S5P_CLKCON_PCLK_SPI1		(1<<22)
 #define S5P_CLKCON_PCLK_SPI0		(1<<21)
 #define S5P_CLKCON_PCLK_GPIO		(1<<18)
 #define S5P_CLKCON_PCLK_IIC0		(1<<17)
 #define S5P_CLKCON_PCLK_TSADC		(1<<12)
+#define S5P_CLKCON_PCLK_PCM0		(1<<8)
 #define S5P_CLKCON_PCLK_PWM		(1<<7)
 #define S5P_CLKCON_PCLK_RTC		(1<<6)
 #define S5P_CLKCON_PCLK_WDT		(1<<5)
@@ -107,13 +122,15 @@
 #define S5P_CLKCON_SCLK0_MMC2		(1<<26)
 #define S5P_CLKCON_SCLK0_MMC1		(1<<25)
 #define S5P_CLKCON_SCLK0_MMC0		(1<<24)
-#define S5P_CLKCON_SCLK0_SPI1_48 	(1<<23)
-#define S5P_CLKCON_SCLK0_SPI0_48 	(1<<22)
 #define S5P_CLKCON_SCLK0_SPI1		(1<<21)
 #define S5P_CLKCON_SCLK0_SPI0		(1<<20)
+#define S5P_CLKCON_SCLK0_AUDIO2		(1<<11)
+#define S5P_CLKCON_SCLK0_POST0		(1<<10)
 #define S5P_CLKCON_SCLK0_UART		(1<<5)
 
 /* SCLK1 GATE Registers */
+#define S5P_CLKCON_SCLK1_FIMGVG		(1<<2)
+#define S5P_CLKCON_SCLK1_DISPCON	(1<<1)
 
 /* MEM0 GATE Registers */
 #define S5P_CLKCON_MEM0_HCLK_NFCON	(1<<2)
-- 
1.6.6.rc2
