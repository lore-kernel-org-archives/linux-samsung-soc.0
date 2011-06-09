From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 3/4] ASoC: SAMSUNG: Change platform driver for SMDKs
Date: Thu,  9 Jun 2011 17:09:09 +0900
Message-ID: <1307606950-8310-4-git-send-email-sbkim73@samsung.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58722 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755089Ab1FIITF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 04:19:05 -0400
In-Reply-To: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

Change platform driver to support internal dma
for smdk_wm8994 and smdk_wm8580

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/smdk_wm8580.c |    2 +-
 sound/soc/samsung/smdk_wm8994.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8580.c b/sound/soc/samsung/smdk_wm8580.c
index 3d26f66..fa415a1 100644
--- a/sound/soc/samsung/smdk_wm8580.c
+++ b/sound/soc/samsung/smdk_wm8580.c
@@ -229,7 +229,7 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.stream_name = "Playback",
 		.cpu_dai_name = "samsung-i2s.x",
 		.codec_dai_name = "wm8580-hifi-playback",
-		.platform_name = "samsung-audio",
+		.platform_name = "samsung-idma",
 		.codec_name = "wm8580-codec.0-001b",
 		.init = smdk_wm8580_init_paifrx,
 		.ops = &smdk_ops,
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index e7c1009..d36c575 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -134,7 +134,7 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.stream_name = "Sec_Dai",
 		.cpu_dai_name = "samsung-i2s.4",
 		.codec_dai_name = "wm8994-aif1",
-		.platform_name = "samsung-audio",
+		.platform_name = "samsung-idma",
 		.codec_name = "wm8994-codec",
 		.ops = &smdk_ops,
 	},
-- 
1.7.1
