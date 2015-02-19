From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] ASoC: max98088: Add master clock handling
Date: Thu, 19 Feb 2015 20:18:41 +0100
Message-ID: <1424373526-4135-1-git-send-email-afaerber@suse.de>
References: <1424283959-16289-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424283959-16289-3-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Tushar Behera <tushar.behera@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Lars-Peter Clausen <lars@metafoo.de>, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: linux-samsung-soc@vger.kernel.org

If master clock is provided through device tree, then update
the master clock frequency during set_sysclk.

Cc: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 sound/soc/codecs/max98088.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 69a21d1946e3..1aa81321afba 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -16,6 +16,7 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
+#include <linux/clk.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -42,6 +43,7 @@ struct max98088_priv {
 	struct regmap *regmap;
 	enum max98088_type devtype;
 	struct max98088_pdata *pdata;
+	struct clk *mclk;
 	unsigned int sysclk;
 	struct max98088_cdata dai[2];
 	int eq_textcnt;
@@ -1361,6 +1363,11 @@ static int max98088_dai_set_sysclk(struct snd_so=
c_dai *dai,
        if (freq =3D=3D max98088->sysclk)
                return 0;
=20
+       if (!IS_ERR(max98088->mclk)) {
+               freq =3D clk_round_rate(max98088->mclk, freq);
+               clk_set_rate(max98088->mclk, freq);
+       }
+
        /* Setup clocks for slave mode, and using the PLL
         * PSCLK =3D 0x01 (when master clk is 10MHz to 20MHz)
         *         0x02 (when master clk is 20MHz to 30MHz)..
@@ -1568,6 +1575,19 @@ static int max98088_set_bias_level(struct snd_so=
c_codec *codec,
 		break;
=20
 	case SND_SOC_BIAS_PREPARE:
+		/*
+		 * SND_SOC_BIAS_PREPARE is called while preparing for a
+		 * transition to ON or away from ON. If current bias_level
+		 * is SND_SOC_BIAS_ON, then it is preparing for a transition
+		 * away from ON. Disable the clock in that case, otherwise
+		 * enable it.
+		 */
+		if (!IS_ERR(max98088->mclk)) {
+			if (codec->dapm.bias_level =3D=3D SND_SOC_BIAS_ON)
+				clk_disable_unprepare(max98088->mclk);
+			else
+				clk_prepare_enable(max98088->mclk);
+		}
 		break;
=20
 	case SND_SOC_BIAS_STANDBY:
@@ -1900,6 +1920,10 @@ static int max98088_probe(struct snd_soc_codec *=
codec)
        max98088->sysclk =3D (unsigned)-1;
        max98088->eq_textcnt =3D 0;
=20
+       max98088->mclk =3D devm_clk_get(codec->dev, "mclk");
+       if (PTR_ERR(max98088->mclk) =3D=3D -EPROBE_DEFER)
+               return -EPROBE_DEFER;
+
        cdata =3D &max98088->dai[0];
        cdata->rate =3D (unsigned)-1;
        cdata->fmt  =3D (unsigned)-1;
--=20
2.1.4
