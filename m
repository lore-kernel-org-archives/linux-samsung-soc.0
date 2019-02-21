From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: odroid: Prevent uninitialized variable use
Date: Thu, 21 Feb 2019 10:42:28 +0100
Message-ID: <20190221094228.3778-1-s.nawrocki@samsung.com>
References: <CGME20190221094255epcas1p434e428e3470a8ae9963e8acd3e0c7532@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: sbkim73@samsung.com, krzk@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This addresses an issue pointed out by compiler warning:

sound/soc/samsung/odroid.c: In function ‘odroid_audio_probe’:
sound/soc/samsung/odroid.c:298:22: warning: ‘cpu_dai’ may be used
uninitialized in this function [-Wmaybe-uninitialized]
  priv->clk_i2s_bus = of_clk_get_by_name(cpu_dai, "iis");
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/odroid.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index c3b0f6c612cb..694512f980fd 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -194,7 +194,8 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 static int odroid_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *cpu, *cpu_dai, *codec;
+	struct device_node *cpu_dai = NULL;
+	struct device_node *cpu, *codec;
 	struct odroid_priv *priv;
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *link, *codec_link;
@@ -271,8 +272,11 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		if (ret < 0)
 			break;
 	}
-	if (ret == 0)
+	if (ret == 0) {
 		cpu_dai = of_parse_phandle(cpu, "sound-dai", 0);
+		if (!cpu_dai)
+			ret = -EINVAL;
+	}
 
 	of_node_put(cpu);
 	of_node_put(codec);
-- 
2.17.1
