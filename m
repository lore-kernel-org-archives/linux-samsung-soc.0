From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung-i2s: Maintain CDCLK settings across
 i2s_{shutdown/startup}
Date: Thu, 10 Jul 2014 18:11:13 +0200
Message-ID: <1405008673-15994-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52034 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882AbaGJQMN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jul 2014 12:12:13 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8I00D7C7OBDT00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jul 2014 01:12:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: drake@endlessm.com, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chen Zhen <zhen1.chen@samsung.com>

Currently configuration of the CDCLK pad is being overwritten in
the i2s_shutdown() callback in order to gate the SoC output clock.
However if an ASoC machine driver doesn't restore that clock
settings each time after opening the sound device this results
in the CDCLK pin being permanently configured into input mode.
I.e. the output clock will always stay disabled.
Fix that by saving the CDCLKCON bit state in i2s_shutdown() and
and restoring it in the i2s_startup() callback.

Signed-off-by: Chen Zhen <zhen1.chen@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 2ac76fa..3cb3e95 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -68,6 +68,8 @@ struct i2s_dai {
 #define DAI_OPENED	(1 << 0) /* Dai is opened */
 #define DAI_MANAGER	(1 << 1) /* Dai is the manager */
 	unsigned mode;
+	/* CDCLK pin direction: 0  - input, 1 - output */
+	unsigned int cdclk_out:1;
 	/* Driver for this DAI */
 	struct snd_soc_dai_driver i2s_dai_drv;
 	/* DMA parameters */
@@ -737,6 +739,9 @@ static int i2s_startup(struct snd_pcm_substream *substream,
 
 	spin_unlock_irqrestore(&lock, flags);
 
+	if (!is_opened(other) && i2s->cdclk_out)
+		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK,
+				0, SND_SOC_CLOCK_OUT);
 	return 0;
 }
 
@@ -752,9 +757,13 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,
 	i2s->mode &= ~DAI_OPENED;
 	i2s->mode &= ~DAI_MANAGER;
 
-	if (is_opened(other))
+	if (is_opened(other)) {
 		other->mode |= DAI_MANAGER;
-
+	} else {
+		u32 mod = readl(i2s->addr + I2SMOD);
+		i2s->cdclk_out = !(mod & MOD_CDCLKCON);
+		other->cdclk_out = i2s->cdclk_out;
+	}
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
 	i2s->bfs = 0;
-- 
1.7.9.5
