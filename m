From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 09/21] ASoC: samsung: i2s: Move IP variant data to common
 driver data structure
Date: Tue, 12 Feb 2019 19:03:30 +0100
Message-ID: <20190212180342.32040-10-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180510epcas1p47878c53f4d053461d23e8697cde1a63a@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The IP variant data is another thing common for both DAIs, move it
to the driver's common data structure.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/i2s.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 0da07975d59b..8352f610ce35 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -85,7 +85,6 @@ struct i2s_dai {
 	struct snd_dmaengine_dai_dma_data idma_playback;
 	dma_filter_fn filter;
 	u32	quirks;
-	const struct samsung_i2s_variant_regs *variant_regs;
 
 	struct samsung_i2s_priv *priv;
 };
@@ -122,6 +121,8 @@ struct samsung_i2s_priv {
 	u32 suspend_i2scon;
 	u32 suspend_i2spsr;
 
+	const struct samsung_i2s_variant_regs *variant_regs;
+
 	/* The clock provider's data */
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
@@ -146,7 +147,7 @@ static inline bool is_slave(struct i2s_dai *i2s)
 	struct samsung_i2s_priv *priv = i2s->priv;
 
 	u32 mod = readl(priv->addr + I2SMOD);
-	return (mod & (1 << i2s->variant_regs->mss_off)) ? true : false;
+	return (mod & (1 << priv->variant_regs->mss_off)) ? true : false;
 }
 
 /* If this interface of the controller is transmitting data */
@@ -261,8 +262,8 @@ static inline unsigned get_rfs(struct i2s_dai *i2s)
 	struct samsung_i2s_priv *priv = i2s->priv;
 	u32 rfs;
 
