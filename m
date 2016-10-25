From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 3/4] ASoC: samsung: s3c24xx-i2s: Don't use platform_data for
 DMA parameters
Date: Tue, 25 Oct 2016 17:08:40 +0200
Message-ID: <1477408121-24716-3-git-send-email-s.nawrocki@samsung.com>
References: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56951 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938921AbcJYPJI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 11:09:08 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFL00NFPZF663B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Oct 2016 00:09:06 +0900 (KST)
In-reply-to: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, lgirdwood@gmail.com, lars@metafoo.de, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Since the s3c24xx-dma is converted to use DMA map we can rely on the
DMA subsystem to match DMA channels and slave devices, rather than
passing DMA details from platform_data.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - none.

 sound/soc/samsung/s3c24xx-i2s.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index d59a47d..29196a9 100644
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
@@ -449,14 +447,8 @@ static int s3c24xx_i2s_resume(struct snd_soc_dai *cpu_dai)

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
1.9.1
