From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 4/7] ARM: S5P64X0: Add clkdev support
Date: Fri, 27 May 2011 20:56:33 +0530
Message-ID: <1306509996-30280-5-git-send-email-thomas.ab@samsung.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11682 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753040Ab1E0PTZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 11:19:25 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLV00AJ9180Y240@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:24 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLV00IAA17ZX8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:23 +0900 (KST)
In-reply-to: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Add clkdev support for Samsung's s5p64x0 platforms.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-s5p64x0/clock-s5p6440.c       |   74 +++++++-------------------
 arch/arm/mach-s5p64x0/clock-s5p6450.c       |   68 +++++++------------------
 arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 +++
 arch/arm/plat-s5p/s5p-time.c                |    9 +++
 5 files changed, 56 insertions(+), 103 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e0a62fe..33ad464 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -729,6 +729,7 @@ config ARCH_S5P64X0
 	select CPU_V6
 	select GENERIC_GPIO
 	select HAVE_CLK
+	select CLKDEV_LOOKUP
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select GENERIC_CLOCKEVENTS
 	select HAVE_SCHED_CLOCK
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 9f12c2e..11fd481 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -95,7 +95,6 @@ static struct clk_ops s5p6440_epll_ops = {
 static struct clksrc_clk clk_hclk = {
 	.clk	= {
 		.name		= "clk_hclk",
-		.id		= -1,
 		.parent		= &clk_armclk.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV0, .shift = 8, .size = 4 },
@@ -104,7 +103,6 @@ static struct clksrc_clk clk_hclk = {
 static struct clksrc_clk clk_pclk = {
 	.clk	= {
 		.name		= "clk_pclk",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV0, .shift = 12, .size = 4 },
@@ -112,7 +110,6 @@ static struct clksrc_clk clk_pclk = {
 static struct clksrc_clk clk_hclk_low = {
 	.clk	= {
 		.name		= "clk_hclk_low",
-		.id		= -1,
 	},
 	.sources	= &clkset_hclk_low,
 	.reg_src	= { .reg = S5P64X0_SYS_OTHERS, .shift = 6, .size = 1 },
@@ -122,7 +119,6 @@ static struct clksrc_clk clk_hclk_low = {
 static struct clksrc_clk clk_pclk_low = {
 	.clk	= {
 		.name		= "clk_pclk_low",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV3, .shift = 12, .size = 4 },
@@ -136,187 +132,167 @@ static struct clksrc_clk clk_pclk_low = {
 static struct clk init_clocks_off[] = {
 	{
 		.name		= "nand",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_mem_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "post",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 5)
 	}, {
 		.name		= "2d",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "pdma",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "hsmmc",
-		.id		= 0,
+		.devname	= "sdhci-s3c.0",
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "hsmmc",
-		.id		= 1,
+		.devname	= "sdhci-s3c.1",
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "hsmmc",
-		.id		= 2,
+		.devname	= "sdhci-s3c.2",
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "otg",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 20)
 	}, {
 		.name		= "irom",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 25),
 	}, {
 		.name		= "lcd",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk1_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "hclk_fimgvg",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk1_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "tsi",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk1_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "watchdog",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "rtc",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "timers",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "pcm",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
 		.name		= "adc",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "i2c",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "spi",
-		.id		= 0,
+		.devname	= "s3c64xx-spi.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "spi",
-		.id		= 1,
+		.devname	= "s3c64xx-spi.1",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 22),
 	}, {
 		.name		= "gps",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 25),
 	}, {
 		.name		= "iis",
-		.id		= 0,
+		.devname	= "samsung-i2s.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
 		.name		= "dsim",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 28),
 	}, {
 		.name		= "etm",
-		.id		= -1,
 		.parent		= &clk_pclk.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 29),
 	}, {
 		.name		= "dmc0",
-		.id		= -1,
 		.parent		= &clk_pclk.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 30),
 	}, {
 		.name		= "pclk_fimgvg",
-		.id		= -1,
 		.parent		= &clk_pclk.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 31),
 	}, {
 		.name		= "sclk_spi_48",
-		.id		= 0,
+		.devname	= "s3c64xx-spi.0",
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 22),
 	}, {
 		.name		= "sclk_spi_48",
-		.id		= 1,
+		.devname	= "s3c64xx-spi.1",
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 23),
 	}, {
 		.name		= "mmc_48m",
-		.id		= 0,
+		.devname	= "sdhci-s3c.0",
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 27),
 	}, {
 		.name		= "mmc_48m",
-		.id		= 1,
+		.devname	= "sdhci-s3c.1",
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 28),
 	}, {
 		.name		= "mmc_48m",
-		.id		= 2,
+		.devname	= "sdhci-s3c.2",
 		.parent		= &clk_48m,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 29),
