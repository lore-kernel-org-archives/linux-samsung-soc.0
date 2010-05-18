From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 5/9] Input: s3c24xx_ts - Adds FEAT for Samsung touchscreen support
Date: Tue, 18 May 2010 20:44:45 +0900
Message-ID: <1274183085-16063-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52995 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755250Ab0ERLw3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 07:52:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Naveen Krishna <ch.naveen@samsung.com>

This patch adds a feature bit field in the touchscreen driver for Samsung SoCs.
Which can be used to distinguish the TSADC module features.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/input/touchscreen/s3c2410_ts.c |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
index 86086a4..e0b7c83 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -55,6 +55,8 @@
 			 S3C2410_ADCTSC_AUTO_PST | \
 			 S3C2410_ADCTSC_XY_PST(0))
 
+#define FEAT_PEN_IRQ	(1 << 0)	/* HAS ADCCLRINTPNDNUP */
+
 /* Per-touchscreen data. */
 
 /**
@@ -69,6 +71,7 @@
  * @irq_tc: The interrupt number for pen up/down interrupt
  * @count: The number of samples collected.
  * @shift: The log2 of the maximum count to read in one go.
+ * @features: The features supported by the TSADC MOdule.
  */
 struct s3c2410ts {
 	struct s3c_adc_client *client;
@@ -81,6 +84,7 @@ struct s3c2410ts {
 	int irq_tc;
 	int count;
 	int shift;
+	int features;
 };
 
 static struct s3c2410ts ts;
@@ -171,6 +175,11 @@ static irqreturn_t stylus_irq(int irq, void *dev_id)
 	else
 		dev_info(ts.dev, "%s: count=%d\n", __func__, ts.count);
 
+	if (ts.features & FEAT_PEN_IRQ) {
+		/* Clear pen down/up interrupt */
+		writel(0x0, ts.io + S3C64XX_ADCCLRINTPNDNUP);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -317,6 +326,7 @@ static int __devinit s3c2410ts_probe(struct platform_device *pdev)
 	ts.input->id.version = 0x0102;
 
 	ts.shift = info->oversampling_shift;
+	ts.features = platform_get_device_id(pdev)->driver_data;
 
 	ret = request_irq(ts.irq_tc, stylus_irq, IRQF_DISABLED,
 			  "s3c2410_ts_pen", ts.input);
@@ -403,15 +413,14 @@ static struct dev_pm_ops s3c_ts_pmops = {
 #endif
 
 static struct platform_device_id s3cts_driver_ids[] = {
-	{ "s3c2410-ts", 0 },
-	{ "s3c2440-ts", 1 },
+	{ "s3c64xx-ts", FEAT_PEN_IRQ },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, s3cts_driver_ids);
 
 static struct platform_driver s3c_ts_driver = {
 	.driver         = {
-		.name   = "s3c24xx-ts",
+		.name   = "samsung-ts",
 		.owner  = THIS_MODULE,
 #ifdef CONFIG_PM
 		.pm	= &s3c_ts_pmops,
-- 
1.6.2.5
