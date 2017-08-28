From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH 1/3] ASoC: samsung: i2s: Use specific name for i2s dais
Date: Mon, 28 Aug 2017 19:01:00 +0900
Message-ID: <20170828100102.17591-2-jcsing.lee@samsung.com>
References: <20170828100102.17591-1-jcsing.lee@samsung.com>
        <CGME20170828100105epcas2p18b821aec5caf1d690c33c2b1426d1a17@epcas2p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170828100102.17591-1-jcsing.lee@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Jaechul Lee <jcsing.lee@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

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
---
 sound/soc/samsung/i2s.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index af3ba4d4ccc5..9cdd36b9711c 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1076,6 +1076,8 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 	.name		= "samsung-i2s",
 };
 
+#define SAMSUNG_I2S_DAI        "samsung-i2s"
+#define SAMSUNG_I2S_DAI_SEC    "samsung-i2s-sec"
 #define SAMSUNG_I2S_RATES	SNDRV_PCM_RATE_8000_96000
 
 #define SAMSUNG_I2S_FMTS	(SNDRV_PCM_FMTBIT_S8 | \
@@ -1093,6 +1095,7 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	i2s->pdev = pdev;
 	i2s->pri_dai = NULL;
 	i2s->sec_dai = NULL;
+	i2s->i2s_dai_drv.id = 1;
 	i2s->i2s_dai_drv.symmetric_rates = 1;
 	i2s->i2s_dai_drv.probe = samsung_i2s_dai_probe;
 	i2s->i2s_dai_drv.remove = samsung_i2s_dai_remove;
@@ -1105,10 +1108,13 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	i2s->i2s_dai_drv.playback.formats = SAMSUNG_I2S_FMTS;
 
 	if (!sec) {
+		i2s->i2s_dai_drv.name = SAMSUNG_I2S_DAI;
 		i2s->i2s_dai_drv.capture.channels_min = 1;
 		i2s->i2s_dai_drv.capture.channels_max = 2;
 		i2s->i2s_dai_drv.capture.rates = SAMSUNG_I2S_RATES;
 		i2s->i2s_dai_drv.capture.formats = SAMSUNG_I2S_FMTS;
+	} else {
+		i2s->i2s_dai_drv.name = SAMSUNG_I2S_DAI_SEC;
 	}
 	return i2s;
 }
-- 
2.14.1
