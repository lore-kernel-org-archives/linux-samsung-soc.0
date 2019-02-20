From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: odroid: Fix of_node refcount unbalance" to the asoc tree
Date: Wed, 20 Feb 2019 17:52:46 +0000 (GMT)
Message-ID: <20190220175246.AB72A112882C@debutante.sirena.org.uk>
References: <20190220110607.13293-1-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220110607.13293-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.comtiwai@suse.de, linux-kernel@vger.kernel.org, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: odroid: Fix of_node refcount unbalance

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

>From d832d2b246c516eacb2d0ba53ec17ed59c3cd62b Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 20 Feb 2019 12:06:07 +0100
Subject: [PATCH] ASoC: samsung: odroid: Fix of_node refcount unbalance

In odroid_audio_probe() some OF nodes are left without reference count
decrease after use. Fix it by ensuring required of_node_calls() are done
before exiting probe.

Reported-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/odroid.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index bd2c5163dc7f..c3b0f6c612cb 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -257,27 +257,31 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		ret = of_parse_phandle_with_args(cpu, "sound-dai",
 						 "#sound-dai-cells", i, &args);
 		if (ret < 0)
-			return ret;
+			break;
 
 		if (!args.np) {
 			dev_err(dev, "sound-dai property parse error: %d\n", ret);
-			return -EINVAL;
+			ret = -EINVAL;
+			break;
 		}
 
 		ret = snd_soc_get_dai_name(&args, &link->cpu_dai_name);
 		of_node_put(args.np);
 
 		if (ret < 0)
-			return ret;
+			break;
 	}
+	if (ret == 0)
+		cpu_dai = of_parse_phandle(cpu, "sound-dai", 0);
 
-	cpu_dai = of_parse_phandle(cpu, "sound-dai", 0);
 	of_node_put(cpu);
 	of_node_put(codec);
+	if (ret < 0)
+		return ret;
 
 	ret = snd_soc_of_get_dai_link_codecs(dev, codec, codec_link);
 	if (ret < 0)
-		goto err_put_codec_n;
+		goto err_put_cpu_dai;
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
@@ -288,7 +292,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
 	if (IS_ERR(priv->sclk_i2s)) {
 		ret = PTR_ERR(priv->sclk_i2s);
-		goto err_put_codec_n;
+		goto err_put_cpu_dai;
 	}
 
 	priv->clk_i2s_bus = of_clk_get_by_name(cpu_dai, "iis");
@@ -310,7 +314,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	clk_put(priv->clk_i2s_bus);
 err_put_sclk:
 	clk_put(priv->sclk_i2s);
-err_put_codec_n:
+err_put_cpu_dai:
+	of_node_put(cpu_dai);
 	snd_soc_of_put_dai_link_codecs(codec_link);
 	return ret;
 }
-- 
2.20.1
