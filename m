From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Remove virtual device for secondary DAI" to the asoc tree
Date: Sat, 31 Dec 2016 19:19:28 +0000
Message-ID: <E1cNPBg-00040u-AK@debutante>
References: <1483011247-21613-2-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52048 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbcLaTTf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Dec 2016 14:19:35 -0500
In-Reply-To: <1483011247-21613-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

The patch

   ASoC: samsung: i2s: Remove virtual device for secondary DAI

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

>From be2c92eb64023e294d6bb9232578963670bb121b Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 29 Dec 2016 12:34:03 +0100
Subject: [PATCH] ASoC: samsung: i2s: Remove virtual device for secondary DAI

For some unknown (maybe historical?) reasons support for secondary I2S DAI
was implemented by adding additional virtual platform device, which was
then probed again with the main I2S driver. This pattern is really hard
to follow and provides no benefits, so lets remove this hack and register
both DAIs during linear probe of Exynos I2S controller driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 102 ++++++++++++------------------------------------
 1 file changed, 26 insertions(+), 76 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d55326289a4a..10b19a4afe86 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -34,11 +34,6 @@
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
-enum samsung_dai_type {
-	TYPE_PRI,
-	TYPE_SEC,
-};
-
 struct samsung_i2s_variant_regs {
 	unsigned int	bfs_off;
 	unsigned int	rfs_off;
@@ -54,7 +49,6 @@ struct samsung_i2s_variant_regs {
 };
 
 struct samsung_i2s_dai_data {
-	int dai_type;
 	u32 quirks;
 	const struct samsung_i2s_variant_regs *i2s_variant_regs;
 };
@@ -1066,7 +1060,6 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 {
 	struct i2s_dai *i2s;
-	int ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dai), GFP_KERNEL);
 	if (i2s == NULL)
@@ -1091,28 +1084,10 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 		i2s->i2s_dai_drv.capture.channels_max = 2;
 		i2s->i2s_dai_drv.capture.rates = SAMSUNG_I2S_RATES;
 		i2s->i2s_dai_drv.capture.formats = SAMSUNG_I2S_FMTS;
-		dev_set_drvdata(&i2s->pdev->dev, i2s);
-	} else {	/* Create a new platform_device for Secondary */
-		i2s->pdev = platform_device_alloc("samsung-i2s-sec", -1);
-		if (!i2s->pdev)
-			return NULL;
-
-		i2s->pdev->dev.parent = &pdev->dev;
-
-		platform_set_drvdata(i2s->pdev, i2s);
-		ret = platform_device_add(i2s->pdev);
-		if (ret < 0)
-			return NULL;
 	}
-
 	return i2s;
 }
 
