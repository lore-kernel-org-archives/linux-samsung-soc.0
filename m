From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree block
Date: Fri, 9 Dec 2011 10:50:10 +0100
Message-ID: <201112091050.11095.heiko@sntech.de>
References: <201112091046.26563.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:33497 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794Ab1LIJuU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 04:50:20 -0500
In-Reply-To: <201112091046.26563.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, 'Thomas Abraham' <thomas.abraham@linaro.org>, Grant Likely <grant.likely@secretlab.ca>
Cc: rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

Use the data field of of_device_id to hold the type for
s3c_cpu_type.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/rtc/rtc-s3c.c |   27 +++++++++++++++++++++------
 1 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 175067a..71807a6 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -428,11 +428,18 @@ static int __devexit s3c_rtc_remove(struct platform_device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id s3c_rtc_dt_match[];
+#endif
+
 static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 {
 	struct rtc_device *rtc;
 	struct rtc_time rtc_tm;
 	struct resource *res;
+#ifdef CONFIG_OF
+	const struct of_device_id *match;
+#endif
 	int ret;
 
 	pr_debug("%s: probe=%p\n", __func__, pdev);
@@ -509,12 +516,15 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_OF
-	if (pdev->dev.of_node)
-		s3c_rtc_cpu_type = of_device_is_compatible(pdev->dev.of_node,
-			"samsung,s3c6410-rtc") ? TYPE_S3C64XX : TYPE_S3C2410;
-	else
+	if (pdev->dev.of_node) {
+		match = of_match_node(s3c_rtc_dt_match, pdev->dev.of_node);
+		s3c_rtc_cpu_type = match->data;
+	} else {
 #endif
 		s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
+#ifdef CONFIG_OF
+	}
+#endif
 
 	/* Check RTC Time */
 
@@ -638,8 +648,13 @@ static int s3c_rtc_resume(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id s3c_rtc_dt_match[] = {
-	{ .compatible = "samsung,s3c2410-rtc" },
-	{ .compatible = "samsung,s3c6410-rtc" },
+	{
+		.compatible = "samsung,s3c2410-rtc"
+		.data = TYPE_S3C2410,
+	}, {
+		.compatible = "samsung,s3c6410-rtc"
+		.data = TYPE_S3C64XX,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
-- 
1.7.5.4