-	rfs = readl(priv->addr + I2SMOD) >> i2s->variant_regs->rfs_off;
-	rfs &= i2s->variant_regs->rfs_mask;
+	rfs = readl(priv->addr + I2SMOD) >> priv->variant_regs->rfs_off;
+	rfs &= priv->variant_regs->rfs_mask;
 
 	switch (rfs) {
 	case 7: return 192;
@@ -281,9 +282,9 @@ static inline void set_rfs(struct i2s_dai *i2s, unsigned rfs)
 {
 	struct samsung_i2s_priv *priv = i2s->priv;
 	u32 mod = readl(priv->addr + I2SMOD);
-	int rfs_shift = i2s->variant_regs->rfs_off;
+	int rfs_shift = priv->variant_regs->rfs_off;
 
-	mod &= ~(i2s->variant_regs->rfs_mask << rfs_shift);
+	mod &= ~(priv->variant_regs->rfs_mask << rfs_shift);
 
 	switch (rfs) {
 	case 192:
@@ -321,8 +322,8 @@ static inline unsigned get_bfs(struct i2s_dai *i2s)
 	struct samsung_i2s_priv *priv = i2s->priv;
 	u32 bfs;
 
-	bfs = readl(priv->addr + I2SMOD) >> i2s->variant_regs->bfs_off;
-	bfs &= i2s->variant_regs->bfs_mask;
+	bfs = readl(priv->addr + I2SMOD) >> priv->variant_regs->bfs_off;
+	bfs &= priv->variant_regs->bfs_mask;
 
 	switch (bfs) {
 	case 8: return 256;
@@ -343,7 +344,7 @@ static inline void set_bfs(struct i2s_dai *i2s, unsigned bfs)
 	struct samsung_i2s_priv *priv = i2s->priv;
 	u32 mod = readl(priv->addr + I2SMOD);
 	int tdm = i2s->quirks & QUIRK_SUPPORTS_TDM;
-	int bfs_shift = i2s->variant_regs->bfs_off;
+	int bfs_shift = priv->variant_regs->bfs_off;
 
 	/* Non-TDM I2S controllers do not support BCLK > 48 * FS */
 	if (!tdm && bfs > 48) {
@@ -351,7 +352,7 @@ static inline void set_bfs(struct i2s_dai *i2s, unsigned bfs)
 		return;
 	}
 
-	mod &= ~(i2s->variant_regs->bfs_mask << bfs_shift);
+	mod &= ~(priv->variant_regs->bfs_mask << bfs_shift);
 
 	switch (bfs) {
 	case 48:
@@ -408,7 +409,7 @@ static void i2s_txctrl(struct i2s_dai *i2s, int on)
 {
 	struct samsung_i2s_priv *priv = i2s->priv;
 	void __iomem *addr = priv->addr;
-	int txr_off = i2s->variant_regs->txr_off;
+	int txr_off = priv->variant_regs->txr_off;
 	u32 con = readl(addr + I2SCON);
 	u32 mod = readl(addr + I2SMOD) & ~(3 << txr_off);
 
@@ -459,7 +460,7 @@ static void i2s_rxctrl(struct i2s_dai *i2s, int on)
 {
 	struct samsung_i2s_priv *priv = i2s->priv;
 	void __iomem *addr = priv->addr;
-	int txr_off = i2s->variant_regs->txr_off;
+	int txr_off = priv->variant_regs->txr_off;
 	u32 con = readl(addr + I2SCON);
 	u32 mod = readl(addr + I2SMOD) & ~(3 << txr_off);
 
@@ -516,7 +517,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
-	const struct samsung_i2s_variant_regs *i2s_regs = i2s->variant_regs;
+	const struct samsung_i2s_variant_regs *i2s_regs = priv->variant_regs;
 	unsigned int cdcon_mask = 1 << i2s_regs->cdclkcon_off;
 	unsigned int rsrc_mask = 1 << i2s_regs->rclksrc_off;
 	u32 mod, mask, val = 0;
@@ -644,9 +645,9 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u32 mod, tmp = 0;
 	unsigned long flags;
 
-	lrp_shift = i2s->variant_regs->lrp_off;
-	sdf_shift = i2s->variant_regs->sdf_off;
-	mod_slave = 1 << i2s->variant_regs->mss_off;
+	lrp_shift = priv->variant_regs->lrp_off;
+	sdf_shift = priv->variant_regs->sdf_off;
+	mod_slave = 1 << priv->variant_regs->mss_off;
 
 	sdf_mask = MOD_SDF_MASK << sdf_shift;
 	lrp_rlow = MOD_LR_RLOW << lrp_shift;
@@ -1023,7 +1024,6 @@ i2s_delay(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	struct i2s_dai *i2s = to_info(dai);
 	u32 reg = readl(priv->addr + I2SFIC);
 	snd_pcm_sframes_t delay;
-	const struct samsung_i2s_variant_regs *i2s_regs = i2s->variant_regs;
 
 	WARN_ON(!pm_runtime_active(dai->dev));
 
@@ -1032,7 +1032,7 @@ i2s_delay(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	else if (is_secondary(i2s))
 		delay = FICS_TXCOUNT(readl(priv->addr + I2SFICS));
 	else
-		delay = (reg >> i2s_regs->ftx0cnt_off) & 0x7f;
+		delay = (reg >> priv->variant_regs->ftx0cnt_off) & 0x7f;
 
 	return delay;
 }
@@ -1280,7 +1280,7 @@ static int i2s_register_clock_provider(struct samsung_i2s_priv *priv)
 	const char *p_names[2] = { NULL };
 	struct device *dev = &priv->pdev->dev;
 	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(dev);
-	const struct samsung_i2s_variant_regs *reg_info = i2s->variant_regs;
+	const struct samsung_i2s_variant_regs *reg_info = priv->variant_regs;
 	const char *i2s_clk_name[ARRAY_SIZE(i2s_clk_desc)];
 	struct clk *rclksrc;
 	int ret, i;
@@ -1399,6 +1399,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->variant_regs = i2s_dai_data->i2s_variant_regs;
+
 	quirks = np ? i2s_dai_data->quirks : i2s_pdata->type.quirks;
 	num_dais = (quirks & QUIRK_SEC_DAI) ? 2 : 1;
 	priv->pdev = pdev;
@@ -1457,7 +1459,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pri_dai->dma_playback.addr_width = 4;
 	pri_dai->dma_capture.addr_width = 4;
 	pri_dai->quirks = quirks;
-	pri_dai->variant_regs = i2s_dai_data->i2s_variant_regs;
 	pri_dai->priv = priv;
 
 	if (quirks & QUIRK_PRI_6CHAN)
@@ -1471,7 +1472,6 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	if (quirks & QUIRK_SEC_DAI) {
 		sec_dai = &priv->dai[SAMSUNG_I2S_ID_SECONDARY - 1];
 
-		sec_dai->variant_regs = pri_dai->variant_regs;
 		sec_dai->dma_playback.addr = regs_base + I2STXDS;
 		sec_dai->dma_playback.chan_name = "tx-sec";
 
-- 
2.20.1
