From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 05/12] ARM: Exynos5: Add MDMA0 clock instance
Date: Tue, 17 Apr 2012 11:16:28 +0530
Message-ID: <1334641595-25301-6-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25034 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab2DQFi1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:27 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L00M32ZM06YN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:27 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:26 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Add clock instance for MDMA0 controller.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fb95e9b..0230ba8 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -768,9 +768,14 @@ static struct clk exynos5_clk_pdma = {
 	.ctrlbit	= (1 << 1),
 };
 
+static struct clk exynos5_clk_mdma0 = {
+	.name		= "dma",
+	.enable		= exynos5_clk_ip_acp_ctrl,
+	.ctrlbit	= (1 << 1),
+};
+
 static struct clk exynos5_clk_mdma1 = {
 	.name		= "dma",
-	.devname	= "dma-pl330.2",
 	.enable		= exynos5_clk_ip_gen_ctrl,
 	.ctrlbit	= (1 << 4),
 };
@@ -1057,6 +1062,7 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 
 static struct clk *exynos5_clk_cdev[] = {
 	&exynos5_clk_pdma,
+	&exynos5_clk_mdma0,
 	&exynos5_clk_mdma1,
 };
 
@@ -1082,7 +1088,8 @@ static struct clk_lookup exynos5_clk_lookup[] = {
 	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", &exynos5_clk_sclk_mmc3.clk),
 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_pdma),
 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_pdma),
-	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma1),
+	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma0),
+	CLKDEV_INIT("dma-pl330.3", "apb_pclk", &exynos5_clk_mdma1),
 };
 
 static unsigned long exynos5_epll_get_rate(struct clk *clk)
-- 
1.6.6.rc2
