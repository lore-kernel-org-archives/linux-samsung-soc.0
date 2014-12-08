From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: request memory region in driver probe()
Date: Mon, 08 Dec 2014 15:36:16 +0100
Message-ID: <1418049376-32129-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14892 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755372AbaLHOgp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 09:36:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NG9000H5PX8OS10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Dec 2014 23:36:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The memory mapped registers region is common for both DAIs so request
it in the I2S platform device driver probe for the platform device
corresponding to the primary DAI, rather than in the ASoC DAI probe
callback. While at it switch to devm_ioremap_resource(). This also
drops the hard coded (0x100) register region size in the driver.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Tested on Odroid X2.

 sound/soc/samsung/i2s.c |   44 +++++++-------------------------------------
 1 file changed, 7 insertions(+), 37 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 26d1a1a..fff429da 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -59,10 +59,8 @@ struct samsung_i2s_dai_data {
 struct i2s_dai {
 	/* Platform device for this DAI */
 	struct platform_device *pdev;
-	/* IOREMAP'd SFRs */
+	/* Memory mapped SFR region */
 	void __iomem	*addr;
-	/* Physical base address of SFRs */
-	u32	base;
 	/* Rate of RCLK source clock */
 	unsigned long rclk_srcrate;
 	/* Frame Clock */
@@ -980,12 +978,6 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 		goto probe_exit;
 	}

-	i2s->addr = ioremap(i2s->base, 0x100);
-	if (i2s->addr == NULL) {
-		dev_err(&i2s->pdev->dev, "cannot ioremap registers\n");
-		return -ENXIO;
-	}
-
 	i2s->clk = clk_get(&i2s->pdev->dev, "iis");
 	if (IS_ERR(i2s->clk)) {
 		dev_err(&i2s->pdev->dev, "failed to get i2s_clock\n");
@@ -1002,7 +994,6 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);

 	if (other) {
-		other->addr = i2s->addr;
 		other->clk = i2s->clk;
 	}

@@ -1044,8 +1035,6 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)

 		clk_disable_unprepare(i2s->clk);
 		clk_put(i2s->clk);
-
-		iounmap(i2s->addr);
 	}

 	i2s->clk = NULL;
@@ -1164,7 +1153,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	u32 regs_base, quirks = 0, idma_addr = 0;
 	struct device_node *np = pdev->dev.of_node;
 	const struct samsung_i2s_dai_data *i2s_dai_data;
-	int ret = 0;

 	/* Call during Seconday interface registration */
 	i2s_dai_data = samsung_i2s_get_driver_data(pdev);
@@ -1229,16 +1217,10 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	}

 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Unable to get I2S SFR address\n");
-		return -ENXIO;
-	}
+	pri_dai->addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pri_dai->addr))
+		return PTR_ERR(pri_dai->addr);

-	if (!request_mem_region(res->start, resource_size(res),
-							"samsung-i2s")) {
-		dev_err(&pdev->dev, "Unable to request SFR region\n");
-		return -EBUSY;
-	}
 	regs_base = res->start;

 	pri_dai->dma_playback.dma_addr = regs_base + I2STXD;
@@ -1247,7 +1229,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pri_dai->dma_capture.ch_name = "rx";
 	pri_dai->dma_playback.dma_size = 4;
 	pri_dai->dma_capture.dma_size = 4;
-	pri_dai->base = regs_base;
 	pri_dai->quirks = quirks;
 	pri_dai->variant_regs = i2s_dai_data->i2s_variant_regs;

@@ -1258,8 +1239,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai = i2s_alloc_dai(pdev, true);
 		if (!sec_dai) {
 			dev_err(&pdev->dev, "Unable to alloc I2S_sec\n");
-			ret = -ENOMEM;
-			goto err;
+			return -ENOMEM;
 		}
 		sec_dai->dma_playback.dma_addr = regs_base + I2STXDS;
 		sec_dai->dma_playback.ch_name = "tx-sec";
@@ -1271,7 +1251,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		}

 		sec_dai->dma_playback.dma_size = 4;
-		sec_dai->base = regs_base;
+		sec_dai->addr = pri_dai->addr;
 		sec_dai->quirks = quirks;
 		sec_dai->idma_playback.dma_addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
@@ -1280,8 +1260,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)

 	if (i2s_pdata && i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
 		dev_err(&pdev->dev, "Unable to configure gpio\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}

 	devm_snd_soc_register_component(&pri_dai->pdev->dev,
@@ -1293,17 +1272,11 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	samsung_asoc_dma_platform_register(&pdev->dev);

 	return 0;
-err:
-	if (res)
-		release_mem_region(regs_base, resource_size(res));
-
-	return ret;
 }

 static int samsung_i2s_remove(struct platform_device *pdev)
 {
 	struct i2s_dai *i2s, *other;
-	struct resource *res;

 	i2s = dev_get_drvdata(&pdev->dev);
 	other = i2s->pri_dai ? : i2s->sec_dai;
@@ -1313,9 +1286,6 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 		other->sec_dai = NULL;
 	} else {
 		pm_runtime_disable(&pdev->dev);
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (res)
-			release_mem_region(res->start, resource_size(res));
 	}

 	i2s->pri_dai = NULL;
--
1.7.9.5
