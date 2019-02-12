From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 05/21] ASoC: samsung: i2s: Move opclk data to common
 driver data structure
Date: Tue, 12 Feb 2019 19:03:26 +0100
Message-ID: <20190212180342.32040-6-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180456epcas1p1fd8b2fb8101d4848e56911f16fa4ffef@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The clock for generating I2S signals is also common for both CPU DAIs
so move it to the driver's common data structure.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/i2s.c | 70 +++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 159c19fdb662..d8414d781f83 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -62,8 +62,6 @@ struct i2s_dai {
 	struct platform_device *pdev;
 	/* Memory mapped SFR region */
 	void __iomem	*addr;
-	/* Rate of RCLK source clock */
-	unsigned long rclk_srcrate;
 	/* Frame Clock */
 	unsigned frmclk;
 	/*
@@ -71,8 +69,6 @@ struct i2s_dai {
 	 * 0 indicates CPU driver is free to choose any value.
 	 */
 	unsigned rfs, bfs;
-	/* Clock for generating I2S signals */
-	struct clk *op_clk;
 	/* Pointer to the Primary_Fifo if this is Sec_Fifo, NULL otherwise */
 	struct i2s_dai *pri_dai;
 	/* Pointer to the Secondary_Fifo if it has one, NULL otherwise */
@@ -118,6 +114,12 @@ struct samsung_i2s_priv {
 	/* The I2S controller's core clock */
 	struct clk *clk;
 
+	/* Clock for generating I2S signals */
+	struct clk *op_clk;
+
+	/* Rate of RCLK source clock */
+	unsigned long rclk_srcrate;
+
 	/* The clock provider's data */
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
@@ -496,9 +498,10 @@ static inline void i2s_fifo(struct i2s_dai *i2s, u32 flush)
 	writel(readl(fic) & ~flush, fic);
 }
 
