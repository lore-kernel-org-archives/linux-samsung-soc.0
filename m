From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v4 1/2] ARM: EXYNOS: Add clock support for G-Scaler
Date: Mon, 13 Aug 2012 15:32:23 +0530
Message-ID: <1344852144-25598-2-git-send-email-shaik.ameer@samsung.com>
References: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34256 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab2HMJUh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Aug 2012 05:20:37 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8O004EBSLWS7M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Aug 2012 18:20:36 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8O00L6USLWO650@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Aug 2012 18:20:36 +0900 (KST)
In-reply-to: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, shaik.ameer@samsung.com

Add required clock support for G-Scaler for exynos5

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |   86 ++++++++++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 3b00e29..eb3f4fc 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -547,6 +547,68 @@ static struct clksrc_clk exynos5_clk_aclk_66 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 0, .size = 3 },
 };
 
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid = {
+	.clk	= {
+		.name		= "mout_aclk_300_gscl_mid",
+	},
+	.sources = &exynos5_clkset_aclk,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 24, .size = 1 },
+};
+
+static struct clk *exynos5_clkset_aclk_300_mid1_list[] = {
+	[0] = &exynos5_clk_sclk_vpll.clk,
+	[1] = &exynos5_clk_mout_cpll.clk,
+};
+
+static struct clksrc_sources exynos5_clkset_aclk_300_gscl_mid1 = {
+	.sources	= exynos5_clkset_aclk_300_mid1_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_300_mid1_list),
+};
+
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid1 = {
+	.clk	= {
+		.name		= "mout_aclk_300_gscl_mid1",
+	},
+	.sources = &exynos5_clkset_aclk_300_gscl_mid1,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP1, .shift = 12, .size = 1 },
+};
+
+static struct clk *exynos5_clkset_aclk_300_gscl_list[] = {
+	[0] = &exynos5_clk_mout_aclk_300_gscl_mid.clk,
+	[1] = &exynos5_clk_mout_aclk_300_gscl_mid1.clk,
+};
+
+static struct clksrc_sources exynos5_clkset_aclk_300_gscl = {
+	.sources	= exynos5_clkset_aclk_300_gscl_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_list),
+};
+
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl = {
+	.clk	= {
+		.name		= "mout_aclk_300_gscl",
+	},
+	.sources = &exynos5_clkset_aclk_300_gscl,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
+};
+
+static struct clk *exynos5_clk_src_gscl_300_list[] = {
+	[0] = &clk_ext_xtal_mux,
+	[1] = &exynos5_clk_mout_aclk_300_gscl.clk,
+};
+
+static struct clksrc_sources exynos5_clk_src_gscl_300 = {
+	.sources	= exynos5_clk_src_gscl_300_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clk_src_gscl_300_list),
+};
+
+static struct clksrc_clk exynos5_clk_aclk_300_gscl = {
+	.clk	= {
+		.name		= "aclk_300_gscl",
+	},
+	.sources = &exynos5_clk_src_gscl_300,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP3, .shift = 10, .size = 1 },
+};
+
 static struct clk exynos5_init_clocks_off[] = {
 	{
 		.name		= "timers",
@@ -755,6 +817,26 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_peric_ctrl,
 		.ctrlbit	= (1 << 18),
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
@@ -1216,6 +1298,10 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_aclk_266,
 	&exynos5_clk_aclk_200,
 	&exynos5_clk_aclk_166,
+	&exynos5_clk_aclk_300_gscl,
+	&exynos5_clk_mout_aclk_300_gscl,
+	&exynos5_clk_mout_aclk_300_gscl_mid,
+	&exynos5_clk_mout_aclk_300_gscl_mid1,
 	&exynos5_clk_aclk_66_pre,
 	&exynos5_clk_aclk_66,
 	&exynos5_clk_dout_mmc0,
-- 
1.7.0.4
