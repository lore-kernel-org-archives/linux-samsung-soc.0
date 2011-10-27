From: Jongpill Lee <boyko.lee@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: Add clock for Exynos4210 asv feature
Date: Thu, 27 Oct 2011 10:12:17 +0900
Message-ID: <1319677938-25732-3-git-send-email-boyko.lee@samsung.com>
References: <1319677938-25732-1-git-send-email-boyko.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48641 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753645Ab1J0BcI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Oct 2011 21:32:08 -0400
In-Reply-To: <1319677938-25732-1-git-send-email-boyko.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jongpill Lee <boyko.lee@samsung.com>

This patch adds clock for exynos4210 asv feature
which name is sclk_pwi,sclk_hpm,dout_copy.
These clock is used for HPM devices

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |   35 ++++++++++++++++++++++++++++++++++-
 1 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index db61691..230f851 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -306,6 +306,25 @@ static struct clksrc_clk clk_periphclk = {
 	.reg_div	= { .reg = S5P_CLKDIV_CPU, .shift = 12, .size = 3 },
 };
 
+static struct clk *clkset_mout_hpm_list[] = {
+	[0] = &clk_mout_apll.clk,
+	[1] = &clk_mout_mpll.clk,
+};
+
+static struct clksrc_sources clkset_sclk_hpm = {
+	.sources	= clkset_mout_hpm_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_hpm_list),
+};
+
+static struct clksrc_clk clk_dout_copy = {
+	.clk	= {
+		.name		= "dout_copy",
+	},
+	.sources = &clkset_sclk_hpm,
+	.reg_src = { .reg = S5P_CLKSRC_CPU, .shift = 20, .size = 1 },
+	.reg_div = { .reg = S5P_CLKDIV_CPU1, .shift = 0, .size = 3 },
+};
+
 /* Core list of CMU_CORE side */
 
 struct clk *clkset_corebus_list[] = {
@@ -1239,7 +1258,20 @@ static struct clksrc_clk clksrcs[] = {
 			.ctrlbit	= (1 << 16),
 		},
 		.reg_div = { .reg = S5P_CLKDIV_FSYS3, .shift = 8, .size = 8 },
-	}
+	}, {
+		.clk	= {
+			.name		= "sclk_hpm",
+			.parent		= &clk_dout_copy.clk,
+		},
+		.reg_div = { .reg = S5P_CLKDIV_CPU1, .shift = 4, .size = 3 },
+	}, {
+		.clk	= {
+			.name		= "sclk_pwi",
+		},
+		.sources = &clkset_group,
+		.reg_src = { .reg = S5P_CLKSRC_DMC, .shift = 16, .size = 4 },
+		.reg_div = { .reg = S5P_CLKDIV_DMC1, .shift = 8, .size = 4 },
+	},
 };
 
 /* Clock initialization code */
@@ -1253,6 +1285,7 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_armclk,
 	&clk_aclk_corem0,
 	&clk_aclk_cores,
+	&clk_dout_copy,
 	&clk_aclk_corem1,
 	&clk_periphclk,
 	&clk_mout_corebus,
-- 
1.7.1
