From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/7] ASoC: samsung: Drop usage of struct s3c_dma_params from
 i2s.c
Date: Thu, 04 Aug 2016 11:30:26 +0200
Message-ID: <1470303032-14582-2-git-send-email-s.nawrocki@samsung.com>
References: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54978 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753794AbcHDJbc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:32 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD014VDP3FUR40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:30:54 +0900 (KST)
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
 sound/soc/samsung/i2s.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 50635ee..fa3ff03 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -87,9 +87,9 @@ struct i2s_dai {
 	/* Driver for this DAI */
 	struct snd_soc_dai_driver i2s_dai_drv;
 	/* DMA parameters */
-	struct s3c_dma_params dma_playback;
-	struct s3c_dma_params dma_capture;
-	struct s3c_dma_params idma_playback;
+	struct snd_dmaengine_dai_dma_data dma_playback;
+	struct snd_dmaengine_dai_dma_data dma_capture;
+	struct snd_dmaengine_dai_dma_data idma_playback;
 	dma_filter_fn filter;
 	u32	quirks;
 	u32	suspend_i2smod;
@@ -692,15 +692,15 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		break;
 	case 2:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			i2s->dma_playback.dma_size = 4;
+			i2s->dma_playback.addr_width = 4;
 		else
-			i2s->dma_capture.dma_size = 4;
+			i2s->dma_capture.addr_width = 4;
 		break;
 	case 1:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			i2s->dma_playback.dma_size = 2;
+			i2s->dma_playback.addr_width = 2;
 		else
-			i2s->dma_capture.dma_size = 2;
+			i2s->dma_capture.addr_width = 2;
 
 		break;
 	default:
@@ -754,7 +754,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	writel(mod, i2s->addr + I2SMOD);
 	spin_unlock_irqrestore(i2s->lock, flags);
 
-	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
+	snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
 
 	i2s->frmclk = params_rate(params);
 
@@ -991,10 +991,10 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	unsigned long flags;
 
 	if (is_secondary(i2s)) { /* If this is probe on the secondary DAI */
-		samsung_asoc_init_dma_data(dai, &other->sec_dai->dma_playback,
+		snd_soc_dai_init_dma_data(dai, &other->sec_dai->dma_playback,
 					   NULL);
 	} else {
-		samsung_asoc_init_dma_data(dai, &i2s->dma_playback,
+		snd_soc_dai_init_dma_data(dai, &i2s->dma_playback,
 					   &i2s->dma_capture);
 
 		if (i2s->quirks & QUIRK_NEED_RSTCLR)
@@ -1002,7 +1002,7 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 
 		if (i2s->quirks & QUIRK_SUPPORTS_IDMA)
 			idma_reg_addr_init(i2s->addr,
-					i2s->sec_dai->idma_playback.dma_addr);
+					i2s->sec_dai->idma_playback.addr);
 	}
 
 	/* Reset any constraint on RFS and BFS */
@@ -1262,8 +1262,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		pri_dai->dma_playback.slave = i2s_pdata->dma_playback;
-		pri_dai->dma_capture.slave = i2s_pdata->dma_capture;
+		pri_dai->dma_playback.filter_data = i2s_pdata->dma_playback;
+		pri_dai->dma_capture.filter_data = i2s_pdata->dma_capture;
 		pri_dai->filter = i2s_pdata->dma_filter;
 
 		if (&i2s_pdata->type)
@@ -1302,12 +1302,12 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to enable clock: %d\n", ret);
 		return ret;
 	}
-	pri_dai->dma_playback.dma_addr = regs_base + I2STXD;
-	pri_dai->dma_capture.dma_addr = regs_base + I2SRXD;
-	pri_dai->dma_playback.ch_name = "tx";
-	pri_dai->dma_capture.ch_name = "rx";
-	pri_dai->dma_playback.dma_size = 4;
-	pri_dai->dma_capture.dma_size = 4;
+	pri_dai->dma_playback.addr = regs_base + I2STXD;
+	pri_dai->dma_capture.addr = regs_base + I2SRXD;
+	pri_dai->dma_playback.chan_name = "tx";
+	pri_dai->dma_capture.chan_name = "rx";
+	pri_dai->dma_playback.addr_width = 4;
+	pri_dai->dma_capture.addr_width = 4;
 	pri_dai->quirks = quirks;
 	pri_dai->variant_regs = i2s_dai_data->i2s_variant_regs;
 
@@ -1323,19 +1323,19 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 		sec_dai->lock = &pri_dai->spinlock;
 		sec_dai->variant_regs = pri_dai->variant_regs;
-		sec_dai->dma_playback.dma_addr = regs_base + I2STXDS;
-		sec_dai->dma_playback.ch_name = "tx-sec";
+		sec_dai->dma_playback.addr = regs_base + I2STXDS;
+		sec_dai->dma_playback.chan_name = "tx-sec";
 
 		if (!np) {
-			sec_dai->dma_playback.slave = i2s_pdata->dma_play_sec;
+			sec_dai->dma_playback.filter_data = i2s_pdata->dma_play_sec;
 			sec_dai->filter = i2s_pdata->dma_filter;
 		}
 
-		sec_dai->dma_playback.dma_size = 4;
+		sec_dai->dma_playback.addr_width = 4;
 		sec_dai->addr = pri_dai->addr;
 		sec_dai->clk = pri_dai->clk;
 		sec_dai->quirks = quirks;
-		sec_dai->idma_playback.dma_addr = idma_addr;
+		sec_dai->idma_playback.addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
 		pri_dai->sec_dai = sec_dai;
 	}
-- 
1.9.1
