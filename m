From: jassisinghbrar@gmail.com
Subject: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM controllers
Date: Mon,  2 Nov 2009 11:09:51 +0900
Message-ID: <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57296 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753617AbZKBCMv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2009 21:12:51 -0500
In-Reply-To: <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 sound/soc/s3c24xx/Kconfig       |    4 +
 sound/soc/s3c24xx/Makefile      |    2 +
 sound/soc/s3c24xx/s3c64xx-dsp.c |  537 +++++++++++++++++++++++++++++++++++++++
 sound/soc/s3c24xx/s3c64xx-dsp.h |   41 +++
 4 files changed, 584 insertions(+), 0 deletions(-)
 create mode 100644 sound/soc/s3c24xx/s3c64xx-dsp.c
 create mode 100644 sound/soc/s3c24xx/s3c64xx-dsp.h

diff --git a/sound/soc/s3c24xx/Kconfig b/sound/soc/s3c24xx/Kconfig
index d7912f1..ea00f8a 100644
--- a/sound/soc/s3c24xx/Kconfig
+++ b/sound/soc/s3c24xx/Kconfig
@@ -24,6 +24,10 @@ config SND_S3C64XX_SOC_I2S
 	select SND_S3C_I2SV2_SOC
 	select S3C64XX_DMA
 
+config SND_S3C64XX_SOC_DSP
+	tristate
+	select S3C64XX_DMA
+
 config SND_S3C2443_SOC_AC97
 	tristate
 	select S3C2410_DMA
diff --git a/sound/soc/s3c24xx/Makefile b/sound/soc/s3c24xx/Makefile
index 7790406..4241593 100644
--- a/sound/soc/s3c24xx/Makefile
+++ b/sound/soc/s3c24xx/Makefile
@@ -5,6 +5,7 @@ snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
 snd-soc-s3c64xx-i2s-objs := s3c64xx-i2s.o
 snd-soc-s3c2443-ac97-objs := s3c2443-ac97.o
 snd-soc-s3c-i2s-v2-objs := s3c-i2s-v2.o
+snd-soc-s3c64xx-dsp-objs := s3c64xx-dsp.o
 
 obj-$(CONFIG_SND_S3C24XX_SOC) += snd-soc-s3c24xx.o
 obj-$(CONFIG_SND_S3C24XX_SOC_I2S) += snd-soc-s3c24xx-i2s.o
@@ -12,6 +13,7 @@ obj-$(CONFIG_SND_S3C2443_SOC_AC97) += snd-soc-s3c2443-ac97.o
 obj-$(CONFIG_SND_S3C2412_SOC_I2S) += snd-soc-s3c2412-i2s.o
 obj-$(CONFIG_SND_S3C64XX_SOC_I2S) += snd-soc-s3c64xx-i2s.o
 obj-$(CONFIG_SND_S3C_I2SV2_SOC) += snd-soc-s3c-i2s-v2.o
+obj-$(CONFIG_SND_S3C64XX_SOC_DSP) += snd-soc-s3c64xx-dsp.o
 
 # S3C24XX Machine Support
 snd-soc-jive-wm8750-objs := jive_wm8750.o
