From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 2/2] ARM: EXYNOS: Add G2D related clock entries for SMDK4X12
Date: Mon, 16 Jul 2012 10:37:00 +0530
Message-ID: <1342415220-15497-3-git-send-email-sachin.kamat@linaro.org>
References: <1342415220-15497-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33902 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab2GPFHa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 01:07:30 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so9452839pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jul 2012 22:07:30 -0700 (PDT)
In-Reply-To: <1342415220-15497-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds G2D related clock entries for SMDK4X12 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4212.c |   41 +++++++++++++++++++++++++++++-
 1 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4212.c b/arch/arm/mach-exynos/clock-exynos4212.c
index da397d2..8fba0b5 100644
--- a/arch/arm/mach-exynos/clock-exynos4212.c
+++ b/arch/arm/mach-exynos/clock-exynos4212.c
@@ -68,12 +68,45 @@ static struct clksrc_clk clk_mout_mpll_user = {
 	.reg_src	= { .reg = EXYNOS4_CLKSRC_CPU, .shift = 24, .size = 1 },
 };
 
+static struct clksrc_clk exynos4x12_clk_mout_g2d0 = {
+	.clk	= {
+		.name		= "mout_g2d0",
+	},
+	.sources = &exynos4_clkset_mout_g2d0,
+	.reg_src = { .reg = EXYNOS4_CLKSRC_DMC, .shift = 20, .size = 1 },
+};
+
+static struct clksrc_clk exynos4x12_clk_mout_g2d1 = {
+	.clk	= {
+		.name		= "mout_g2d1",
+	},
+	.sources = &exynos4_clkset_mout_g2d1,
+	.reg_src = { .reg = EXYNOS4_CLKSRC_DMC, .shift = 24, .size = 1 },
+};
+
+static struct clk *exynos4x12_clkset_mout_g2d_list[] = {
+	[0] = &exynos4x12_clk_mout_g2d0.clk,
+	[1] = &exynos4x12_clk_mout_g2d1.clk,
+};
+
+static struct clksrc_sources exynos4x12_clkset_mout_g2d = {
+	.sources	= exynos4x12_clkset_mout_g2d_list,
+	.nr_sources	= ARRAY_SIZE(exynos4x12_clkset_mout_g2d_list),
+};
+
 static struct clksrc_clk *sysclks[] = {
 	&clk_mout_mpll_user,
 };
 
 static struct clksrc_clk clksrcs[] = {
-	/* nothing here yet */
+	{
+		.clk	= {
+			.name		= "sclk_fimg2d",
+		},
+		.sources = &exynos4x12_clkset_mout_g2d,
+		.reg_src = { .reg = EXYNOS4_CLKSRC_DMC, .shift = 28, .size = 1 },
+		.reg_div = { .reg = EXYNOS4_CLKDIV_DMC1, .shift = 0, .size = 4 },
+	},
 };
 
 static struct clk init_clocks_off[] = {
@@ -102,7 +135,11 @@ static struct clk init_clocks_off[] = {
 		.devname	= "exynos-fimc-lite.1",
 		.enable		= exynos4212_clk_ip_isp0_ctrl,
 		.ctrlbit	= (1 << 3),
-	}
+	}, {
+		.name		= "fimg2d",
+		.enable		= exynos4_clk_ip_dmc_ctrl,
+		.ctrlbit	= (1 << 23),
+	},
 };
 
 #ifdef CONFIG_PM_SLEEP
-- 
1.7.4.1
