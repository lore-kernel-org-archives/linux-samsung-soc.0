From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 09/22] ASoC: samsung: i2s: Move core clk to the driver
 common data structure
Date: Thu, 07 Feb 2019 18:00:17 +0100
Message-ID: <20190207170028.720-10-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170116epcas2p1e0768a74062c8af83842ddb59309850f@epcas2p1.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The core clock is also common for both CPU DAIs so move it to
the driver's private data structure.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b435e6226ec2..c2c3a3286c63 100644
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
 
 	if (!priv)
 		return 0;
@@ -1536,7 +1537,7 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	i2s_unregister_clock_provider(priv);
-	clk_disable_unprepare(pri_dai->clk);
+	clk_disable_unprepare(priv->clk);
 	pm_runtime_put_noidle(&pdev->dev);
 	i2s_delete_secondary_device(priv);
 
-- 
2.20.1
