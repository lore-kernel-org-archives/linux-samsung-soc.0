From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Ensure proper runtime PM state of I2S device" to the asoc tree
Date: Sat, 31 Dec 2016 19:19:25 +0000
Message-ID: <E1cNPBd-0003zv-AH@debutante>
References: <1483011247-21613-3-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52020 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbcLaTTb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Dec 2016 14:19:31 -0500
In-Reply-To: <1483011247-21613-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

The patch

   ASoC: samsung: i2s: Ensure proper runtime PM state of I2S device

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From dc938ddb56283a0b71d987e7ecd4be90390985d6 Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 29 Dec 2016 12:34:04 +0100
Subject: [PATCH] ASoC: samsung: i2s: Ensure proper runtime PM state of I2S
 device

This patch adds calls to pm_runtime_get/put to ensure that any access to
I2S registers is done with proper (active) runtime PM state of I2S device.
Till now the driver enabled runtime PM, but didn't manage the state during
driver operation. The driver worked fine only because the runtime PM
callbacks managed device clock, which was enabled all the time because of
the additional enable call in the driver's probe function.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 54 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 10b19a4afe86..8d8965e7107c 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -477,6 +477,9 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 	unsigned int rsrc_mask = 1 << i2s_regs->rclksrc_off;
 	u32 mod, mask, val = 0;
 	unsigned long flags;
+	int ret = 0;
+
+	pm_runtime_get_sync(dai->dev);
 
 	spin_lock_irqsave(i2s->lock, flags);
 	mod = readl(i2s->addr + I2SMOD);
@@ -501,7 +504,8 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 					&& (mod & cdcon_mask))))) {
 			dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
-			return -EAGAIN;
+			ret = -EAGAIN;
+			goto err;
 		}
 
 		if (dir == SND_SOC_CLOCK_IN)
@@ -529,7 +533,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 				} else {
 					i2s->rclk_srcrate =
 						clk_get_rate(i2s->op_clk);
-					return 0;
+					goto done;
 				}
 			}
 
@@ -540,8 +544,10 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 				i2s->op_clk = clk_get(&i2s->pdev->dev,
 						"i2s_opclk0");
 
-			if (WARN_ON(IS_ERR(i2s->op_clk)))
-				return PTR_ERR(i2s->op_clk);
+			if (WARN_ON(IS_ERR(i2s->op_clk))) {
+				ret = PTR_ERR(i2s->op_clk);
+				goto err;
+			}
 
 			clk_prepare_enable(i2s->op_clk);
 			i2s->rclk_srcrate = clk_get_rate(i2s->op_clk);
@@ -555,12 +561,13 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 				|| (clk_id && !(mod & rsrc_mask))) {
 			dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
-			return -EAGAIN;
+			ret = -EAGAIN;
+			goto err;
 		} else {
 			/* Call can't be on the active DAI */
 			i2s->op_clk = other->op_clk;
 			i2s->rclk_srcrate = other->rclk_srcrate;
-			return 0;
+			goto done;
 		}
 
 		if (clk_id == 1)
