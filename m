From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 11/22] ASoC: samsung: i2s: Move registers cache to common
 driver data structure
Date: Thu, 07 Feb 2019 18:00:19 +0100
Message-ID: <20190207170028.720-12-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170123epcas1p2fae464ba7f102d841548c5a523cc6660@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There is no need to keep the PM suspend/resume register cache separate
for each DAI as those registers are common, move related i2s_dai data
structure to the driver's common data structure.  This will allow us
to simplify the code a little eventually and to make it easier to follow.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b7b28813645a..b0913cc488ab 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -86,9 +86,6 @@ struct i2s_dai {
 	struct snd_dmaengine_dai_dma_data idma_playback;
 	dma_filter_fn filter;
 	u32	quirks;
-	u32	suspend_i2smod;
-	u32	suspend_i2scon;
-	u32	suspend_i2spsr;
 	const struct samsung_i2s_variant_regs *variant_regs;
 
 	spinlock_t *lock;
@@ -120,6 +117,11 @@ struct samsung_i2s_priv {
 	/* Rate of RCLK source clock */
 	unsigned long rclk_srcrate;
 
+	/* Cache of selected I2S registers for system suspend */
+	u32 suspend_i2smod;
+	u32 suspend_i2scon;
+	u32 suspend_i2spsr;
+
 	/* The clock provider's data */
 	struct clk *clk_table[3];
 	struct clk_onecell_data clk_data;
@@ -1205,9 +1207,9 @@ static int i2s_runtime_suspend(struct device *dev)
 	struct samsung_i2s_priv *priv = dev_get_drvdata(dev);
 	struct i2s_dai *i2s = samsung_i2s_get_pri_dai(dev);
 
-	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
-	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
-	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
+	priv->suspend_i2smod = readl(i2s->addr + I2SMOD);
+	priv->suspend_i2scon = readl(i2s->addr + I2SCON);
+	priv->suspend_i2spsr = readl(i2s->addr + I2SPSR);
 
 	if (priv->op_clk)
 		clk_disable_unprepare(priv->op_clk);
@@ -1234,9 +1236,9 @@ static int i2s_runtime_resume(struct device *dev)
 		}
 	}
 
-	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
-	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
-	writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
+	writel(priv->suspend_i2scon, i2s->addr + I2SCON);
+	writel(priv->suspend_i2smod, i2s->addr + I2SMOD);
+	writel(priv->suspend_i2spsr, i2s->addr + I2SPSR);
 
 	return 0;
 }
-- 
2.20.1
