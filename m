From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 3/4] ARM: S5P64X0: Add SPI clkdev support
Date: Wed, 02 Nov 2011 17:06:43 -0400
Message-ID: <1320268004-4545-4-git-send-email-padma.v@samsung.com>
References: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18223 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258Ab1KBLMJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 07:12:09 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU1006JJ5S2B0R0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:12:07 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU100GVF5RWN140@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:12:07 +0900 (KST)
In-reply-to: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk

Registered the SPI bus clocks with clkdev using generic
connection id.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |   61 +++++++++++++++-----------------
 arch/arm/mach-s5p64x0/clock-s5p6450.c |   49 +++++++++++++++-----------
 2 files changed, 58 insertions(+), 52 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index bfb1917..73c7cc9 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -268,18 +268,6 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5p64x0_pclk_ctrl,
 		.ctrlbit	= (1 << 31),
 	}, {
-		.name		= "sclk_spi_48",
-		.devname	= "s3c64xx-spi.0",
-		.parent		= &clk_48m,
-		.enable		= s5p64x0_sclk_ctrl,
-		.ctrlbit	= (1 << 22),
-	}, {
-		.name		= "sclk_spi_48",
-		.devname	= "s3c64xx-spi.1",
-		.parent		= &clk_48m,
-		.enable		= s5p64x0_sclk_ctrl,
-		.ctrlbit	= (1 << 23),
-	}, {
 		.name		= "mmc_48m",
 		.devname	= "s3c-sdhci.0",
 		.parent		= &clk_48m,
@@ -421,26 +409,6 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P64X0_CLK_DIV1, .shift = 8, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.0",
-			.ctrlbit	= (1 << 20),
-			.enable		= s5p64x0_sclk_ctrl,
-		},
-		.sources = &clkset_group1,
-		.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 14, .size = 2 },
-		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.1",
-			.ctrlbit	= (1 << 21),
-			.enable		= s5p64x0_sclk_ctrl,
-		},
-		.sources = &clkset_group1,
-		.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 16, .size = 2 },
-		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 4, .size = 4 },
-	}, {
-		.clk	= {
 			.name		= "sclk_post",
 			.ctrlbit	= (1 << 10),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -489,6 +457,30 @@ static struct clksrc_clk clk_sclk_uclk = {
 	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 16, .size = 4 },
 };
 
+static struct clksrc_clk clk_sclk_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "s3c64xx-spi.0",
+		.ctrlbit	= (1 << 20),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 14, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk clk_sclk_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "s3c64xx-spi.1",
+		.ctrlbit	= (1 << 21),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 16, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 4, .size = 4 },
+};
+
 /* Clock initialization code */
 static struct clksrc_clk *sysclks[] = {
 	&clk_mout_apll,
@@ -509,11 +501,16 @@ static struct clk dummy_apb_pclk = {
 
 static struct clksrc_clk *clksrc_cdev[] = {
 	&clk_sclk_uclk,
+	&clk_sclk_spi0,
+	&clk_sclk_spi1,
 };
 
 static struct clk_lookup s5p6440_clk_lookup[] = {
 	CLKDEV_INIT(NULL, "clk_uart_baud2", &clk_pclk_low.clk),
 	CLKDEV_INIT(NULL, "clk_uart_baud3", &clk_sclk_uclk.clk),
+	CLKDEV_INIT(NULL, "spi_busclk0", &clk_p),
+	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk1", &clk_sclk_spi0.clk),
+	CLKDEV_INIT("s3c64xx-spi.1", "spi_busclk1", &clk_sclk_spi1.clk),
 };
 
 void __init_or_cpufreq s5p6440_setup_clocks(void)
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index d132638..50f90cb 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -443,26 +443,6 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P64X0_CLK_DIV1, .shift = 8, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.0",
-			.ctrlbit	= (1 << 20),
-			.enable		= s5p64x0_sclk_ctrl,
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 14, .size = 2 },
-		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.1",
-			.ctrlbit	= (1 << 21),
-			.enable		= s5p64x0_sclk_ctrl,
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 16, .size = 2 },
-		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 4, .size = 4 },
-	}, {
-		.clk	= {
 			.name		= "sclk_fimc",
 			.ctrlbit	= (1 << 10),
 			.enable		= s5p64x0_sclk_ctrl,
@@ -538,13 +518,42 @@ static struct clksrc_clk clk_sclk_uclk = {
 	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 16, .size = 4 },
 };
 
+static struct clksrc_clk clk_sclk_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "s3c64xx-spi.0",
+		.ctrlbit	= (1 << 20),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 14, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk clk_sclk_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "s3c64xx-spi.1",
+		.ctrlbit	= (1 << 21),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 16, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 4, .size = 4 },
+};
+
 static struct clksrc_clk *clksrc_cdev[] = {
 	&clk_sclk_uclk,
+	&clk_sclk_spi0,
+	&clk_sclk_spi1,
 };
 
 static struct clk_lookup s5p6450_clk_lookup[] = {
 	CLKDEV_INIT(NULL, "clk_uart_baud2", &clk_pclk_low.clk),
 	CLKDEV_INIT(NULL, "clk_uart_baud3", &clk_sclk_uclk.clk),
+	CLKDEV_INIT(NULL, "spi_busclk0", &clk_p),
+	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk1", &clk_sclk_spi0.clk),
+	CLKDEV_INIT("s3c64xx-spi.1", "spi_busclk1", &clk_sclk_spi1.clk),
 };
 
 /* Clock initialization code */
-- 
1.7.0.4
