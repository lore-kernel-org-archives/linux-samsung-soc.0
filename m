From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 03/14] ASoC: samsung: i2s: Add return value checks in
 probe()
Date: Thu, 11 Dec 2014 18:45:41 +0100
Message-ID: <1418319952-10163-4-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24366 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRqd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:46:33 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGF00GCMIPKI090@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Dec 2014 02:46:32 +0900 (KST)
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Those function may fail so let's report properly any errors.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 45f7f0f..d65e092 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1173,11 +1173,13 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Unable to get drvdata\n");
 			return -EFAULT;
 		}
-		devm_snd_soc_register_component(&sec_dai->pdev->dev,
+		ret = devm_snd_soc_register_component(&sec_dai->pdev->dev,
 						&samsung_i2s_component,
 						&sec_dai->i2s_dai_drv, 1);
-		samsung_asoc_dma_platform_register(&pdev->dev);
-		return 0;
+		if (ret != 0)
+			return ret;
+
+		return samsung_asoc_dma_platform_register(&pdev->dev);
 	}
 
 	pri_dai = i2s_alloc_dai(pdev, false);
@@ -1290,7 +1292,9 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	samsung_asoc_dma_platform_register(&pdev->dev);
+	ret = samsung_asoc_dma_platform_register(&pdev->dev);
+	if (ret != 0)
+		return ret;
 
 	return 0;
 err:
-- 
1.7.9.5
