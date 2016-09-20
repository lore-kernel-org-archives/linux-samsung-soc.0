From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] PM / devfreq: exynos-ppmu: Remove unused mutex from struct exynos_ppmu
Date: Tue, 20 Sep 2016 14:48:20 +0800
Message-ID: <1474354100-6092-1-git-send-email-axel.lin@ingics.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
List-Id: linux-samsung-soc@vger.kernel.org

The mutex is not used at all, remove it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/devfreq/event/exynos-ppmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index f55cf0e..251692b 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
@@ -34,7 +33,6 @@ struct exynos_ppmu {
 	unsigned int num_events;
 
 	struct device *dev;
-	struct mutex lock;
 
 	struct exynos_ppmu_data ppmu;
 };
@@ -463,7 +461,6 @@ static int exynos_ppmu_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	mutex_init(&info->lock);
 	info->dev = &pdev->dev;
 
 	/* Parse dt data to get resource */
-- 
2.7.4

