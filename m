From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 17/21] ASoC: samsung: i2s: Change indentation in
 SAMSUNG_I2S_FMTS definition
Date: Tue, 12 Feb 2019 19:03:38 +0100
Message-ID: <20190212180342.32040-18-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180539epcas1p457a5c91f2c2cef0d1b92ff8bf804beee@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Change indentation so this macro definition spans 2 rows and looks
more consistent with surrounding code.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 097c641fc1b9..debeaf51cc7e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1150,9 +1150,8 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 	.num_dapm_routes = ARRAY_SIZE(samsung_i2s_dapm_routes),
 };

-#define SAMSUNG_I2S_FMTS	(SNDRV_PCM_FMTBIT_S8 | \
-					SNDRV_PCM_FMTBIT_S16_LE | \
-					SNDRV_PCM_FMTBIT_S24_LE)
+#define SAMSUNG_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
+			  SNDRV_PCM_FMTBIT_S24_LE)

 static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 			  const struct samsung_i2s_dai_data *i2s_dai_data,
--
2.20.1