-static int i2s_set_sysclk(struct snd_soc_dai *dai,
-	  int clk_id, unsigned int rfs, int dir)
+static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
+			  int dir)
 {
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
 	const struct samsung_i2s_variant_regs *i2s_regs = i2s->variant_regs;
@@ -554,44 +557,39 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 			clk_id = 1;
 
 		if (!any_active(i2s)) {
-			if (i2s->op_clk && !IS_ERR(i2s->op_clk)) {
+			if (priv->op_clk && !IS_ERR(priv->op_clk)) {
 				if ((clk_id && !(mod & rsrc_mask)) ||
 					(!clk_id && (mod & rsrc_mask))) {
-					clk_disable_unprepare(i2s->op_clk);
-					clk_put(i2s->op_clk);
+					clk_disable_unprepare(priv->op_clk);
+					clk_put(priv->op_clk);
 				} else {
-					i2s->rclk_srcrate =
-						clk_get_rate(i2s->op_clk);
+					priv->rclk_srcrate =
+						clk_get_rate(priv->op_clk);
 					goto done;
 				}
 			}
 
 			if (clk_id)
-				i2s->op_clk = clk_get(&i2s->pdev->dev,
+				priv->op_clk = clk_get(&i2s->pdev->dev,
 						"i2s_opclk1");
 			else
-				i2s->op_clk = clk_get(&i2s->pdev->dev,
+				priv->op_clk = clk_get(&i2s->pdev->dev,
 						"i2s_opclk0");
 
-			if (WARN_ON(IS_ERR(i2s->op_clk))) {
-				ret = PTR_ERR(i2s->op_clk);
-				i2s->op_clk = NULL;
+			if (WARN_ON(IS_ERR(priv->op_clk))) {
+				ret = PTR_ERR(priv->op_clk);
+				priv->op_clk = NULL;
 				goto err;
 			}
 
-			ret = clk_prepare_enable(i2s->op_clk);
+			ret = clk_prepare_enable(priv->op_clk);
 			if (ret) {
-				clk_put(i2s->op_clk);
-				i2s->op_clk = NULL;
+				clk_put(priv->op_clk);
+				priv->op_clk = NULL;
 				goto err;
 			}
-			i2s->rclk_srcrate = clk_get_rate(i2s->op_clk);
+			priv->rclk_srcrate = clk_get_rate(priv->op_clk);
 
-			/* Over-ride the other's */
-			if (other) {
-				other->op_clk = i2s->op_clk;
-				other->rclk_srcrate = i2s->rclk_srcrate;
-			}
 		} else if ((!clk_id && (mod & rsrc_mask))
 				|| (clk_id && !(mod & rsrc_mask))) {
 			dev_err(&i2s->pdev->dev,
@@ -600,8 +598,6 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 			goto err;
 		} else {
 			/* Call can't be on the active DAI */
-			i2s->op_clk = other->op_clk;
-			i2s->rclk_srcrate = other->rclk_srcrate;
 			goto done;
 		}
 
@@ -689,7 +685,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
 		 * clock configuration assigned in DT is not overwritten.
 		 */
-		if (i2s->rclk_srcrate == 0 && priv->clk_data.clks == NULL)
+		if (priv->rclk_srcrate == 0 && priv->clk_data.clks == NULL)
 			i2s_set_sysclk(dai, SAMSUNG_I2S_RCLKSRC_0,
 							0, SND_SOC_CLOCK_IN);
 		break;
@@ -814,7 +810,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 
 	rclksrc = priv->clk_table[CLK_I2S_RCLK_SRC];
 	if (rclksrc && !IS_ERR(rclksrc))
-		i2s->rclk_srcrate = clk_get_rate(rclksrc);
+		priv->rclk_srcrate = clk_get_rate(rclksrc);
 
 	return 0;
 }
@@ -872,6 +868,7 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,
 
 static int config_setup(struct i2s_dai *i2s)
 {
+	struct samsung_i2s_priv *priv = i2s->priv;
 	struct i2s_dai *other = get_other_dai(i2s);
 	unsigned rfs, bfs, blc;
 	u32 psr;
@@ -920,11 +917,11 @@ static int config_setup(struct i2s_dai *i2s)
 		return 0;
 
 	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
-		psr = i2s->rclk_srcrate / i2s->frmclk / rfs;
+		psr = priv->rclk_srcrate / i2s->frmclk / rfs;
 		writel(((psr - 1) << 8) | PSR_PSREN, i2s->addr + I2SPSR);
 		dev_dbg(&i2s->pdev->dev,
 			"RCLK_SRC=%luHz PSR=%u, RCLK=%dfs, BCLK=%dfs\n",
-				i2s->rclk_srcrate, psr, rfs, bfs);
+				priv->rclk_srcrate, psr, rfs, bfs);
 	}
 
 	return 0;
@@ -1067,7 +1064,6 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
 	i2s->bfs = 0;
-	i2s->rclk_srcrate = 0;
 
 	spin_lock_irqsave(i2s->lock, flags);
 	i2s_txctrl(i2s, 0);
@@ -1213,8 +1209,8 @@ static int i2s_runtime_suspend(struct device *dev)
 	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
 	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
 
-	if (i2s->op_clk)
-		clk_disable_unprepare(i2s->op_clk);
+	if (priv->op_clk)
+		clk_disable_unprepare(priv->op_clk);
 	clk_disable_unprepare(priv->clk);
 
 	return 0;
@@ -1230,8 +1226,8 @@ static int i2s_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (i2s->op_clk) {
-		ret = clk_prepare_enable(i2s->op_clk);
+	if (priv->op_clk) {
+		ret = clk_prepare_enable(priv->op_clk);
 		if (ret) {
 			clk_disable_unprepare(priv->clk);
 			return ret;
@@ -1514,7 +1510,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_disable_pm;
 
-	pri_dai->op_clk = clk_get_parent(priv->clk_table[CLK_I2S_RCLK_SRC]);
+	priv->op_clk = clk_get_parent(priv->clk_table[CLK_I2S_RCLK_SRC]);
 
 	return 0;
 
-- 
2.20.1