diff --git a/sound/soc/s3c24xx/s3c64xx-dsp.c b/sound/soc/s3c24xx/s3c64xx-dsp.c
new file mode 100644
index 0000000..e8aff48
--- /dev/null
+++ b/sound/soc/s3c24xx/s3c64xx-dsp.c
@@ -0,0 +1,537 @@
+/* sound/soc/s3c24xx/s3c64xx-dsp.c
+ *
+ * ALSA SoC Audio Layer - S3C64XX PCM-Controller driver
+ *
+ * Copyright (c) 2009 Samsung Electronics Co. Ltd
+ * Author: Jaswinder Singh <jassi.brar@samsung.com>
+ * based upon I2S drivers by Ben Dooks.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/gpio.h>
+#include <linux/io.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/initval.h>
+#include <sound/soc.h>
+
+#include <plat/regs-pcm.h>
+#include <plat/gpio-bank-d.h>
+#include <plat/gpio-bank-e.h>
+#include <plat/gpio-cfg.h>
+
+#include <mach/map.h>
+#include <mach/dma.h>
+
+#include "s3c24xx-pcm.h"
+#include "s3c64xx-dsp.h"
+
+static struct s3c2410_dma_client s3c64xx_dma_client_out = {
+	.name		= "DSP Stereo out"
+};
+
+static struct s3c2410_dma_client s3c64xx_dma_client_in = {
+	.name		= "DSP Stereo in"
+};
+
+static struct s3c24xx_pcm_dma_params s3c64xx_pcm_stereo_out[] = {
+	[0] = {
+		.channel	= DMACH_PCM0_TX,
+		.client		= &s3c64xx_dma_client_out,
+		.dma_addr	= S3C64XX_PA_PCM0 + S3C64XX_PCM_TXFIFO,
+		.dma_size	= 4,
+	},
+	[1] = {
+		.channel	= DMACH_PCM1_TX,
+		.client		= &s3c64xx_dma_client_out,
+		.dma_addr	= S3C64XX_PA_PCM1 + S3C64XX_PCM_TXFIFO,
+		.dma_size	= 4,
+	},
+};
+
+static struct s3c24xx_pcm_dma_params s3c64xx_pcm_stereo_in[] = {
+	[0] = {
+		.channel	= DMACH_PCM0_RX,
+		.client		= &s3c64xx_dma_client_in,
+		.dma_addr	= S3C64XX_PA_PCM0 + S3C64XX_PCM_RXFIFO,
+		.dma_size	= 4,
+	},
+	[1] = {
+		.channel	= DMACH_PCM1_RX,
+		.client		= &s3c64xx_dma_client_in,
+		.dma_addr	= S3C64XX_PA_PCM1 + S3C64XX_PCM_RXFIFO,
+		.dma_size	= 4,
+	},
+};
+
+static struct s3c_dsp_info s3c64xx_dsp[2];
+
+static inline struct s3c_dsp_info *to_info(struct snd_soc_dai *cpu_dai)
+{
+	return cpu_dai->private_data;
+}
+
+static void s3c64xx_dsp_snd_txctrl(struct s3c_dsp_info *dsp, int on)
+{
+	void __iomem *regs = dsp->regs;
+	u32 ctl, clkctl;
+
+	pr_debug("%s(%d)\n", __func__, on);
+
+	clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
+	ctl = readl(regs + S3C64XX_PCM_CTL);
+	ctl &= ~(S3C64XX_PCM_CTL_TXDIPSTICK_MASK
+			 << S3C64XX_PCM_CTL_TXDIPSTICK_SHIFT);
+
+	if (on) {
+		ctl |= S3C64XX_PCM_CTL_TXDMA_EN;
+		ctl |= S3C64XX_PCM_CTL_TXFIFO_EN;
+		ctl |= S3C64XX_PCM_CTL_ENABLE;
+		ctl |= (0x20<<S3C64XX_PCM_CTL_TXDIPSTICK_SHIFT);
+		clkctl |= S3C64XX_PCM_CLKCTL_SERCLK_EN;
+	} else {
+		ctl &= ~S3C64XX_PCM_CTL_TXDMA_EN;
+		ctl &= ~S3C64XX_PCM_CTL_TXFIFO_EN;
+
+		if (!(ctl & S3C64XX_PCM_CTL_RXFIFO_EN)) {
+			ctl &= ~S3C64XX_PCM_CTL_ENABLE;
+			if (!dsp->idleclk)
+				clkctl |= S3C64XX_PCM_CLKCTL_SERCLK_EN;
+		}
+	}
+
+	writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
+	writel(ctl, regs + S3C64XX_PCM_CTL);
+}
+
+static void s3c64xx_dsp_snd_rxctrl(struct s3c_dsp_info *dsp, int on)
+{
+	void __iomem *regs = dsp->regs;
+	u32 ctl, clkctl;
+
+	pr_debug("%s(%d)\n", __func__, on);
+
+	ctl = readl(regs + S3C64XX_PCM_CTL);
+	clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
+
+	if (on) {
+		ctl |= S3C64XX_PCM_CTL_RXDMA_EN;
+		ctl |= S3C64XX_PCM_CTL_RXFIFO_EN;
+		ctl |= S3C64XX_PCM_CTL_ENABLE;
+		clkctl |= S3C64XX_PCM_CLKCTL_SERCLK_EN;
+	} else {
+		ctl &= ~S3C64XX_PCM_CTL_RXDMA_EN;
+		ctl &= ~S3C64XX_PCM_CTL_RXFIFO_EN;
+
+		if (!(ctl & S3C64XX_PCM_CTL_TXFIFO_EN)) {
+			ctl &= ~S3C64XX_PCM_CTL_ENABLE;
+			if (!dsp->idleclk)
+				clkctl |= S3C64XX_PCM_CLKCTL_SERCLK_EN;
+		}
+	}
+
+	writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
+	writel(ctl, regs + S3C64XX_PCM_CTL);
+}
+
+static int s3c64xx_dsp_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct s3c_dsp_info *dsp = to_info(rtd->dai->cpu_dai);
+	unsigned long irqs;
+
+	pr_debug("Entered %s\n", __func__);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		local_irq_save(irqs);
+
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			s3c64xx_dsp_snd_rxctrl(dsp, 1);
+		else
+			s3c64xx_dsp_snd_txctrl(dsp, 1);
+
+		local_irq_restore(irqs);
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		local_irq_save(irqs);
+
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			s3c64xx_dsp_snd_rxctrl(dsp, 0);
+		else
+			s3c64xx_dsp_snd_txctrl(dsp, 0);
+
+		local_irq_restore(irqs);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int s3c64xx_dsp_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *socdai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai_link *dai = rtd->dai;
+	struct s3c_dsp_info *dsp = to_info(dai->cpu_dai);
+
+	pr_debug("Entered %s\n", __func__);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->cpu_dai->dma_data = dsp->dma_playback;
+	else
+		dai->cpu_dai->dma_data = dsp->dma_capture;
+
+	/* Strictly check for sample size */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int s3c64xx_dsp_set_fmt(struct snd_soc_dai *cpu_dai,
+			       unsigned int fmt)
+{
+	struct s3c_dsp_info *dsp = to_info(cpu_dai);
+	void __iomem *regs = dsp->regs;
+	u32 ctl;
+
+	pr_debug("Entered %s\n", __func__);
+
+	ctl = readl(regs + S3C64XX_PCM_CTL);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		/* Nothing to do, NB_NF by default */
+		break;
+	default:
+		pr_err("Unsupported clock inversion!\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		/* Nothing to do, Master by default */
+		break;
+	default:
+		pr_err("Unsupported master/slave format!\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
+	case SND_SOC_DAIFMT_CONT:
+		dsp->idleclk = 1;
+		break;
+	case SND_SOC_DAIFMT_GATED:
+		dsp->idleclk = 0;
+		break;
+	default:
+		pr_err("Invalid Clock gating request!\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		ctl |= S3C64XX_PCM_CTL_TXMSB_AFTER_FSYNC;
+		ctl |= S3C64XX_PCM_CTL_RXMSB_AFTER_FSYNC;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		ctl &= ~S3C64XX_PCM_CTL_TXMSB_AFTER_FSYNC;
+		ctl &= ~S3C64XX_PCM_CTL_RXMSB_AFTER_FSYNC;
+		break;
+	default:
+		pr_err("Unsupported data format!\n");
+		return -EINVAL;
+	}
+
+	writel(ctl, regs + S3C64XX_PCM_CTL);
+
+	return 0;
+}
+
+static int s3c64xx_dsp_set_clkdiv(struct snd_soc_dai *cpu_dai,
+				  int div_id, int div)
+{
+	struct s3c_dsp_info *dsp = to_info(cpu_dai);
+	void __iomem *regs = dsp->regs;
+	u32 clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
+
+	pr_debug("%s(%p, %d, %d)\n", __func__, cpu_dai, div_id, div);
+
+	switch (div_id) {
+	case S3C64XX_DSP_SCLK_DIV:
+		clkctl &= ~(S3C64XX_PCM_CLKCTL_SCLKDIV_MASK
+				<< S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT);
+		clkctl |= ((div & S3C64XX_PCM_CLKCTL_SCLKDIV_MASK)
+				<< S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT);
+		break;
+
+	case S3C64XX_DSP_SYNC_DIV:
+		clkctl &= ~(S3C64XX_PCM_CLKCTL_SYNCDIV_MASK
+				<< S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT);
+		clkctl |= ((div & S3C64XX_PCM_CLKCTL_SYNCDIV_MASK)
+				<< S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
+
+	return 0;
+}
+
+static int s3c64xx_dsp_set_sysclk(struct snd_soc_dai *cpu_dai,
+				  int clk_id, unsigned int freq, int dir)
+{
+	struct s3c_dsp_info *dsp = to_info(cpu_dai);
+	void __iomem *regs = dsp->regs;
+	u32 clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
+
+	switch (clk_id) {
+	case S3C64XX_DSP_CLKSRC_PCLK:
+		clkctl |= S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK;
+		break;
+
+	case S3C64XX_DSP_CLKSRC_MUX:
+		clkctl &= ~S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK;
+
+		if (clk_get_rate(dsp->pcm_cclk) != freq)
+			clk_set_rate(dsp->pcm_cclk, freq);
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
+
+	return 0;
+}
+
+struct clk *s3c64xx_dsp_get_clock(struct snd_soc_dai *dai)
+{
+	struct s3c_dsp_info *dsp = to_info(dai);
+	void __iomem *regs = dsp->regs;
+	u32 clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
+
+	if (clkctl & S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK)
+		return dsp->pcm_pclk;
+	else
+		return dsp->pcm_cclk;
+}
+EXPORT_SYMBOL_GPL(s3c64xx_dsp_get_clock);
+
+static int s3c64xx_dsp_probe(struct platform_device *pdev,
+			     struct snd_soc_dai *dai)
+{
+	/* configure GPIO for the PCM controller */
+	switch (dai->id) {
+	case 0:
+		s3c_gpio_cfgpin(S3C64XX_GPD(0), S3C64XX_GPD0_PCM0_SCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPD(1), S3C64XX_GPD1_PCM0_EXTCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPD(2), S3C64XX_GPD2_PCM0_FSYNC);
+		s3c_gpio_cfgpin(S3C64XX_GPD(3), S3C64XX_GPD3_PCM0_SIN);
+		s3c_gpio_cfgpin(S3C64XX_GPD(4), S3C64XX_GPD4_PCM0_SOUT);
+		break;
+	case 1:
+		s3c_gpio_cfgpin(S3C64XX_GPE(0), S3C64XX_GPE0_PCM1_SCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPE(1), S3C64XX_GPE1_PCM1_EXTCLK);
+		s3c_gpio_cfgpin(S3C64XX_GPE(2), S3C64XX_GPE2_PCM1_FSYNC);
+		s3c_gpio_cfgpin(S3C64XX_GPE(3), S3C64XX_GPE3_PCM1_SIN);
+		s3c_gpio_cfgpin(S3C64XX_GPE(4), S3C64XX_GPE4_PCM1_SOUT);
+		break;
+	default:
+		printk(KERN_DEBUG "Invalid PCM Controller number!");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops s3c64xx_dsp_dai_ops = {
+	.set_sysclk	= s3c64xx_dsp_set_sysclk,
+	.trigger	= s3c64xx_dsp_trigger,
+	.hw_params	= s3c64xx_dsp_hw_params,
+	.set_fmt	= s3c64xx_dsp_set_fmt,
+	.set_clkdiv	= s3c64xx_dsp_set_clkdiv,
+};
+
+#define S3C64XX_DSP_RATES  SNDRV_PCM_RATE_8000_96000
+
+#define S3C64XX_DSP_DECLARE(n)			\
+{								\
+	.name		 = "s3c64xx-dsp",			\
+	.id		 = (n),				\
+	.symmetric_rates = 1,					\
+	.probe		 = s3c64xx_dsp_probe,			\
+	.ops = &s3c64xx_dsp_dai_ops,				\
+	.playback = {						\
+		.channels_min	= 2,				\
+		.channels_max	= 2,				\
+		.rates		= S3C64XX_DSP_RATES,		\
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,	\
+	},							\
+	.capture = {						\
+		.channels_min	= 2,				\
+		.channels_max	= 2,				\
+		.rates		= S3C64XX_DSP_RATES,		\
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,	\
+	},							\
+}
+
+struct snd_soc_dai s3c64xx_dsp_dai[] = {
+	S3C64XX_DSP_DECLARE(0),
+	S3C64XX_DSP_DECLARE(1),
+};
+EXPORT_SYMBOL_GPL(s3c64xx_dsp_dai);
+
+static int s3c_dsp_probe(struct platform_device *pdev,
+		    struct snd_soc_dai *dai,
+		    struct s3c_dsp_info *dsp,
+		    unsigned long base)
+{
+	struct device *dev = &pdev->dev;
+
+	dsp->dev = dev;
+
+	/* record our dsp structure for later use in the callbacks */
+	dai->private_data = dsp;
+
+	if (!base) {
+		struct resource *res = platform_get_resource(pdev,
+							     IORESOURCE_MEM,
+							     0);
+		if (!res) {
+			dev_err(dev, "Unable to get register resource\n");
+			return -ENXIO;
+		}
+
+		if (!request_mem_region(res->start, resource_size(res),
+					"s3c64xx-dsp")) {
+			dev_err(dev, "Unable to request register region\n");
+			return -EBUSY;
+		}
+
+		base = res->start;
+	}
+
+	dsp->regs = ioremap(base, 0x100);
+	if (dsp->regs == NULL) {
+		dev_err(dev, "cannot ioremap registers\n");
+		return -ENXIO;
+	}
+
+	dsp->pcm_pclk = clk_get(dev, "pcm");
+	if (IS_ERR(dsp->pcm_pclk)) {
+		dev_err(dev, "failed to get pcm_clock\n");
+		iounmap(dsp->regs);
+		return -ENOENT;
+	}
+
+	clk_enable(dsp->pcm_pclk);
+
+	return 0;
+}
+
+static __devinit int s3c64xx_dsp_dev_probe(struct platform_device *pdev)
+{
+	struct s3c_dsp_info *dsp;
+	struct snd_soc_dai *dai;
+	int ret;
+
+	if (pdev->id >= ARRAY_SIZE(s3c64xx_dsp)) {
+		dev_err(&pdev->dev, "id %d out of range\n", pdev->id);
+		return -EINVAL;
+	}
+
+	dsp = &s3c64xx_dsp[pdev->id];
+	dai = &s3c64xx_dsp_dai[pdev->id];
+	dai->dev = &pdev->dev;
+
+	dsp->dma_capture = &s3c64xx_pcm_stereo_in[pdev->id];
+	dsp->dma_playback = &s3c64xx_pcm_stereo_out[pdev->id];
+
+	dsp->pcm_cclk = clk_get(&pdev->dev, "audio-bus");
+	if (IS_ERR(dsp->pcm_cclk)) {
+		dev_err(&pdev->dev, "failed to get audio-bus\n");
+		ret = PTR_ERR(dsp->pcm_cclk);
+		goto err;
+	}
+	clk_enable(dsp->pcm_cclk);
+
+	ret = s3c_dsp_probe(pdev, dai, dsp, 0);
+	if (ret)
+		goto err_clk;
+
+	ret = snd_soc_register_dai(dai);
+	if (ret != 0)
+		goto err_dsp;
+
+	return 0;
+
+err_dsp:
+	/* Not implemented */
+err_clk:
+	clk_put(dsp->pcm_cclk);
+err:
+	return ret;
+}
+
+static __devexit int s3c64xx_dsp_dev_remove(struct platform_device *pdev)
+{
+	dev_err(&pdev->dev, "Device removal not yet supported\n");
+	return 0;
+}
+
+static struct platform_driver s3c64xx_dsp_driver = {
+	.probe  = s3c64xx_dsp_dev_probe,
+	.remove = s3c64xx_dsp_dev_remove,
+	.driver = {
+		.name = "s3c64xx-dsp",
+		.owner = THIS_MODULE,
+	},
+};
+
+static int __init s3c64xx_dsp_init(void)
+{
+	return platform_driver_register(&s3c64xx_dsp_driver);
+}
+module_init(s3c64xx_dsp_init);
+
+static void __exit s3c64xx_dsp_exit(void)
+{
+	platform_driver_unregister(&s3c64xx_dsp_driver);
+}
+module_exit(s3c64xx_dsp_exit);
+
+/* Module information */
+MODULE_AUTHOR("Jaswinder Singh, <jassi.brar@samsung.com>");
+MODULE_DESCRIPTION("S3C64XX PCM Controller Driver");
diff --git a/sound/soc/s3c24xx/s3c64xx-dsp.h b/sound/soc/s3c24xx/s3c64xx-dsp.h
new file mode 100644
index 0000000..cb92346
--- /dev/null
+++ b/sound/soc/s3c24xx/s3c64xx-dsp.h
@@ -0,0 +1,41 @@
+/*  sound/soc/s3c24xx/s3c64xx-dsp.h
+ *
+ *  ALSA Soc Audio Layer - S3C64XX PCM Controller driver
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+
+#ifndef __SND_SOC_S3C64XX_PCM_H
+#define __SND_SOC_S3C64XX_PCM_H __FILE__
+
+#define S3C64XX_DSP_CLKSRC_PCLK	0
+#define S3C64XX_DSP_CLKSRC_MUX	1
+
+#define S3C64XX_DSP_SYNC_DIV	0
+#define S3C64XX_DSP_SCLK_DIV	1
+
+/**
+ * struct s3c_dsp_info - S3C PCM Controller information
+ * @dev: The parent device passed to use from the probe.
+ * @regs: The pointer to the device register block.
+ * @dma_playback: DMA information for playback channel.
+ * @dma_capture: DMA information for capture channel.
+ */
+struct s3c_dsp_info {
+	struct device	*dev;
+	void __iomem	*regs;
+
+	/* Whether to keep PCMSCLK enabled even when idle(no active xfer) */
+	unsigned int idleclk;
+
+	struct clk	*pcm_pclk;
+	struct clk	*pcm_cclk;
+
+	struct s3c24xx_pcm_dma_params	*dma_playback;
+	struct s3c24xx_pcm_dma_params	*dma_capture;
+};
+
+#endif /* __SND_SOC_S3C64XX_PCM_H */
-- 
1.6.2.5
