From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v3 1/2] ARM: EXYNOS: Add clock support for Gscaler
Date: Fri, 20 Jul 2012 18:38:42 +0530
Message-ID: <1342789723-3949-2-git-send-email-shaik.ameer@samsung.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37360 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753451Ab2GTMyE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jul 2012 08:54:04 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7G0046HMHWWVA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 21:54:03 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7G00EA1MHSQ5A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 21:54:03 +0900 (KST)
In-reply-to: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com, shaik.ameer@samsung.com

Add required clock support for Gscaler for exynos5

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |  100 ++++++++++++++++++++++++++++++++++
 1 files changed, 100 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 774533c..49a76b1 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -552,6 +552,81 @@ static struct clksrc_clk exynos5_clk_aclk_66 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 0, .size = 3 },
 };
 
+/* for aclk_300_gscl_mid */
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid = {
+	.clk = {
+		.name		= "mout_aclk_300_gscl_mid",
+	},
+	.sources = &exynos5_clkset_aclk,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 24, .size = 1 },
+};
+
+/* for aclk_300_gscl_mid1 */
+static struct clk *exynos5_clkset_aclk_300_gscl_mid1_list[] = {
+	[0] = &exynos5_clk_sclk_vpll.clk,
+	[1] = &exynos5_clk_mout_cpll.clk,
+};
+
+static struct clksrc_sources exynos5_clkset_aclk_300_gscl_mid1 = {
+	.sources	= exynos5_clkset_aclk_300_gscl_mid1_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_mid1_list),
+};
+
+
+static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid1 = {
+	.clk    = {
+		.name		= "mout_aclk_300_gscl_mid1",
+	},
+	.sources = &exynos5_clkset_aclk_300_gscl_mid1,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP1, .shift = 12, .size = 1 },
+};
+
+/* for aclk_300_gscl */
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
+	.clk    = {
+		.name		= "mout_aclk_300_gscl",
+	},
+	.sources = &exynos5_clkset_aclk_300_gscl,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
+};
+
+static struct clksrc_clk exynos5_clk_dout_aclk_300_gscl = {
+	.clk    = {
+		.name		= "dout_aclk_300_gscl",
+		.parent		= &exynos5_clk_mout_aclk_300_gscl.clk,
+	},
+	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
+};
+
+/* for aclk_300_gscl_sub mux */
+static struct clk *exynos5_clk_src_gscl_300_list[] = {
+	[0] = &clk_ext_xtal_mux,
+	[1] = &exynos5_clk_dout_aclk_300_gscl.clk,
+};
+
+static struct clksrc_sources exynos5_clk_src_gscl_300 = {
+	.sources	= exynos5_clk_src_gscl_300_list,
+	.nr_sources	= ARRAY_SIZE(exynos5_clk_src_gscl_300_list),
+};
+
+static struct clksrc_clk exynos5_clk_aclk_300_gscl = {
+	.clk    = {
+		.name		= "aclk_300_gscl",
+	},
+	.sources = &exynos5_clk_src_gscl_300,
+	.reg_src = { .reg = EXYNOS5_CLKSRC_TOP3, .shift = 10, .size = 1 },
+};
+
 static struct clk exynos5_init_clocks_off[] = {
 	{
 		.name		= "timers",
@@ -764,6 +839,26 @@ static struct clk exynos5_init_clocks_off[] = {
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
@@ -1225,6 +1320,11 @@ static struct clksrc_clk *exynos5_sysclks[] = {
 	&exynos5_clk_aclk_266,
 	&exynos5_clk_aclk_200,
 	&exynos5_clk_aclk_166,
+	&exynos5_clk_aclk_300_gscl,
+	&exynos5_clk_dout_aclk_300_gscl,
+	&exynos5_clk_mout_aclk_300_gscl,
+	&exynos5_clk_mout_aclk_300_gscl_mid,
+	&exynos5_clk_mout_aclk_300_gscl_mid1,
 	&exynos5_clk_aclk_66_pre,
 	&exynos5_clk_aclk_66,
 	&exynos5_clk_dout_mmc0,
-- 
1.7.0.4
