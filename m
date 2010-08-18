From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 11/14] ARM: S5PV310: Bug fix on uclk1 and sclk_pwm
Date: Wed, 18 Aug 2010 23:01:21 +0900
Message-ID: <1282140084-10265-12-git-send-email-kgene.kim@samsung.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39815 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753512Ab0HROhX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Aug 2010 10:37:23 -0400
In-Reply-To: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch fixes on enable and ctrlbit of uclk1 and sclk_pwm.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/clock.c |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
index 843f4d0..ec69edc 100644
--- a/arch/arm/mach-s5pv310/clock.c
+++ b/arch/arm/mach-s5pv310/clock.c
@@ -56,6 +56,11 @@ static int s5pv310_clksrc_mask_fsys_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKSRC_MASK_FSYS, clk, enable);
 }
 
+static int s5pv310_clksrc_mask_peril0_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKSRC_MASK_PERIL0, clk, enable);
+}
+
 static int s5pv310_clk_ip_fsys_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLKGATE_IP_FSYS, clk, enable);
@@ -403,8 +408,8 @@ static struct clksrc_clk clksrcs[] = {
 		.clk	= {
 			.name		= "uclk1",
 			.id		= 0,
+			.enable		= s5pv310_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 0),
-			.enable		= s5pv310_clk_ip_peril_ctrl,
 		},
 		.sources = &clkset_group,
 		.reg_src = { .reg = S5P_CLKSRC_PERIL0, .shift = 0, .size = 4 },
@@ -413,8 +418,8 @@ static struct clksrc_clk clksrcs[] = {
 		.clk		= {
 			.name		= "uclk1",
 			.id		= 1,
-			.enable		= s5pv310_clk_ip_peril_ctrl,
-			.ctrlbit	= (1 << 1),
+			.enable		= s5pv310_clksrc_mask_peril0_ctrl,
+			.ctrlbit	= (1 << 4),
 		},
 		.sources = &clkset_group,
 		.reg_src = { .reg = S5P_CLKSRC_PERIL0, .shift = 4, .size = 4 },
@@ -423,8 +428,8 @@ static struct clksrc_clk clksrcs[] = {
 		.clk		= {
 			.name		= "uclk1",
 			.id		= 2,
-			.enable		= s5pv310_clk_ip_peril_ctrl,
-			.ctrlbit	= (1 << 2),
+			.enable		= s5pv310_clksrc_mask_peril0_ctrl,
+			.ctrlbit	= (1 << 8),
 		},
 		.sources = &clkset_group,
 		.reg_src = { .reg = S5P_CLKSRC_PERIL0, .shift = 8, .size = 4 },
@@ -433,8 +438,8 @@ static struct clksrc_clk clksrcs[] = {
 		.clk		= {
 			.name		= "uclk1",
 			.id		= 3,
-			.enable		= s5pv310_clk_ip_peril_ctrl,
-			.ctrlbit	= (1 << 3),
+			.enable		= s5pv310_clksrc_mask_peril0_ctrl,
+			.ctrlbit	= (1 << 12),
 		},
 		.sources = &clkset_group,
 		.reg_src = { .reg = S5P_CLKSRC_PERIL0, .shift = 12, .size = 4 },
@@ -443,7 +448,7 @@ static struct clksrc_clk clksrcs[] = {
 		.clk		= {
 			.name		= "sclk_pwm",
 			.id		= -1,
-			.enable		= s5pv310_clk_ip_peril_ctrl,
+			.enable		= s5pv310_clksrc_mask_peril0_ctrl,
 			.ctrlbit	= (1 << 24),
 		},
 		.sources = &clkset_group,
-- 
1.6.2.5
