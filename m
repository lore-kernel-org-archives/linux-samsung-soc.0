From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: s3c24xx-i2s.c merge fixup" to the asoc tree
Date: Wed, 02 Nov 2016 10:48:25 -0600
Message-ID: <E1c1yi9-0006CN-Tq@finisterre>
References: <1478084676-30536-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38588 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756355AbcKBQs4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 12:48:56 -0400
In-Reply-To: <1478084676-30536-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, krzk@kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org

The patch

   ASoC: samsung: s3c24xx-i2s.c merge fixup

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

>From 6c9473c55e7bb93dd4086f74e8e727dd3350855d Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 2 Nov 2016 12:04:36 +0100
Subject: [PATCH] ASoC: samsung: s3c24xx-i2s.c merge fixup
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes a build error as below which appeared after merging
branch fix/samsung and also proper error messages are restored.

sound/soc/samsung/s3c24xx-i2s.c: In function ‘s3c24xx_iis_dev_probe’:
sound/soc/samsung/s3c24xx-i2s.c:444:8: error: ‘pdata’ undeclared (first use in this function)
sound/soc/samsung/s3c24xx-i2s.c:444:8: note: each undeclared identifier is reported only once for each function it appears in

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/s3c24xx-i2s.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index c93169823c7c..07f5091b33e8 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -436,18 +436,17 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
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
2.10.1
