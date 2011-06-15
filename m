From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 1/4] ASoC: SAMSUNG: Modify I2S driver to support idma
Date: Wed, 15 Jun 2011 17:43:24 +0900
Message-ID: <1308127407-22458-2-git-send-email-sbkim73@samsung.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34642 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483Ab1FOItx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:49:53 -0400
In-Reply-To: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, Sangbeom Kim <sbkim73@samsung.com>

Previously, I2S driver only can support system dma.
In this patch, i2s driver can support internal dma too.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/i2s-regs.h |  141 ++++++++++++++++++++++++++++++++++++++++++
 sound/soc/samsung/i2s.c      |  124 ++++++-------------------------------
 2 files changed, 160 insertions(+), 105 deletions(-)
 create mode 100644 sound/soc/samsung/i2s-regs.h

diff --git a/sound/soc/samsung/i2s-regs.h b/sound/soc/samsung/i2s-regs.h
new file mode 100644
index 0000000..aeb0590
--- /dev/null
+++ b/sound/soc/samsung/i2s-regs.h
@@ -0,0 +1,141 @@
+/*
+ * linux/sound/soc/samsung/i2s-regs.h
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Samsung I2S driver's register header
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __SND_SOC_SAMSUNG_I2S_REGS_H
+#define __SND_SOC_SAMSUNG_I2S_REGS_H
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
+#endif /* __SND_SOC_SAMSUNG_I2S_REGS_H */
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 992a732..2fc2428 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -9,7 +9,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-
+#define DEBUG
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
@@ -21,112 +21,14 @@
 #include <plat/audio.h>
 
 #include "dma.h"
+#include "idma.h"
 #include "i2s.h"
+#include "i2s-regs.h"
+
+#define msecs_to_loops(t)	(loops_per_jiffy / 1000 * HZ * t)
 
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
+#define ST_RUNNING		(1<<0)
+#define ST_OPENED		(1<<1)
 
 struct i2s_dai {
 	/* Platform device for this DAI */
@@ -646,6 +548,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct i2s_dai *i2s = to_info(dai);
 	u32 mod = readl(i2s->addr + I2SMOD);
+	u32 ahb = readl(i2s->addr + I2SAHB);
 
 	if (!is_secondary(i2s))
 		mod &= ~(MOD_DC2_EN | MOD_DC1_EN);
@@ -702,6 +605,13 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -979,6 +889,9 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (i2s->quirks & QUIRK_NEED_RSTCLR)
 		writel(CON_RSTCLR, i2s->addr + I2SCON);
 
+	if (i2s->quirks & QUIRK_SEC_DAI)
+		idma_reg_init((void *)i2s->addr);
+
 probe_exit:
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
@@ -1170,6 +1083,7 @@ static __devinit int samsung_i2s_probe(struct platform_device *pdev)
 			ret = -ENOMEM;
 			goto err2;
 		}
+		idma_addr_init(i2s_cfg->idma_addr);
 		sec_dai->dma_playback.dma_addr = regs_base + I2STXDS;
 		sec_dai->dma_playback.client =
 			(struct s3c2410_dma_client *)&sec_dai->dma_playback;
-- 
1.7.1
