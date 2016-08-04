From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: dwc: Drop DMA channel names assignment
Date: Thu, 04 Aug 2016 12:22:32 +0200
Message-ID: <1470306152-15441-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53405 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932814AbcHDKfE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 06:35:04 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD015CVRI1KH80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 19:22:49 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: Andrew.Jackson@arm.com, rajeevk-dlh.kumar@st.com, Jose.Abreu@synopsys.com, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The dw_configure_dai_by_dt() function and further dev->{play,capture}
_dma_data.dt data structures seem to be used in this driver only in case 
of a system using devicetree, thus chan_name assignments have no effect 
since they will be ignored in dmaengine_pcm_request_chan_of() call and 
will be substituted with values taken form dmaengine_pcm_dma_channel_names[] 
table ("tx", "rx").

Also there is no any "TX", "RX" dma-names entries in arch/arm/boot/dts, 
only lower case "tx", "rx" seem to be used.

Lastly, this driver doesn't set SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME
flag when registering a dmaengine PCM to indicate the chan_name should be
used.

My intention is to eventually remove the struct snd_dmaengine_dai_dma_data
chan_name field as there is also a chan_names[] field in struct
snd_dmaengine_pcm_config which can be used for same purpose.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/dwc/designware_i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/dwc/designware_i2s.c b/sound/soc/dwc/designware_i2s.c
index dc97f43..2998954 100644
--- a/sound/soc/dwc/designware_i2s.c
+++ b/sound/soc/dwc/designware_i2s.c
@@ -577,7 +577,6 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_PLAY;
 		dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 		dev->play_dma_data.dt.addr_width = bus_widths[idx];
-		dev->play_dma_data.dt.chan_name = "TX";
 		dev->play_dma_data.dt.fifo_size = fifo_depth *
 			(fifo_width[idx2]) >> 8;
 		dev->play_dma_data.dt.maxburst = 16;
@@ -588,7 +587,6 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_RECORD;
 		dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 		dev->capture_dma_data.dt.addr_width = bus_widths[idx];
-		dev->capture_dma_data.dt.chan_name = "RX";
 		dev->capture_dma_data.dt.fifo_size = fifo_depth *
 			(fifo_width[idx2] >> 8);
 		dev->capture_dma_data.dt.maxburst = 16;
-- 
1.9.1
