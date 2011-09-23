From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 6/7] ARM: S5PV210: Add SPI clkdev support
Date: Fri, 23 Sep 2011 17:23:46 +0530
Message-ID: <1316778827-24694-7-git-send-email-padma.v@samsung.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31067 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753507Ab1IWLrh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Sep 2011 07:47:37 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRZ00D644R03AG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:36 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRZ009KD4QTUT@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:36 +0900 (KST)
In-reply-to: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, jassisinghbrar@gmail.com, ben-linux@fluff.org, kgene.kim@samsung.com, s.nawrocki@samsung.com

Registered the SPI bus clocks with clkdev using generic
connection id.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |   58 ++++++++++++++++++++++++++--------------
 1 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index ad553ee..00fe252 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -985,26 +985,6 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLK_DIV1, .shift = 28, .size = 4 },
 	}, {
 		.clk		= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.0",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 16),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC5, .shift = 0, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 0, .size = 4 },
-	}, {
-		.clk		= {
-			.name		= "sclk_spi",
-			.devname	= "s3c64xx-spi.1",
-			.enable		= s5pv210_clk_mask0_ctrl,
-			.ctrlbit	= (1 << 17),
-		},
-		.sources = &clkset_group2,
-		.reg_src = { .reg = S5P_CLK_SRC5, .shift = 4, .size = 4 },
-		.reg_div = { .reg = S5P_CLK_DIV5, .shift = 4, .size = 4 },
-	}, {
-		.clk		= {
 			.name		= "sclk_pwi",
 			.enable		= s5pv210_clk_mask0_ctrl,
 			.ctrlbit	= (1 << 29),
@@ -1024,6 +1004,39 @@ static struct clksrc_clk clksrcs[] = {
 	},
 };
 
+static struct clksrc_clk sclk_spi0 = {
+	.clk		= {
+		.name		= "sclk_spi",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 16),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC5, .shift = 0, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV5, .shift = 0, .size = 4 },
+};
+
+static struct clksrc_clk sclk_spi1 = {
+	.clk		= {
+		.name		= "sclk_spi",
+		.enable		= s5pv210_clk_mask0_ctrl,
+		.ctrlbit	= (1 << 17),
+	},
+	.sources = &clkset_group2,
+	.reg_src = { .reg = S5P_CLK_SRC5, .shift = 4, .size = 4 },
+	.reg_div = { .reg = S5P_CLK_DIV5, .shift = 4, .size = 4 },
+};
+
+static struct clk_lookup clk_lookup_table[] = {
+	CLK(NULL, "spi_busclk0", &clk_p),
+	CLK("s3c64xx-spi.0", "spi_busclk1", &sclk_spi0.clk),
+	CLK("s3c64xx-spi.1", "spi_busclk1", &sclk_spi1.clk),
+};
+
+static struct clksrc_clk *clksrc_cdev[] = {
+	&sclk_spi0,
+	&sclk_spi1,
+};
+
 /* Clock initialisation code */
 static struct clksrc_clk *sysclks[] = {
 	&clk_mout_apll,
@@ -1275,6 +1288,9 @@ void __init s5pv210_register_clocks(void)
 	for (ptr = 0; ptr < ARRAY_SIZE(sclk_tv); ptr++)
 		s3c_register_clksrc(sclk_tv[ptr], 1);
 
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrc_cdev); ptr++)
+		s3c_register_clksrc(clksrc_cdev[ptr], 1);
+
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
 
@@ -1283,4 +1299,6 @@ void __init s5pv210_register_clocks(void)
 
 	s3c24xx_register_clock(&dummy_apb_pclk);
 	s3c_pwmclk_init();
+
+	clkdev_add_table(clk_lookup_table, ARRAY_SIZE(clk_lookup_table));
 }
-- 
1.7.4.4
