From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [RESEND PATCH v2 1/2] ASoC: samsung: s3c24{xx,12}-i2s: port to use generic dmaengine API
Date: Sun,  1 Jun 2014 20:15:57 +0300
Message-ID: <1401642958-6236-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:64797 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752103AbaFARST (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jun 2014 13:18:19 -0400
Received: by mail-wg0-f46.google.com with SMTP id n12so4026066wgh.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Jun 2014 10:18:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use dmaengine instead of legacy s3c24xx DMA API for s3c24xx and s3c2412

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
v2: use hardcoded dma channel number

 sound/soc/samsung/Kconfig       |  9 +++----
 sound/soc/samsung/dmaengine.c   |  3 +++
 sound/soc/samsung/s3c-i2s-v2.c  | 17 +------------
 sound/soc/samsung/s3c2412-i2s.c | 47 +++++++++++++++++-----------------
 sound/soc/samsung/s3c24xx-i2s.c | 56 +++++++++++++++++++----------------------
 5 files changed, 56 insertions(+), 76 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 3507574..022c7a4 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -1,11 +1,10 @@
 config SND_SOC_SAMSUNG
 	tristate "ASoC support for Samsung"
 	depends on PLAT_SAMSUNG
-	select S3C2410_DMA if ARCH_S3C24XX
+	select S3C24XX_DMAC if ARCH_S3C24XX
 	select S3C64XX_PL080 if ARCH_S3C64XX
-	select SND_S3C_DMA if !ARCH_S3C24XX
-	select SND_S3C_DMA_LEGACY if ARCH_S3C24XX
-	select SND_SOC_GENERIC_DMAENGINE_PCM if !ARCH_S3C24XX
+	select SND_S3C_DMA
+	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for codecs attached to
 	  the Samsung SoCs' Audio interfaces. You will also need to
@@ -19,7 +18,6 @@ config SND_S3C_DMA_LEGACY
 
 config SND_S3C24XX_I2S
 	tristate
-	select S3C24XX_DMA
 
 config SND_S3C_I2SV2_SOC
 	tristate
@@ -27,7 +25,6 @@ config SND_S3C_I2SV2_SOC
 config SND_S3C2412_SOC_I2S
 	tristate
 	select SND_S3C_I2SV2_SOC
-	select S3C2410_DMA
 
 config SND_SAMSUNG_PCM
 	tristate
diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
index 750ce58..72f27d1 100644
--- a/sound/soc/samsung/dmaengine.c
+++ b/sound/soc/samsung/dmaengine.c
@@ -17,6 +17,7 @@
 
 #include <linux/module.h>
 #include <linux/amba/pl08x.h>
+#include <linux/platform_data/dma-s3c24xx.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -29,6 +30,8 @@
 
 #ifdef CONFIG_ARCH_S3C64XX
 #define filter_fn pl08x_filter_id
+#elif defined(CONFIG_ARCH_S3C24XX)
+#define filter_fn s3c24xx_dma_filter
 #else
 #define filter_fn NULL
 #endif
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 79e7efb..1a74051 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -392,8 +392,6 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	unsigned long irqs;
 	int ret = 0;
-	struct s3c_dma_params *dma_data =
-		snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
 
 	pr_debug("Entered %s\n", __func__);
 
@@ -424,13 +422,6 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		local_irq_restore(irqs);
 
-		/*
-		 * Load the next buffer to DMA to meet the reqirement
-		 * of the auto reload mechanism of S3C24XX.
-		 * This call won't bother S3C64XX.
-		 */
-		s3c2410_dma_ctrl(dma_data->channel, S3C2410_DMAOP_STARTED);
-
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -644,12 +635,6 @@ int s3c_i2sv2_probe(struct snd_soc_dai *dai,
 	/* record our i2s structure for later use in the callbacks */
 	snd_soc_dai_set_drvdata(dai, i2s);
 
-	i2s->regs = ioremap(base, 0x100);
-	if (i2s->regs == NULL) {
-		dev_err(dev, "cannot ioremap registers\n");
-		return -ENXIO;
-	}
-
 	i2s->iis_pclk = clk_get(dev, "iis");
 	if (IS_ERR(i2s->iis_pclk)) {
 		dev_err(dev, "failed to get iis_clock\n");
@@ -729,7 +714,7 @@ int s3c_i2sv2_register_component(struct device *dev, int id,
 			   struct snd_soc_component_driver *cmp_drv,
 			   struct snd_soc_dai_driver *dai_drv)
 {
-	struct snd_soc_dai_ops *ops = dai_drv->ops;
+	struct snd_soc_dai_ops *ops = (struct snd_soc_dai_ops *)dai_drv->ops;
 
 	ops->trigger = s3c2412_i2s_trigger;
 	if (!ops->hw_params)
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index d079445..ba084e3 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -33,25 +33,19 @@
 #include "regs-i2s-v2.h"
 #include "s3c2412-i2s.h"
 
-static struct s3c2410_dma_client s3c2412_dma_client_out = {
-	.name		= "I2S PCM Stereo out"
-};
-
-static struct s3c2410_dma_client s3c2412_dma_client_in = {
-	.name		= "I2S PCM Stereo in"
-};
-
 static struct s3c_dma_params s3c2412_i2s_pcm_stereo_out = {
-	.client		= &s3c2412_dma_client_out,
+	.client		=
+		(struct s3c2410_dma_client *)&s3c2412_i2s_pcm_stereo_out,
 	.channel	= DMACH_I2S_OUT,
-	.dma_addr	= S3C2410_PA_IIS + S3C2412_IISTXD,
+	.ch_name	= "tx",
 	.dma_size	= 4,
 };
 
 static struct s3c_dma_params s3c2412_i2s_pcm_stereo_in = {
-	.client		= &s3c2412_dma_client_in,
+	.client		=
+		(struct s3c2410_dma_client *)&s3c2412_i2s_pcm_stereo_in,
 	.channel	= DMACH_I2S_IN,
-	.dma_addr	= S3C2410_PA_IIS + S3C2412_IISRXD,
+	.ch_name	= "rx",
 	.dma_size	= 4,
 };
 
@@ -63,6 +57,9 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 
 	pr_debug("Entered %s\n", __func__);
 
+	samsung_asoc_init_dma_data(dai, &s3c2412_i2s_pcm_stereo_out,
+		&s3c2412_i2s_pcm_stereo_in);
+
 	ret = s3c_i2sv2_probe(dai, &s3c2412_i2s, S3C2410_PA_IIS);
 	if (ret)
 		return ret;
@@ -70,10 +67,9 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 	s3c2412_i2s.dma_capture = &s3c2412_i2s_pcm_stereo_in;
 	s3c2412_i2s.dma_playback = &s3c2412_i2s_pcm_stereo_out;
 
-	s3c2412_i2s.iis_cclk = clk_get(dai->dev, "i2sclk");
+	s3c2412_i2s.iis_cclk = devm_clk_get(dai->dev, "i2sclk");
 	if (IS_ERR(s3c2412_i2s.iis_cclk)) {
 		pr_err("failed to get i2sclk clock\n");
-		iounmap(s3c2412_i2s.regs);
 		return PTR_ERR(s3c2412_i2s.iis_cclk);
 	}
 
@@ -94,8 +90,6 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 static int s3c2412_i2s_remove(struct snd_soc_dai *dai)
 {
 	clk_disable(s3c2412_i2s.iis_cclk);
-	clk_put(s3c2412_i2s.iis_cclk);
-	iounmap(s3c2412_i2s.regs);
 
 	return 0;
 }
@@ -105,18 +99,10 @@ static int s3c2412_i2s_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *cpu_dai)
 {
 	struct s3c_i2sv2_info *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	struct s3c_dma_params *dma_data;
 	u32 iismod;
 
 	pr_debug("Entered %s\n", __func__);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dma_data = i2s->dma_playback;
-	else
-		dma_data = i2s->dma_capture;
-
-	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
-
 	iismod = readl(i2s->regs + S3C2412_IISMOD);
 	pr_debug("%s: r: IISMOD: %x\n", __func__, iismod);
 
@@ -169,6 +155,19 @@ static const struct snd_soc_component_driver s3c2412_i2s_component = {
 static int s3c2412_iis_dev_probe(struct platform_device *pdev)
 {
 	int ret = 0;
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Can't get IO resource.\n");
+		return -ENOENT;
+	}
+	s3c2412_i2s.regs = devm_ioremap_resource(&pdev->dev, res);
+	if (s3c2412_i2s.regs == NULL)
+		return -ENXIO;
+
+	s3c2412_i2s_pcm_stereo_out.dma_addr = res->start + S3C2412_IISTXD;
+	s3c2412_i2s_pcm_stereo_in.dma_addr = res->start + S3C2412_IISRXD;
 
 	ret = s3c_i2sv2_register_component(&pdev->dev, -1,
 					   &s3c2412_i2s_component,
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index f31e916..97600df 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -31,25 +31,19 @@
 #include "dma.h"
 #include "s3c24xx-i2s.h"
 
-static struct s3c2410_dma_client s3c24xx_dma_client_out = {
-	.name = "I2S PCM Stereo out"
-};
-
-static struct s3c2410_dma_client s3c24xx_dma_client_in = {
-	.name = "I2S PCM Stereo in"
-};
-
 static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_out = {
-	.client		= &s3c24xx_dma_client_out,
+	.client		=
+		(struct s3c2410_dma_client *)&s3c24xx_i2s_pcm_stereo_out,
 	.channel	= DMACH_I2S_OUT,
-	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
+	.ch_name	= "tx",
 	.dma_size	= 2,
 };
 
 static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_in = {
-	.client		= &s3c24xx_dma_client_in,
+	.client		=
+		(struct s3c2410_dma_client *)&s3c24xx_i2s_pcm_stereo_in,
 	.channel	= DMACH_I2S_IN,
-	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
+	.ch_name	= "rx",
 	.dma_size	= 2,
 };
 
@@ -231,18 +225,12 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct s3c_dma_params *dma_data;
+	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 iismod;
 
 	pr_debug("Entered %s\n", __func__);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dma_data = &s3c24xx_i2s_pcm_stereo_out;
-	else
-		dma_data = &s3c24xx_i2s_pcm_stereo_in;
-
-	snd_soc_dai_set_dma_data(rtd->cpu_dai, substream, dma_data);
+	dma_data = snd_soc_dai_get_dma_data(dai, substream);
 
 	/* Working copies of register */
 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
@@ -251,11 +239,11 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S8:
 		iismod &= ~S3C2410_IISMOD_16BIT;
-		dma_data->dma_size = 1;
+		dma_data->addr_width = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S16_LE:
 		iismod |= S3C2410_IISMOD_16BIT;
-		dma_data->dma_size = 2;
+		dma_data->addr_width = 2;
 		break;
 	default:
 		return -EINVAL;
@@ -270,8 +258,6 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
 	int ret = 0;
-	struct s3c_dma_params *dma_data =
-		snd_soc_dai_get_dma_data(dai, substream);
 
 	pr_debug("Entered %s\n", __func__);
 
@@ -290,7 +276,6 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		else
 			s3c24xx_snd_txctrl(1);
 
-		s3c2410_dma_ctrl(dma_data->channel, S3C2410_DMAOP_STARTED);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -380,14 +365,12 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 {
 	pr_debug("Entered %s\n", __func__);
 
-	s3c24xx_i2s.regs = ioremap(S3C2410_PA_IIS, 0x100);
-	if (s3c24xx_i2s.regs == NULL)
-		return -ENXIO;
+	samsung_asoc_init_dma_data(dai, &s3c24xx_i2s_pcm_stereo_out,
+		&s3c24xx_i2s_pcm_stereo_in);
 
-	s3c24xx_i2s.iis_clk = clk_get(dai->dev, "iis");
+	s3c24xx_i2s.iis_clk = devm_clk_get(dai->dev, "iis");
 	if (IS_ERR(s3c24xx_i2s.iis_clk)) {
 		pr_err("failed to get iis_clock\n");
-		iounmap(s3c24xx_i2s.regs);
 		return PTR_ERR(s3c24xx_i2s.iis_clk);
 	}
 	clk_enable(s3c24xx_i2s.iis_clk);
@@ -474,6 +457,19 @@ static const struct snd_soc_component_driver s3c24xx_i2s_component = {
 static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 {
 	int ret = 0;
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Can't get IO resource.\n");
+		return -ENOENT;
+	}
+	s3c24xx_i2s.regs = devm_ioremap_resource(&pdev->dev, res);
+	if (s3c24xx_i2s.regs == NULL)
+		return -ENXIO;
+
+	s3c24xx_i2s_pcm_stereo_out.dma_addr = res->start + S3C2410_IISFIFO;
+	s3c24xx_i2s_pcm_stereo_in.dma_addr = res->start + S3C2410_IISFIFO;
 
 	ret = snd_soc_register_component(&pdev->dev, &s3c24xx_i2s_component,
 					 &s3c24xx_i2s_dai, 1);
-- 
1.9.3
