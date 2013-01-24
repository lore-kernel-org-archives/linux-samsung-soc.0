From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH] Asoc: Samsung: Add support for I2S runtime S2R
Date: Thu, 24 Jan 2013 18:05:30 +0530
Message-ID: <1359030931-27354-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58328 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753065Ab3AXMix (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 07:38:53 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH400HDSR4I0QU0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jan 2013 21:38:51 +0900 (KST)
Received: from sekar-ubuntu.sisodomain.com ([107.108.73.178])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH4007KRR2EEQ50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jan 2013 21:38:51 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com, "R. Chandrasekar" <rcsekar@samsung.com>

From: "R. Chandrasekar" <rcsekar@samsung.com>

This patch adds runtime suspend to resume support for I2S.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>
---
 sound/soc/samsung/i2s.c |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d2d124f..27a5ab1 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -993,6 +993,26 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	return i2s;
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
 	u32 dma_pl_chan, dma_cp_chan, dma_pl_sec_chan;
@@ -1143,12 +1163,18 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dev_pm_ops samsung_i2s_pm = {
+	SET_RUNTIME_PM_OPS(i2s_runtime_suspend,
+				i2s_runtime_resume, NULL)
+};
+
 static struct platform_driver samsung_i2s_driver = {
 	.probe  = samsung_i2s_probe,
 	.remove = samsung_i2s_remove,
 	.driver = {
 		.name = "samsung-i2s",
 		.owner = THIS_MODULE,
+		.pm = &samsung_i2s_pm,
 	},
 };
 
-- 
1.7.9.5