-static void i2s_free_sec_dai(struct i2s_dai *i2s)
-{
-	platform_device_del(i2s->pdev);
-}
-
 #ifdef CONFIG_PM
 static int i2s_runtime_suspend(struct device *dev)
 {
@@ -1230,22 +1205,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		i2s_dai_data = (struct samsung_i2s_dai_data *)
 				platform_get_device_id(pdev)->driver_data;
 
-	/* Call during the secondary interface registration */
-	if (i2s_dai_data->dai_type == TYPE_SEC) {
-		sec_dai = dev_get_drvdata(&pdev->dev);
-		if (!sec_dai) {
-			dev_err(&pdev->dev, "Unable to get drvdata\n");
-			return -EFAULT;
-		}
-		ret = samsung_asoc_dma_platform_register(&pdev->dev,
-					sec_dai->filter, "tx-sec", NULL);
-		if (ret != 0)
-			return ret;
-
-		return devm_snd_soc_register_component(&sec_dai->pdev->dev,
-						&samsung_i2s_component,
-						&sec_dai->i2s_dai_drv, 1);
-	}
 
 	pri_dai = i2s_alloc_dai(pdev, false);
 	if (!pri_dai) {
@@ -1312,6 +1271,12 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_disable_clk;
 
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					&samsung_i2s_component,
+					&pri_dai->i2s_dai_drv, 1);
+	if (ret < 0)
+		goto err_disable_clk;
+
 	if (quirks & QUIRK_SEC_DAI) {
 		sec_dai = i2s_alloc_dai(pdev, true);
 		if (!sec_dai) {
@@ -1336,6 +1301,17 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->idma_playback.addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
 		pri_dai->sec_dai = sec_dai;
+
+		ret = samsung_asoc_dma_platform_register(&pdev->dev,
+					sec_dai->filter, "tx-sec", NULL);
+		if (ret < 0)
+			goto err_disable_clk;
+
+		ret = devm_snd_soc_register_component(&pdev->dev,
+						&samsung_i2s_component,
+						&sec_dai->i2s_dai_drv, 1);
+		if (ret < 0)
+			goto err_disable_clk;
 	}
 
 	if (i2s_pdata && i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
@@ -1344,11 +1320,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	ret = devm_snd_soc_register_component(&pri_dai->pdev->dev,
-					&samsung_i2s_component,
-					&pri_dai->i2s_dai_drv, 1);
-	if (ret < 0)
-		goto err_free_dai;
+	dev_set_drvdata(&pdev->dev, pri_dai);
 
 
 	pm_runtime_enable(&pdev->dev);
@@ -1358,9 +1330,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		return 0;
 
 	pm_runtime_disable(&pdev->dev);
-err_free_dai:
-	if (sec_dai)
-		i2s_free_sec_dai(sec_dai);
 err_disable_clk:
 	clk_disable_unprepare(pri_dai->clk);
 	return ret;
@@ -1368,25 +1337,18 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 static int samsung_i2s_remove(struct platform_device *pdev)
 {
-	struct i2s_dai *i2s, *other;
+	struct i2s_dai *pri_dai, *sec_dai;
 
-	i2s = dev_get_drvdata(&pdev->dev);
-	other = get_other_dai(i2s);
+	pri_dai = dev_get_drvdata(&pdev->dev);
+	sec_dai = pri_dai->sec_dai;
 
-	if (other) {
-		other->pri_dai = NULL;
-		other->sec_dai = NULL;
-	} else {
-		pm_runtime_disable(&pdev->dev);
-	}
+	pri_dai->sec_dai = NULL;
+	sec_dai->pri_dai = NULL;
 
-	if (!is_secondary(i2s)) {
-		i2s_unregister_clock_provider(pdev);
-		clk_disable_unprepare(i2s->clk);
-	}
+	pm_runtime_disable(&pdev->dev);
 
-	i2s->pri_dai = NULL;
-	i2s->sec_dai = NULL;
+	i2s_unregister_clock_provider(pdev);
+	clk_disable_unprepare(pri_dai->clk);
 
 	return 0;
 }
@@ -1448,49 +1410,37 @@ static const struct samsung_i2s_variant_regs i2sv5_i2s1_regs = {
 };
 
 static const struct samsung_i2s_dai_data i2sv3_dai_type = {
-	.dai_type = TYPE_PRI,
 	.quirks = QUIRK_NO_MUXPSR,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv5_dai_type = {
-	.dai_type = TYPE_PRI,
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_IDMA,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv6_dai_type = {
-	.dai_type = TYPE_PRI,
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM | QUIRK_SUPPORTS_IDMA,
 	.i2s_variant_regs = &i2sv6_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv7_dai_type = {
-	.dai_type = TYPE_PRI,
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM,
 	.i2s_variant_regs = &i2sv7_regs,
 };
 
 static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 = {
-	.dai_type = TYPE_PRI,
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_NEED_RSTCLR,
 	.i2s_variant_regs = &i2sv5_i2s1_regs,
 };
 
-static const struct samsung_i2s_dai_data samsung_dai_type_sec = {
-	.dai_type = TYPE_SEC,
-};
-
 static const struct platform_device_id samsung_i2s_driver_ids[] = {
 	{
 		.name           = "samsung-i2s",
 		.driver_data	= (kernel_ulong_t)&i2sv3_dai_type,
-	}, {
-		.name           = "samsung-i2s-sec",
-		.driver_data    = (kernel_ulong_t)&samsung_dai_type_sec,
 	},
 	{},
 };
-- 
2.11.0
