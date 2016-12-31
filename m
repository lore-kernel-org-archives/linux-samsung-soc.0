From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Provide I2S device for registered clocks" to the asoc tree
Date: Sat, 31 Dec 2016 19:19:16 +0000
Message-ID: <E1cNPBU-0003vr-Gg@debutante>
References: <1483011247-21613-6-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51954 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbcLaTTX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Dec 2016 14:19:23 -0500
In-Reply-To: <1483011247-21613-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

The patch

   ASoC: samsung: i2s: Provide I2S device for registered clocks

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

>From 9b41da80e09128574f09bed8dc5a5fc6f72a8239 Mon Sep 17 00:00:00 2001
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 29 Dec 2016 12:34:07 +0100
Subject: [PATCH] ASoC: samsung: i2s: Provide I2S device for registered clocks

This patch adds pointer to I2S device to clk_register_* functions.
This in the future allow clock framework to ensure proper runtime state
of the I2S device during all operations on the clocks provided by I2S
module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b2b9ee4a177a..2a5b92c672fb 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1191,13 +1191,13 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 		u32 val = readl(i2s->addr + I2SPSR);
 		writel(val | PSR_PSREN, i2s->addr + I2SPSR);
 
-		i2s->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(NULL,
+		i2s->clk_table[CLK_I2S_RCLK_SRC] = clk_register_mux(dev,
 				"i2s_rclksrc", p_names, ARRAY_SIZE(p_names),
 				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->rclksrc_off,
 				1, 0, i2s->lock);
 
-		i2s->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(NULL,
+		i2s->clk_table[CLK_I2S_RCLK_PSR] = clk_register_divider(dev,
 				"i2s_presc", "i2s_rclksrc",
 				CLK_SET_RATE_PARENT,
 				i2s->addr + I2SPSR, 8, 6, 0, i2s->lock);
@@ -1208,7 +1208,7 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
 	of_property_read_string_index(dev->of_node,
 				"clock-output-names", 0, &clk_name[0]);
 
-	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(NULL, clk_name[0],
+	i2s->clk_table[CLK_I2S_CDCLK] = clk_register_gate(dev, clk_name[0],
 				p_names[0], CLK_SET_RATE_PARENT,
 				i2s->addr + I2SMOD, reg_info->cdclkcon_off,
 				CLK_GATE_SET_TO_DISABLE, i2s->lock);
-- 
2.11.0
