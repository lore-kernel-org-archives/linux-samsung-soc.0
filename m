From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 10/14] ARM: S5PV310: Adds uart clocks
Date: Wed, 18 Aug 2010 23:01:20 +0900
Message-ID: <1282140084-10265-11-git-send-email-kgene.kim@samsung.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39806 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753298Ab0HROhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Aug 2010 10:37:22 -0400
In-Reply-To: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch adds uart clocks for S5PV310/S5PC210.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/clock.c |   37 +++++++++++++++++++++++++++++++------
 1 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
index 8728504..843f4d0 100644
--- a/arch/arm/mach-s5pv310/clock.c
+++ b/arch/arm/mach-s5pv310/clock.c
@@ -61,6 +61,11 @@ static int s5pv310_clk_ip_fsys_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(S5P_CLKGATE_IP_FSYS, clk, enable);
 }
 
+static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enable);
+}
+
 /* Core list of CMU_CPU side */
 
 static struct clksrc_clk clk_mout_apll = {
@@ -257,11 +262,6 @@ static struct clksrc_clk clk_sclk_vpll = {
 	.reg_src	= { .reg = S5P_CLKSRC_TOP0, .shift = 8, .size = 1 },
 };
 
-static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enable);
-}
-
 static struct clk init_clocks_disable[] = {
 	{
 		.name		= "timers",
@@ -303,7 +303,32 @@ static struct clk init_clocks_disable[] = {
 };
 
 static struct clk init_clocks[] = {
-	/* Nothing here yet */
+	{
+		.name		= "uart",
+		.id		= 1,
+		.enable		= s5pv310_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 1),
+	}, {
+		.name		= "uart",
+		.id		= 2,
+		.enable		= s5pv310_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 2),
+	}, {
+		.name		= "uart",
+		.id		= 3,
+		.enable		= s5pv310_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
+		.name		= "uart",
+		.id		= 4,
+		.enable		= s5pv310_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
+		.name		= "uart",
+		.id		= 5,
+		.enable		= s5pv310_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 5),
+	}
 };
 
 static struct clk *clkset_group_list[] = {
-- 
1.6.2.5
