From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 07/22] ASoC: samsung: i2s: Move clk supplier data to common
 driver data structure
Date: Thu, 07 Feb 2019 18:00:15 +0100
Message-ID: <20190207170028.720-8-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170109epcas1p20929934c01ae67a05cd6a56f13ed8486@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Having the clocks provider data in struct samsung_i2s_priv, i.e. per the I2S
controller instance, rather than per CPU DAI better models the hardware and
simplifies the code a little. The clock provider is common for both DAIs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 68 ++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 994dcd4b01fb..978614673ffb 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -99,9 +99,7 @@ struct i2s_dai {
 
 	spinlock_t *lock;
 
-	/* Below fields are only valid if this is the primary FIFO */
-	struct clk *clk_table[3];
-	struct clk_onecell_data clk_data;
+	struct samsung_i2s_priv *priv;
 };
 
 /* Lock for cross i/f checks */
@@ -118,6 +116,10 @@ struct samsung_i2s_priv {
 	struct i2s_dai *dai;
 	struct snd_soc_dai_driver *dai_drv;
 	int num_dais;
+
+	/* The clock provider's data */
+	struct clk *clk_table[3];
+	struct clk_onecell_data clk_data;
 };
 
 struct i2s_dai *samsung_i2s_get_pri_dai(struct device *dev)
@@ -625,11 +627,10 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 	return ret;
 }
 
-static int i2s_set_fmt(struct snd_soc_dai *dai,
-	unsigned int fmt)
+static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
-	struct i2s_dai *other = get_other_dai(i2s);
 	int lrp_shift, sdf_shift, sdf_mask, lrp_rlow, mod_slave;
 	u32 mod, tmp = 0;
 	unsigned long flags;
@@ -687,8 +688,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
 		 * clock configuration assigned in DT is not overwritten.
 		 */
-		if (i2s->rclk_srcrate == 0 && i2s->clk_data.clks == NULL &&
-		    other->clk_data.clks == NULL)
+		if (i2s->rclk_srcrate == 0 && priv->clk_data.clks == NULL)
 			i2s_set_sysclk(dai, SAMSUNG_I2S_RCLKSRC_0,
 							0, SND_SOC_CLOCK_IN);
 		break;
@@ -725,8 +725,8 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 static int i2s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
-	struct i2s_dai *other = get_other_dai(i2s);
 	u32 mod, mask = 0, val = 0;
 	struct clk *rclksrc;
 	unsigned long flags;
@@ -811,10 +811,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 
 	i2s->frmclk = params_rate(params);
 
-	rclksrc = i2s->clk_table[CLK_I2S_RCLK_SRC];
-	if (!rclksrc || IS_ERR(rclksrc))
-		rclksrc = other->clk_table[CLK_I2S_RCLK_SRC];
-
+	rclksrc = priv->clk_table[CLK_I2S_RCLK_SRC];
 	if (rclksrc && !IS_ERR(rclksrc))
 		i2s->rclk_srcrate = clk_get_rate(rclksrc);
 
@@ -1221,31 +1218,30 @@ static int i2s_runtime_resume(struct device *dev)
 }
 #endif /* CONFIG_PM */
 
