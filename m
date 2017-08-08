From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: odroid: Drop requirement of clocks in the sound node" to the asoc tree
Date: Tue, 08 Aug 2017 12:06:17 +0100
Message-ID: <E1df2L3-0004xW-Tt@finisterre>
References: <1501844297-22842-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34074 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752003AbdHHLGY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 07:06:24 -0400
In-Reply-To: <1501844297-22842-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.comkrzk@kernel.org, robh+dt@kernel.orgalsa-devel@alsa-project.org

The patch

   ASoC: samsung: odroid: Drop requirement of clocks in the sound node

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

>From a8ad0c85fbfa56c44161829f6433e59dcd84b731 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 4 Aug 2017 12:58:17 +0200
Subject: [PATCH] ASoC: samsung: odroid: Drop requirement of clocks in the
 sound node

As suggested in reviews the requirement of clocks in the 'sound' node
is dropped and instead a leaf clock is used to configure frequency
of the audio root clock PLL. This can work now after the clock tree
definitions have been updated to allow clock rate setting propagation
on the path from the I2S controller up to the EPLL.

This patch also lowers the CODEC master clock frequency so as
to not exceed the maximum allowed 60 MHz at maximum audio sampling
rates.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/samsung,odroid.txt   |  6 ---
 sound/soc/samsung/odroid.c                         | 44 +++++++++++++++-------
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
index c30934dd975b..625b1b18fd02 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
@@ -7,9 +7,6 @@ Required properties:
  - model - the user-visible name of this sound complex
  - clocks - should contain entries matching clock names in the clock-names
     property
- - clock-names - should contain following entries:
-    - "epll" - indicating the EPLL output clock
-    - "i2s_rclk" - indicating the RCLK (root) clock of the I2S0 controller
  - samsung,audio-widgets - this property specifies off-codec audio elements
    like headphones or speakers, for details see widgets.txt
  - samsung,audio-routing - a list of the connections between audio
@@ -46,9 +43,6 @@ sound {
 		"IN1", "Mic Jack",
 		"Mic Jack", "MICBIAS";
 
-	clocks = <&clock CLK_FOUT_EPLL>, <&i2s0 CLK_I2S_RCLK_SRC>;
-	clock-names = "epll", "sclk_i2s";
-
 	cpu {
 		sound-dai = <&i2s0 0>;
 	};
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 0c0b00e40646..00b7f455a472 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -19,8 +19,8 @@ struct odroid_priv {
 	struct snd_soc_card card;
 	struct snd_soc_dai_link dai_link;
 
-	struct clk *pll;
-	struct clk *rclk;
+	struct clk *clk_i2s_bus;
+	struct clk *sclk_i2s;
 };
 
 static int odroid_card_startup(struct snd_pcm_substream *substream)
@@ -58,13 +58,18 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = clk_set_rate(priv->pll, pll_freq + 1);
+	ret = clk_set_rate(priv->clk_i2s_bus, pll_freq / 2 + 1);
 	if (ret < 0)
 		return ret;
 
-	rclk_freq = params_rate(params) * 256 * 4;
+	/*
+	 *  We add 1 to the rclk_freq value in order to avoid too low clock
+	 *  frequency values due to the EPLL output frequency not being exact
+	 *  multiple of the audio sampling rate.
+	 */
+	rclk_freq = params_rate(params) * 256 + 1;
 
-	ret = clk_set_rate(priv->rclk, rclk_freq);
+	ret = clk_set_rate(priv->sclk_i2s, rclk_freq);
 	if (ret < 0)
 		return ret;
 
@@ -118,14 +123,6 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
-	priv->pll = devm_clk_get(dev, "epll");
-	if (IS_ERR(priv->pll))
-		return PTR_ERR(priv->pll);
-
-	priv->rclk = devm_clk_get(dev, "i2s_rclk");
-	if (IS_ERR(priv->rclk))
-		return PTR_ERR(priv->rclk);
-
 	ret = snd_soc_of_parse_card_name(card, "model");
 	if (ret < 0)
 		return ret;
@@ -171,14 +168,31 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	link->name = "Primary";
 	link->stream_name = link->name;
 
+
+	priv->sclk_i2s = of_clk_get_by_name(link->cpu_of_node, "i2s_opclk1");
+	if (IS_ERR(priv->sclk_i2s)) {
+		ret = PTR_ERR(priv->sclk_i2s);
+		goto err_put_i2s_n;
+	}
+
+	priv->clk_i2s_bus = of_clk_get_by_name(link->cpu_of_node, "iis");
+	if (IS_ERR(priv->clk_i2s_bus)) {
+		ret = PTR_ERR(priv->clk_i2s_bus);
+		goto err_put_sclk;
+	}
+
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
 		dev_err(dev, "snd_soc_register_card() failed: %d\n", ret);
-		goto err_put_i2s_n;
+		goto err_put_clk_i2s;
 	}
 
 	return 0;
 
+err_put_clk_i2s:
+	clk_put(priv->clk_i2s_bus);
+err_put_sclk:
+	clk_put(priv->sclk_i2s);
 err_put_i2s_n:
 	of_node_put(link->cpu_of_node);
 err_put_codec_n:
@@ -192,6 +206,8 @@ static int odroid_audio_remove(struct platform_device *pdev)
 
 	of_node_put(priv->dai_link.cpu_of_node);
 	odroid_put_codec_of_nodes(&priv->dai_link);
+	clk_put(priv->sclk_i2s);
+	clk_put(priv->clk_i2s_bus);
 
 	return 0;
 }
-- 
2.13.2
