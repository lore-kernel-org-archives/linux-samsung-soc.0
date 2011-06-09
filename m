From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 1/4] ASoC: SAMSUNG: Modify I2S driver to support idma
Date: Thu,  9 Jun 2011 17:09:07 +0900
Message-ID: <1307606950-8310-2-git-send-email-sbkim73@samsung.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58734 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756298Ab1FIITF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 04:19:05 -0400
In-Reply-To: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

Previously, I2S driver only can support system dma.
In this patch, i2s driver can support internal dma too.
To share register definition, register definition is moved
to i2s.h and added some register to support idma.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/i2s.c |  126 ++++++++--------------------------------------
 sound/soc/samsung/i2s.h |  130 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 150 insertions(+), 106 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ffa09b3..404f4c2 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -21,113 +21,9 @@
 #include <plat/audio.h>
 
 #include "dma.h"
+#include "idma.h"
 #include "i2s.h"
 
-#define I2SCON		0x0
-#define I2SMOD		0x4
-#define I2SFIC		0x8
-#define I2SPSR		0xc
-#define I2STXD		0x10
-#define I2SRXD		0x14
-#define I2SFICS		0x18
-#define I2STXDS		0x1c
-
-#define CON_RSTCLR		(1 << 31)
-#define CON_FRXOFSTATUS		(1 << 26)
-#define CON_FRXORINTEN		(1 << 25)
-#define CON_FTXSURSTAT		(1 << 24)
-#define CON_FTXSURINTEN		(1 << 23)
-#define CON_TXSDMA_PAUSE	(1 << 20)
-#define CON_TXSDMA_ACTIVE	(1 << 18)
-
-#define CON_FTXURSTATUS		(1 << 17)
-#define CON_FTXURINTEN		(1 << 16)
-#define CON_TXFIFO2_EMPTY	(1 << 15)
-#define CON_TXFIFO1_EMPTY	(1 << 14)
-#define CON_TXFIFO2_FULL	(1 << 13)
-#define CON_TXFIFO1_FULL	(1 << 12)
-
-#define CON_LRINDEX		(1 << 11)
-#define CON_TXFIFO_EMPTY	(1 << 10)
-#define CON_RXFIFO_EMPTY	(1 << 9)
-#define CON_TXFIFO_FULL		(1 << 8)
-#define CON_RXFIFO_FULL		(1 << 7)
-#define CON_TXDMA_PAUSE		(1 << 6)
-#define CON_RXDMA_PAUSE		(1 << 5)
-#define CON_TXCH_PAUSE		(1 << 4)
-#define CON_RXCH_PAUSE		(1 << 3)
-#define CON_TXDMA_ACTIVE	(1 << 2)
-#define CON_RXDMA_ACTIVE	(1 << 1)
-#define CON_ACTIVE		(1 << 0)
-
-#define MOD_OPCLK_CDCLK_OUT	(0 << 30)
-#define MOD_OPCLK_CDCLK_IN	(1 << 30)
-#define MOD_OPCLK_BCLK_OUT	(2 << 30)
-#define MOD_OPCLK_PCLK		(3 << 30)
-#define MOD_OPCLK_MASK		(3 << 30)
-#define MOD_TXS_IDMA		(1 << 28) /* Sec_TXFIFO use I-DMA */
-
-#define MOD_BLCS_SHIFT	26
-#define MOD_BLCS_16BIT	(0 << MOD_BLCS_SHIFT)
-#define MOD_BLCS_8BIT	(1 << MOD_BLCS_SHIFT)
-#define MOD_BLCS_24BIT	(2 << MOD_BLCS_SHIFT)
-#define MOD_BLCS_MASK	(3 << MOD_BLCS_SHIFT)
-#define MOD_BLCP_SHIFT	24
-#define MOD_BLCP_16BIT	(0 << MOD_BLCP_SHIFT)
-#define MOD_BLCP_8BIT	(1 << MOD_BLCP_SHIFT)
-#define MOD_BLCP_24BIT	(2 << MOD_BLCP_SHIFT)
-#define MOD_BLCP_MASK	(3 << MOD_BLCP_SHIFT)
-
-#define MOD_C2DD_HHALF		(1 << 21) /* Discard Higher-half */
-#define MOD_C2DD_LHALF		(1 << 20) /* Discard Lower-half */
-#define MOD_C1DD_HHALF		(1 << 19)
-#define MOD_C1DD_LHALF		(1 << 18)
-#define MOD_DC2_EN		(1 << 17)
-#define MOD_DC1_EN		(1 << 16)
-#define MOD_BLC_16BIT		(0 << 13)
-#define MOD_BLC_8BIT		(1 << 13)
-#define MOD_BLC_24BIT		(2 << 13)
-#define MOD_BLC_MASK		(3 << 13)
-
-#define MOD_IMS_SYSMUX		(1 << 10)
-#define MOD_SLAVE		(1 << 11)
-#define MOD_TXONLY		(0 << 8)
-#define MOD_RXONLY		(1 << 8)
-#define MOD_TXRX		(2 << 8)
-#define MOD_MASK		(3 << 8)
-#define MOD_LR_LLOW		(0 << 7)
-#define MOD_LR_RLOW		(1 << 7)
-#define MOD_SDF_IIS		(0 << 5)
-#define MOD_SDF_MSB		(1 << 5)
-#define MOD_SDF_LSB		(2 << 5)
-#define MOD_SDF_MASK		(3 << 5)
-#define MOD_RCLK_256FS		(0 << 3)
-#define MOD_RCLK_512FS		(1 << 3)
-#define MOD_RCLK_384FS		(2 << 3)
-#define MOD_RCLK_768FS		(3 << 3)
-#define MOD_RCLK_MASK		(3 << 3)
-#define MOD_BCLK_32FS		(0 << 1)
-#define MOD_BCLK_48FS		(1 << 1)
-#define MOD_BCLK_16FS		(2 << 1)
-#define MOD_BCLK_24FS		(3 << 1)
-#define MOD_BCLK_MASK		(3 << 1)
-#define MOD_8BIT		(1 << 0)
-
-#define MOD_CDCLKCON		(1 << 12)
-
-#define PSR_PSREN		(1 << 15)
-
-#define FIC_TX2COUNT(x)		(((x) >>  24) & 0xf)
-#define FIC_TX1COUNT(x)		(((x) >>  16) & 0xf)
-
-#define FIC_TXFLUSH		(1 << 15)
-#define FIC_RXFLUSH		(1 << 7)
-#define FIC_TXCOUNT(x)		(((x) >>  8) & 0xf)
-#define FIC_RXCOUNT(x)		(((x) >>  0) & 0xf)
-#define FICS_TXCOUNT(x)		(((x) >>  8) & 0x7f)
-
-#define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
-
 struct i2s_dai {
 	/* Platform device for this DAI */
 	struct platform_device *pdev;
@@ -646,6 +542,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct i2s_dai *i2s = to_info(dai);
 	u32 mod = readl(i2s->addr + I2SMOD);
+	u32 ahb = readl(i2s->addr + I2SAHB);
 
 	if (!is_secondary(i2s))
 		mod &= ~(MOD_DC2_EN | MOD_DC1_EN);
@@ -657,6 +554,16 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		mod |= MOD_DC1_EN;
 		break;
 	case 2:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			i2s->dma_playback.dma_size = 4;
+		else
+			i2s->dma_capture.dma_size = 4;
+		break;
+	case 1:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			i2s->dma_playback.dma_size = 2;
+		else
+			i2s->dma_capture.dma_size = 2;
 		break;
 	default:
 		dev_err(&i2s->pdev->dev, "%d channels not supported\n",
@@ -702,6 +609,13 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 				params_format(params));
 		return -EINVAL;
 	}
