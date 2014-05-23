From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ASoC: samsung: Use params_width()
Date: Fri, 23 May 2014 17:35:39 +0530
Message-ID: <1400846739-32427-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33325 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186AbaEWMHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 08:07:53 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so4076093pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 05:07:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com

commit 8c5178fca4ce ("ALSA: Add params_width() helpers") introduces
a helper to get the sample width. Updating Samsung related sound
drivers to use this helper.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 sound/soc/samsung/i2s.c         |    8 ++++----
 sound/soc/samsung/pcm.c         |    4 ++--
 sound/soc/samsung/s3c-i2s-v2.c  |    8 ++++----
 sound/soc/samsung/s3c2412-i2s.c |    6 +++---
 sound/soc/samsung/s3c24xx-i2s.c |    6 +++---
 sound/soc/samsung/smdk_wm8580.c |    8 +++-----
 sound/soc/samsung/smdk_wm8994.c |    2 +-
 sound/soc/samsung/spdif.c       |    4 ++--
 8 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 07ff3e7..6b96168 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -672,8 +672,8 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	if (is_manager(i2s))
 		mod &= ~MOD_BLC_MASK;
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S8:
+	switch (params_width(params)) {
+	case 8:
 		if (is_secondary(i2s))
 			mod |= MOD_BLCS_8BIT;
 		else
@@ -681,7 +681,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		if (is_manager(i2s))
 			mod |= MOD_BLC_8BIT;
 		break;
-	case SNDRV_PCM_FORMAT_S16_LE:
+	case 16:
 		if (is_secondary(i2s))
 			mod |= MOD_BLCS_16BIT;
 		else
@@ -689,7 +689,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		if (is_manager(i2s))
 			mod |= MOD_BLC_16BIT;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case 24:
 		if (is_secondary(i2s))
 			mod |= MOD_BLCS_24BIT;
 		else
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index a3c9c9c..4c5f97f 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -283,8 +283,8 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
 
 	/* Strictly check for sample size */
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (params_width(params)) {
+	case 16:
 		break;
 	default:
 		return -EINVAL;
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 77a2ae5..0ff4bbe 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -322,13 +322,13 @@ static int s3c_i2sv2_hw_params(struct snd_pcm_substream *substream,
 
 	iismod &= ~S3C64XX_IISMOD_BLC_MASK;
 	/* Sample size */
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S8:
+	switch (params_width(params)) {
+	case 8:
 		iismod |= S3C64XX_IISMOD_BLC_8BIT;
 		break;
-	case SNDRV_PCM_FORMAT_S16_LE:
+	case 16:
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case 24:
 		iismod |= S3C64XX_IISMOD_BLC_24BIT;
 		break;
 	}
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 843f315..08c059b 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -120,11 +120,11 @@ static int s3c2412_i2s_hw_params(struct snd_pcm_substream *substream,
 	iismod = readl(i2s->regs + S3C2412_IISMOD);
 	pr_debug("%s: r: IISMOD: %x\n", __func__, iismod);
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S8:
+	switch (params_width(params)) {
+	case 8:
 		iismod |= S3C2412_IISMOD_8BIT;
 		break;
-	case SNDRV_PCM_FORMAT_S16_LE:
+	case 16:
 		iismod &= ~S3C2412_IISMOD_8BIT;
 		break;
 	}
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 4a6d206..9aba9fb 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -248,12 +248,12 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x\n", iismod);
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S8:
+	switch (params_width(params)) {
+	case 8:
 		iismod &= ~S3C2410_IISMOD_16BIT;
 		dma_data->dma_size = 1;
 		break;
-	case SNDRV_PCM_FORMAT_S16_LE:
+	case 16:
 		iismod |= S3C2410_IISMOD_16BIT;
 		dma_data->dma_size = 2;
 		break;
diff --git a/sound/soc/samsung/smdk_wm8580.c b/sound/soc/samsung/smdk_wm8580.c
index 7a16b32..b1a519f 100644
--- a/sound/soc/samsung/smdk_wm8580.c
+++ b/sound/soc/samsung/smdk_wm8580.c
@@ -37,13 +37,11 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	unsigned int pll_out;
 	int bfs, rfs, ret;
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_U8:
-	case SNDRV_PCM_FORMAT_S8:
+	switch (params_width(params)) {
+	case 8:
 		bfs = 16;
 		break;
-	case SNDRV_PCM_FORMAT_U16_LE:
-	case SNDRV_PCM_FORMAT_S16_LE:
+	case 16:
 		bfs = 32;
 		break;
 	default:
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index fc25cc0..3d6272a 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -57,7 +57,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* AIF1CLK should be >=3MHz for optimal performance */
-	if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)
+	if (params_width(params) == 24)
 		pll_out = params_rate(params) * 384;
 	else if (params_rate(params) == 8000 || params_rate(params) == 11025)
 		pll_out = params_rate(params) * 512;
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index e93a93e..d9ffc48 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -211,8 +211,8 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	con |= CON_PCM_DATA;
 
 	con &= ~CON_PCM_MASK;
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (params_width(params)) {
+	case 16:
 		con |= CON_PCM_16BIT;
 		break;
 	default:
-- 
1.7.9.5
