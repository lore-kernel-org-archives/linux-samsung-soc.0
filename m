From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/5] ASoC: samsung: i2s: Remove virtual device for secondary DAI
Date: Thu, 29 Dec 2016 12:34:03 +0100
Message-ID: <1483011247-21613-2-git-send-email-m.szyprowski@samsung.com>
References: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161229113425eucas1p2600ba7e4337e90f65c0bc60bb4a9c2ec@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53688 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751358AbcL2Lea (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 06:34:30 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIY00BO72TELZ00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2016 11:34:27 +0000 (GMT)
In-reply-to: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

For some unknown (maybe historical?) reasons support for secondary I2S DAI
was implemented by adding additional virtual platform device, which was
then probed again with the main I2S driver. This pattern is really hard
to follow and provides no benefits, so lets remove this hack and register
both DAIs during linear probe of Exynos I2S controller driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/i2s.c | 102 ++++++++++++------------------------------------
 1 file changed, 26 insertions(+), 76 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index e00974bc5616..ce4e70ef5568 100644
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
@@ -1066,7 +1060,6 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
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
@@ -1231,22 +1206,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
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
@@ -1318,6 +1277,12 @@ static int samsung_i2s_probe(struct platform_device *pdev)
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
@@ -1342,6 +1307,17 @@ static int samsung_i2s_probe(struct platform_device *pdev)
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
@@ -1350,11 +1326,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	ret = devm_snd_soc_register_component(&pri_dai->pdev->dev,
-					&samsung_i2s_component,
-					&pri_dai->i2s_dai_drv, 1);
-	if (ret < 0)
-		goto err_free_dai;
+	dev_set_drvdata(&pdev->dev, pri_dai);
 
 
 	pm_runtime_enable(&pdev->dev);
@@ -1364,9 +1336,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		return 0;
 
 	pm_runtime_disable(&pdev->dev);
-err_free_dai:
-	if (sec_dai)
-		i2s_free_sec_dai(sec_dai);
 err_disable_clk:
 	clk_disable_unprepare(pri_dai->clk);
 	return ret;
@@ -1374,25 +1343,18 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
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
@@ -1454,49 +1416,37 @@ static int samsung_i2s_remove(struct platform_device *pdev)
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
1.9.1
