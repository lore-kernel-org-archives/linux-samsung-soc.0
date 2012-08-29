From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 1/3] ARM: Samsung: Add support for MSHC controller clocks
Date: Wed, 29 Aug 2012 16:31:10 +0530
Message-ID: <1346238072-7324-2-git-send-email-thomas.abraham@linaro.org>
References: <1346238072-7324-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43919 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794Ab2H2Knd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 06:43:33 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9I0014IJ4K2O30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 19:43:32 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9I00K0KJ3AVK60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 19:43:31 +0900 (KST)
In-reply-to: <1346238072-7324-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org

Add clock instances for bus interface unit clock and card interface unit
clock of the all four MSHC controller instances.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |   45 ++++++++++++----------------------
 1 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 3b00e29..16d8bef 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -564,35 +564,30 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_peris_ctrl,
 		.ctrlbit	= (1 << 19),
 	}, {
-		.name		= "hsmmc",
-		.devname	= "exynos4-sdhci.0",
+		.name		= "biu",
+		.devname	= "dw_mmc.0",
 		.parent		= &exynos5_clk_aclk_200.clk,
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 12),
 	}, {
-		.name		= "hsmmc",
-		.devname	= "exynos4-sdhci.1",
+		.name		= "biu",
+		.devname	= "dw_mmc.1",
 		.parent		= &exynos5_clk_aclk_200.clk,
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 13),
 	}, {
-		.name		= "hsmmc",
-		.devname	= "exynos4-sdhci.2",
+		.name		= "biu",
+		.devname	= "dw_mmc.2",
 		.parent		= &exynos5_clk_aclk_200.clk,
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 14),
 	}, {
-		.name		= "hsmmc",
-		.devname	= "exynos4-sdhci.3",
+		.name		= "biu",
+		.devname	= "dw_mmc.3",
 		.parent		= &exynos5_clk_aclk_200.clk,
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 15),
 	}, {
-		.name		= "dwmci",
-		.parent		= &exynos5_clk_aclk_200.clk,
-		.enable		= exynos5_clk_ip_fsys_ctrl,
-		.ctrlbit	= (1 << 16),
-	}, {
 		.name		= "sata",
 		.devname	= "ahci",
 		.enable		= exynos5_clk_ip_fsys_ctrl,
@@ -1006,8 +1001,8 @@ static struct clksrc_clk exynos5_clk_sclk_uart3 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.0",
+		.name		= "ciu",
+		.devname	= "dw_mmc.0",
 		.parent		= &exynos5_clk_dout_mmc0.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 0),
@@ -1017,8 +1012,8 @@ static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc1 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.1",
+		.name		= "ciu",
+		.devname	= "dw_mmc.1",
 		.parent		= &exynos5_clk_dout_mmc1.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 4),
@@ -1028,8 +1023,8 @@ static struct clksrc_clk exynos5_clk_sclk_mmc1 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc2 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.2",
+		.name		= "ciu",
+		.devname	= "dw_mmc.2",
 		.parent		= &exynos5_clk_dout_mmc2.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 8),
@@ -1039,8 +1034,8 @@ static struct clksrc_clk exynos5_clk_sclk_mmc2 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.3",
+		.name		= "ciu",
+		.devname	= "dw_mmc.3",
 		.parent		= &exynos5_clk_dout_mmc3.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 12),
@@ -1114,14 +1109,6 @@ static struct clksrc_clk exynos5_clk_sclk_spi2 = {
 static struct clksrc_clk exynos5_clksrcs[] = {
 	{
 		.clk	= {
-			.name		= "sclk_dwmci",
-			.parent		= &exynos5_clk_dout_mmc4.clk,
-			.enable		= exynos5_clksrc_mask_fsys_ctrl,
-			.ctrlbit	= (1 << 16),
-		},
-		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS3, .shift = 8, .size = 8 },
-	}, {
-		.clk	= {
 			.name		= "sclk_fimd",
 			.devname	= "s3cfb.1",
 			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
-- 
1.6.6.rc2
