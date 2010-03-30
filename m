From: Christian Pellegrin <chripell@fsfe.org>
Subject: [PATCH v2.6.34-rc2] s3c: Fix CONFIG_MTD_NAND_S3C2410_CLKSTOP
Date: Tue, 30 Mar 2010 10:22:03 +0200
Message-ID: <1269937323-7541-1-git-send-email-chripell@fsfe.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:42437 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755955Ab0C3IYi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Mar 2010 04:24:38 -0400
Received: by vws20 with SMTP id 20so509146vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Mar 2010 01:24:37 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Christian Pellegrin <chripell@fsfe.org>

Option CONFIG_MTD_NAND_S3C2410_CLKSTOP was broken by higher MTD layers
calling select_chip with -1 twice in a row. This patch fixes the problem
by making sure that clk_disable is not called too many times.

Signed-off-by: Christian Pellegrin <chripell@fsfe.org>
---
 drivers/mtd/nand/s3c2410.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index fa6e9c7..9adecc6 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -37,6 +37,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
+#include <linux/bitops.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
@@ -135,6 +136,9 @@ struct s3c2410_nand_info {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
+#ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
+	unsigned long                   clk_running;
+#endif
 };
 
 /* conversion functions */
@@ -333,7 +337,8 @@ static void s3c2410_nand_select_chip(struct mtd_info *mtd, int chip)
 	nmtd = this->priv;
 	info = nmtd->info;
 
-	if (chip != -1 && allow_clk_stop(info))
+	if (chip != -1 && allow_clk_stop(info) &&
+	    !test_and_set_bit(0, &info->clk_running))
 		clk_enable(info->clk);
 
 	cur = readl(info->sel_reg);
@@ -356,7 +361,8 @@ static void s3c2410_nand_select_chip(struct mtd_info *mtd, int chip)
 
 	writel(cur, info->sel_reg);
 
-	if (chip == -1 && allow_clk_stop(info))
+	if (chip == -1 && allow_clk_stop(info) &&
+	    test_and_clear_bit(0, &info->clk_running))
 		clk_disable(info->clk);
 }
 
-- 
1.5.6.5
