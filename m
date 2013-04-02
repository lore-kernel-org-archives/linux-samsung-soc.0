From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/2] ASoC: Samsung: return error if drvdata is not set
Date: Tue, 02 Apr 2013 16:53:01 +0530
Message-ID: <1364901782-16619-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58805 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049Ab3DBLWq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 07:22:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM00KXVKXV17M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 20:22:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, Prathyush K <prathyush.k@samsung.com>

From: Prathyush K <prathyush.k@samsung.com>

This patch fixes a possible crash in case drvdata for the secondary
device is not set.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Based on Kukjin for-next branch

 sound/soc/samsung/i2s.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d7231e3..f1fc064 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1107,6 +1107,10 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	if (samsung_dai_type == TYPE_SEC) {
 		sec_dai = dev_get_drvdata(&pdev->dev);
+		if (!sec_dai) {
+			dev_err(&pdev->dev, "Unable to get drvdata\n");
+			return -EFAULT;
+		}
 		snd_soc_register_dai(&sec_dai->pdev->dev,
 			&sec_dai->i2s_dai_drv);
 		asoc_dma_platform_register(&pdev->dev);
-- 
1.7.4.4
