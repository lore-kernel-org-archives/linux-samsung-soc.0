From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Add missing static storage class specifiers in clock-exynos5.c
Date: Wed,  7 Nov 2012 15:39:51 +0530
Message-ID: <1352282991-19449-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35932 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492Ab2KGKP0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 05:15:26 -0500
Received: by mail-pb0-f46.google.com with SMTP id rr4so1109254pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Nov 2012 02:15:25 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Fixes the following warnings:
arch/arm/mach-exynos/clock-exynos5.c:300:19: warning:
symbol 'exynos5_clk_mout_mpll' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:475:12: warning:
symbol 'exynos5_clkset_aclk_top_list' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:480:23: warning:
symbol 'exynos5_clkset_aclk' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:494:12: warning:
symbol 'exynos5_clkset_aclk_333_166_list' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:499:23: warning:
symbol 'exynos5_clkset_aclk_333_166' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:989:12: warning:
symbol 'exynos5_clkset_group_list' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:1002:23: warning:
symbol 'exynos5_clkset_group' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:1218:19: warning:
symbol 'exynos5_clk_sclk_fimd1' was not declared. Should it be static?
arch/arm/mach-exynos/clock-exynos5.c:1499:20: warning:
symbol 'exynos5_clock_syscore_ops' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index a88e0d9..e48d7c2 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -297,7 +297,7 @@ static struct clksrc_sources exynos5_clk_src_mpll = {
 	.nr_sources	= ARRAY_SIZE(exynos5_clk_src_mpll_list),
 };
 
-struct clksrc_clk exynos5_clk_mout_mpll = {
+static struct clksrc_clk exynos5_clk_mout_mpll = {
 	.clk = {
 		.name		= "mout_mpll",
 	},
@@ -472,12 +472,12 @@ static struct clksrc_clk exynos5_clk_pclk_acp = {
 
 /* Core list of CMU_TOP side */
 
-struct clk *exynos5_clkset_aclk_top_list[] = {
+static struct clk *exynos5_clkset_aclk_top_list[] = {
 	[0] = &exynos5_clk_mout_mpll_user.clk,
 	[1] = &exynos5_clk_mout_bpll_user.clk,
 };
 
-struct clksrc_sources exynos5_clkset_aclk = {
+static struct clksrc_sources exynos5_clkset_aclk = {
 	.sources	= exynos5_clkset_aclk_top_list,
 	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_top_list),
 };
@@ -491,12 +491,12 @@ static struct clksrc_clk exynos5_clk_aclk_400 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 24, .size = 3 },
 };
 
-struct clk *exynos5_clkset_aclk_333_166_list[] = {
+static struct clk *exynos5_clkset_aclk_333_166_list[] = {
 	[0] = &exynos5_clk_mout_cpll.clk,
 	[1] = &exynos5_clk_mout_mpll_user.clk,
 };
 
-struct clksrc_sources exynos5_clkset_aclk_333_166 = {
+static struct clksrc_sources exynos5_clkset_aclk_333_166 = {
 	.sources	= exynos5_clkset_aclk_333_166_list,
 	.nr_sources	= ARRAY_SIZE(exynos5_clkset_aclk_333_166_list),
 };
@@ -986,7 +986,7 @@ static struct clk exynos5_clk_fimd1 = {
 	.ctrlbit	= (1 << 0),
 };
 
-struct clk *exynos5_clkset_group_list[] = {
+static struct clk *exynos5_clkset_group_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = NULL,
 	[2] = &exynos5_clk_sclk_hdmi24m,
@@ -999,7 +999,7 @@ struct clk *exynos5_clkset_group_list[] = {
 	[9] = &exynos5_clk_mout_cpll.clk,
 };
 
-struct clksrc_sources exynos5_clkset_group = {
+static struct clksrc_sources exynos5_clkset_group = {
 	.sources	= exynos5_clkset_group_list,
 	.nr_sources	= ARRAY_SIZE(exynos5_clkset_group_list),
 };
@@ -1215,7 +1215,7 @@ static struct clksrc_clk exynos5_clk_sclk_spi2 = {
 	.reg_div = { .reg = EXYNOS5_CLKDIV_PERIC2, .shift = 8, .size = 8 },
 };
 
-struct clksrc_clk exynos5_clk_sclk_fimd1 = {
+static struct clksrc_clk exynos5_clk_sclk_fimd1 = {
 	.clk	= {
 		.name		= "sclk_fimd",
 		.devname	= "exynos5-fb.1",
@@ -1496,7 +1496,7 @@ static void exynos5_clock_resume(void)
 #define exynos5_clock_resume NULL
 #endif
 
-struct syscore_ops exynos5_clock_syscore_ops = {
+static struct syscore_ops exynos5_clock_syscore_ops = {
 	.suspend	= exynos5_clock_suspend,
 	.resume		= exynos5_clock_resume,
 };
-- 
1.7.4.1
