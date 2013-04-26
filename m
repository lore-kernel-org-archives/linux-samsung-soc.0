From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 5/9] s3c2410fb: Use dev_pm_ops
Date: Fri, 26 Apr 2013 22:02:19 +0200
Message-ID: <1367006543-5458-6-git-send-email-sylvester.nawrocki@gmail.com>
References: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:60802 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754611Ab3DZUEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 16:04:21 -0400
In-Reply-To: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, FlorianSchandinat@gmx.de
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Use the driver PM ops rather than legacy suspend/resume callbacks.
Also use CONFIG_PM_SLEEP switch to compile in the system sleep
code instead of CONFIG_PM.

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/video/s3c2410fb.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/video/s3c2410fb.c b/drivers/video/s3c2410fb.c
index d6706f7..479ab45 100644
--- a/drivers/video/s3c2410fb.c
+++ b/drivers/video/s3c2410fb.c
@@ -26,6 +26,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/io.h>
@@ -36,10 +37,6 @@
 #include <asm/mach/map.h>
 #include <mach/regs-gpio.h>
 
-#ifdef CONFIG_PM
-#include <linux/pm.h>
-#endif
-
 #include "s3c2410fb.h"
 
 /* Debugging stuff */
@@ -1044,8 +1041,7 @@ static int s3c2410fb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-
+#ifdef CONFIG_PM_SLEEP
 /* suspend and resume support for the lcd controller */
 static int s3c2410fb_suspend(struct platform_device *dev, pm_message_t state)
 {
@@ -1081,9 +1077,14 @@ static int s3c2410fb_resume(struct platform_device *dev)
 	return 0;
 }
 
+static const struct dev_pm_ops s3c2410fb_pm_ops = {
+	.resume = s3c2410fb_resume,
+	.suspend = s3c2410fb_suspend,
+};
+
+#define S3C2410FB_PM_OPS (&s3c2410fb_pm_ops)
 #else
-#define s3c2410fb_suspend NULL
-#define s3c2410fb_resume  NULL
+#define S3C2410FB_PM_OPS (NULL)
 #endif
 
 static struct platform_device_id s3c2410fb_driver_ids[] = {
@@ -1099,12 +1100,11 @@ static struct platform_device_id s3c2410fb_driver_ids[] = {
 static struct platform_driver s3c2410fb_driver = {
 	.probe		= s3c2410fb_probe,
 	.remove		= s3c2410fb_remove,
-	.suspend	= s3c2410fb_suspend,
-	.resume		= s3c2410fb_resume,
 	.id_table	= s3c2410fb_driver_ids,
 	.driver		= {
 		.name	= "s3c2410-lcd",
 		.owner	= THIS_MODULE,
+		.pm	= S3C2410FB_PM_OPS,
 	},
 };
 
-- 
1.7.4.1
