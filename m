From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Restore support for the secondary PCM" to the asoc tree
Date: Wed, 13 Feb 2019 11:53:46 +0000 (GMT)
Message-ID: <20190213115346.92B4A1128158@debutante.sirena.org.uk>
References: <20190212180342.32040-2-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212180342.32040-2-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.comkrzk@kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: i2s: Restore support for the secondary PCM

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From 7196c64c7d0c6d421c9bb721d8d66c6d0edc5385 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 12 Feb 2019 19:03:22 +0100
Subject: [PATCH] ASoC: samsung: i2s: Restore support for the secondary PCM

This patch introduces again registration of additional platform device as
we still need it for registering the secondary dmaengine PCM component.

This patch in most part is a revert of changes done in commit
be2c92eb64023e ("ASoC: samsung: i2s: Remove virtual device for secondary DAI")

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 52 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 455bc65d115a..cc983afae735 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -109,6 +109,7 @@ static DEFINE_SPINLOCK(lock);
 
 struct samsung_i2s_priv {
 	struct platform_device *pdev;
+	struct platform_device *pdev_sec;
 
 	/* Spinlock protecting access to the device's registers */
 	spinlock_t spinlock;
@@ -1306,6 +1307,34 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 	return ret;
 }
 
+/* Create platform device for the secondary PCM */
+static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_simple("samsung-i2s-sec", -1, NULL, 0);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = device_attach(&pdev->dev);
+	if (ret < 0) {
+		dev_info(&pdev->dev, "device_attach() failed\n");
+		return ret;
+	}
+
+	priv->pdev_sec = pdev;
+
+	return 0;
+}
+
+static void i2s_delete_secondary_device(struct samsung_i2s_priv *priv)
+{
+	if (priv->pdev_sec) {
+		platform_device_del(priv->pdev_sec);
+		priv->pdev_sec = NULL;
+	}
+}
 static int samsung_i2s_probe(struct platform_device *pdev)
 {
 	struct i2s_dai *pri_dai, *sec_dai = NULL;
@@ -1323,13 +1352,15 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		i2s_dai_data = (struct samsung_i2s_dai_data *)
 				platform_get_device_id(pdev)->driver_data;
 
+	/* Nothing to do if it is the secondary device probe */
+	if (!i2s_dai_data)
+		return 0;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	quirks = np ? i2s_dai_data->quirks : i2s_pdata->type.quirks;
-	quirks &= ~(QUIRK_SEC_DAI | QUIRK_SUPPORTS_IDMA);
-
 	num_dais = (quirks & QUIRK_SEC_DAI) ? 2 : 1;
 	priv->pdev = pdev;
 
@@ -1419,8 +1450,13 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->pri_dai = pri_dai;
 		pri_dai->sec_dai = sec_dai;
 
-		ret = samsung_asoc_dma_platform_register(&pdev->dev,
-					sec_dai->filter, "tx-sec", NULL, NULL);
+		ret = i2s_create_secondary_device(priv);
+		if (ret < 0)
+			goto err_disable_clk;
+
+		ret = samsung_asoc_dma_platform_register(&priv->pdev_sec->dev,
+						sec_dai->filter, "tx-sec", NULL,
+						&pdev->dev);
 		if (ret < 0)
 			goto err_disable_clk;
 
@@ -1455,6 +1491,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 err_disable_clk:
 	clk_disable_unprepare(pri_dai->clk);
+	i2s_delete_secondary_device(priv);
 	return ret;
 }
 
@@ -1463,12 +1500,17 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	struct samsung_i2s_priv *priv = dev_get_drvdata(&pdev->dev);
 	struct i2s_dai *pri_dai = samsung_i2s_get_pri_dai(&pdev->dev);
 
+	/* The secondary device has no driver data assigned */
+	if (!priv)
+		return 0;
+
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	i2s_unregister_clock_provider(pdev);
 	clk_disable_unprepare(pri_dai->clk);
 	pm_runtime_put_noidle(&pdev->dev);
+	i2s_delete_secondary_device(priv);
 
 	return 0;
 }
@@ -1566,6 +1608,8 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
 	{
 		.name           = "samsung-i2s",
 		.driver_data	= (kernel_ulong_t)&i2sv3_dai_type,
+	}, {
+		.name           = "samsung-i2s-sec",
 	},
 	{},
 };
-- 
2.20.1
