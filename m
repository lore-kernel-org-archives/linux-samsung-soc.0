From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 10/14] ARM: S5PV310: Adds uart clocks
Date: Thu, 26 Aug 2010 15:28:37 +0900
Message-ID: <1282804120-17241-3-git-send-email-kgene.kim@samsung.com>
References: <1282804120-17241-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59077 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120Ab0HZGoL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Aug 2010 02:44:11 -0400
In-Reply-To: <1282804120-17241-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch adds uart clocks for S5PV310/S5PC210.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1:
- Added 'uart0'

 arch/arm/mach-s5pv310/clock.c |   42 +++++++++++++++++++++++++++++++++++-----
 1 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
index 019bca5..d99c8d1 100644
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
@@ -329,11 +334,6 @@ static struct clksrc_clk clk_sclk_vpll = {
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
@@ -375,7 +375,37 @@ static struct clk init_clocks_disable[] = {
 };
 
 static struct clk init_clocks[] = {
-	/* Nothing here yet */
+	{
+		.name		= "uart",
+		.id		= 0,
+		.enable		= s5pv310_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
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
