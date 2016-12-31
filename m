From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Move saving and restoring regs to runtime pm operations" to the asoc tree
Date: Sat, 31 Dec 2016 19:19:22 +0000
Message-ID: <E1cNPBa-0003xo-DF@debutante>
References: <1483011247-21613-4-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52000 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbcLaTT2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Dec 2016 14:19:28 -0500
In-Reply-To: <1483011247-21613-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

The patch

   ASoC: samsung: i2s: Move saving and restoring regs to runtime pm operations

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

>From e7e52dfc68a2160570c7ec51415e391961160edb Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 29 Dec 2016 12:34:05 +0100
Subject: [PATCH] ASoC: samsung: i2s: Move saving and restoring regs to runtime
 pm operations

This patch moves saving and restoring I2S registers to runtime PM
operations, what prepares the driver to operate with audio power domain.
When support for audio power domain is enabled and the domain is being
turned off, the I2S module will loose its context (registers), so runtime
callbacks have to handle it. System sleep suspend/resume operation are
implemented on top of runtime PM operations with generic
pm_runtime_force_suspend/resume helpers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 8d8965e7107c..df3fae862665 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -983,24 +983,12 @@ i2s_delay(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 #ifdef CONFIG_PM
 static int i2s_suspend(struct snd_soc_dai *dai)
 {
-	struct i2s_dai *i2s = to_info(dai);
-
-	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
-	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
-	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
-
-	return 0;
+	return pm_runtime_force_suspend(dai->dev);
 }
 
 static int i2s_resume(struct snd_soc_dai *dai)
 {
-	struct i2s_dai *i2s = to_info(dai);
-
-	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
-	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
-	writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
-
-	return 0;
+	return pm_runtime_force_resume(dai->dev);
 }
 #else
 #define i2s_suspend NULL
@@ -1129,6 +1117,10 @@ static int i2s_runtime_suspend(struct device *dev)
 {
 	struct i2s_dai *i2s = dev_get_drvdata(dev);
 
+	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
+	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
+	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
+
 	clk_disable_unprepare(i2s->clk);
 
 	return 0;
@@ -1140,6 +1132,10 @@ static int i2s_runtime_resume(struct device *dev)
 
 	clk_prepare_enable(i2s->clk);
 
+	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
+	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
+	writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
+
 	return 0;
 }
 #endif /* CONFIG_PM */
@@ -1510,6 +1506,8 @@ MODULE_DEVICE_TABLE(of, exynos_i2s_match);
 static const struct dev_pm_ops samsung_i2s_pm = {
 	SET_RUNTIME_PM_OPS(i2s_runtime_suspend,
 				i2s_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
 };
 
 static struct platform_driver samsung_i2s_driver = {
-- 
2.11.0
