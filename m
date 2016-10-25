From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/3] ASoC: samsung: s3c24xx-i2s: Debug/error trace cleanup
Date: Tue, 25 Oct 2016 12:56:31 +0200
Message-ID: <1477392991-10604-3-git-send-email-s.nawrocki@samsung.com>
References: <1477392991-10604-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44490 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965754AbcJYK5S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 06:57:18 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFL00R4XNREWLF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2016 19:57:16 +0900 (KST)
In-reply-to: <1477392991-10604-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

pr_err() are replaced with dev_err() so information about
device the error logs refer to is also included.

pr_debug() at beginning of each function are removed
as they are likely very rarely used and can always be
added again when doing any serious debugging.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx-i2s.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 29196a9..7c7061b 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -54,8 +54,6 @@ static void s3c24xx_snd_txctrl(int on)
 	u32 iiscon;
 	u32 iismod;
 
-	pr_debug("Entered %s\n", __func__);
-
 	iisfcon = readl(s3c24xx_i2s.regs + S3C2410_IISFCON);
 	iiscon  = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
 	iismod  = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
@@ -99,8 +97,6 @@ static void s3c24xx_snd_rxctrl(int on)
 	u32 iiscon;
 	u32 iismod;
 
-	pr_debug("Entered %s\n", __func__);
-
 	iisfcon = readl(s3c24xx_i2s.regs + S3C2410_IISFCON);
 	iiscon  = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
 	iismod  = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
@@ -147,8 +143,6 @@ static int s3c24xx_snd_lrsync(void)
 	u32 iiscon;
 	int timeout = 50; /* 5ms */
 
-	pr_debug("Entered %s\n", __func__);
-
 	while (1) {
 		iiscon = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
 		if (iiscon & S3C2410_IISCON_LRINDEX)
@@ -167,8 +161,6 @@ static int s3c24xx_snd_lrsync(void)
  */
 static inline int s3c24xx_snd_is_clkmaster(void)
 {
-	pr_debug("Entered %s\n", __func__);
-
 	return (readl(s3c24xx_i2s.regs + S3C2410_IISMOD) & S3C2410_IISMOD_SLAVE) ? 0:1;
 }
 
@@ -180,8 +172,6 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	u32 iismod;
 
-	pr_debug("Entered %s\n", __func__);
-
 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
@@ -209,6 +199,7 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 
 	writel(iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params w: IISMOD: %x \n", iismod);
+
 	return 0;
 }
 
@@ -219,8 +210,6 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 iismod;
 
-	pr_debug("Entered %s\n", __func__);
-
 	dma_data = snd_soc_dai_get_dma_data(dai, substream);
 
 	/* Working copies of register */
@@ -242,6 +231,7 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	writel(iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params w: IISMOD: %x\n", iismod);
+
 	return 0;
 }
 
@@ -250,8 +240,6 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	int ret = 0;
 
-	pr_debug("Entered %s\n", __func__);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -293,8 +281,6 @@ static int s3c24xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
 {
 	u32 iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 
-	pr_debug("Entered %s\n", __func__);
-
 	iismod &= ~S3C2440_IISMOD_MPLL;
 
 	switch (clk_id) {
@@ -319,8 +305,6 @@ static int s3c24xx_i2s_set_clkdiv(struct snd_soc_dai *cpu_dai,
 {
 	u32 reg;
 
-	pr_debug("Entered %s\n", __func__);
-
 	switch (div_id) {
 	case S3C24XX_DIV_BCLK:
 		reg = readl(s3c24xx_i2s.regs + S3C2410_IISMOD) & ~S3C2410_IISMOD_FS_MASK;
@@ -354,8 +338,6 @@ u32 s3c24xx_i2s_get_clockrate(void)
 
 static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 {
-	pr_debug("Entered %s\n", __func__);
-
 	snd_soc_dai_init_dma_data(dai, &s3c24xx_i2s_pcm_stereo_out,
 					&s3c24xx_i2s_pcm_stereo_in);
 
@@ -381,8 +363,6 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 #ifdef CONFIG_PM
 static int s3c24xx_i2s_suspend(struct snd_soc_dai *cpu_dai)
 {
-	pr_debug("Entered %s\n", __func__);
-
 	s3c24xx_i2s.iiscon = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
 	s3c24xx_i2s.iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 	s3c24xx_i2s.iisfcon = readl(s3c24xx_i2s.regs + S3C2410_IISFCON);
@@ -395,7 +375,6 @@ static int s3c24xx_i2s_suspend(struct snd_soc_dai *cpu_dai)
 
 static int s3c24xx_i2s_resume(struct snd_soc_dai *cpu_dai)
 {
-	pr_debug("Entered %s\n", __func__);
 	clk_prepare_enable(s3c24xx_i2s.iis_clk);
 
 	writel(s3c24xx_i2s.iiscon, s3c24xx_i2s.regs + S3C2410_IISCON);
@@ -410,7 +389,6 @@ static int s3c24xx_i2s_resume(struct snd_soc_dai *cpu_dai)
 #define s3c24xx_i2s_resume NULL
 #endif
 
-
 #define S3C24XX_I2S_RATES \
 	(SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 | SNDRV_PCM_RATE_16000 | \
 	SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
@@ -465,14 +443,14 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
 	if (ret) {
-		pr_err("failed to register the dai\n");
+		dev_err(&pdev->dev, "Failed to register the DAI\n");
 		return ret;
 	}
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
 						 NULL, NULL);
 	if (ret)
-		pr_err("failed to register the dma: %d\n", ret);
+		dev_err(&pdev->dev, "Failed to register the DMA: %d\n", ret);
 
 	return ret;
 }
-- 
1.9.1
