From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH] Asoc: Samsung: I2S: Add support for runtime S2R
Date: Wed, 30 Jan 2013 17:41:04 +0530
Message-ID: <1359547864-1057-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33298 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285Ab3A3MOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 07:14:24 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHF00M5ETZXRI41@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 21:14:22 +0900 (KST)
Received: from sekar-ubuntu.sisodomain.com ([107.108.73.178])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHF001O6TXULM40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 21:14:22 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com, "R. Chandrasekar" <rcsekar@samsung.com>

From: "R. Chandrasekar" <rcsekar@samsung.com>

This patch adds runtime suspend to resume support for I2S.
I2S clk is disabled at suspend and enabled at resume.

Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/i2s.c |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 2fc42f9..d7231e3 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1071,6 +1071,26 @@ static inline int samsung_i2s_get_driver_data(struct platform_device *pdev)
 		return platform_get_device_id(pdev)->driver_data;
 }
 
+#ifdef CONFIG_PM_RUNTIME
+static int i2s_runtime_suspend(struct device *dev)
+{
+	struct i2s_dai *i2s = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(i2s->clk);
+
+	return 0;
+}
+
+static int i2s_runtime_resume(struct device *dev)
+{
+	struct i2s_dai *i2s = dev_get_drvdata(dev);
+
+	clk_prepare_enable(i2s->clk);
+
+	return 0;
+}
+#endif /* CONFIG_PM_RUNTIME */
+
 static int samsung_i2s_probe(struct platform_device *pdev)
 {
 	struct i2s_dai *pri_dai, *sec_dai = NULL;
@@ -1288,6 +1308,11 @@ static const struct of_device_id exynos_i2s_match[] = {
 MODULE_DEVICE_TABLE(of, exynos_i2s_match);
 #endif
 
+static const struct dev_pm_ops samsung_i2s_pm = {
+	SET_RUNTIME_PM_OPS(i2s_runtime_suspend,
+				i2s_runtime_resume, NULL)
+};
+
 static struct platform_driver samsung_i2s_driver = {
 	.probe  = samsung_i2s_probe,
 	.remove = samsung_i2s_remove,
@@ -1296,6 +1321,7 @@ static struct platform_driver samsung_i2s_driver = {
 		.name = "samsung-i2s",
 		.owner = THIS_MODULE,
 		.of_match_table = of_match_ptr(exynos_i2s_match),
+		.pm = &samsung_i2s_pm,
 	},
 };
 
-- 
1.7.9.5