@@ -568,7 +575,8 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 		break;
 	default:
 		dev_err(&i2s->pdev->dev, "We don't serve that!\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	spin_lock_irqsave(i2s->lock, flags);
@@ -576,8 +584,13 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 	mod = (mod & ~mask) | val;
 	writel(mod, i2s->addr + I2SMOD);
 	spin_unlock_irqrestore(i2s->lock, flags);
+done:
+	pm_runtime_put(dai->dev);
 
 	return 0;
+err:
+	pm_runtime_put(dai->dev);
+	return ret;
 }
 
 static int i2s_set_fmt(struct snd_soc_dai *dai,
@@ -646,6 +659,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(dai->dev);
 	spin_lock_irqsave(i2s->lock, flags);
 	mod = readl(i2s->addr + I2SMOD);
 	/*
@@ -655,6 +669,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 	if (any_active(i2s) &&
 		((mod & (sdf_mask | lrp_rlow | mod_slave)) != tmp)) {
 		spin_unlock_irqrestore(i2s->lock, flags);
+		pm_runtime_put(dai->dev);
 		dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
 		return -EAGAIN;
@@ -664,6 +679,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 	mod |= tmp;
 	writel(mod, i2s->addr + I2SMOD);
 	spin_unlock_irqrestore(i2s->lock, flags);
+	pm_runtime_put(dai->dev);
 
 	return 0;
 }
@@ -675,6 +691,8 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 mod, mask = 0, val = 0;
 	unsigned long flags;
 
+	WARN_ON(!pm_runtime_active(dai->dev));
+
 	if (!is_secondary(i2s))
 		mask |= (MOD_DC2_EN | MOD_DC1_EN);
 
@@ -763,6 +781,8 @@ static int i2s_startup(struct snd_pcm_substream *substream,
 	struct i2s_dai *other = get_other_dai(i2s);
 	unsigned long flags;
 
+	pm_runtime_get_sync(dai->dev);
+
 	spin_lock_irqsave(&lock, flags);
 
 	i2s->mode |= DAI_OPENED;
@@ -800,6 +820,8 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,
 	i2s->bfs = 0;
 
 	spin_unlock_irqrestore(&lock, flags);
+
+	pm_runtime_put(dai->dev);
 }
 
 static int config_setup(struct i2s_dai *i2s)
@@ -874,6 +896,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		pm_runtime_get_sync(dai->dev);
 		spin_lock_irqsave(i2s->lock, flags);
 
 		if (config_setup(i2s)) {
@@ -902,6 +925,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 		}
 
 		spin_unlock_irqrestore(i2s->lock, flags);
+		pm_runtime_put(dai->dev);
 		break;
 	}
 
@@ -916,13 +940,16 @@ static int i2s_set_clkdiv(struct snd_soc_dai *dai,
 
 	switch (div_id) {
 	case SAMSUNG_I2S_DIV_BCLK:
+		pm_runtime_get_sync(dai->dev);
 		if ((any_active(i2s) && div && (get_bfs(i2s) != div))
 			|| (other && other->bfs && (other->bfs != div))) {
+			pm_runtime_put(dai->dev);
 			dev_err(&i2s->pdev->dev,
 				"%s:%d Other DAI busy\n", __func__, __LINE__);
 			return -EAGAIN;
 		}
 		i2s->bfs = div;
+		pm_runtime_put(dai->dev);
 		break;
 	default:
 		dev_err(&i2s->pdev->dev,
@@ -941,6 +968,8 @@ i2s_delay(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	snd_pcm_sframes_t delay;
 	const struct samsung_i2s_variant_regs *i2s_regs = i2s->variant_regs;
 
+	WARN_ON(!pm_runtime_active(dai->dev));
+
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		delay = FIC_RXCOUNT(reg);
 	else if (is_secondary(i2s))
@@ -984,6 +1013,8 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	struct i2s_dai *other = get_other_dai(i2s);
 	unsigned long flags;
 
+	pm_runtime_get_sync(dai->dev);
+
 	if (is_secondary(i2s)) { /* If this is probe on the secondary DAI */
 		snd_soc_dai_init_dma_data(dai, &other->sec_dai->dma_playback,
 					   NULL);
@@ -1016,6 +1047,7 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (!is_opened(other))
 		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK,
 				0, SND_SOC_CLOCK_IN);
+	pm_runtime_put(dai->dev);
 
 	return 0;
 }
@@ -1025,6 +1057,8 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 	struct i2s_dai *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned long flags;
 
+	pm_runtime_get_sync(dai->dev);
+
 	if (!is_secondary(i2s)) {
 		if (i2s->quirks & QUIRK_NEED_RSTCLR) {
 			spin_lock_irqsave(i2s->lock, flags);
@@ -1033,6 +1067,8 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 		}
 	}
 
+	pm_runtime_put(dai->dev);
+
 	return 0;
 }
 
@@ -1322,7 +1358,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, pri_dai);
 
-
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = i2s_register_clock_provider(pdev);
@@ -1345,10 +1381,12 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	pri_dai->sec_dai = NULL;
 	sec_dai->pri_dai = NULL;
 
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	i2s_unregister_clock_provider(pdev);
 	clk_disable_unprepare(pri_dai->clk);
+	pm_runtime_put_noidle(&pdev->dev);
 
 	return 0;
 }
-- 
2.11.0
