From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 3/4] ARM: S5P64X0: Add SPI clkdev support
Date: Mon, 10 Oct 2011 13:33:08 +0530
Message-ID: <1318233789-19882-4-git-send-email-padma.v@samsung.com>
References: <1318233789-19882-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15870 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455Ab1JJH60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 03:58:26 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU009OUBH8AA00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 16:58:25 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSU00CW6BH3TN20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 16:58:25 +0900 (KST)
In-reply-to: <1318233789-19882-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com

Registered the SPI bus clocks with clkdev using generic
connection id.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |   57 +++++++++++++++++++++-----------
 arch/arm/mach-s5p64x0/clock-s5p6450.c |   57 +++++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 40 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index c54c65d..9e4f517 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -430,26 +430,6 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 16, .size = 4 },
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
@@ -487,6 +467,39 @@ static struct clksrc_clk clksrcs[] = {
 	},
 };
 
+static struct clksrc_clk sclk_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.ctrlbit	= (1 << 20),
+		.enable		= s5p64x0_sclk_ctrl,
+		},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 14, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk sclk_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.ctrlbit	= (1 << 21),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group1,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 16, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 4, .size = 4 },
+};
+
+static struct clk_lookup clk_lookup_table[] = {
+	CLKDEV_INIT(NULL, "spi_busclk0", &clk_p),
+	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk1", &sclk_spi0.clk),
+	CLKDEV_INIT("s3c64xx-spi.1", "spi_busclk1", &sclk_spi1.clk),
+};
+
+static struct clksrc_clk *clksrc_cdev[] = {
+	&sclk_spi0,
+	&sclk_spi1,
+};
+
 /* Clock initialization code */
 static struct clksrc_clk *sysclks[] = {
 	&clk_mout_apll,
@@ -581,6 +594,9 @@ void __init s5p6440_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrc_cdev); ptr++)
+		s3c_register_clksrc(clksrc_cdev[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
@@ -590,4 +606,5 @@ void __init s5p6440_register_clocks(void)
 	s3c24xx_register_clock(&dummy_apb_pclk);
 
 	s3c_pwmclk_init();
+	clkdev_add_table(clk_lookup_table, ARRAY_SIZE(clk_lookup_table));
 }
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 2d04abf..323c30c 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -452,26 +452,6 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 16, .size = 4 },
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
@@ -536,6 +516,39 @@ static struct clksrc_clk clksrcs[] = {
 	},
 };
 
+static struct clksrc_clk sclk_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.ctrlbit	= (1 << 20),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 14, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk sclk_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.ctrlbit	= (1 << 21),
+		.enable		= s5p64x0_sclk_ctrl,
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P64X0_CLK_SRC0, .shift = 16, .size = 2 },
+	.reg_div = { .reg = S5P64X0_CLK_DIV2, .shift = 4, .size = 4 },
+};
+
+static struct clk_lookup clk_lookup_table[] = {
+	CLKDEV_INIT(NULL, "spi_busclk0", &clk_p),
+	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk1", &sclk_spi0.clk),
+	CLKDEV_INIT("s3c64xx-spi.1", "spi_busclk1", &sclk_spi1.clk),
+};
+
+static struct clksrc_clk *clksrc_cdev[] = {
+	&sclk_spi0,
+	&sclk_spi1,
+};
+
 /* Clock initialization code */
 static struct clksrc_clk *sysclks[] = {
 	&clk_mout_apll,
@@ -632,6 +645,9 @@ void __init s5p6450_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sysclks); ptr++)
 		s3c_register_clksrc(sysclks[ptr], 1);
 
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrc_cdev); ptr++)
+		s3c_register_clksrc(clksrc_cdev[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
@@ -641,4 +657,5 @@ void __init s5p6450_register_clocks(void)
 	s3c24xx_register_clock(&dummy_apb_pclk);
 
 	s3c_pwmclk_init();
+	clkdev_add_table(clk_lookup_table, ARRAY_SIZE(clk_lookup_table));
 }
-- 
1.7.4.4
