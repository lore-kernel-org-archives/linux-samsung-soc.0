From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] video: s3c2410fb: Register cpufreq notifier only on S3C24xx
Date: Mon, 27 Jun 2016 14:52:25 +0200
Message-ID: <1467031945-10486-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24185 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbcF0Mwf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2016 08:52:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

The driver registered for CPU frequency transitions to recalculate its
clock when ARM clock frequency changes (ratio between frequencies of
ARM's parent clock (fclk) and clock for peripherals remains fixed).

This is needed only on S3C24xx platform when cpufreq driver is enabled
so limit the ifdef to respective cpufreq Kconfig.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/video/fbdev/s3c2410fb.c | 2 +-
 drivers/video/fbdev/s3c2410fb.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
index 0dd86be36afb..a67e4567e656 100644
--- a/drivers/video/fbdev/s3c2410fb.c
+++ b/drivers/video/fbdev/s3c2410fb.c
@@ -767,7 +767,7 @@ static irqreturn_t s3c2410fb_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_CPU_FREQ
+#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
 
 static int s3c2410fb_cpufreq_transition(struct notifier_block *nb,
 					unsigned long val, void *data)
diff --git a/drivers/video/fbdev/s3c2410fb.h b/drivers/video/fbdev/s3c2410fb.h
index 47a17bd23011..cdd11e2f8859 100644
--- a/drivers/video/fbdev/s3c2410fb.h
+++ b/drivers/video/fbdev/s3c2410fb.h
@@ -32,7 +32,7 @@ struct s3c2410fb_info {
 	unsigned long		clk_rate;
 	unsigned int		palette_ready;
 
-#ifdef CONFIG_CPU_FREQ
+#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
 	struct notifier_block	freq_transition;
 #endif
 
-- 
1.9.1
