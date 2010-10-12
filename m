From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH v2 4/6] ARM: S5P: Add EPLL rate change warning
Date: Tue, 12 Oct 2010 20:46:23 +0900
Message-ID: <1286883983-27790-1-git-send-email-sw.youn@samsung.com>
References: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34107 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932068Ab0JLLzy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Oct 2010 07:55:54 -0400
In-Reply-To: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com, Seungwhan Youn <sw.youn@samsung.com>

This patch adds warning about changing EPLL rate to notice that other
driver that controls H/W, which is using EPLL, will has unknown effects
by this EPLL rate change.

Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |    3 +++
 arch/arm/mach-s5p64x0/clock-s5p6450.c |    3 +++
 arch/arm/mach-s5pc100/clock.c         |    3 +++
 arch/arm/mach-s5pv210/clock.c         |    3 +++
 4 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 1e3f517..0b539d5 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -79,6 +79,9 @@ static int s5p6440_epll_set_rate(struct clk *clk, unsigned long rate)
 	__raw_writel(epll_con, S5P_EPLL_CON);
 	__raw_writel(epll_con_k, S5P_EPLL_CON_K);
 
+	printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
+			clk->rate, rate);
+
 	clk->rate = rate;
 
 	return 0;
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index ee03ec3..838eeff 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -80,6 +80,9 @@ static int s5p6450_epll_set_rate(struct clk *clk, unsigned long rate)
 	__raw_writel(epll_con, S5P_EPLL_CON);
 	__raw_writel(epll_con_k, S5P_EPLL_CON_K);
 
+	printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
+			clk->rate, rate);
+
 	clk->rate = rate;
 
 	return 0;
diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index 42c2636..9e192a0 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -323,6 +323,9 @@ static int s5pc100_epll_set_rate(struct clk *clk, unsigned long rate)
 
 	__raw_writel(epll_con, S5P_EPLL_CON);
 
+	printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
+			clk->rate, rate);
+
 	clk->rate = rate;
 
 	return 0;
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index fdfadac..25eb839 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -1066,6 +1066,9 @@ static int s5pv210_epll_set_rate(struct clk *clk, unsigned long rate)
 	__raw_writel(epll_con, S5P_EPLL_CON);
 	__raw_writel(epll_con_k, S5P_EPLL_CON1);
 
+	printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
+			clk->rate, rate);
+
 	clk->rate = rate;
 
 	return 0;
-- 
1.6.2.5
