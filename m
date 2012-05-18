From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: EXYNOS: Move G2D clock entries to clock-exynos4210.c file
Date: Fri, 18 May 2012 09:37:50 +0530
Message-ID: <1337314071-15305-2-git-send-email-sachin.kamat@linaro.org>
References: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:56800 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387Ab2ERESH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 May 2012 00:18:07 -0400
Received: by dady13 with SMTP id y13so3300491dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 May 2012 21:18:06 -0700 (PDT)
In-Reply-To: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

G2D clock registers are different in Exynos4210 and Exynos4X12 SoCs.
Hence moving the SoC specific G2D clock entries from common clock file
(clock-exynos4.c) to Exynos4210 specific clock file (clock-exynos4210.c).

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4.c    |   41 +-----------------------------
 arch/arm/mach-exynos/clock-exynos4.h    |    3 ++
 arch/arm/mach-exynos/clock-exynos4210.c |   37 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index bcb7db4..18d59d3 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -620,10 +620,6 @@ static struct clk exynos4_init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 27),
 	}, {
-		.name		= "fimg2d",
-		.enable		= exynos4_clk_ip_image_ctrl,
-		.ctrlbit	= (1 << 0),
-	}, {
 		.name		= "mfc",
 		.devname	= "s5p-mfc",
 		.enable		= exynos4_clk_ip_mfc_ctrl,
@@ -819,47 +815,21 @@ static struct clk *exynos4_clkset_mout_g2d0_list[] = {
 	[1] = &exynos4_clk_sclk_apll.clk,
 };
 
-static struct clksrc_sources exynos4_clkset_mout_g2d0 = {
+struct clksrc_sources exynos4_clkset_mout_g2d0 = {
 	.sources	= exynos4_clkset_mout_g2d0_list,
 	.nr_sources	= ARRAY_SIZE(exynos4_clkset_mout_g2d0_list),
 };
 
-static struct clksrc_clk exynos4_clk_mout_g2d0 = {
-	.clk	= {
-		.name		= "mout_g2d0",
-	},
-	.sources = &exynos4_clkset_mout_g2d0,
-	.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 0, .size = 1 },
-};
-
 static struct clk *exynos4_clkset_mout_g2d1_list[] = {
 	[0] = &exynos4_clk_mout_epll.clk,
 	[1] = &exynos4_clk_sclk_vpll.clk,
 };
 
-static struct clksrc_sources exynos4_clkset_mout_g2d1 = {
+struct clksrc_sources exynos4_clkset_mout_g2d1 = {
 	.sources	= exynos4_clkset_mout_g2d1_list,
 	.nr_sources	= ARRAY_SIZE(exynos4_clkset_mout_g2d1_list),
 };
 
-static struct clksrc_clk exynos4_clk_mout_g2d1 = {
-	.clk	= {
-		.name		= "mout_g2d1",
-	},
-	.sources = &exynos4_clkset_mout_g2d1,
-	.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 4, .size = 1 },
-};
-
-static struct clk *exynos4_clkset_mout_g2d_list[] = {
-	[0] = &exynos4_clk_mout_g2d0.clk,
-	[1] = &exynos4_clk_mout_g2d1.clk,
-};
-
-static struct clksrc_sources exynos4_clkset_mout_g2d = {
-	.sources	= exynos4_clkset_mout_g2d_list,
-	.nr_sources	= ARRAY_SIZE(exynos4_clkset_mout_g2d_list),
-};
-
 static struct clk *exynos4_clkset_mout_mfc0_list[] = {
 	[0] = &exynos4_clk_mout_mpll.clk,
 	[1] = &exynos4_clk_sclk_apll.clk,
@@ -1126,13 +1096,6 @@ static struct clksrc_clk exynos4_clksrcs[] = {
 		.reg_div = { .reg = EXYNOS4_CLKDIV_LCD0, .shift = 0, .size = 4 },
 	}, {
 		.clk	= {
-			.name		= "sclk_fimg2d",
-		},
-		.sources = &exynos4_clkset_mout_g2d,
-		.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 8, .size = 1 },
-		.reg_div = { .reg = EXYNOS4_CLKDIV_IMAGE, .shift = 0, .size = 4 },
-	}, {
-		.clk	= {
 			.name		= "sclk_mfc",
 			.devname	= "s5p-mfc",
 		},
diff --git a/arch/arm/mach-exynos/clock-exynos4.h b/arch/arm/mach-exynos/clock-exynos4.h
index 28a1197..bd12d5f 100644
--- a/arch/arm/mach-exynos/clock-exynos4.h
+++ b/arch/arm/mach-exynos/clock-exynos4.h
@@ -23,6 +23,9 @@ extern struct clksrc_sources exynos4_clkset_group;
 extern struct clk *exynos4_clkset_aclk_top_list[];
 extern struct clk *exynos4_clkset_group_list[];
 
+extern struct clksrc_sources exynos4_clkset_mout_g2d0;
+extern struct clksrc_sources exynos4_clkset_mout_g2d1;
+
 extern int exynos4_clksrc_mask_fsys_ctrl(struct clk *clk, int enable);
 extern int exynos4_clk_ip_fsys_ctrl(struct clk *clk, int enable);
 extern int exynos4_clk_ip_lcd1_ctrl(struct clk *clk, int enable);
diff --git a/arch/arm/mach-exynos/clock-exynos4210.c b/arch/arm/mach-exynos/clock-exynos4210.c
index b8689ff..0bf767a 100644
--- a/arch/arm/mach-exynos/clock-exynos4210.c
+++ b/arch/arm/mach-exynos/clock-exynos4210.c
@@ -48,6 +48,32 @@ static struct clksrc_clk *sysclks[] = {
 	/* nothing here yet */
 };
 
+static struct clksrc_clk exynos4_clk_mout_g2d0 = {
+	.clk	= {
+		.name		= "mout_g2d0",
+	},
+	.sources = &exynos4_clkset_mout_g2d0,
+	.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 0, .size = 1 },
+};
+
+static struct clksrc_clk exynos4_clk_mout_g2d1 = {
+	.clk	= {
+		.name		= "mout_g2d1",
+	},
+	.sources = &exynos4_clkset_mout_g2d1,
+	.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 4, .size = 1 },
+};
+
+static struct clk *exynos4_clkset_mout_g2d_list[] = {
+	[0] = &exynos4_clk_mout_g2d0.clk,
+	[1] = &exynos4_clk_mout_g2d1.clk,
+};
+
+static struct clksrc_sources exynos4_clkset_mout_g2d = {
+	.sources	= exynos4_clkset_mout_g2d_list,
+	.nr_sources	= ARRAY_SIZE(exynos4_clkset_mout_g2d_list),
+};
+
 static int exynos4_clksrc_mask_lcd1_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(EXYNOS4210_CLKSRC_MASK_LCD1, clk, enable);
