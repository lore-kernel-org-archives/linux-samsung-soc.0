From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: samsung: Initialise DMA data at device probe time
Date: Thu, 17 Oct 2013 22:34:13 +0100
Message-ID: <1382045653-14807-2-git-send-email-broonie@kernel.org>
References: <1382045653-14807-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:40722 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762379Ab3JQVei (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 17:34:38 -0400
In-Reply-To: <1382045653-14807-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

This is a minor simplification and will help with converting the platform
to use the dmaengine helpers.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/i2s.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 32956df..2c4d250 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -702,13 +702,6 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	writel(mod, i2s->addr + I2SMOD);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_soc_dai_set_dma_data(dai, substream,
-			(void *)&i2s->dma_playback);
-	else
-		snd_soc_dai_set_dma_data(dai, substream,
-			(void *)&i2s->dma_capture);
-
 	i2s->frmclk = params_rate(params);
 
 	return 0;
@@ -970,6 +963,8 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	}
 	clk_prepare_enable(i2s->clk);
 
+	snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
+
 	if (other) {
 		other->addr = i2s->addr;
 		other->clk = i2s->clk;
-- 
1.8.4.rc3
