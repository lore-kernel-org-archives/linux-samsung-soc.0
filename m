From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v2 1/2] ARM: EXYNOS: Add clock support for Gscaler
Date: Wed, 11 Jul 2012 19:36:49 +0530
Message-ID: <1342015610-19261-2-git-send-email-shaik.ameer@samsung.com>
References: <1342015610-19261-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50278 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932494Ab2GKNw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 09:52:59 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M70007D91870TT0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 22:52:58 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7000J0E17Q6330@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 22:52:58 +0900 (KST)
In-reply-to: <1342015610-19261-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, ameersk@gmail.com

Add required clock support for Gscaler for exynos5

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |   79 ++++++++++++++++++++++++++++++++++
 1 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..c8293a3 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -741,6 +741,26 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_peric_ctrl,
 		.ctrlbit	= (1 << 14),
 	}, {
+		.name		= "gscl",
+		.devname	= "exynos-gsc.0",
+		.enable		= exynos5_clk_ip_gscl_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
+		.name		= "gscl",
+		.devname	= "exynos-gsc.1",
+		.enable		= exynos5_clk_ip_gscl_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "gscl",
+		.devname	= "exynos-gsc.2",
+		.enable		= exynos5_clk_ip_gscl_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "gscl",
+		.devname	= "exynos-gsc.3",
+		.enable		= exynos5_clk_ip_gscl_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
 		.name		= SYSMMU_CLOCK_NAME,
 		.devname	= SYSMMU_CLOCK_DEVNAME(mfc_l, 0),
 		.enable		= &exynos5_clk_ip_mfc_ctrl,
@@ -1116,6 +1136,61 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 	},
 };
 
+/* For ACLK_300_gscl_mid */
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid = {
+	.clk    = {
+		.name   = "mout_aclk_300_gscl_mid",
+	},
+	.sources = &exynos5_clkset_aclk,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 24, .size = 1 },
+};
+
+/* For ACLK_300_gscl */
+struct clk *exynos5_clkset_aclk_300_gscl_list[] = {
+	[0] = &exynos5_clk_mout_aclk_300_gscl_mid.clk,
+	[1] = &exynos5_clk_sclk_vpll.clk,
+};
+
+struct clksrc_sources exynos5_clkset_aclk_300_gscl = {
+	.sources        = exynos5_clkset_aclk_300_gscl_list,
+	.nr_sources     = ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_list),
+};
+
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl = {
+	.clk    = {
+		.name           = "mout_aclk_300_gscl",
+	},
+	.sources = &exynos5_clkset_aclk_300_gscl,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
+};
+
+static struct clksrc_clk exynos5_clk_dout_aclk_300_gscl = {
+	.clk    = {
+		.name           = "dout_aclk_300_gscl",
+		.parent         = &exynos5_clk_mout_aclk_300_gscl.clk,
+	},
+	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
+};
+
+/* Possible clock sources for aclk_300_gscl_sub Mux */
+static struct clk *clk_src_gscl_300_list[] = {
+	[0] = &clk_ext_xtal_mux,
+	[1] = &exynos5_clk_dout_aclk_300_gscl.clk,
+};
+
+static struct clksrc_sources clk_src_gscl_300 = {
+	.sources        = clk_src_gscl_300_list,
+	.nr_sources     = ARRAY_SIZE(clk_src_gscl_300_list),
+};
+
+static struct clksrc_clk exynos5_clk_aclk_300_gscl = {
+	.clk    = {
+		.name           = "aclk_300_gscl",
+	},
+	.sources = &clk_src_gscl_300,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP3, .shift = 10, .size = 1 },
+};
+
 /* Clock initialization code */
 static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_mout_apll,
@@ -1139,6 +1214,10 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_aclk_266,
 	&exynos5_clk_aclk_200,
 	&exynos5_clk_aclk_166,
+	&exynos5_clk_aclk_300_gscl,
+	&exynos5_clk_dout_aclk_300_gscl,
+	&exynos5_clk_mout_aclk_300_gscl,
+	&exynos5_clk_mout_aclk_300_gscl_mid,
 	&exynos5_clk_aclk_66_pre,
 	&exynos5_clk_aclk_66,
 	&exynos5_clk_dout_mmc0,
-- 
1.7.0.4