+
+	if (is_secondary(i2s)) {
+		ahb |= (AHB_DMARLD | AHB_INTMASK);
+		mod |= MOD_TXS_IDMA;
+	}
+
+	writel(ahb, i2s->addr + I2SAHB);
 	writel(mod, i2s->addr + I2SMOD);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -979,6 +893,8 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (i2s->quirks & QUIRK_NEED_RSTCLR)
 		writel(CON_RSTCLR, i2s->addr + I2SCON);
 
+	idma_init((void *)i2s->addr);
+
 probe_exit:
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
diff --git a/sound/soc/samsung/i2s.h b/sound/soc/samsung/i2s.h
index 8e15f6a..7f8aa61 100644
--- a/sound/soc/samsung/i2s.h
+++ b/sound/soc/samsung/i2s.h
@@ -24,6 +24,134 @@
 
 #define SAMSUNG_I2S_RCLKSRC_0	0
 #define SAMSUNG_I2S_RCLKSRC_1	1
-#define SAMSUNG_I2S_CDCLK		2
+#define SAMSUNG_I2S_CDCLK	2
+
+#define I2SCON			0x0
+#define I2SMOD			0x4
+#define I2SFIC			0x8
+#define I2SPSR			0xc
+#define I2STXD			0x10
+#define I2SRXD			0x14
+#define I2SFICS			0x18
+#define I2STXDS			0x1c
+#define I2SAHB			0x20
+#define I2SSTR0			0x24
+#define I2SSIZE			0x28
+#define I2STRNCNT		0x2c
+#define I2SLVL0ADDR		0x30
+#define I2SLVL1ADDR		0x34
+#define I2SLVL2ADDR		0x38
+#define I2SLVL3ADDR		0x3c
+
+#define CON_RSTCLR		(1 << 31)
+#define CON_FRXOFSTATUS		(1 << 26)
+#define CON_FRXORINTEN		(1 << 25)
+#define CON_FTXSURSTAT		(1 << 24)
+#define CON_FTXSURINTEN		(1 << 23)
+#define CON_TXSDMA_PAUSE	(1 << 20)
+#define CON_TXSDMA_ACTIVE	(1 << 18)
+
+#define CON_FTXURSTATUS		(1 << 17)
+#define CON_FTXURINTEN		(1 << 16)
+#define CON_TXFIFO2_EMPTY	(1 << 15)
+#define CON_TXFIFO1_EMPTY	(1 << 14)
+#define CON_TXFIFO2_FULL	(1 << 13)
+#define CON_TXFIFO1_FULL	(1 << 12)
+
+#define CON_LRINDEX		(1 << 11)
+#define CON_TXFIFO_EMPTY	(1 << 10)
+#define CON_RXFIFO_EMPTY	(1 << 9)
+#define CON_TXFIFO_FULL		(1 << 8)
+#define CON_RXFIFO_FULL		(1 << 7)
+#define CON_TXDMA_PAUSE		(1 << 6)
+#define CON_RXDMA_PAUSE		(1 << 5)
+#define CON_TXCH_PAUSE		(1 << 4)
+#define CON_RXCH_PAUSE		(1 << 3)
+#define CON_TXDMA_ACTIVE	(1 << 2)
+#define CON_RXDMA_ACTIVE	(1 << 1)
+#define CON_ACTIVE		(1 << 0)
+
+#define MOD_OPCLK_CDCLK_OUT	(0 << 30)
+#define MOD_OPCLK_CDCLK_IN	(1 << 30)
+#define MOD_OPCLK_BCLK_OUT	(2 << 30)
+#define MOD_OPCLK_PCLK		(3 << 30)
+#define MOD_OPCLK_MASK		(3 << 30)
+#define MOD_TXS_IDMA		(1 << 28)
+
+#define MOD_BLCS_SHIFT		26
+#define MOD_BLCS_16BIT		(0 << MOD_BLCS_SHIFT)
+#define MOD_BLCS_8BIT		(1 << MOD_BLCS_SHIFT)
+#define MOD_BLCS_24BIT		(2 << MOD_BLCS_SHIFT)
+#define MOD_BLCS_MASK		(3 << MOD_BLCS_SHIFT)
+#define MOD_BLCP_SHIFT		24
+#define MOD_BLCP_16BIT		(0 << MOD_BLCP_SHIFT)
+#define MOD_BLCP_8BIT		(1 << MOD_BLCP_SHIFT)
+#define MOD_BLCP_24BIT		(2 << MOD_BLCP_SHIFT)
+#define MOD_BLCP_MASK		(3 << MOD_BLCP_SHIFT)
+
+#define MOD_C2DD_HHALF		(1 << 21) /* Discard Higher-half */
+#define MOD_C2DD_LHALF		(1 << 20) /* Discard Lower-half */
+#define MOD_C1DD_HHALF		(1 << 19)
+#define MOD_C1DD_LHALF		(1 << 18)
+#define MOD_DC2_EN		(1 << 17)
+#define MOD_DC1_EN		(1 << 16)
+#define MOD_BLC_16BIT		(0 << 13)
+#define MOD_BLC_8BIT		(1 << 13)
+#define MOD_BLC_24BIT		(2 << 13)
+#define MOD_BLC_MASK		(3 << 13)
+
+#define MOD_IMS_SYSMUX		(1 << 10)
+#define MOD_SLAVE		(1 << 11)
+#define MOD_TXONLY		(0 << 8)
+#define MOD_RXONLY		(1 << 8)
+#define MOD_TXRX		(2 << 8)
+#define MOD_MASK		(3 << 8)
+#define MOD_LR_LLOW		(0 << 7)
+#define MOD_LR_RLOW		(1 << 7)
+#define MOD_SDF_IIS		(0 << 5)
+#define MOD_SDF_MSB		(1 << 5)
+#define MOD_SDF_LSB		(2 << 5)
+#define MOD_SDF_MASK		(3 << 5)
+#define MOD_RCLK_256FS		(0 << 3)
+#define MOD_RCLK_512FS		(1 << 3)
+#define MOD_RCLK_384FS		(2 << 3)
+#define MOD_RCLK_768FS		(3 << 3)
+#define MOD_RCLK_MASK		(3 << 3)
+#define MOD_BCLK_32FS		(0 << 1)
+#define MOD_BCLK_48FS		(1 << 1)
+#define MOD_BCLK_16FS		(2 << 1)
+#define MOD_BCLK_24FS		(3 << 1)
+#define MOD_BCLK_MASK		(3 << 1)
+#define MOD_8BIT		(1 << 0)
+
+#define MOD_CDCLKCON		(1 << 12)
+
+#define PSR_PSREN		(1 << 15)
+
+#define FIC_TX2COUNT(x)		(((x) >>  24) & 0xf)
+#define FIC_TX1COUNT(x)		(((x) >>  16) & 0xf)
+
+#define FIC_TXFLUSH		(1 << 15)
+#define FIC_RXFLUSH		(1 << 7)
+
+#define FIC_TXCOUNT(x)		(((x) >>  8) & 0x7f)
+#define FIC_RXCOUNT(x)		(((x) >>  0) & 0x7f)
+#define FICS_TXCOUNT(x)		(((x) >>  8) & 0x7f)
+
+#define AHB_INTENLVL0		(1 << 24)
+#define AHB_LVL0INT		(1 << 20)
+#define AHB_CLRLVL0INT		(1 << 16)
+#define AHB_DMARLD		(1 << 5)
+#define AHB_INTMASK		(1 << 3)
+#define AHB_DMAEN		(1 << 0)
+#define AHB_LVLINTMASK		(0xf << 20)
+
+#define I2SSIZE_TRNMSK		(0xffff)
+#define I2SSIZE_SHIFT		(16)
+
+#define msecs_to_loops(t)	(loops_per_jiffy / 1000 * HZ * t)
+
+#define ST_RUNNING		(1<<0)
+#define ST_OPENED		(1<<1)
 
 #endif /* __SND_SOC_SAMSUNG_I2S_H */
-- 
1.7.1
