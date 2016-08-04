From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/7] ASoC: samsung: Drop usage of of struct s3c_dma_params from
 pcm.c
Date: Thu, 04 Aug 2016 11:30:31 +0200
Message-ID: <1470303032-14582-7-git-send-email-s.nawrocki@samsung.com>
References: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933223AbcHDJbe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:34 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD00V68P3HE550@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:31:05 +0900 (KST)
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
 sound/soc/samsung/pcm.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 490c1a8..43e367a 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -127,25 +127,25 @@ struct s3c_pcm_info {
 	struct clk	*pclk;
 	struct clk	*cclk;
 
-	struct s3c_dma_params	*dma_playback;
-	struct s3c_dma_params	*dma_capture;
+	struct snd_dmaengine_dai_dma_data *dma_playback;
+	struct snd_dmaengine_dai_dma_data *dma_capture;
 };
 
-static struct s3c_dma_params s3c_pcm_stereo_out[] = {
+static struct snd_dmaengine_dai_dma_data s3c_pcm_stereo_out[] = {
 	[0] = {
-		.dma_size	= 4,
+		.addr_width	= 4,
 	},
 	[1] = {
-		.dma_size	= 4,
+		.addr_width	= 4,
 	},
 };
 
-static struct s3c_dma_params s3c_pcm_stereo_in[] = {
+static struct snd_dmaengine_dai_dma_data s3c_pcm_stereo_in[] = {
 	[0] = {
-		.dma_size	= 4,
+		.addr_width	= 4,
 	},
 	[1] = {
-		.dma_size	= 4,
+		.addr_width	= 4,
 	},
 };
 
@@ -552,15 +552,13 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	}
 	clk_prepare_enable(pcm->pclk);
 
-	s3c_pcm_stereo_in[pdev->id].dma_addr = mem_res->start
-							+ S3C_PCM_RXFIFO;
-	s3c_pcm_stereo_out[pdev->id].dma_addr = mem_res->start
-							+ S3C_PCM_TXFIFO;
+	s3c_pcm_stereo_in[pdev->id].addr = mem_res->start + S3C_PCM_RXFIFO;
+	s3c_pcm_stereo_out[pdev->id].addr = mem_res->start + S3C_PCM_TXFIFO;
 
 	filter = NULL;
 	if (pcm_pdata) {
-		s3c_pcm_stereo_in[pdev->id].slave = pcm_pdata->dma_capture;
-		s3c_pcm_stereo_out[pdev->id].slave = pcm_pdata->dma_playback;
+		s3c_pcm_stereo_in[pdev->id].filter_data = pcm_pdata->dma_capture;
+		s3c_pcm_stereo_out[pdev->id].filter_data = pcm_pdata->dma_playback;
 		filter = pcm_pdata->dma_filter;
 	}
 
-- 
1.9.1
