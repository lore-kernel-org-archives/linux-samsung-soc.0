From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ASoC: SAMSUNG: Fix the inverted clocks handling for pcm driver
Date: Sat,  9 Apr 2011 10:53:58 +0900
Message-ID: <1302314038-11398-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39241 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750873Ab1DICY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2011 22:24:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

Fix the inverted clocks handling for pcm cpu driver.
By using SND_SOC_DAIFMT_NB_NF, Audio noise can be generated on SMDK.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/pcm.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 38aac7d..9c7e8b4 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -350,8 +350,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 	ctl = readl(regs + S3C_PCM_CTL);
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		/* Nothing to do, NB_NF by default */
+	case SND_SOC_DAIFMT_IB_NF:
+		/* Nothing to do, IB_NF by default */
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported clock inversion!\n");
-- 
1.7.1
