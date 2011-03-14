From: Jeongtae Park <jtp.park@samsung.com>
Subject: [PATCH v3 1/3] ARM: EXYNOS4: Add clock support for MFC v5.1
Date: Mon, 14 Mar 2011 17:04:00 +0900
Message-ID: <1300089842-13140-1-git-send-email-jtp.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45556 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752284Ab1CNIfo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 04:35:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jeongtae Park <jtp.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>

This patch adds clock support for MFC v5.1.

Reviewed-by: Peter Oh <jaeryul.oh@samsung.com>
Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
---
 arch/arm/mach-exynos4/clock.c                   |   68 +++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    3 +
 2 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 72d53d5..a18364c 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -86,6 +86,11 @@ static int exynos4_clk_ip_cam_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP_CAM, clk, enable);
 }
 
+static int exynos4_clk_ip_mfc_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKGATE_IP_MFC, clk, enable);
+}
+
 static int exynos4_clk_ip_image_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLKGATE_IP_IMAGE, clk, enable);
@@ -422,6 +427,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
+		.name		= "mfc",
+		.id		= -1,
+		.enable		= exynos4_clk_ip_mfc_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "fimd",
 		.id		= 0,
 		.enable		= exynos4_clk_ip_lcd0_ctrl,
@@ -643,6 +653,54 @@ static struct clksrc_sources clkset_group = {
 	.nr_sources	= ARRAY_SIZE(clkset_group_list),
 };
 
+static struct clk *clkset_mout_mfc0_list[] = {
+	[0] = &clk_mout_mpll.clk,
+	[1] = &clk_sclk_apll.clk,
+};
+
+static struct clksrc_sources clkset_mout_mfc0 = {
+	.sources	= clkset_mout_mfc0_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc0_list),
+};
+
+static struct clksrc_clk clk_mout_mfc0 = {
+	.clk	= {
+		.name		= "mout_mfc0",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_mfc0,
+	.reg_src	= { .reg = S5P_CLKSRC_MFC, .shift = 0, .size = 1 },
+};
+
+static struct clk *clkset_mout_mfc1_list[] = {
+	[0] = &clk_mout_epll.clk,
+	[1] = &clk_sclk_vpll.clk,
+};
+
+static struct clksrc_sources clkset_mout_mfc1 = {
+	.sources	= clkset_mout_mfc1_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc1_list),
+};
+
+static struct clksrc_clk clk_mout_mfc1 = {
+	.clk	= {
+		.name		= "mout_mfc1",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_mfc1,
+	.reg_src	= { .reg = S5P_CLKSRC_MFC, .shift = 4, .size = 1 },
+};
+
+static struct clk *clkset_mout_mfc_list[] = {
+	[0] = &clk_mout_mfc0.clk,
+	[1] = &clk_mout_mfc1.clk,
+};
+
+static struct clksrc_sources clkset_mout_mfc = {
+	.sources	= clkset_mout_mfc_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc_list),
+};
+
 static struct clk *clkset_mout_g2d0_list[] = {
 	[0] = &clk_mout_mpll.clk,
 	[1] = &clk_sclk_apll.clk,
@@ -874,6 +932,14 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLKDIV_CAM, .shift = 12, .size = 4 },
 	}, {
 		.clk		= {
+			.name		= "sclk_mfc",
+			.id		= -1,
+		},
+		.sources = &clkset_mout_mfc,
+		.reg_src = { .reg = S5P_CLKSRC_MFC, .shift = 8, .size = 1 },
+		.reg_div = { .reg = S5P_CLKDIV_MFC, .shift = 0, .size = 4 },
+	}, {
+		.clk		= {
 			.name		= "sclk_fimd",
 			.id		= 0,
 			.enable		= exynos4_clksrc_mask_lcd0_ctrl,
@@ -1018,6 +1084,8 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_dout_mmc2,
 	&clk_dout_mmc3,
 	&clk_dout_mmc4,
+	&clk_mout_mfc0,
+	&clk_mout_mfc1,
 };
 
 static int xtal_rate;
diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/arm/mach-exynos4/include/mach/regs-clock.h
index ba8f91c..9d05047 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
@@ -33,6 +33,7 @@
 #define S5P_CLKSRC_TOP0			S5P_CLKREG(0x0C210)
 #define S5P_CLKSRC_TOP1			S5P_CLKREG(0x0C214)
 #define S5P_CLKSRC_CAM			S5P_CLKREG(0x0C220)
+#define S5P_CLKSRC_MFC			S5P_CLKREG(0x0C228)
 #define S5P_CLKSRC_IMAGE		S5P_CLKREG(0x0C230)
 #define S5P_CLKSRC_LCD0			S5P_CLKREG(0x0C234)
 #define S5P_CLKSRC_LCD1			S5P_CLKREG(0x0C238)
@@ -42,6 +43,7 @@
 
 #define S5P_CLKDIV_TOP			S5P_CLKREG(0x0C510)
 #define S5P_CLKDIV_CAM			S5P_CLKREG(0x0C520)
+#define S5P_CLKDIV_MFC			S5P_CLKREG(0x0C528)
 #define S5P_CLKDIV_IMAGE		S5P_CLKREG(0x0C530)
 #define S5P_CLKDIV_LCD0			S5P_CLKREG(0x0C534)
 #define S5P_CLKDIV_LCD1			S5P_CLKREG(0x0C538)
@@ -67,6 +69,7 @@
 #define S5P_CLKDIV_STAT_TOP		S5P_CLKREG(0x0C610)
 
 #define S5P_CLKGATE_IP_CAM		S5P_CLKREG(0x0C920)
+#define S5P_CLKGATE_IP_MFC		S5P_CLKREG(0x0C928)
 #define S5P_CLKGATE_IP_IMAGE		S5P_CLKREG(0x0C930)
 #define S5P_CLKGATE_IP_LCD0		S5P_CLKREG(0x0C934)
 #define S5P_CLKGATE_IP_LCD1		S5P_CLKREG(0x0C938)
-- 
1.7.1
