From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: s3c24xx-i2s.c merge fixup
Date: Wed, 02 Nov 2016 12:04:36 +0100
Message-ID: <1478084676-30536-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59839 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbcKBLEu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 07:04:50 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG001A63HFUNA40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2016 20:04:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This fixes a build error as below which appeared after merging
branch fix/samsung and also proper error messages are restored.

sound/soc/samsung/s3c24xx-i2s.c: In function ‘s3c24xx_iis_dev_probe’:
sound/soc/samsung/s3c24xx-i2s.c:444:8: error: ‘pdata’ undeclared (first use in this function)
sound/soc/samsung/s3c24xx-i2s.c:444:8: note: each undeclared identifier is reported only once for each function it appears in

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx-i2s.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 3b4bef9..bc5809a 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -440,18 +440,17 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 	s3c24xx_i2s_pcm_stereo_out.addr = res->start + S3C2410_IISFIFO;
 	s3c24xx_i2s_pcm_stereo_in.addr = res->start + S3C2410_IISFIFO;
 
-	ret = samsung_asoc_dma_platform_register(&pdev->dev,
-						 pdata->dma_filter,
+	ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
 						 NULL, NULL);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register the DAI\n");
+		dev_err(&pdev->dev, "Failed to register the DMA: %d\n", ret);
 		return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 			&s3c24xx_i2s_component, &s3c24xx_i2s_dai, 1);
 	if (ret)
-		pr_err("failed to register the dai\n");
+		dev_err(&pdev->dev, "Failed to register the DAI\n");
 
 	return ret;
 }
-- 
1.9.1
