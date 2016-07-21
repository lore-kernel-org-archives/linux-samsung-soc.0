From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] ASoC: samsung: Fix error paths in the I2S driver's probe()
Date: Thu, 21 Jul 2016 20:03:49 +0200
Message-ID: <1469124230-8583-2-git-send-email-s.nawrocki@samsung.com>
References: <1469124230-8583-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42873 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbcGUSEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 14:04:08 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAO00LG6FG4QU30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jul 2016 03:04:07 +0900 (KST)
In-reply-to: <1469124230-8583-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Ensure they secondary DAI device is freed properly when asoc_dma_platform
registration fails.  This change is needed for proper deferred probe support
and will help preventing situations when the CPU DAI's initialization
completes without required DMA resources.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 27ca116..2bb3550 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1107,6 +1107,11 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	return i2s;
 }
 
+static void i2s_free_sec_dai(struct i2s_dai *i2s)
+{
+	platform_device_del(i2s->pdev);
+}
+
 #ifdef CONFIG_PM
 static int i2s_runtime_suspend(struct device *dev)
 {
@@ -1340,17 +1345,27 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	devm_snd_soc_register_component(&pri_dai->pdev->dev,
+	ret = devm_snd_soc_register_component(&pri_dai->pdev->dev,
 					&samsung_i2s_component,
 					&pri_dai->i2s_dai_drv, 1);
+	if (ret < 0)
+		goto err_free_dai;
+
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter);
+	if (ret < 0)
+		goto err_free_dai;
 
 	pm_runtime_enable(&pdev->dev);
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter);
-	if (ret != 0)
-		return ret;
+	ret = i2s_register_clock_provider(pdev);
+	if (!ret)
+		return 0;
 
-	return i2s_register_clock_provider(pdev);
+	pm_runtime_disable(&pdev->dev);
+err_free_dai:
+	if (sec_dai)
+		i2s_free_sec_dai(sec_dai);
+	return ret;
 }
 
 static int samsung_i2s_remove(struct platform_device *pdev)
-- 
1.9.1
