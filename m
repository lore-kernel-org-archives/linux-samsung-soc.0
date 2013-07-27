From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: smdk_wm8994: Configure DAI format at init time
Date: Sat, 27 Jul 2013 12:53:24 +0100
Message-ID: <1374926005-2400-2-git-send-email-broonie@kernel.org>
References: <1374926005-2400-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56734 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751546Ab3G0Lxd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Jul 2013 07:53:33 -0400
In-Reply-To: <1374926005-2400-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Initialise the DAI format from the data link, saving code and repeated
work.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/smdk_wm8994.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 05c479c..a561175 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -41,7 +41,6 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	unsigned int pll_out;
 	int ret;
@@ -54,18 +53,6 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	else
 		pll_out = params_rate(params) * 256;
 
-	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
-					 | SND_SOC_DAIFMT_NB_NF
-					 | SND_SOC_DAIFMT_CBM_CFM);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S
-					 | SND_SOC_DAIFMT_NB_NF
-					 | SND_SOC_DAIFMT_CBM_CFM);
-	if (ret < 0)
-		return ret;
-
 	ret = snd_soc_dai_set_pll(codec_dai, WM8994_FLL1, WM8994_FLL_SRC_MCLK1,
 					SMDK_WM8994_FREQ, pll_out);
 	if (ret < 0)
@@ -131,6 +118,8 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.platform_name = "samsung-i2s.0",
 		.codec_name = "wm8994-codec",
 		.init = smdk_wm8994_init_paiftx,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBM_CFM,
 		.ops = &smdk_ops,
 	}, { /* Sec_Fifo Playback i/f */
 		.name = "Sec_FIFO TX",
@@ -139,6 +128,8 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.codec_dai_name = "wm8994-aif1",
 		.platform_name = "samsung-i2s-sec",
 		.codec_name = "wm8994-codec",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBM_CFM,
 		.ops = &smdk_ops,
 	},
 };
-- 
1.8.3.2
