From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: dwc: Drop DMA channel names assignment" to the asoc tree
Date: Fri, 05 Aug 2016 13:09:04 +0100
Message-ID: <E1bVdw0-0002dt-JY@debutante>
References: <1470306152-15441-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56702 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161217AbcHEMJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 08:09:14 -0400
In-Reply-To: <1470306152-15441-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, Jose.Abreu@synopsys.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, Andrew.Jackson@arm.com, rajeevk-dlh.kumar@st.com

The patch

   ASoC: dwc: Drop DMA channel names assignment

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 8bb9d4991657fc79874076b89f96601e6b32319a Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 4 Aug 2016 12:22:32 +0200
Subject: [PATCH] ASoC: dwc: Drop DMA channel names assignment

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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/dwc/designware_i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/dwc/designware_i2s.c b/sound/soc/dwc/designware_i2s.c
index dc97f4349e66..2998954a1c74 100644
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
2.8.1
