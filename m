From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] rtc: rtc-s3c: Add device tree support
Date: Sat, 03 Sep 2011 21:19:19 +0530
Message-ID: <1315064959-16930-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12954 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab1ICPti (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Sep 2011 11:49:38 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQY00JTSEM64X20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 04 Sep 2011 00:49:36 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LQY0086FEMJB730@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sun, 04 Sep 2011 00:49:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Add device tree based discovery support for Samsung's rtc controller.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 Documentation/devicetree/bindings/rtc/s3c-rtc.txt |   20 ++++++++++++++++++++
 drivers/rtc/rtc-s3c.c                             |   21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
new file mode 100644
index 0000000..90ec45f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
@@ -0,0 +1,20 @@
+* Samsung's S3C Real Time Clock controller
+
+Required properties:
+- compatible: should be one of the following.
+    * "samsung,s3c2410-rtc" - for controllers compatible with s3c2410 rtc.
+    * "samsung,s3c6410-rtc" - for controllers compatible with s3c6410 rtc.
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: Two interrupt numbers to the cpu should be specified. First
+  interrupt number is the rtc alarm interupt and second interrupt number
+  is the rtc tick interrupt. The number of cells representing a interrupt
+  depends on the parent interrupt controller.
+
+Example:
+
+	rtc@10070000 {
+		compatible = "samsung,s3c6410-rtc";
+		reg = <0x10070000 0x100>;
+		interrupts = <44 0 45 0>;
+	};
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 4e7c04e..29f928c 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -25,6 +25,7 @@
 #include <linux/clk.h>
 #include <linux/log2.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 #include <mach/hardware.h>
 #include <asm/uaccess.h>
@@ -481,7 +482,13 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 		goto err_nortc;
 	}
 
-	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
+#ifdef CONFIG_OF
+	if (pdev->dev.of_node)
+		s3c_rtc_cpu_type = of_device_is_compatible(pdev->dev.of_node,
+			"samsung,s3c6410-rtc") ? TYPE_S3C64XX : TYPE_S3C2410;
+	else
+#endif
+		s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
 
 	/* Check RTC Time */
 
@@ -603,6 +610,17 @@ static int s3c_rtc_resume(struct platform_device *pdev)
 #define s3c_rtc_resume  NULL
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id s3c_rtc_dt_match[] = {
+	{ .compatible = "samsung,s3c2410-rtc" },
+	{ .compatible = "samsung,s3c6410-rtc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
+#else
+#define s3c_rtc_dt_match NULL
+#endif
+
 static struct platform_device_id s3c_rtc_driver_ids[] = {
 	{
 		.name		= "s3c2410-rtc",
@@ -625,6 +643,7 @@ static struct platform_driver s3c_rtc_driver = {
 	.driver		= {
 		.name	= "s3c-rtc",
 		.owner	= THIS_MODULE,
+		.of_match_table	= s3c_rtc_dt_match,
 	},
 };
 
-- 
1.6.6.rc2
