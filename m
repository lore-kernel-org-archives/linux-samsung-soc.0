From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 1/6] ARM: Exynos4: Fix the incorrect hierarchy of spi
 controller bus clock
Date: Fri, 18 May 2012 15:16:27 +0530
Message-ID: <1337334392-6441-2-git-send-email-thomas.abraham@linaro.org>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48391 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967899Ab2ERJcq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 May 2012 05:32:46 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4700DRDP41MDS0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 18:32:45 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4700FF3P67SH60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 18:32:45 +0900 (KST)
In-reply-to: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

The sclk_spi clock is derived currently from the first level divider
(MMCx_RATIO) which is incorrect. The output of the first level clock
is divided by a second level divider (MMCx_PRE_RATIO), the output of
which is used as the spi bus clock (sclk_spi). Fix the clock hierarchy
issues for the sclk_spi clock.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4.c |   48 ++++++++++++++++++++++++++++-----
 1 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index 10a46a9..b5f0507 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -1242,40 +1242,70 @@ static struct clksrc_clk exynos4_clk_sclk_mmc3 = {
 	.reg_div = { .reg = EXYNOS4_CLKDIV_FSYS2, .shift = 24, .size = 8 },
 };
 
+static struct clksrc_clk exynos4_clk_mdout_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi_mdout",
+		.devname	= "exynos4210-spi.0",
+	},
+	.sources = &exynos4_clkset_group,
+	.reg_src = { .reg = EXYNOS4_CLKSRC_PERIL1, .shift = 16, .size = 4 },
+	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL1, .shift = 0, .size = 4 },
+
+};
+
 static struct clksrc_clk exynos4_clk_sclk_spi0 = {
 	.clk	= {
 		.name		= "sclk_spi",
 		.devname	= "exynos4210-spi.0",
+		.parent		= &exynos4_clk_mdout_spi0.clk,
 		.enable		= exynos4_clksrc_mask_peril1_ctrl,
 		.ctrlbit	= (1 << 16),
 	},
+	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL1, .shift = 8, .size = 8 },
+};
+
+static struct clksrc_clk exynos4_clk_mdout_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi_mdout",
+		.devname	= "exynos4210-spi.1",
+	},
 	.sources = &exynos4_clkset_group,
-	.reg_src = { .reg = EXYNOS4_CLKSRC_PERIL1, .shift = 16, .size = 4 },
-	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL1, .shift = 0, .size = 4 },
+	.reg_src = { .reg = EXYNOS4_CLKSRC_PERIL1, .shift = 20, .size = 4 },
+	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL1, .shift = 16, .size = 4 },
+
 };
 
 static struct clksrc_clk exynos4_clk_sclk_spi1 = {
 	.clk	= {
 		.name		= "sclk_spi",
 		.devname	= "exynos4210-spi.1",
+		.parent		= &exynos4_clk_mdout_spi1.clk,
 		.enable		= exynos4_clksrc_mask_peril1_ctrl,
 		.ctrlbit	= (1 << 20),
 	},
+	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL1, .shift = 24, .size = 8 },
+};
+
+static struct clksrc_clk exynos4_clk_mdout_spi2 = {
+	.clk	= {
+		.name		= "sclk_spi_mdout",
+		.devname	= "exynos4210-spi.2",
+	},
 	.sources = &exynos4_clkset_group,
-	.reg_src = { .reg = EXYNOS4_CLKSRC_PERIL1, .shift = 20, .size = 4 },
-	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL1, .shift = 16, .size = 4 },
+	.reg_src = { .reg = EXYNOS4_CLKSRC_PERIL1, .shift = 24, .size = 4 },
+	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL2, .shift = 0, .size = 4 },
+
 };
 
 static struct clksrc_clk exynos4_clk_sclk_spi2 = {
 	.clk	= {
 		.name		= "sclk_spi",
 		.devname	= "exynos4210-spi.2",
+		.parent		= &exynos4_clk_mdout_spi2.clk,
 		.enable		= exynos4_clksrc_mask_peril1_ctrl,
 		.ctrlbit	= (1 << 24),
 	},
-	.sources = &exynos4_clkset_group,
-	.reg_src = { .reg = EXYNOS4_CLKSRC_PERIL1, .shift = 24, .size = 4 },
-	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL2, .shift = 0, .size = 4 },
+	.reg_div = { .reg = EXYNOS4_CLKDIV_PERIL2, .shift = 8, .size = 8 },
 };
 
 /* Clock initialization code */
@@ -1331,7 +1361,9 @@ static struct clksrc_clk *exynos4_clksrc_cdev[] = {
 	&exynos4_clk_sclk_spi0,
 	&exynos4_clk_sclk_spi1,
 	&exynos4_clk_sclk_spi2,
-
+	&exynos4_clk_mdout_spi0,
+	&exynos4_clk_mdout_spi1,
+	&exynos4_clk_mdout_spi2,
 };
 
 static struct clk_lookup exynos4_clk_lookup[] = {
-- 
1.6.6.rc2
