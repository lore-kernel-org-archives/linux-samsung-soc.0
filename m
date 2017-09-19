From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Use 'samsung-i2s' cpu_dai for dai_links" to the asoc tree
Date: Tue, 19 Sep 2017 15:59:40 +0100
Message-ID: <E1duJzw-0002EG-N9@debutante>
References: <20170906010415.26952-3-jcsing.lee@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906010415.26952-3-jcsing.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, Chanwoo Choi <cw00.choi@samsung.com>, galaxyra@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.orgalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: Use 'samsung-i2s' cpu_dai for dai_links

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

>From e8d93208905a9987c211f97a14a93f2776ab52e7 Mon Sep 17 00:00:00 2001
From: Jaechul Lee <jcsing.lee@samsung.com>
Date: Wed, 6 Sep 2017 10:04:14 +0900
Subject: [PATCH] ASoC: samsung: Use 'samsung-i2s' cpu_dai for dai_links

Add specific cpu_dai_name to dai_link because samsung i2s driver registers
two dais and components. Selecting one of them clearly is needed more
information like cpu_dai_name, of_node. The reason why the dai_links have
to use 'samsung-i2s' for cpu_dai is that 'samsung-i2s-sec' doesn't have a
capture functionality.

Without this code, cpu_dai will be selected the first one of the
component_list. For example, if I describe nothing to cpu_dai_name,
'samsung-i2s-sec' might be selected to HiFi Primay.

Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
