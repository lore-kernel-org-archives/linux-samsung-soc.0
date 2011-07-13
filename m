From: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Subject: [PATCH] ASoC: SAMSUNG: 24-bit audio playback on Exynos4210
Date: Wed, 13 Jul 2011 16:52:06 +0530
Message-ID: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52759 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964915Ab1GMLWx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 07:22:53 -0400
Received: by pzk9 with SMTP id 9so4708062pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jul 2011 04:22:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: naveenkrishna.ch@gmail.com, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, dp@opensource.wolfsonmicro.com, Kyung-Kwee.Ryu@wolfsonmicro.com, broonie@opensource.wolfsonmicro.com
Cc: Giridhar Maruthy <giridhar.maruthy@linaro.org>

Using 256fs or 512fs will result in distortion of 24-bit
audio samples. This is because the lrclk generated is not
proper. Using 384 fs generates proper output.

Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
---
 sound/soc/samsung/smdk_wm8994.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index e7c1009..45fbe2b 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -8,6 +8,7 @@
  */
 
 #include "../codecs/wm8994.h"
+#include <sound/pcm_params.h>
 
  /*
   * Default CFG switch settings to use this driver:
@@ -44,7 +45,9 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* AIF1CLK should be >=3MHz for optimal performance */
-	if (params_rate(params) == 8000 || params_rate(params) == 11025)
+	if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)
+		pll_out = params_rate(params) * 384;
+	else if (params_rate(params) == 8000 || params_rate(params) == 11025)
 		pll_out = params_rate(params) * 512;
 	else
 		pll_out = params_rate(params) * 256;
-- 
1.7.4.1
