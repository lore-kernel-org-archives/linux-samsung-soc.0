From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 2/5] devfreq: exynos4: Use SIMPLE_DEV_PM_OPS macro
Date: Thu, 20 Mar 2014 11:59:10 +0900
Message-ID: <1395284353-22458-3-git-send-email-cw00.choi@samsung.com>
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
 drivers/devfreq/exynos/exynos4_bus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/exynos/exynos4_bus.c b/drivers/devfreq/exynos/exynos4_bus.c
index 4c1bbd9..5a48d16 100644
--- a/drivers/devfreq/exynos/exynos4_bus.c
+++ b/drivers/devfreq/exynos/exynos4_bus.c
@@ -1119,6 +1119,7 @@ static int exynos4_busfreq_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static int exynos4_busfreq_resume(struct device *dev)
 {
 	struct busfreq_data *data = dev_get_drvdata(dev);
@@ -1126,10 +1127,9 @@ static int exynos4_busfreq_resume(struct device *dev)
 	busfreq_mon_reset(data);
 	return 0;
 }
+#endif
 
-static const struct dev_pm_ops exynos4_busfreq_pm = {
-	.resume	= exynos4_busfreq_resume,
-};
+static SIMPLE_DEV_PM_OPS(exynos4_busfreq_pm_ops, NULL, exynos4_busfreq_resume);
 
 static const struct platform_device_id exynos4_busfreq_id[] = {
 	{ "exynos4210-busfreq", TYPE_BUSF_EXYNOS4210 },
@@ -1145,7 +1145,7 @@ static struct platform_driver exynos4_busfreq_driver = {
 	.driver = {
 		.name	= "exynos4-busfreq",
 		.owner	= THIS_MODULE,
-		.pm	= &exynos4_busfreq_pm,
+		.pm	= &exynos4_busfreq_pm_ops,
 	},
 };
 
-- 
1.8.0
