From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Let runtime PM operations to control op_clk too" to the asoc tree
Date: Sat, 31 Dec 2016 19:19:19 +0000
Message-ID: <E1cNPBX-0003wq-FQ@debutante>
References: <1483011247-21613-5-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51974 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbcLaTTZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Dec 2016 14:19:25 -0500
In-Reply-To: <1483011247-21613-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

The patch

   ASoC: samsung: i2s: Let runtime PM operations to control op_clk too

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

>From afa99da863e8e00efd8ce2f8840ed31d50abb889 Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 29 Dec 2016 12:34:06 +0100
Subject: [PATCH] ASoC: samsung: i2s: Let runtime PM operations to control
 op_clk too

This patch adds handling of parent operational clock to runtime PM
callbacks. This way it is ensured that when I2S module is in runtime
suspended state, all its parent clocks are disabled and unprepared.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index df3fae862665..b2b9ee4a177a 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -546,6 +546,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 
 			if (WARN_ON(IS_ERR(i2s->op_clk))) {
 				ret = PTR_ERR(i2s->op_clk);
+				i2s->op_clk = NULL;
 				goto err;
 			}
 
@@ -1121,6 +1122,8 @@ static int i2s_runtime_suspend(struct device *dev)
 	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
 	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
 
+	if (i2s->op_clk)
+		clk_disable_unprepare(i2s->op_clk);
 	clk_disable_unprepare(i2s->clk);
 
 	return 0;
@@ -1131,6 +1134,8 @@ static int i2s_runtime_resume(struct device *dev)
 	struct i2s_dai *i2s = dev_get_drvdata(dev);
 
 	clk_prepare_enable(i2s->clk);
+	if (i2s->op_clk)
+		clk_prepare_enable(i2s->op_clk);
 
 	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
 	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
-- 
2.11.0
