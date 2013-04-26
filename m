From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 9/9] s3c2410fb: Use module parameter instead of a sysfs entry
Date: Fri, 26 Apr 2013 22:02:23 +0200
Message-ID: <1367006543-5458-10-git-send-email-sylvester.nawrocki@gmail.com>
References: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:51300 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756869Ab3DZUEd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 16:04:33 -0400
In-Reply-To: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, FlorianSchandinat@gmx.de
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Use module parameter to set debug level instead of a sysfs
entry. Replace pr_debug() with pr_info() so we can actually
control the debug traces without DYNAMIC_PRINTK. This fixes
a sort of regression introduced in commit 81c1655811e941af2
video: s3c2410: Use pr_* and dev_* instead of printk

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/video/s3c2410fb.c |   48 +++++++-------------------------------------
 1 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/drivers/video/s3c2410fb.c b/drivers/video/s3c2410fb.c
index 0439ed0..c2ee75a 100644
--- a/drivers/video/s3c2410fb.c
+++ b/drivers/video/s3c2410fb.c
@@ -46,10 +46,13 @@ static int debug	= 1;
 static int debug;
 #endif
 
-#define dprintk(msg...) \
-do { \
-	if (debug) \
-		pr_debug(msg); \
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "Debug level (0-1)");
+
+#define dprintk(msg...)		\
+do { 				\
+	if (debug)		\
+		pr_info(msg);	\
 } while (0)
 
 /* useful functions */
@@ -584,36 +587,6 @@ static int s3c2410fb_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
-static int s3c2410fb_debug_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	return snprintf(buf, PAGE_SIZE, "%s\n", debug ? "on" : "off");
-}
-
-static int s3c2410fb_debug_store(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t len)
-{
-	if (len < 1)
-		return -EINVAL;
-
-	if (strnicmp(buf, "on", 2) == 0 ||
-	    strnicmp(buf, "1", 1) == 0) {
-		debug = 1;
-		dev_dbg(dev, "s3c2410fb: Debug On");
-	} else if (strnicmp(buf, "off", 3) == 0 ||
-		   strnicmp(buf, "0", 1) == 0) {
-		debug = 0;
-		dev_dbg(dev, "s3c2410fb: Debug Off");
-	} else {
-		return -EINVAL;
-	}
-
-	return len;
-}
-
-static DEVICE_ATTR(debug, 0666, s3c2410fb_debug_show, s3c2410fb_debug_store);
-
 static struct fb_ops s3c2410fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= s3c2410fb_check_var,
@@ -962,17 +935,12 @@ static int s3c2410fb_probe(struct platform_device *pdev)
 		goto free_cpufreq;
 	}
 
-	/* create device files */
-	ret = device_create_file(&pdev->dev, &dev_attr_debug);
-	if (ret)
-		dev_err(&pdev->dev, "failed to add debug attribute\n");
-
 	dev_info(&pdev->dev, "fb%d: %s frame buffer device\n",
 		fbinfo->node, fbinfo->fix.id);
 
 	return 0;
 
- free_cpufreq:
+free_cpufreq:
 	s3c2410fb_cpufreq_deregister(info);
 free_video_memory:
 	s3c2410fb_unmap_video_memory(fbinfo);
-- 
1.7.4.1
