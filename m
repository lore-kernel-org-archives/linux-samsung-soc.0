From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Move core clk to the driver common data structure" to the asoc tree
Date: Wed, 13 Feb 2019 11:53:40 +0000 (GMT)
Message-ID: <20190213115340.454001128158@debutante.sirena.org.uk>
References: <20190212180342.32040-5-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212180342.32040-5-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.comkrzk@kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: i2s: Move core clk to the driver common data structure

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

>From b5d015e68e6ce36e0373cda3537009aaa96b5902 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 12 Feb 2019 19:03:25 +0100
Subject: [PATCH] ASoC: samsung: i2s: Move core clk to the driver common data
 structure

The core clock is also common for both CPU DAIs so move it to
the driver's private data structure.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 29bcfca20572..159c19fdb662 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -71,8 +71,6 @@ struct i2s_dai {
 	 * 0 indicates CPU driver is free to choose any value.
 	 */
 	unsigned rfs, bfs;
-	/* I2S Controller's core clock */
-	struct clk *clk;
 	/* Clock for generating I2S signals */
 	struct clk *op_clk;
 	/* Pointer to the Primary_Fifo if this is Sec_Fifo, NULL otherwise */
@@ -117,6 +115,9 @@ struct samsung_i2s_priv {
 	struct snd_soc_dai_driver *dai_drv;
 	int num_dais;
 
+	/* The I2S controller's core clock */
+	struct clk *clk;
+
 	/* The clock provider's data */
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
@@ -1205,6 +1206,7 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 #ifdef CONFIG_PM
 static int i2s_runtime_suspend(struct device *dev)
 {
+	struct samsung_i2s_priv *priv = dev_get_drvdata(dev);
 	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(dev);
 
 	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
@@ -1213,24 +1215,25 @@ static int i2s_runtime_suspend(struct device *dev)
 
 	if (i2s->op_clk)
 		clk_disable_unprepare(i2s->op_clk);
-	clk_disable_unprepare(i2s->clk);
+	clk_disable_unprepare(priv->clk);
 
 	return 0;
 }
 
 static int i2s_runtime_resume(struct device *dev)
 {
+	struct samsung_i2s_priv *priv = dev_get_drvdata(dev);
 	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(dev);
 	int ret;
 
-	ret = clk_prepare_enable(i2s->clk);
+	ret = clk_prepare_enable(priv->clk);
 	if (ret)
 		return ret;
 
 	if (i2s->op_clk) {
 		ret = clk_prepare_enable(i2s->op_clk);
 		if (ret) {
-			clk_disable_unprepare(i2s->clk);
+			clk_disable_unprepare(priv->clk);
 			return ret;
 		}
 	}
@@ -1428,13 +1431,13 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	regs_base = res->start;
 
-	pri_dai->clk = devm_clk_get(&pdev->dev, "iis");
-	if (IS_ERR(pri_dai->clk)) {
+	priv->clk = devm_clk_get(&pdev->dev, "iis");
+	if (IS_ERR(priv->clk)) {
 		dev_err(&pdev->dev, "Failed to get iis clock\n");
-		return PTR_ERR(pri_dai->clk);
+		return PTR_ERR(priv->clk);
 	}
 
-	ret = clk_prepare_enable(pri_dai->clk);
+	ret = clk_prepare_enable(priv->clk);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "failed to enable clock: %d\n", ret);
 		return ret;
@@ -1472,7 +1475,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 		sec_dai->dma_playback.addr_width = 4;
 		sec_dai->addr = pri_dai->addr;
-		sec_dai->clk = pri_dai->clk;
 		sec_dai->quirks = quirks;
 		sec_dai->idma_playback.addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
@@ -1519,7 +1521,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 err_disable_pm:
 	pm_runtime_disable(&pdev->dev);
 err_disable_clk:
-	clk_disable_unprepare(pri_dai->clk);
+	clk_disable_unprepare(priv->clk);
 	i2s_delete_secondary_device(priv);
 	return ret;
 }
@@ -1527,7 +1529,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 static int samsung_i2s_remove(struct platform_device *pdev)
 {
 	struct samsung_i2s_priv *priv = dev_get_drvdata(&pdev->dev);
-	struct i2s_dai *pri_dai = samsung_i2s_get_pri_dai(&pdev->dev);
 
 	/* The secondary device has no driver data assigned */
 	if (!priv)
@@ -1537,7 +1538,7 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	i2s_unregister_clock_provider(priv);
-	clk_disable_unprepare(pri_dai->clk);
+	clk_disable_unprepare(priv->clk);
 	pm_runtime_put_noidle(&pdev->dev);
 	i2s_delete_secondary_device(priv);
 
-- 
2.20.1