-static void i2s_unregister_clocks(struct i2s_dai *i2s)
+static void i2s_unregister_clocks(struct samsung_i2s_priv *priv)
 {
 	int i;
 
-	for (i = 0; i < i2s->clk_data.clk_num; i++) {
-		if (!IS_ERR(i2s->clk_table[i]))
-			clk_unregister(i2s->clk_table[i]);
+	for (i = 0; i < priv->clk_data.clk_num; i++) {
+		if (!IS_ERR(priv->clk_table[i]))
+			clk_unregister(priv->clk_table[i]);
 	}
 }
 
-static void i2s_unregister_clock_provider(struct platform_device *pdev)
+static void i2s_unregister_clock_provider(struct samsung_i2s_priv *priv)
 {
-	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(&pdev->dev);
-
-	of_clk_del_provider(pdev->dev.of_node);
-	i2s_unregister_clocks(i2s);
+	of_clk_del_provider(priv->pdev->dev.of_node);
+	i2s_unregister_clocks(priv);
 }
 
-static int i2s_register_clock_provider(struct platform_device *pdev)
+
+static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 {
 
 	const char * const i2s_clk_desc[] = { "cdclk", "rclk_src", "prescaler" };
 	const char *clk_name[2] = { "i2s_opclk0", "i2s_opclk1" };
 	const char *p_names[2] = { NULL };
-	struct device *dev = &pdev->dev;
+	struct device *dev = &priv->pdev->dev;
 	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(dev);
 	const struct samsung_i2s_variant_regs *reg_info = i2s->variant_regs;
 	const char *i2s_clk_name[ARRAY_SIZE(i2s_clk_desc)];
@@ -1277,37 +1273,37 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 		u32 val = readl(i2s->addr + I2SPSR);
 		writel(val | PSR_PSREN, i2s->addr + I2SPSR);
 
-		i2s->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(dev,
+		priv->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(dev,
 				i2s_clk_name[CLK_I2S_RCLK_SRC], p_names,
 				ARRAY_SIZE(p_names),
 				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->rclksrc_off,
 				1, 0, i2s->lock);
 
-		i2s->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(dev,
+		priv->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(dev,
 				i2s_clk_name[CLK_I2S_RCLK_PSR],
 				i2s_clk_name[CLK_I2S_RCLK_SRC],
 				CLK_SET_RATE_PARENT,
 				i2s->addr + I2SPSR, 8, 6, 0, i2s->lock);
 
 		p_names[0] = i2s_clk_name[CLK_I2S_RCLK_PSR];
-		i2s->clk_data.clk_num = 2;
+		priv->clk_data.clk_num = 2;
 	}
 
-	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(dev,
+	priv->clk_table[CLK_I2S_CDCLK] = clk_register_gate(dev,
 				i2s_clk_name[CLK_I2S_CDCLK], p_names[0],
 				CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->cdclkcon_off,
 				CLK_GATE_SET_TO_DISABLE, i2s->lock);
 
-	i2s->clk_data.clk_num += 1;
-	i2s->clk_data.clks = i2s->clk_table;
+	priv->clk_data.clk_num += 1;
+	priv->clk_data.clks = priv->clk_table;
 
 	ret = of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
-				  &i2s->clk_data);
+				  &priv->clk_data);
 	if (ret < 0) {
 		dev_err(dev, "failed to add clock provider: %d\n", ret);
-		i2s_unregister_clocks(i2s);
+		i2s_unregister_clocks(priv);
 	}
 
 	return ret;
@@ -1426,6 +1422,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pri_dai->dma_capture.addr_width = 4;
 	pri_dai->quirks = quirks;
 	pri_dai->variant_regs = i2s_dai_data->i2s_variant_regs;
+	pri_dai->priv = priv;
 
 	if (quirks & QUIRK_PRI_6CHAN)
 		pri_dai->drv->playback.channels_max = 6;
@@ -1454,6 +1451,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->quirks = quirks;
 		sec_dai->idma_playback.addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
+		sec_dai->priv = priv;
 		pri_dai->sec_dai = sec_dai;
 
 		ret = i2s_create_secondary_device(priv);
@@ -1485,11 +1483,11 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	ret = i2s_register_clock_provider(pdev);
+	ret = i2s_register_clock_provider(priv);
 	if (ret < 0)
 		goto err_disable_pm;
 
-	pri_dai->op_clk = clk_get_parent(pri_dai->clk_table[CLK_I2S_RCLK_SRC]);
+	pri_dai->op_clk = clk_get_parent(priv->clk_table[CLK_I2S_RCLK_SRC]);
 
 	return 0;
 
@@ -1512,7 +1510,7 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	i2s_unregister_clock_provider(pdev);
+	i2s_unregister_clock_provider(priv);
 	clk_disable_unprepare(pri_dai->clk);
 	pm_runtime_put_noidle(&pdev->dev);
 	i2s_delete_secondary_device(priv);
-- 
2.20.1
