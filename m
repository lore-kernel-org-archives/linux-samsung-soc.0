From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: s3c24xx-i2s: Don't use platform_data for DMA parameters" to the asoc tree
Date: Tue, 25 Oct 2016 20:26:49 +0100
Message-ID: <E1bz7N3-00057Y-Lj@debutante>
References: <1477392991-10604-2-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36532 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759582AbcJYT05 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 15:26:57 -0400
In-Reply-To: <1477392991-10604-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lgirdwood@gmail.com, krzk@kernel.org

The patch

   ASoC: samsung: s3c24xx-i2s: Don't use platform_data for DMA parameters

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

>From b57a089bd4213b5e33007f8293bf83a8b14e4729 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 25 Oct 2016 17:08:40 +0200
Subject: [PATCH] ASoC: samsung: s3c24xx-i2s: Don't use platform_data for DMA
 parameters

Since the s3c24xx-dma is converted to use DMA map we can rely on the
DMA subsystem to match DMA channels and slave devices, rather than
passing DMA details from platform_data.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/s3c24xx-i2s.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index d59a47d8ca0f..29196a9933a6 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -30,8 +30,6 @@
 #include "dma.h"
 #include "s3c24xx-i2s.h"
 
-#include <linux/platform_data/asoc-s3c.h>
-
 static struct snd_dmaengine_dai_dma_data s3c24xx_i2s_pcm_stereo_out = {
 	.addr_width	= 2,
 };
@@ -449,14 +447,8 @@ static const struct snd_soc_component_driver s3c24xx_i2s_component = {
 
 static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 {
-	int ret = 0;
 	struct resource *res;
-	struct s3c_audio_pdata *pdata = dev_get_platdata(&pdev->dev);
-
-	if (!pdata) {
-		dev_err(&pdev->dev, "missing platform data");
-		return -ENXIO;
-	}
+	int ret = 0;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -468,9 +460,7 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(s3c24xx_i2s.regs);
 
 	s3c24xx_i2s_pcm_stereo_out.addr = res->start + S3C2410_IISFIFO;
-	s3c24xx_i2s_pcm_stereo_out.filter_data = pdata->dma_playback;
 	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
-	s3c24xx_i2s_pcm_stereo_in.filter_data = pdata->dma_capture;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
@@ -479,8 +469,7 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 pdata->dma_filter,
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
 						 NULL, NULL);
 	if (ret)
 		pr_err("failed to register the dma: %d\n", ret);
-- 
2.8.1
