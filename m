From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH v2 2/3] ASoC: samsung: Use 'samsung-i2s' cpu_dai for
 dai_links
Date: Wed, 06 Sep 2017 10:04:14 +0900
Message-ID: <20170906010415.26952-3-jcsing.lee@samsung.com>
References: <20170906010415.26952-1-jcsing.lee@samsung.com>
        <CGME20170906010417epcas1p2b3460cf27e35e64f5e35fad98f554108@epcas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170906010415.26952-1-jcsing.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Jaechul Lee <jcsing.lee@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add specific cpu_dai_name to dai_link because samsung i2s driver registers
two dais and components. Selecting one of them clearly is needed more
information like cpu_dai_name, of_node. The reason why the dai_links have
to use 'samsung-i2s' for cpu_dai is that 'samsung-i2s-sec' doesn't have a
capture functionality.

Without this code, cpu_dai will be selected the first one of the
component_list. For example, if I describe nothing to cpu_dai_name,
'samsung-i2s-sec' might be selected to HiFi Primay.

Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
---
 sound/soc/samsung/tm2_wm5110.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 68698f3d72f9..710e2151141f 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -383,6 +383,7 @@ static struct snd_soc_dai_link tm2_dai_links[] = {
 	{
 		.name		= "WM5110 AIF1",
 		.stream_name	= "HiFi Primary",
+		.cpu_dai_name   = SAMSUNG_I2S_DAI,
 		.codec_dai_name = "wm5110-aif1",
 		.ops		= &tm2_aif1_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
@@ -390,6 +391,7 @@ static struct snd_soc_dai_link tm2_dai_links[] = {
 	}, {
 		.name		= "WM5110 Voice",
 		.stream_name	= "Voice call",
+		.cpu_dai_name   = SAMSUNG_I2S_DAI,
 		.codec_dai_name = "wm5110-aif2",
 		.ops		= &tm2_aif2_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
@@ -398,6 +400,7 @@ static struct snd_soc_dai_link tm2_dai_links[] = {
 	}, {
 		.name		= "WM5110 BT",
 		.stream_name	= "Bluetooth",
+		.cpu_dai_name   = SAMSUNG_I2S_DAI,
 		.codec_dai_name = "wm5110-aif3",
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				  SND_SOC_DAIFMT_CBM_CFM,
@@ -477,7 +480,6 @@ static int tm2_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < card->num_links; i++) {
-		card->dai_link[i].cpu_dai_name = NULL;
 		card->dai_link[i].cpu_name = NULL;
 		card->dai_link[i].platform_name = NULL;
 		card->dai_link[i].codec_of_node = codec_dai_node;
-- 
2.14.1
