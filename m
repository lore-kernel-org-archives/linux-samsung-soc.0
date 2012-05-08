From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 08/10] ARM: Exynos4: Fix the incorrect hierarchy of spi
 controller bus clock
Date: Wed, 09 May 2012 03:34:52 +0530
Message-ID: <1336514694-22393-9-git-send-email-thomas.abraham@linaro.org>
References: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63309 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756994Ab2EHVwx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 17:52:53 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3Q00KN14RQ0C00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 06:52:52 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3Q009L04RKMU40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 06:52:52 +0900 (KST)
In-reply-to: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

The sclk_spi clock is derived currently from the first level divider
(MMCx_RATIO) which is incorrect. The output of the first level clock
is divided by a second level divider (MMCx_PRE_RATIO), the output of
which is used as the spi bus clock (sclk_spi). Fix the clock hierarchy
issues for the sclk_spi clock.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4.c |   48 ++++++++++++++++++++++++++++-----
 1 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index 57b5464..331186e 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -1243,40 +1243,70 @@ static struct clksrc_clk exynos4_clk_sclk_mmc3 = {
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
@@ -1332,7 +1362,9 @@ static struct clksrc_clk *exynos4_clksrc_cdev[] = {
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
