From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] mtd: nand: s3c2410: Register cpufreq notifier only on S3C24xx
Date: Mon, 27 Jun 2016 14:51:38 +0200
Message-ID: <1467031898-1410-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30741 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634AbcF0Mvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2016 08:51:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

The driver registered for CPU frequency transitions to recalculate its
clock when ARM clock frequency changes (ratio between frequencies of
ARM's parent clock (fclk) and clock for peripherals remains fixed).

This is needed only on S3C24xx platform when cpufreq driver is enabled
so limit the ifdef to respective cpufreq Kconfig.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mtd/nand/s3c2410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d9309cf0ce2e..8d440cc0f002 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -180,7 +180,7 @@ struct s3c2410_nand_info {
 
 	enum s3c_cpu_type		cpu_type;
 
-#ifdef CONFIG_CPU_FREQ
+#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
 	struct notifier_block	freq_transition;
 #endif
 };
@@ -701,7 +701,7 @@ static void s3c2440_nand_write_buf(struct mtd_info *mtd, const u_char *buf,
 
 /* cpufreq driver support */
 
-#ifdef CONFIG_CPU_FREQ
+#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
 
 static int s3c2410_nand_cpufreq_transition(struct notifier_block *nb,
 					  unsigned long val, void *data)
-- 
1.9.1
