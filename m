From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 4/5] devfreq: exynos5: Use SIMPLE_DEV_PM_OPS macro
Date: Thu, 20 Mar 2014 11:59:12 +0900
Message-ID: <1395284353-22458-5-git-send-email-cw00.choi@samsung.com>
References: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com
Cc: rafael.j.wysocki@intel.com, t.figa@samsaung.com, b.zolnierkie@samsaung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch use SIMPLE_DEV_PM_OPS macro instead of legacy method.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/devfreq/exynos/exynos5_bus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/exynos/exynos5_bus.c b/drivers/devfreq/exynos/exynos5_bus.c
index 6eef1f7..af6213f 100644
--- a/drivers/devfreq/exynos/exynos5_bus.c
+++ b/drivers/devfreq/exynos/exynos5_bus.c
@@ -429,6 +429,7 @@ static int exynos5_busfreq_int_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static int exynos5_busfreq_int_resume(struct device *dev)
 {
 	struct platform_device *pdev = container_of(dev, struct platform_device,
@@ -438,10 +439,12 @@ static int exynos5_busfreq_int_resume(struct device *dev)
 	busfreq_mon_reset(data);
 	return 0;
 }
-
 static const struct dev_pm_ops exynos5_busfreq_int_pm = {
 	.resume	= exynos5_busfreq_int_resume,
 };
+#endif
+static SIMPLE_DEV_PM_OPS(exynos5_busfreq_int_pm_ops, NULL,
+			 exynos5_busfreq_int_resume);
 
 /* platform device pointer for exynos5 devfreq device. */
 static struct platform_device *exynos5_devfreq_pdev;
@@ -452,7 +455,7 @@ static struct platform_driver exynos5_busfreq_int_driver = {
 	.driver		= {
 		.name		= "exynos5-bus-int",
 		.owner		= THIS_MODULE,
-		.pm		= &exynos5_busfreq_int_pm,
+		.pm		= &exynos5_busfreq_int_pm_ops,
 	},
 };
 
-- 
1.8.0
