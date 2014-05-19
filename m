From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Allow setting OP_CLK of the IIS Multi Audio
 Interface
Date: Mon, 19 May 2014 19:30:38 +0200
Message-ID: <1400520638-6907-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22711 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754832AbaESRbM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 13:31:12 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5U00LHB0NZI1A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 02:31:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds support for setting source clock of the "Core CLK"
of the IIS Multi Audio Interface.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |    4 ++++
 sound/soc/samsung/i2s.h |    1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 048ead9..ae02811 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -451,6 +451,10 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 	u32 mod = readl(i2s->addr + I2SMOD);
 
 	switch (clk_id) {
+	case SAMSUNG_I2S_OPCLK:
+		mod &= ~MOD_OPCLK_MASK;
+		mod |= dir;
+		break;
 	case SAMSUNG_I2S_CDCLK:
 		/* Shouldn't matter in GATING(CLOCK_IN) mode */
 		if (dir == SND_SOC_CLOCK_IN)
diff --git a/sound/soc/samsung/i2s.h b/sound/soc/samsung/i2s.h
index 7966afc..21ff24e 100644
--- a/sound/soc/samsung/i2s.h
+++ b/sound/soc/samsung/i2s.h
@@ -18,5 +18,6 @@
 #define SAMSUNG_I2S_RCLKSRC_0	0
 #define SAMSUNG_I2S_RCLKSRC_1	1
 #define SAMSUNG_I2S_CDCLK		2
+#define SAMSUNG_I2S_OPCLK		3
 
 #endif /* __SND_SOC_SAMSUNG_I2S_H */
-- 
1.7.9.5
