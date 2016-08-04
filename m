From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/7] ASoC: samsung: Drop usage of struct s3c_dma_params from
 ac97.c
Date: Thu, 04 Aug 2016 11:30:29 +0200
Message-ID: <1470303032-14582-5-git-send-email-s.nawrocki@samsung.com>
References: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754336AbcHDJbd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:33 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD00V68P3HE550@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:31:01 +0900 (KST)
In-reply-to: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

struct s3c_dma_params already includes struct snd_dmaengine_dai_dma_data,
there is no need for such an indirection so switch to using struct
snd_dmaengine_dai_dma_data instead of struct s3c_dma_params.  This also
allows us to use snd_soc_dai_init_dma_data() function instead of the
platform specific samsung_asoc_init_dma_data helper.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/ac97.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
index 547d310..5eafb66 100644
--- a/sound/soc/samsung/ac97.c
+++ b/sound/soc/samsung/ac97.c
@@ -38,16 +38,16 @@ struct s3c_ac97_info {
 };
 static struct s3c_ac97_info s3c_ac97;
 
-static struct s3c_dma_params s3c_ac97_pcm_out = {
-	.dma_size	= 4,
+static struct snd_dmaengine_dai_dma_data s3c_ac97_pcm_out = {
+	.addr_width	= 4,
 };
 
-static struct s3c_dma_params s3c_ac97_pcm_in = {
-	.dma_size	= 4,
+static struct snd_dmaengine_dai_dma_data s3c_ac97_pcm_in = {
+	.addr_width	= 4,
 };
 
-static struct s3c_dma_params s3c_ac97_mic_in = {
-	.dma_size	= 4,
+static struct snd_dmaengine_dai_dma_data s3c_ac97_mic_in = {
+	.addr_width	= 4,
 };
 
 static void s3c_ac97_activate(struct snd_ac97 *ac97)
@@ -273,14 +273,14 @@ static const struct snd_soc_dai_ops s3c_ac97_mic_dai_ops = {
 
 static int s3c_ac97_dai_probe(struct snd_soc_dai *dai)
 {
-	samsung_asoc_init_dma_data(dai, &s3c_ac97_pcm_out, &s3c_ac97_pcm_in);
+	snd_soc_dai_init_dma_data(dai, &s3c_ac97_pcm_out, &s3c_ac97_pcm_in);
 
 	return 0;
 }
 
 static int s3c_ac97_mic_dai_probe(struct snd_soc_dai *dai)
 {
-	samsung_asoc_init_dma_data(dai, NULL, &s3c_ac97_mic_in);
+	snd_soc_dai_init_dma_data(dai, NULL, &s3c_ac97_mic_in);
 
 	return 0;
 }
@@ -346,12 +346,12 @@ static int s3c_ac97_probe(struct platform_device *pdev)
 	if (IS_ERR(s3c_ac97.regs))
 		return PTR_ERR(s3c_ac97.regs);
 
-	s3c_ac97_pcm_out.slave = ac97_pdata->dma_playback;
-	s3c_ac97_pcm_out.dma_addr = mem_res->start + S3C_AC97_PCM_DATA;
-	s3c_ac97_pcm_in.slave = ac97_pdata->dma_capture;
-	s3c_ac97_pcm_in.dma_addr = mem_res->start + S3C_AC97_PCM_DATA;
-	s3c_ac97_mic_in.slave = ac97_pdata->dma_capture_mic;
-	s3c_ac97_mic_in.dma_addr = mem_res->start + S3C_AC97_MIC_DATA;
+	s3c_ac97_pcm_out.filter_data = ac97_pdata->dma_playback;
+	s3c_ac97_pcm_out.addr = mem_res->start + S3C_AC97_PCM_DATA;
+	s3c_ac97_pcm_in.filter_data = ac97_pdata->dma_capture;
+	s3c_ac97_pcm_in.addr = mem_res->start + S3C_AC97_PCM_DATA;
+	s3c_ac97_mic_in.filter_data = ac97_pdata->dma_capture_mic;
+	s3c_ac97_mic_in.addr = mem_res->start + S3C_AC97_MIC_DATA;
 
 	init_completion(&s3c_ac97.done);
 	mutex_init(&s3c_ac97.lock);
-- 
1.9.1
