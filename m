From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Ensure DMA data is initialised for secondary DAI
Date: Thu,  5 Dec 2013 14:13:57 +0000
Message-ID: <1386252837-17321-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47066 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429Ab3LEOOL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 09:14:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, stable@vger.kernel.org

From: Mark Brown <broonie@linaro.org>

While testing the upcoming dmaengine conversion for the driver Padma
noticed that the DMA data for the secondard DAI is not being correctly
initialised and provided a fix on top of the conversion.  Also do this
fix for mainline.

Reported-by: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: Mark Brown <broonie@linaro.org>
Cc: stable@vger.kernel.org
---

Compile tested only, I don't have hardware to test.

 sound/soc/samsung/i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index a5cbdb4f1655..f9f2227421ea 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -946,8 +946,11 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = i2s->pri_dai ? : i2s->sec_dai;
 
-	if (other && other->clk) /* If this is probe on secondary */
+	if (other && other->clk) { /* If this is probe on secondary */
+		snd_soc_dai_init_dma_data(dai, &other->sec_dai->dma_playback,
+					  NULL);
 		goto probe_exit;
+	}
 
 	i2s->addr = ioremap(i2s->base, 0x100);
 	if (i2s->addr == NULL) {
-- 
1.8.5.1
