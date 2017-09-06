From: Jaechul Lee <jcsing.lee@samsung.com>
Subject: [PATCH v2 1/3] ASoC: samsung: i2s: Use specific name for i2s dais
Date: Wed, 06 Sep 2017 10:04:13 +0900
Message-ID: <20170906010415.26952-2-jcsing.lee@samsung.com>
References: <20170906010415.26952-1-jcsing.lee@samsung.com>
        <CGME20170906010417epcas2p208db637d89a670d01fa3dbeb78ff0da0@epcas2p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17618 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753658AbdIFBEU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 21:04:20 -0400
In-reply-to: <20170906010415.26952-1-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Jaechul Lee <jcsing.lee@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

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
 sound/soc/samsung/i2s.c | 4 ++++
 sound/soc/samsung/i2s.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 10a4da06c0a1..3aa2e7d54ea9 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1096,6 +1096,7 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev,
 	i2s->pdev = pdev;
 	i2s->pri_dai = NULL;
 	i2s->sec_dai = NULL;
+	i2s->i2s_dai_drv.id = 1;
 	i2s->i2s_dai_drv.symmetric_rates = 1;
 	i2s->i2s_dai_drv.probe = samsung_i2s_dai_probe;
 	i2s->i2s_dai_drv.remove = samsung_i2s_dai_remove;
@@ -1108,10 +1109,13 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev,
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
