From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 1/5] devfreq: exynos4: Fix bug of resource leak and code
 clean on probe()
Date: Thu, 20 Mar 2014 11:59:09 +0900
Message-ID: <1395284353-22458-2-git-send-email-cw00.choi@samsung.com>
References: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36117 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416AbaCTC7V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 22:59:21 -0400
In-reply-to: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com
Cc: rafael.j.wysocki@intel.com, t.figa@samsaung.com, b.zolnierkie@samsaung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

This patch fix bug about resource leak when happening probe fail and code clean
to add debug message.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/devfreq/exynos/exynos4_bus.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/devfreq/exynos/exynos4_bus.c b/drivers/devfreq/exynos/exynos4_bus.c
index e07b0c6..4c1bbd9 100644
--- a/drivers/devfreq/exynos/exynos4_bus.c
+++ b/drivers/devfreq/exynos/exynos4_bus.c
@@ -763,19 +763,11 @@ static int exynos4_bus_get_dev_status(struct device *dev,
 	return 0;
 }
 
-static void exynos4_bus_exit(struct device *dev)
-{
-	struct busfreq_data *data = dev_get_drvdata(dev);
-
-	devfreq_unregister_opp_notifier(dev, data->devfreq);
-}
-
 static struct devfreq_dev_profile exynos4_devfreq_profile = {
 	.initial_freq	= 400000,
 	.polling_ms	= 50,
 	.target		= exynos4_bus_target,
 	.get_dev_status	= exynos4_bus_get_dev_status,
-	.exit		= exynos4_bus_exit,
 };
 
 static int exynos4210_init_tables(struct busfreq_data *data)
@@ -1048,8 +1040,11 @@ static int exynos4_busfreq_probe(struct platform_device *pdev)
 		dev_err(dev, "Cannot determine the device id %d\n", data->type);
 		err = -EINVAL;
 	}
-	if (err)
+	if (err) {
+		dev_err(dev, "Cannot initialize busfreq table %d\n",
+			     data->type);
 		return err;
+	}
 
 	data->vdd_int = devm_regulator_get(dev, "vdd_int");
 	if (IS_ERR(data->vdd_int)) {
@@ -1086,23 +1081,39 @@ static int exynos4_busfreq_probe(struct platform_device *pdev)
 	if (IS_ERR(data->devfreq))
 		return PTR_ERR(data->devfreq);
 
-	devfreq_register_opp_notifier(dev, data->devfreq);
+	/* Register opp_notifier for Exynos4 busfreq */
+	err = devfreq_register_opp_notifier(dev, data->devfreq);
+	if (err < 0) {
+		dev_err(dev, "Failed to register opp notifier\n");
+		goto err_notifier_opp;
+	}
 
+	/* Register pm_notifier for Exynos4 busfreq */
 	err = register_pm_notifier(&data->pm_notifier);
 	if (err) {
 		dev_err(dev, "Failed to setup pm notifier\n");
-		devfreq_remove_device(data->devfreq);
-		return err;
+		goto err_notifier_pm;
 	}
 
 	return 0;
+
+err_notifier_pm:
+	devfreq_unregister_opp_notifier(dev, data->devfreq);
+err_notifier_opp:
+	devfreq_remove_device(data->devfreq);
+
+	return err;
 }
 
 static int exynos4_busfreq_remove(struct platform_device *pdev)
 {
 	struct busfreq_data *data = platform_get_drvdata(pdev);
 
+	/* Unregister all of notifier chain */
 	unregister_pm_notifier(&data->pm_notifier);
+	devfreq_unregister_opp_notifier(data->dev, data->devfreq);
+
+	/* Remove devfreq instance */
 	devfreq_remove_device(data->devfreq);
 
 	return 0;
-- 
1.8.0
