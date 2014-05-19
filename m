From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] sound: soc: samsung: dma.c:  Fix for possible null pointer dereference
Date: Mon, 19 May 2014 23:37:23 +0200
Message-ID: <1400535443-5886-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:35077 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838AbaESVge (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 17:36:34 -0400
Received: by mail-ee0-f52.google.com with SMTP id e53so4016983eek.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 14:36:33 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

There is otherwise a risk of a possible null pointer dereference.

Was largely found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 sound/soc/samsung/dma.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index dc09b71..1d9bcaa 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -115,17 +115,19 @@ static void dma_enqueue(struct snd_pcm_substream *substream)
 static void audio_buffdone(void *data)
 {
 	struct snd_pcm_substream *substream = data;
-	struct runtime_data *prtd = substream->runtime->private_data;
+	struct runtime_data *prtd = NULL;
 
 	pr_debug("Entered %s\n", __func__);
 
-	if (prtd->state & ST_RUNNING) {
+	if (substream)
+		prtd = substream->runtime->private_data;
+
+	if (prtd && prtd->state & ST_RUNNING) {
 		prtd->dma_pos += prtd->dma_period;
 		if (prtd->dma_pos >= prtd->dma_end)
 			prtd->dma_pos = prtd->dma_start;
 
-		if (substream)
-			snd_pcm_period_elapsed(substream);
+		snd_pcm_period_elapsed(substream);
 
 		spin_lock(&prtd->lock);
 		if (!samsung_dma_has_circular()) {
-- 
1.7.10.4