@@ -329,43 +305,40 @@ static struct clk init_clocks_off[] = {
 static struct clk init_clocks[] = {
 	{
 		.name		= "intc",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "mem",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "uart",
-		.id		= 0,
+		.devname	= "s3c6400-uart.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
-		.id		= 1,
+		.devname	= "s3c6400-uart.1",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
-		.id		= 2,
+		.devname	= "s3c6400-uart.2",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "uart",
-		.id		= 3,
+		.devname	= "s3c6400-uart.3",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "gpio",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 18),
@@ -374,12 +347,10 @@ static struct clk init_clocks[] = {
 
 static struct clk clk_iis_cd_v40 = {
 	.name		= "iis_cdclk_v40",
-	.id		= -1,
 };
 
 static struct clk clk_pcm_cd = {
 	.name		= "pcm_cdclk",
-	.id		= -1,
 };
 
 static struct clk *clkset_group1_list[] = {
@@ -420,7 +391,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "sclk_mmc",
-			.id		= 0,
+			.devname	= "sdhci-s3c.0",
 			.ctrlbit	= (1 << 24),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -430,7 +401,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
-			.id		= 1,
+			.devname	= "sdhci-s3c.1",
 			.ctrlbit	= (1 << 25),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -440,7 +411,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
-			.id		= 2,
+			.devname	= "sdhci-s3c.2",
 			.ctrlbit	= (1 << 26),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -450,7 +421,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "uclk1",
-			.id		= -1,
 			.ctrlbit	= (1 << 5),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -460,7 +430,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
-			.id		= 0,
+			.devname	= "s3c64xx-spi.0",
 			.ctrlbit	= (1 << 20),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -470,7 +440,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
-			.id		= 1,
+			.devname	= "s3c64xx-spi.1",
 			.ctrlbit	= (1 << 21),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -480,7 +450,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_post",
-			.id		= -1,
 			.ctrlbit	= (1 << 10),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -490,7 +459,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_dispcon",
-			.id		= -1,
 			.ctrlbit	= (1 << 1),
 			.enable		= s5p64x0_sclk1_ctrl,
 		},
@@ -500,7 +468,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimgvg",
-			.id		= -1,
 			.ctrlbit	= (1 << 2),
 			.enable		= s5p64x0_sclk1_ctrl,
 		},
@@ -510,7 +477,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_audio2",
-			.id		= -1,
 			.ctrlbit	= (1 << 11),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 4eec457..80bfcd9 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -36,7 +36,6 @@
 static struct clksrc_clk clk_mout_dpll = {
 	.clk	= {
 		.name		= "mout_dpll",
-		.id		= -1,
 	},
 	.sources	= &clk_src_dpll,
 	.reg_src	= { .reg = S5P64X0_CLK_SRC0, .shift = 5, .size = 1 },
@@ -96,7 +95,6 @@ static struct clk_ops s5p6450_epll_ops = {
 static struct clksrc_clk clk_dout_epll = {
 	.clk	= {
 		.name		= "dout_epll",
-		.id		= -1,
 		.parent		= &clk_mout_epll.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV1, .shift = 24, .size = 4 },
@@ -105,7 +103,6 @@ static struct clksrc_clk clk_dout_epll = {
 static struct clksrc_clk clk_mout_hclk_sel = {
 	.clk	= {
 		.name		= "mout_hclk_sel",
-		.id		= -1,
 	},
 	.sources	= &clkset_hclk_low,
 	.reg_src	= { .reg = S5P64X0_OTHERS, .shift = 15, .size = 1 },
@@ -124,7 +121,6 @@ static struct clksrc_sources clkset_hclk = {
 static struct clksrc_clk clk_hclk = {
 	.clk	= {
 		.name		= "clk_hclk",
-		.id		= -1,
 	},
 	.sources	= &clkset_hclk,
 	.reg_src	= { .reg = S5P64X0_OTHERS, .shift = 14, .size = 1 },
@@ -134,7 +130,6 @@ static struct clksrc_clk clk_hclk = {
 static struct clksrc_clk clk_pclk = {
 	.clk	= {
 		.name		= "clk_pclk",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 	},
 	.reg_div = { .reg = S5P64X0_CLK_DIV0, .shift = 12, .size = 4 },
@@ -142,7 +137,6 @@ static struct clksrc_clk clk_pclk = {
 static struct clksrc_clk clk_dout_pwm_ratio0 = {
 	.clk	= {
 		.name		= "clk_dout_pwm_ratio0",
-		.id		= -1,
 		.parent		= &clk_mout_hclk_sel.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV3, .shift = 16, .size = 4 },
@@ -151,7 +145,6 @@ static struct clksrc_clk clk_dout_pwm_ratio0 = {
 static struct clksrc_clk clk_pclk_to_wdt_pwm = {
 	.clk	= {
 		.name		= "clk_pclk_to_wdt_pwm",
-		.id		= -1,
 		.parent		= &clk_dout_pwm_ratio0.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV3, .shift = 20, .size = 4 },
@@ -160,7 +153,6 @@ static struct clksrc_clk clk_pclk_to_wdt_pwm = {
 static struct clksrc_clk clk_hclk_low = {
 	.clk	= {
 		.name		= "clk_hclk_low",
-		.id		= -1,
 	},
 	.sources	= &clkset_hclk_low,
 	.reg_src	= { .reg = S5P64X0_OTHERS, .shift = 6, .size = 1 },
@@ -170,7 +162,6 @@ static struct clksrc_clk clk_hclk_low = {
 static struct clksrc_clk clk_pclk_low = {
 	.clk	= {
 		.name		= "clk_pclk_low",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 	},
 	.reg_div	= { .reg = S5P64X0_CLK_DIV3, .shift = 12, .size = 4 },
@@ -184,109 +175,101 @@ static struct clksrc_clk clk_pclk_low = {
 static struct clk init_clocks_off[] = {
 	{
 		.name		= "usbhost",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "pdma",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "hsmmc",
-		.id		= 0,
+		.devname	= "sdhci-s3c.0",
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "hsmmc",
-		.id		= 1,
+		.devname	= "sdhci-s3c.1",
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 18),
 	}, {
 		.name		= "hsmmc",
-		.id		= 2,
+		.devname	= "sdhci-s3c.2",
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
 		.name		= "usbotg",
-		.id		= -1,
 		.parent		= &clk_hclk_low.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 20),
 	}, {
 		.name		= "lcd",
-		.id		= -1,
 		.parent		= &clk_h,
 		.enable		= s5p64x0_hclk1_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "watchdog",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
 		.name		= "rtc",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
 		.name		= "adc",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
 		.name		= "i2c",
-		.id		= 0,
+		.devname	= "s3c2440-i2c.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 17),
 	}, {
 		.name		= "spi",
-		.id		= 0,
+		.devname	= "s3c64xx-spi.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "spi",
-		.id		= 1,
+		.devname	= "s3c64xx-spi.1",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 22),
 	}, {
 		.name		= "iis",
-		.id		= 0,
+		.devname	= "samsung-i2s.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
 		.name		= "iis",
-		.id		= 1,
+		.devname	= "samsung-i2s.1",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
 		.name		= "iis",
-		.id		= 2,
+		.devname	= "samsung-i2s.2",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 16),
 	}, {
 		.name		= "i2c",
-		.id		= 1,
+		.devname	= "s3c2440-i2c.1",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 27),
 	}, {
 		.name		= "dmc0",
-		.id		= -1,
 		.parent		= &clk_pclk.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 30),
@@ -299,49 +282,45 @@ static struct clk init_clocks_off[] = {
 static struct clk init_clocks[] = {
 	{
 		.name		= "intc",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "mem",
-		.id		= -1,
 		.parent		= &clk_hclk.clk,
 		.enable		= s5p64x0_hclk0_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
 		.name		= "uart",
-		.id		= 0,
+		.devname	= "s3c6400-uart.0",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= "uart",
-		.id		= 1,
+		.devname	= "s3c6400-uart.1",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= "uart",
-		.id		= 2,
+		.devname	= "s3c6400-uart.2",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
 		.name		= "uart",
-		.id		= 3,
+		.devname	= "s3c6400-uart.3",
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 4),
 	}, {
 		.name		= "timers",
-		.id		= -1,
 		.parent		= &clk_pclk_to_wdt_pwm.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
 		.name		= "gpio",
-		.id		= -1,
 		.parent		= &clk_pclk_low.clk,
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 18),
@@ -421,7 +400,6 @@ static struct clksrc_sources clkset_sclk_audio0 = {
 static struct clksrc_clk clk_sclk_audio0 = {
 	.clk		= {
 		.name		= "audio-bus",
-		.id		= -1,
 		.enable		= s5p64x0_sclk_ctrl,
 		.ctrlbit	= (1 << 8),
 		.parent		= &clk_dout_epll.clk,
@@ -435,7 +413,7 @@ static struct clksrc_clk clksrcs[] = {
 	{
 		.clk	= {
 			.name		= "sclk_mmc",
-			.id		= 0,
+			.devname	= "sdhci-s3c.0",
 			.ctrlbit	= (1 << 24),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -445,7 +423,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
-			.id		= 1,
+			.devname	= "sdhci-s3c.1",
 			.ctrlbit	= (1 << 25),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -455,7 +433,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_mmc",
-			.id		= 2,
+			.devname	= "sdhci-s3c.2",
 			.ctrlbit	= (1 << 26),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -465,7 +443,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "uclk1",
-			.id		= -1,
 			.ctrlbit	= (1 << 5),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -475,7 +452,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
-			.id		= 0,
+			.devname	= "s3c64xx-spi.0",
 			.ctrlbit	= (1 << 20),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -485,7 +462,7 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_spi",
-			.id		= 1,
+			.devname	= "s3c64xx-spi.1",
 			.ctrlbit	= (1 << 21),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -495,7 +472,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimc",
-			.id		= -1,
 			.ctrlbit	= (1 << 10),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -505,7 +481,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "aclk_mali",
-			.id		= -1,
 			.ctrlbit	= (1 << 2),
 			.enable		= s5p64x0_sclk1_ctrl,
 		},
@@ -515,7 +490,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_2d",
-			.id		= -1,
 			.ctrlbit	= (1 << 12),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -525,7 +499,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_usi",
-			.id		= -1,
 			.ctrlbit	= (1 << 7),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -535,7 +508,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_camif",
-			.id		= -1,
 			.ctrlbit	= (1 << 6),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
@@ -545,7 +517,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_dispcon",
-			.id		= -1,
 			.ctrlbit	= (1 << 1),
 			.enable		= s5p64x0_sclk1_ctrl,
 		},
@@ -555,7 +526,6 @@ static struct clksrc_clk clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_hsmmc44",
-			.id		= -1,
 			.ctrlbit	= (1 << 30),
 			.enable		= s5p64x0_sclk_ctrl,
 		},
diff --git a/arch/arm/mach-s5p64x0/include/mach/clkdev.h b/arch/arm/mach-s5p64x0/include/mach/clkdev.h
new file mode 100644
index 0000000..17bc68e
--- /dev/null
+++ b/arch/arm/mach-s5p64x0/include/mach/clkdev.h
@@ -0,0 +1,7 @@
+#ifndef __MACH_S5P64X0_CLKDEV_H__
+#define __MACH_S5P64X0_CLKDEV_H__
+
+#define __clk_get(clk) ({ 1; })
+#define __clk_put(clk) do { } while (0)
+
+#endif
diff --git a/arch/arm/plat-s5p/s5p-time.c b/arch/arm/plat-s5p/s5p-time.c
index 8090403..d9efd29 100644
--- a/arch/arm/plat-s5p/s5p-time.c
+++ b/arch/arm/plat-s5p/s5p-time.c
@@ -408,6 +408,7 @@ static void __init s5p_timer_resources(void)
 
 	unsigned long event_id = timer_source.event_id;
 	unsigned long source_id = timer_source.source_id;
+	char devname[15];
 
 	timerclk = clk_get(NULL, "timers");
 	if (IS_ERR(timerclk))
@@ -415,6 +416,10 @@ static void __init s5p_timer_resources(void)
 
 	clk_enable(timerclk);
 
+	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
+	s3c_device_timer[event_id].id = event_id;
+	s3c_device_timer[event_id].dev.init_name = devname;
+
 	tin_event = clk_get(&s3c_device_timer[event_id].dev, "pwm-tin");
 	if (IS_ERR(tin_event))
 		panic("failed to get pwm-tin clock for event timer");
@@ -425,6 +430,10 @@ static void __init s5p_timer_resources(void)
 
 	clk_enable(tin_event);
 
+	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
+	s3c_device_timer[source_id].id = source_id;
+	s3c_device_timer[source_id].dev.init_name = devname;
+
 	tin_source = clk_get(&s3c_device_timer[source_id].dev, "pwm-tin");
 	if (IS_ERR(tin_source))
 		panic("failed to get pwm-tin clock for source timer");
-- 
1.6.6.rc2
