From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/2] ASOC: SAMSUNG: Add dma_prop variable in s3c_dma_params
Date: Wed, 25 Jul 2012 17:39:30 +0530
Message-ID: <1343218170-30483-3-git-send-email-padma.v@samsung.com>
References: <1343218170-30483-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62583 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756558Ab2GYMFA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jul 2012 08:05:00 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7P0050UTJZQGP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jul 2012 21:04:59 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7P003XATJZ9260@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jul 2012 21:04:59 +0900 (KST)
In-reply-to: <1343218170-30483-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: padma.v@samsung.com, rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, thutt@chromium.org, joshi@samsung.com

In DT based implementation, the DMA channel number need to be parsed as
a property from device tree. So add dma_prop variable in s3c_dma_params
to get the i2s DMA channel number.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/dma.c |    1 +
 sound/soc/samsung/dma.h |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index f3ebc38..28a7c37 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -170,6 +170,7 @@ static int dma_hw_params(struct snd_pcm_substream *substream,
 		req.cap = (samsung_dma_has_circular() ?
 			DMA_CYCLIC : DMA_SLAVE);
 		req.client = prtd->params->client;
+		req.dt_dmach_prop = prtd->params->dma_prop;
 		config.direction =
 			(substream->stream == SNDRV_PCM_STREAM_PLAYBACK
 			? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM);
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 7d1ead7..2e60415 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -19,6 +19,7 @@ struct s3c_dma_params {
 	int dma_size;			/* Size of the DMA transfer */
 	unsigned ch;
 	struct samsung_dma_ops *ops;
+	struct property *dma_prop;
 };
 
 #endif
-- 
1.7.4.4
