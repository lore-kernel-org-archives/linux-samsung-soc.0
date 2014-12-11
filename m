From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 08/14] ASoC: samsung: i2s: Remove an unneeded goto usage
Date: Thu, 11 Dec 2014 18:45:46 +0100
Message-ID: <1418319952-10163-9-git-send-email-s.nawrocki@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24383 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRqr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:46:47 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGF00GCSIPYI090@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Dec 2014 02:46:46 +0900 (KST)
In-reply-to: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

The usage of this goto seems unjustified, use if/else statement instead.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 6501c40..a131621 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -979,19 +979,18 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (is_secondary(i2s)) { /* If this is probe on the secondary DAI */
 		samsung_asoc_init_dma_data(dai, &other->sec_dai->dma_playback,
 					   NULL);
-		goto probe_exit;
-	}
-
-	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
+	} else {
+		samsung_asoc_init_dma_data(dai, &i2s->dma_playback,
+					   &i2s->dma_capture);
 
-	if (i2s->quirks & QUIRK_NEED_RSTCLR)
-		writel(CON_RSTCLR, i2s->addr + I2SCON);
+		if (i2s->quirks & QUIRK_NEED_RSTCLR)
+			writel(CON_RSTCLR, i2s->addr + I2SCON);
 
-	if (i2s->quirks & QUIRK_SUPPORTS_IDMA)
-		idma_reg_addr_init(i2s->addr,
+		if (i2s->quirks & QUIRK_SUPPORTS_IDMA)
+			idma_reg_addr_init(i2s->addr,
 					i2s->sec_dai->idma_playback.dma_addr);
+	}
 
-probe_exit:
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
 	i2s->bfs = 0;
-- 
1.7.9.5
