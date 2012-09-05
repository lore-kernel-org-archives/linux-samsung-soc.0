From: ~@samsung.com
Subject: video: exynos_dp: Add device tree based discovery support
Date: Wed, 05 Sep 2012 14:24:11 +0530
Message-ID: <1346835251-1276-1-git-send-email-~@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47827 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841Ab2IEEvr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 00:51:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, jg1.han@samsung.com
Cc: FlorianSchandinat@gmx.de

From: Ajay Kumar <ajaykumar.rs@samsung.com>

Add device tree match table for Exynos DP
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/video/exynos/exynos_dp_core.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/video/exynos/exynos_dp_core.c b/drivers/video/exynos/exynos_dp_core.c
index c6c016a..3bccd6b 100644
--- a/drivers/video/exynos/exynos_dp_core.c
+++ b/drivers/video/exynos/exynos_dp_core.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 
 #include <video/exynos_dp.h>
 
@@ -1019,6 +1020,14 @@ static const struct dev_pm_ops exynos_dp_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(exynos_dp_suspend, exynos_dp_resume)
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id exynos_dp_match[] = {
+	{ .compatible = "samsung,exynos5-dp" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_dp_match);
+#endif
+
 static struct platform_driver exynos_dp_driver = {
 	.probe		= exynos_dp_probe,
 	.remove		= __devexit_p(exynos_dp_remove),
@@ -1026,6 +1035,7 @@ static struct platform_driver exynos_dp_driver = {
 		.name	= "exynos-dp",
 		.owner	= THIS_MODULE,
 		.pm	= &exynos_dp_pm_ops,
+		.of_match_table = of_match_ptr(exynos_dp_match),
 	},
 };
 
-- 
1.7.0.4
