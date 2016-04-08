From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/3] ASoC: samsung: Use of_device_get_match_data() helper
Date: Fri, 08 Apr 2016 18:52:45 +0200
Message-ID: <1460134365-31500-3-git-send-email-s.nawrocki@samsung.com>
References: <1460134365-31500-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59084 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754046AbcDHQx6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2016 12:53:58 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5B015S9QXW0C00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Apr 2016 01:53:56 +0900 (KST)
In-reply-to: <1460134365-31500-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Simplify the code a little by using a standard function for
getting the match data.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 7ea030e..27ca116 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 
@@ -1106,21 +1107,6 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	return i2s;
 }
 
-static const struct of_device_id exynos_i2s_match[];
-
-static inline const struct samsung_i2s_dai_data *samsung_i2s_get_driver_data(
-						struct platform_device *pdev)
-{
-	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(exynos_i2s_match, pdev->dev.of_node);
-		return match ? match->data : NULL;
-	} else {
-		return (struct samsung_i2s_dai_data *)
-				platform_get_device_id(pdev)->driver_data;
-	}
-}
-
 #ifdef CONFIG_PM
 static int i2s_runtime_suspend(struct device *dev)
 {
@@ -1233,9 +1219,13 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	const struct samsung_i2s_dai_data *i2s_dai_data;
 	int ret;
 
-	/* Call during Seconday interface registration */
-	i2s_dai_data = samsung_i2s_get_driver_data(pdev);
+	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)
+		i2s_dai_data = of_device_get_match_data(&pdev->dev);
+	else
+		i2s_dai_data = (struct samsung_i2s_dai_data *)
+				platform_get_device_id(pdev)->driver_data;
 
+	/* Call during the secondary interface registration */
 	if (i2s_dai_data->dai_type == TYPE_SEC) {
 		sec_dai = dev_get_drvdata(&pdev->dev);
 		if (!sec_dai) {
-- 
1.9.1
