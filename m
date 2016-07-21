From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Fix error paths in the I2S driver's probe()" to the asoc tree
Date: Thu, 21 Jul 2016 19:31:47 +0100
Message-ID: <E1bQIl9-00013i-SN@debutante>
References: <1469124230-8583-2-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41998 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752013AbcGUSb4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 14:31:56 -0400
In-Reply-To: <1469124230-8583-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

The patch

   ASoC: samsung: Fix error paths in the I2S driver's probe()

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 2b960386cb75bd332a132c44c9ec69bd1f3122d8 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 21 Jul 2016 20:03:49 +0200
Subject: [PATCH] ASoC: samsung: Fix error paths in the I2S driver's probe()

Ensure they secondary DAI device is freed properly when asoc_dma_platform
registration fails.  This change is needed for proper deferred probe support
and will help preventing situations when the CPU DAI's initialization
completes without required DMA resources.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 27ca116ef31f..2bb35502b070 100644
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
2.8.1
