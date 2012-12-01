From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/2] ASoC: Samsung: Do not register samsung audio dma device as
 pdev
Date: Sat, 01 Dec 2012 15:37:27 +0530
Message-ID: <1354356447-16784-3-git-send-email-padma.v@samsung.com>
References: <1354356447-16784-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59945 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab2LAKDj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Dec 2012 05:03:39 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEC00396JWMKR60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 01 Dec 2012 19:03:38 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MEC00MJCJXROT30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 01 Dec 2012 19:03:38 +0900 (KST)
In-reply-to: <1354356447-16784-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org, kgene.kim@samsung.com

Previously, the ASoC 'platform' (PCM/DMA) object was instantiated via a
platform_device. This didn't represent the hardware well, since there
was no separate hardware associated with this platform_device; it was a
virtual device with sole purpose to call snd_soc_register_platform().

This change removes the platform_device completely. Each Samsung DAI now
registers the ASoC 'platform' itself. Machine drivers are adjusted for
the new 'platform' name.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/dma.c         |   24 ++++++------------------
 sound/soc/samsung/dma.h         |    3 +++
 sound/soc/samsung/i2s.c         |    3 +++
 sound/soc/samsung/smdk_wm8994.c |    7 +++++--
 4 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index 359708c..f7e0d47 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -433,30 +433,18 @@ static struct snd_soc_platform_driver samsung_asoc_platform = {
 	.pcm_free	= dma_free_dma_buffers,
 };
 
-static int __devinit samsung_asoc_platform_probe(struct platform_device *pdev)
+int __devinit samsung_dma_platform_register(struct device *dev)
 {
-	return snd_soc_register_platform(&pdev->dev, &samsung_asoc_platform);
+	return snd_soc_register_platform(dev, &samsung_asoc_platform);
 }
+EXPORT_SYMBOL_GPL(samsung_dma_platform_register);
 
-static int __devexit samsung_asoc_platform_remove(struct platform_device *pdev)
+void __devexit samsung_dma_platform_unregister(struct device *dev)
 {
-	snd_soc_unregister_platform(&pdev->dev);
-	return 0;
+	snd_soc_unregister_platform(dev);
 }
-
-static struct platform_driver asoc_dma_driver = {
-	.driver = {
-		.name = "samsung-audio",
-		.owner = THIS_MODULE,
-	},
-
-	.probe = samsung_asoc_platform_probe,
-	.remove = __devexit_p(samsung_asoc_platform_remove),
-};
-
-module_platform_driver(asoc_dma_driver);
+EXPORT_SYMBOL_GPL(samsung_dma_platform_unregister);
 
 MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
 MODULE_DESCRIPTION("Samsung ASoC DMA Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:samsung-audio");
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 2e60415..3c462a8 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -22,4 +22,7 @@ struct s3c_dma_params {
 	struct property *dma_prop;
 };
 
+int samsung_dma_platform_register(struct device *dev);
+void samsung_dma_platform_unregister(struct device *dev);
+
 #endif
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index a7d03d9..dbf1e5c 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1075,6 +1075,7 @@ static __devinit int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai = dev_get_drvdata(&pdev->dev);
 		snd_soc_register_dai(&sec_dai->pdev->dev,
 			&sec_dai->i2s_dai_drv);
+		samsung_dma_platform_register(&pdev->dev);
 		return 0;
 	}
 
@@ -1232,6 +1233,8 @@ static __devinit int samsung_i2s_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	samsung_dma_platform_register(&pdev->dev);
+
 	return 0;
 err:
 	release_mem_region(regs_base, resource_size(res));
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index f9ba2b9..2f3e2b8 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -128,7 +128,7 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.stream_name = "Pri_Dai",
 		.cpu_dai_name = "samsung-i2s.0",
 		.codec_dai_name = "wm8994-aif1",
-		.platform_name = "samsung-audio",
+		.platform_name = "samsung-i2s.0",
 		.codec_name = "wm8994-codec",
 		.init = smdk_wm8994_init_paiftx,
 		.ops = &smdk_ops,
@@ -137,7 +137,7 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.stream_name = "Sec_Dai",
 		.cpu_dai_name = "samsung-i2s.4",
 		.codec_dai_name = "wm8994-aif1",
-		.platform_name = "samsung-audio",
+		.platform_name = "samsung-i2s.4",
 		.codec_name = "wm8994-codec",
 		.ops = &smdk_ops,
 	},
@@ -168,6 +168,9 @@ static int __devinit smdk_audio_probe(struct platform_device *pdev)
 			   "Property 'samsung,i2s-controller' missing or invalid\n");
 			ret = -EINVAL;
 		}
+
+		smdk_dai[0].platform_name = NULL;
+		smdk_dai[0].platform_of_node = smdk_dai[0].cpu_of_node;
 	}
 
 	ret = snd_soc_register_card(card);
-- 
1.7.4.4
