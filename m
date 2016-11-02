From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: spdif: Fix DMA filter initialization
Date: Wed, 02 Nov 2016 12:03:03 +0100
Message-ID: <1478084583-30460-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52536 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbcKBLDP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 07:03:15 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG000O6SHDC8F50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2016 20:03:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch fixes issues introduced in commit 73f5dfc68316bef2ab7062ec
"ASoC: samsung: get access to DMA engine early to defer probe properly"
and indicated by a following compilation warning:

  CC [M]  sound/soc/samsung/spdif.o
sound/soc/samsung/spdif.c: In function ‘spdif_probe’:
sound/soc/samsung/spdif.c:419:6: warning: ‘filter’ may be used uninitialized
in this function [-Wuninitialized]

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/spdif.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 704b7b1..779504f 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -416,6 +416,15 @@ static int spdif_probe(struct platform_device *pdev)
 		goto err3;
 	}

+	spdif_stereo_out.addr_width = 2;
+	spdif_stereo_out.addr = mem_res->start + DATA_OUTBUF;
+	filter = NULL;
+	if (spdif_pdata) {
+		spdif_stereo_out.filter_data = spdif_pdata->dma_playback;
+		filter = spdif_pdata->dma_filter;
+	}
+	spdif->dma_playback = &spdif_stereo_out;
+
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
 						 NULL, NULL);
 	if (ret) {
@@ -432,16 +441,6 @@ static int spdif_probe(struct platform_device *pdev)
 		goto err4;
 	}

-	spdif_stereo_out.addr_width = 2;
-	spdif_stereo_out.addr = mem_res->start + DATA_OUTBUF;
-	filter = NULL;
-	if (spdif_pdata) {
-		spdif_stereo_out.filter_data = spdif_pdata->dma_playback;
-		filter = spdif_pdata->dma_filter;
-	}
-
-	spdif->dma_playback = &spdif_stereo_out;
-
 	return 0;
 err4:
 	iounmap(spdif->regs);
--
1.9.1
