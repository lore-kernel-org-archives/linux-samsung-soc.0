From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V5] ARM: EXYNOS5: Add bus clock for FIMD
Date: Tue, 18 Sep 2012 19:54:48 +0530
Message-ID: <1347978288-27759-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47750 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277Ab2IRI1K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 04:27:10 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAJ00E7HE4E2K30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 17:27:08 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAJ005WIE4A62G0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 17:27:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com

This patch adds the bus clock for FIMD and changes the device name for lcd clock

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |   32 ++++++++++++++++++++++----------
 1 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 774533c..404c53d 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {
 	.ctrlbit	= (1 << 4),
 };
 
+static struct clk exynos5_clk_fimd1 = {
+	.name		= "fimd",
+	.devname	= "exynos5-fb.1",
+	.enable		= exynos5_clk_ip_disp1_ctrl,
+	.ctrlbit	= (1 << 0),
+};
+
 struct clk *exynos5_clkset_group_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = NULL,
@@ -1120,6 +1127,18 @@ static struct clksrc_clk exynos5_clk_sclk_spi2 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 8, .size = 8 },
 };
 
+struct clksrc_clk exynos5_clk_sclk_fimd1 = {
+	.clk	= {
+		.name		= "sclk_fimd",
+		.devname	= "exynos5-fb.1",
+		.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
+		.ctrlbit	= (1 << 0),
+	},
+	.sources = &exynos5_clkset_group,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
+	.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
+};
+
 static struct clksrc_clk exynos5_clksrcs[] = {
 	{
 		.clk	= {
@@ -1131,16 +1150,6 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS3, .shift = 8, .size = 8 },
 	}, {
 		.clk	= {
-			.name		= "sclk_fimd",
-			.devname	= "s3cfb.1",
-			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
-			.ctrlbit	= (1 << 0),
-		},
-		.sources = &exynos5_clkset_group,
-		.reg_src = { .reg = EXYNOS5_CLKSRC_DISP1_0, .shift = 0, .size = 4 },
-		.reg_div = { .reg = EXYNOS5_CLKDIV_DISP1_0, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
 			.name		= "aclk_266_gscl",
 		},
 		.sources = &clk_src_gscl_266,
@@ -1240,12 +1249,14 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_mdout_spi0,
 	&exynos5_clk_mdout_spi1,
 	&exynos5_clk_mdout_spi2,
+	&exynos5_clk_sclk_fimd1,
 };
 
 static struct clk *exynos5_clk_cdev[] = {
 	&exynos5_clk_pdma0,
 	&exynos5_clk_pdma1,
 	&exynos5_clk_mdma1,
+	&exynos5_clk_fimd1,
 };
 
 static struct clksrc_clk *exynos5_clksrc_cdev[] = {
@@ -1274,6 +1285,7 @@ static struct clk_lookup exynos5_clk_lookup[] = {
 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_pdma0),
 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_pdma1),
 	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma1),
+	CLKDEV_INIT("exynos5-fb.1", "lcd", &exynos5_clk_fimd1),
 };
 
 static unsigned long exynos5_epll_get_rate(struct clk *clk)
-- 
1.7.0.4
