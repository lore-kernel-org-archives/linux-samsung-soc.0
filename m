From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: odroid: Fix of_node refcount unbalance
Date: Wed, 20 Feb 2019 12:06:07 +0100
Message-ID: <20190220110607.13293-1-s.nawrocki@samsung.com>
References: <CGME20190220110620epcas2p27841bf821d10beab780362bdd59d9020@epcas2p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: tiwai@suse.de, sbkim73@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In odroid_audio_probe() some OF nodes are left without reference count
decrease after use. Fix it by ensuring required of_node_calls() are done
before exiting probe.

Reported-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
2.17.1