@@ -74,6 +100,13 @@ static struct clksrc_clk clksrcs[] = {
 		.sources = &exynos4_clkset_group,
 		.reg_src = { .reg = EXYNOS4210_CLKSRC_LCD1, .shift = 0, .size = 4 },
 		.reg_div = { .reg = EXYNOS4210_CLKDIV_LCD1, .shift = 0, .size = 4 },
+	}, {
+		.clk	= {
+			.name		= "sclk_fimg2d",
+		},
+		.sources = &exynos4_clkset_mout_g2d,
+		.reg_src = { .reg = EXYNOS4_CLKSRC_IMAGE, .shift = 8, .size = 1 },
+		.reg_div = { .reg = EXYNOS4_CLKDIV_IMAGE, .shift = 0, .size = 4 },
 	},
 };
 
@@ -105,6 +138,10 @@ static struct clk init_clocks_off[] = {
 		.devname	= SYSMMU_CLOCK_DEVNAME(fimd1, 11),
 		.enable		= exynos4_clk_ip_lcd1_ctrl,
 		.ctrlbit	= (1 << 4),
+	}, {
+		.name		= "fimg2d",
+		.enable		= exynos4_clk_ip_image_ctrl,
+		.ctrlbit	= (1 << 0),
 	},
 };
 
-- 
1.7.4.1
