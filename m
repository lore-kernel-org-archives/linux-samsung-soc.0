From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 08/21] ASoC: samsung: i2s: Drop spinlock pointer from
 i2s_dai data structure
Date: Tue, 12 Feb 2019 19:03:29 +0100
Message-ID: <20190212180342.32040-9-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180506epcas2p43d7efeaec4a4ff63d13e5f79b281707a@epcas2p4.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

As we now have the 'priv' pointer in most of the places we can use
priv->lock directly, dropping extra indirection in the SFR region
spinlock access.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/i2s.c | 51 +++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 05f1de208307..0da07975d59b 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -87,8 +87,6 @@ struct i2s_dai {
 	u32	quirks;
 	const struct samsung_i2s_variant_regs *variant_regs;
 
-	spinlock_t *lock;
-
 	struct samsung_i2s_priv *priv;
 };
 
@@ -103,7 +101,7 @@ struct samsung_i2s_priv {
 	void __iomem *addr;
 
 	/* Spinlock protecting access to the device's registers */
-	spinlock_t spinlock;
+	spinlock_t lock;
 
 	/* CPU DAIs and their corresponding drivers */
 	struct i2s_dai *dai;
@@ -527,9 +525,9 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 
 	pm_runtime_get_sync(dai->dev);
 
-	spin_lock_irqsave(i2s->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	mod = readl(priv->addr + I2SMOD);
-	spin_unlock_irqrestore(i2s->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	switch (clk_id) {
 	case SAMSUNG_I2S_OPCLK:
@@ -624,11 +622,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 		goto err;
 	}
 
-	spin_lock_irqsave(i2s->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	mod = readl(priv->addr + I2SMOD);
 	mod = (mod & ~mask) | val;
 	writel(mod, priv->addr + I2SMOD);
-	spin_unlock_irqrestore(i2s->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 done:
 	pm_runtime_put(dai->dev);
 
@@ -709,7 +707,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	pm_runtime_get_sync(dai->dev);
-	spin_lock_irqsave(i2s->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	mod = readl(priv->addr + I2SMOD);
 	/*
 	 * Don't change the I2S mode if any controller is active on this
@@ -717,7 +715,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	 */
 	if (any_active(i2s) &&
 		((mod & (sdf_mask | lrp_rlow | mod_slave)) != tmp)) {
-		spin_unlock_irqrestore(i2s->lock, flags);
+		spin_unlock_irqrestore(&priv->lock, flags);
 		pm_runtime_put(dai->dev);
 		dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
@@ -727,7 +725,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	mod &= ~(sdf_mask | lrp_rlow | mod_slave);
 	mod |= tmp;
 	writel(mod, priv->addr + I2SMOD);
-	spin_unlock_irqrestore(i2s->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 	pm_runtime_put(dai->dev);
 
 	return 0;
@@ -812,11 +810,11 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(i2s->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	mod = readl(priv->addr + I2SMOD);
 	mod = (mod & ~mask) | val;
 	writel(mod, priv->addr + I2SMOD);
-	spin_unlock_irqrestore(i2s->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
 
@@ -944,6 +942,7 @@ static int config_setup(struct i2s_dai *i2s)
 static int i2s_trigger(struct snd_pcm_substream *substream,
 	int cmd, struct snd_soc_dai *dai)
 {
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct i2s_dai *i2s = to_info(rtd->cpu_dai);
@@ -954,10 +953,10 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		pm_runtime_get_sync(dai->dev);
-		spin_lock_irqsave(i2s->lock, flags);
+		spin_lock_irqsave(&priv->lock, flags);
 
 		if (config_setup(i2s)) {
-			spin_unlock_irqrestore(i2s->lock, flags);
+			spin_unlock_irqrestore(&priv->lock, flags);
 			return -EINVAL;
 		}
 
@@ -966,12 +965,12 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 		else
 			i2s_txctrl(i2s, 1);
 
-		spin_unlock_irqrestore(i2s->lock, flags);
+		spin_unlock_irqrestore(&priv->lock, flags);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(i2s->lock, flags);
+		spin_lock_irqsave(&priv->lock, flags);
 
 		if (capture) {
 			i2s_rxctrl(i2s, 0);
@@ -981,7 +980,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 			i2s_fifo(i2s, FIC_TXFLUSH);
 		}
 
-		spin_unlock_irqrestore(i2s->lock, flags);
+		spin_unlock_irqrestore(&priv->lock, flags);
 		pm_runtime_put(dai->dev);
 		break;
 	}
@@ -1081,13 +1080,13 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	i2s->rfs = 0;
 	i2s->bfs = 0;
 
-	spin_lock_irqsave(i2s->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	i2s_txctrl(i2s, 0);
 	i2s_rxctrl(i2s, 0);
 	i2s_fifo(i2s, FIC_TXFLUSH);
 	i2s_fifo(other, FIC_TXFLUSH);
 	i2s_fifo(i2s, FIC_RXFLUSH);
-	spin_unlock_irqrestore(i2s->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	/* Gate CDCLK by default */
 	if (!is_opened(other))
@@ -1107,9 +1106,9 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 
 	if (!is_secondary(i2s)) {
 		if (i2s->quirks & QUIRK_NEED_RSTCLR) {
-			spin_lock_irqsave(i2s->lock, flags);
+			spin_lock_irqsave(&priv->lock, flags);
 			writel(0, i2s->priv->addr + I2SCON);
-			spin_unlock_irqrestore(i2s->lock, flags);
+			spin_unlock_irqrestore(&priv->lock, flags);
 		}
 	}
 
@@ -1316,13 +1315,13 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 				ARRAY_SIZE(p_names),
 				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				priv->addr + I2SMOD, reg_info->rclksrc_off,
-				1, 0, i2s->lock);
+				1, 0, &priv->lock);
 
 		priv->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(dev,
 				i2s_clk_name[CLK_I2S_RCLK_PSR],
 				i2s_clk_name[CLK_I2S_RCLK_SRC],
 				CLK_SET_RATE_PARENT,
-				priv->addr + I2SPSR, 8, 6, 0, i2s->lock);
+				priv->addr + I2SPSR, 8, 6, 0, &priv->lock);
 
 		p_names[0] = i2s_clk_name[CLK_I2S_RCLK_PSR];
 		priv->clk_data.clk_num = 2;
@@ -1332,7 +1331,7 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 				i2s_clk_name[CLK_I2S_CDCLK], p_names[0],
 				CLK_SET_RATE_PARENT,
 				priv->addr + I2SMOD, reg_info->cdclkcon_off,
-				CLK_GATE_SET_TO_DISABLE, i2s->lock);
+				CLK_GATE_SET_TO_DISABLE, &priv->lock);
 
 	priv->clk_data.clk_num += 1;
 	priv->clk_data.clks = priv->clk_table;
@@ -1410,8 +1409,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	pri_dai = &priv->dai[SAMSUNG_I2S_ID_PRIMARY - 1];
 
-	spin_lock_init(&priv->spinlock);
-	pri_dai->lock = &priv->spinlock;
+	spin_lock_init(&priv->lock);
 
 	if (!np) {
 		if (i2s_pdata == NULL) {
@@ -1473,7 +1471,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (quirks & QUIRK_SEC_DAI) {
 		sec_dai = &priv->dai[SAMSUNG_I2S_ID_SECONDARY - 1];
 
-		sec_dai->lock = &priv->spinlock;
 		sec_dai->variant_regs = pri_dai->variant_regs;
 		sec_dai->dma_playback.addr = regs_base + I2STXDS;
 		sec_dai->dma_playback.chan_name = "tx-sec";
-- 
2.20.1
