From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 15/22] ASoC: samsung: i2s: Move quirks data to common driver
 data structure
Date: Thu, 07 Feb 2019 18:00:23 +0100
Message-ID: <20190207170028.720-16-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170138epcas2p31134b2beee877922d27fab5c79fdc7b1@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The quirk flags are common for the primary and the secondary DAI
so move respective field from struct i2s_dai to common driver data
structure.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 6ea0f0050fc8..e11d678e9c1f 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -84,7 +84,6 @@ struct i2s_dai {
 	struct snd_dmaengine_dai_dma_data dma_capture;
 	struct snd_dmaengine_dai_dma_data idma_playback;
 	dma_filter_fn filter;
-	u32	quirks;
 
 	struct samsung_i2s_priv *priv;
 };
@@ -122,19 +121,13 @@ struct samsung_i2s_priv {
 	u32 suspend_i2spsr;
 
 	const struct samsung_i2s_variant_regs *variant_regs;
+	u32 quirks;
 
 	/* The clock provider's data */
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
 };
 
-struct i2s_dai *samsung_i2s_get_pri_dai(struct device *dev)
-{
-	struct samsung_i2s_priv *priv = dev_get_drvdata(dev);
-
-	return &priv->dai[SAMSUNG_I2S_ID_PRIMARY - 1];
-}
-
 /* Returns true if this is the 'overlay' stereo DAI */
 static inline bool is_secondary(struct i2s_dai *i2s)
 {
@@ -343,7 +336,7 @@ static inline void set_bfs(struct i2s_dai *i2s, unsigned bfs)
 {
 	struct samsung_i2s_priv *priv = i2s->priv;
 	u32 mod = readl(priv->addr + I2SMOD);
-	int tdm = i2s->quirks & QUIRK_SUPPORTS_TDM;
+	int tdm = priv->quirks & QUIRK_SUPPORTS_TDM;
 	int bfs_shift = priv->variant_regs->bfs_off;
 
 	/* Non-TDM I2S controllers do not support BCLK > 48 * FS */
@@ -563,7 +556,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 	case SAMSUNG_I2S_RCLKSRC_1: /* clock corrsponding to IISMOD[10] := 1 */
 		mask = 1 << i2s_regs->rclksrc_off;
 
-		if ((i2s->quirks & QUIRK_NO_MUXPSR)
+		if ((priv->quirks & QUIRK_NO_MUXPSR)
 				|| (clk_id == SAMSUNG_I2S_RCLKSRC_0))
 			clk_id = 0;
 		else
@@ -830,8 +823,9 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 
 /* We set constraints on the substream acc to the version of I2S */
 static int i2s_startup(struct snd_pcm_substream *substream,
-	  struct snd_soc_dai *dai)
+	struct snd_soc_dai *dai)
 {
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
 	unsigned long flags;
@@ -847,7 +841,7 @@ static int i2s_startup(struct snd_pcm_substream *substream,
 	else
 		i2s->mode |= DAI_MANAGER;
 
-	if (!any_active(i2s) && (i2s->quirks & QUIRK_NEED_RSTCLR))
+	if (!any_active(i2s) && (priv->quirks & QUIRK_NEED_RSTCLR))
 		writel(CON_RSTCLR, i2s->priv->addr + I2SCON);
 
 	spin_unlock_irqrestore(&lock, flags);
@@ -929,7 +923,7 @@ static int config_setup(struct i2s_dai *i2s)
 	if (is_slave(i2s))
 		return 0;
 
-	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
+	if (!(priv->quirks & QUIRK_NO_MUXPSR)) {
 		psr = priv->rclk_srcrate / i2s->frmclk / rfs;
 		writel(((psr - 1) << 8) | PSR_PSREN, priv->addr + I2SPSR);
 		dev_dbg(&i2s->pdev->dev,
@@ -1068,10 +1062,10 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 		snd_soc_dai_init_dma_data(dai, &i2s->dma_playback,
 					   &i2s->dma_capture);
 
-		if (i2s->quirks & QUIRK_NEED_RSTCLR)
+		if (priv->quirks & QUIRK_NEED_RSTCLR)
 			writel(CON_RSTCLR, priv->addr + I2SCON);
 
-		if (i2s->quirks & QUIRK_SUPPORTS_IDMA)
+		if (priv->quirks & QUIRK_SUPPORTS_IDMA)
 			idma_reg_addr_init(priv->addr,
 					i2s->sec_dai->idma_playback.addr);
 	}
@@ -1099,13 +1093,14 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 
 static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 {
+	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	unsigned long flags;
 
 	pm_runtime_get_sync(dai->dev);
 
 	if (!is_secondary(i2s)) {
-		if (i2s->quirks & QUIRK_NEED_RSTCLR) {
+		if (priv->quirks & QUIRK_NEED_RSTCLR) {
 			spin_lock_irqsave(&priv->lock, flags);
 			writel(0, i2s->priv->addr + I2SCON);
 			spin_unlock_irqrestore(&priv->lock, flags);
@@ -1279,7 +1274,6 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 	const char *clk_name[2] = { "i2s_opclk0", "i2s_opclk1" };
 	const char *p_names[2] = { NULL };
 	struct device *dev = &priv->pdev->dev;
-	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(dev);
 	const struct samsung_i2s_variant_regs *reg_info = priv->variant_regs;
 	const char *i2s_clk_name[ARRAY_SIZE(i2s_clk_desc)];
 	struct clk *rclksrc;
@@ -1305,7 +1299,7 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 			return -ENOMEM;
 	}
 
-	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
+	if (!(priv->quirks & QUIRK_NO_MUXPSR)) {
 		/* Activate the prescaler */
 		u32 val = readl(priv->addr + I2SPSR);
 		writel(val | PSR_PSREN, priv->addr + I2SPSR);
@@ -1399,11 +1393,11 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->variant_regs = i2s_dai_data->i2s_variant_regs;
-
 	quirks = np ? i2s_dai_data->quirks : i2s_pdata->type.quirks;
 	num_dais = (quirks & QUIRK_SEC_DAI) ? 2 : 1;
 	priv->pdev = pdev;
+	priv->variant_regs = i2s_dai_data->i2s_variant_regs;
+	priv->quirks = quirks;
 
 	ret = i2s_alloc_dais(priv, i2s_dai_data, num_dais);
 	if (ret < 0)
@@ -1458,7 +1452,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pri_dai->dma_capture.chan_name = "rx";
 	pri_dai->dma_playback.addr_width = 4;
 	pri_dai->dma_capture.addr_width = 4;
-	pri_dai->quirks = quirks;
 	pri_dai->priv = priv;
 
 	if (quirks & QUIRK_PRI_6CHAN)
@@ -1481,7 +1474,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		}
 
 		sec_dai->dma_playback.addr_width = 4;
-		sec_dai->quirks = quirks;
 		sec_dai->idma_playback.addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
 		sec_dai->priv = priv;
-- 
2.20.1
