From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] ARM: SAMSUNG: Make clk_default_setrate and clk_ops_def_setrate visible
Date: Mon, 11 Jan 2010 12:21:52 +0900
Message-ID: <1263180113-31605-2-git-send-email-kgene.kim@samsung.com>
References: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51275 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab0AKD20 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2010 22:28:26 -0500
In-Reply-To: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

This patch makes clk_default_setrate and clk_ops_def_setrate available
to code outside plat-samsung clock code.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/plat-samsung/clock.c              |    4 ++--
 arch/arm/plat-samsung/include/plat/clock.h |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 9194af9..0c746ae 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -225,13 +225,13 @@ EXPORT_SYMBOL(clk_set_parent);
 
 /* base clocks */
 
-static int clk_default_setrate(struct clk *clk, unsigned long rate)
+int clk_default_setrate(struct clk *clk, unsigned long rate)
 {
 	clk->rate = rate;
 	return 0;
 }
 
-static struct clk_ops clk_ops_def_setrate = {
+struct clk_ops clk_ops_def_setrate = {
 	.set_rate	= clk_default_setrate,
 };
 
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index bd41f82..22e0114 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -75,6 +75,9 @@ extern struct clk clk_h2;
 extern struct clk clk_27m;
 extern struct clk clk_48m;
 
+extern int clk_default_setrate(struct clk *clk, unsigned long rate);
+extern struct clk_ops clk_ops_def_setrate;
+
 /* exports for arch/arm/mach-s3c2410
  *
  * Please DO NOT use these outside of arch/arm/mach-s3c2410
-- 
1.6.2.5
