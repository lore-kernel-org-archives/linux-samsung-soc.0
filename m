From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Don't use register read to determine slave/master mode" to the asoc tree
Date: Wed, 20 Mar 2019 17:29:27 +0000 (GMT)
Message-ID: <20190320172927.EADBE1126E4D@debutante.sirena.org.uk>
References: <20190319121102.28069-1-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319121102.28069-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: i2s: Don't use register read to determine slave/master mode

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

>From f29eec793d4d16a1019abac1ac0702d07adae78e Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 19 Mar 2019 13:11:02 +0100
Subject: [PATCH] ASoC: samsung: i2s: Don't use register read to determine
 slave/master mode

We can simplify the code by caching the CPU DAI master/slave
information rather than reading previously set register bit.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ab471d550d17..9722940da6a4 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -88,12 +88,6 @@ struct samsung_i2s_priv {
 	struct platform_device *pdev;
 	struct platform_device *pdev_sec;
 
-	/* Memory mapped SFR region */
-	void __iomem *addr;
-
-	/* Spinlock protecting access to the device's registers */
-	spinlock_t lock;
-
 	/* Lock for cross interface checks */
 	spinlock_t pcm_lock;
 
@@ -122,6 +116,15 @@ struct samsung_i2s_priv {
 	/* The clock provider's data */
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
+
+	/* Spinlock protecting member fields below */
+	spinlock_t lock;
+
+	/* Memory mapped SFR region */
+	void __iomem *addr;
+
+	/* A flag indicating the I2S slave mode operation */
+	bool slave_mode;
 };
 
 /* Returns true if this is the 'overlay' stereo DAI */
@@ -130,15 +133,6 @@ static inline bool is_secondary(struct i2s_dai *i2s)
 	return i2s->drv->id == SAMSUNG_I2S_ID_SECONDARY;
 }
 
-/* If operating in SoC-Slave mode */
-static inline bool is_slave(struct i2s_dai *i2s)
-{
-	struct samsung_i2s_priv *priv = i2s->priv;
-
-	u32 mod = readl(priv->addr + I2SMOD);
-	return (mod & (1 << priv->variant_regs->mss_off)) ? true : false;
-}
-
 /* If this interface of the controller is transmitting data */
 static inline bool tx_active(struct i2s_dai *i2s)
 {
@@ -715,6 +709,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	mod &= ~(sdf_mask | lrp_rlow | mod_slave);
 	mod |= tmp;
 	writel(mod, priv->addr + I2SMOD);
+	priv->slave_mode = (mod & mod_slave);
 	spin_unlock_irqrestore(&priv->lock, flags);
 	pm_runtime_put(dai->dev);
 
@@ -917,7 +912,7 @@ static int config_setup(struct i2s_dai *i2s)
 	set_rfs(i2s, rfs);
 
 	/* Don't bother with PSR in Slave mode */
-	if (is_slave(i2s))
+	if (priv->slave_mode)
 		return 0;
 
 	if (!(priv->quirks & QUIRK_NO_MUXPSR)) {
-- 
2.20.1
