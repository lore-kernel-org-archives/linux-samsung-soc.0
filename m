From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Use specific name for i2s dais" to the asoc tree
Date: Tue, 19 Sep 2017 15:59:48 +0100
Message-ID: <E1duK04-0002FS-9J@debutante>
References: <20170906010415.26952-2-jcsing.lee@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906010415.26952-2-jcsing.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, Chanwoo Choi <cw00.choi@samsung.com>, galaxyra@gmail.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.orgalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: i2s: Use specific name for i2s dais

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

>From 22289ddcd87285b3d61cd8b129438ca6abb1aa37 Mon Sep 17 00:00:00 2001
From: Jaechul Lee <jcsing.lee@samsung.com>
Date: Wed, 6 Sep 2017 10:04:13 +0900
Subject: [PATCH] ASoC: samsung: i2s: Use specific name for i2s dais

Add specific dais name when components are registered. Component and dai
name will follow their parent dev name, if the name isn't described.  In
case of this driver, each dais will have same name like '11440000.i2s0' by
fmt_single_name function.

The problem having same name is that TM2 machine driver can't detect
capture devices correctly. Machine driver doesn't know which one is proper
to use for cpu dai. The driver just selects to use 'samsung-i2c-sec' that
doesn't have capture functionality because the component of
samsung-i2s-sec is located in the first of the component_list.

I add dai name like 'samsung-i2s', 'samsung-i2s-sec' for each dais. The
reason why adding dai id to 1 is that it doesn't allow to use particular
dai name in case of when I use 0 for dai id.

Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/i2s.c | 4 ++++
 sound/soc/samsung/i2s.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d7e7f4244d38..8d5e1861abb1 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1099,6 +1099,7 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev,
 	i2s->pdev = pdev;
 	i2s->pri_dai = NULL;
 	i2s->sec_dai = NULL;
+	i2s->i2s_dai_drv.id = 1;
 	i2s->i2s_dai_drv.symmetric_rates = 1;
 	i2s->i2s_dai_drv.probe = samsung_i2s_dai_probe;
 	i2s->i2s_dai_drv.remove = samsung_i2s_dai_remove;
@@ -1111,10 +1112,13 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev,
 	i2s->i2s_dai_drv.playback.formats = SAMSUNG_I2S_FMTS;
 
 	if (!sec) {
+		i2s->i2s_dai_drv.name = SAMSUNG_I2S_DAI;
 		i2s->i2s_dai_drv.capture.channels_min = 1;
 		i2s->i2s_dai_drv.capture.channels_max = 2;
 		i2s->i2s_dai_drv.capture.rates = i2s_dai_data->pcm_rates;
 		i2s->i2s_dai_drv.capture.formats = SAMSUNG_I2S_FMTS;
+	} else {
+		i2s->i2s_dai_drv.name = SAMSUNG_I2S_DAI_SEC;
 	}
 	return i2s;
 }
diff --git a/sound/soc/samsung/i2s.h b/sound/soc/samsung/i2s.h
index 21ff24e930db..79781de2f247 100644
--- a/sound/soc/samsung/i2s.h
+++ b/sound/soc/samsung/i2s.h
@@ -13,6 +13,9 @@
 #ifndef __SND_SOC_SAMSUNG_I2S_H
 #define __SND_SOC_SAMSUNG_I2S_H
 
+#define SAMSUNG_I2S_DAI        "samsung-i2s"
+#define SAMSUNG_I2S_DAI_SEC    "samsung-i2s-sec"
+
 #define SAMSUNG_I2S_DIV_BCLK	1
 
 #define SAMSUNG_I2S_RCLKSRC_0	0
-- 
2.14.1
