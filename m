From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 2/6] ARM: Exynos5: Add spi clock support
Date: Sun, 03 Jun 2012 18:12:45 +0530
Message-ID: <1338727369-18241-3-git-send-email-thomas.abraham@linaro.org>
References: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30650 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab2FCM1v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:27:51 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M51008O7JYB3OB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:50 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5100119JY60A40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:50 +0900 (KST)
In-reply-to: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Add support for clock instances for each spi controller.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |   98 ++++++++++++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..7369b51 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -131,6 +131,11 @@ static int exynos5_clksrc_mask_peric0_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(EXYNOS5_CLKSRC_MASK_PERIC0, clk, enable);
 }
 
+static int exynos5_clksrc_mask_peric1_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(EXYNOS5_CLKSRC_MASK_PERIC1, clk, enable);
+}
+
 static int exynos5_clk_ip_acp_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(EXYNOS5_CLKGATE_IP_ACP, clk, enable);
@@ -741,6 +746,24 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_peric_ctrl,
 		.ctrlbit	= (1 << 14),
 	}, {
+		.name		= "spi",
+		.devname	= "exynos4210-spi.0",
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
+		.name		= "spi",
+		.devname	= "exynos4210-spi.1",
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.ctrlbit	= (1 << 17),
+	}, {
+		.name		= "spi",
+		.devname	= "exynos4210-spi.2",
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.ctrlbit	= (1 << 18),
+	}, {
 		.name		= SYSMMU_CLOCK_NAME,
 		.devname	= SYSMMU_CLOCK_DEVNAME(mfc_l, 0),
 		.enable		= &exynos5_clk_ip_mfc_ctrl,
@@ -1034,6 +1057,72 @@ static struct clksrc_clk exynos5_clk_sclk_mmc3 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS2, .shift = 24, .size = 8 },
 };
 
+static struct clksrc_clk exynos5_clk_mdout_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi_mdout",
+		.devname	= "exynos4210-spi.0",
+	},
+	.sources = &exynos5_clkset_group,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_PERIC1, .shift = 16, .size = 4 },
+	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC1, .shift = 0, .size = 4 },
+
+};
+
+static struct clksrc_clk exynos5_clk_sclk_spi0 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "exynos4210-spi.0",
+		.parent		= &exynos5_clk_mdout_spi0.clk,
+		.enable		= exynos5_clksrc_mask_peric1_ctrl,
+		.ctrlbit	= (1 << 16),
+	},
+	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC1, .shift = 8, .size = 8 },
+};
+
+static struct clksrc_clk exynos5_clk_mdout_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi_mdout",
+		.devname	= "exynos4210-spi.1",
+	},
+	.sources = &exynos5_clkset_group,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_PERIC1, .shift = 20, .size = 4 },
+	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC1, .shift = 16, .size = 4 },
+
+};
+
+static struct clksrc_clk exynos5_clk_sclk_spi1 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "exynos4210-spi.1",
+		.parent		= &exynos5_clk_mdout_spi1.clk,
+		.enable		= exynos5_clksrc_mask_peric1_ctrl,
+		.ctrlbit	= (1 << 20),
+	},
+	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC1, .shift = 24, .size = 8 },
+};
+
+static struct clksrc_clk exynos5_clk_mdout_spi2 = {
+	.clk	= {
+		.name		= "sclk_spi_mdout",
+		.devname	= "exynos4210-spi.2",
+	},
+	.sources = &exynos5_clkset_group,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_PERIC1, .shift = 24, .size = 4 },
+	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 0, .size = 4 },
+
+};
+
+static struct clksrc_clk exynos5_clk_sclk_spi2 = {
+	.clk	= {
+		.name		= "sclk_spi",
+		.devname	= "exynos4210-spi.2",
+		.parent		= &exynos5_clk_mdout_spi2.clk,
+		.enable		= exynos5_clksrc_mask_peric1_ctrl,
+		.ctrlbit	= (1 << 24),
+	},
+	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 8, .size = 8 },
+};
+
 static struct clksrc_clk exynos5_clksrcs[] = {
 	{
 		.clk	= {
@@ -1148,6 +1237,12 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_dout_mmc4,
 	&exynos5_clk_aclk_acp,
 	&exynos5_clk_pclk_acp,
+	&exynos5_clk_sclk_spi0,
+	&exynos5_clk_sclk_spi1,
+	&exynos5_clk_sclk_spi2,
+	&exynos5_clk_mdout_spi0,
+	&exynos5_clk_mdout_spi1,
+	&exynos5_clk_mdout_spi2,
 };
 
 static struct clk *exynos5_clk_cdev[] = {
@@ -1176,6 +1271,9 @@ static struct clk_lookup exynos5_clk_lookup[] = {
 	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2", &exynos5_clk_sclk_mmc1.clk),
 	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2", &exynos5_clk_sclk_mmc2.clk),
 	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", &exynos5_clk_sclk_mmc3.clk),
+	CLKDEV_INIT("exynos4210-spi.0", "spi_busclk0", &exynos5_clk_sclk_spi0.clk),
+	CLKDEV_INIT("exynos4210-spi.1", "spi_busclk0", &exynos5_clk_sclk_spi1.clk),
+	CLKDEV_INIT("exynos4210-spi.2", "spi_busclk0", &exynos5_clk_sclk_spi2.clk),
 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos5_clk_pdma0),
 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos5_clk_pdma1),
 	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos5_clk_mdma1),
-- 
1.6.6.rc2
