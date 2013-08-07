From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 6/7] ASoC: Samsung: wm8994: Register the osc clock.
Date: Wed, 07 Aug 2013 14:20:41 +0530
Message-ID: <1375865442-5323-10-git-send-email-padma.v@samsung.com>
References: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40843 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757198Ab3HGItd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 04:49:33 -0400
In-reply-to: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

This patch registers the 16MHz oscillator clock as fixed clk.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/smdk_wm8994.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 581ea4a..a6edded 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -9,6 +9,7 @@
 
 #include "../codecs/wm8994.h"
 #include <sound/pcm_params.h>
+#include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of.h>
 
@@ -37,6 +38,15 @@
 /* SMDK has a 16.934MHZ crystal attached to WM8994 */
 #define SMDK_WM8994_FREQ 16934000
 
+/* 16.9MHz fixed oscillator clock */
+static void init_osc_clock(void)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "osc3_clk16mhz");
+	of_fixed_clk_setup(np);
+}
+
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
@@ -173,6 +183,8 @@ static int smdk_audio_probe(struct platform_device *pdev)
 		smdk_dai[0].platform_of_node = smdk_dai[0].cpu_of_node;
 	}
 
+	init_osc_clock();
+
 	ret = snd_soc_register_card(card);
 
 	if (ret)
-- 
1.7.4.4
