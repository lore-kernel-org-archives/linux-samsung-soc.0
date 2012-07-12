From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 1/3] ARM: Samsung: Add support for MSHC controller clocks
Date: Thu, 12 Jul 2012 18:28:45 +0530
Message-ID: <1342097927-25334-2-git-send-email-thomas.abraham@linaro.org>
References: <1342097927-25334-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36067 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752320Ab2GLMo7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 08:44:59 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100FGTSQV6JO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 21:44:58 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7100BY3SQSXZ10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 21:44:58 +0900 (KST)
In-reply-to: <1342097927-25334-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Add clock instances for bus interface unit clock and card interface unit
clock of the all four MSHC controller instances.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |   45 ++++++++++++----------------------
 1 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..02038d8 100644
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
@@ -992,8 +987,8 @@ static struct clksrc_clk exynos5_clk_sclk_uart3 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.0",
+		.name		= "ciu",
+		.devname	= "dw_mmc.0",
 		.parent		= &exynos5_clk_dout_mmc0.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 0),
@@ -1003,8 +998,8 @@ static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc1 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.1",
+		.name		= "ciu",
+		.devname	= "dw_mmc.1",
 		.parent		= &exynos5_clk_dout_mmc1.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 4),
@@ -1014,8 +1009,8 @@ static struct clksrc_clk exynos5_clk_sclk_mmc1 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc2 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.2",
+		.name		= "ciu",
+		.devname	= "dw_mmc.2",
 		.parent		= &exynos5_clk_dout_mmc2.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 8),
@@ -1025,8 +1020,8 @@ static struct clksrc_clk exynos5_clk_sclk_mmc2 = {
 
 static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
 	.clk	= {
-		.name		= "sclk_mmc",
-		.devname	= "exynos4-sdhci.3",
+		.name		= "ciu",
+		.devname	= "dw_mmc.3",
 		.parent		= &exynos5_clk_dout_mmc3.clk,
 		.enable		= exynos5_clksrc_mask_fsys_ctrl,
 		.ctrlbit	= (1 << 12),
@@ -1037,14 +1032,6 @@ static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
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
