From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Fix IISMOD setting in i2s_set_sysclk()
Date: Wed, 19 Nov 2014 19:11:04 +0100
Message-ID: <1416420664-20952-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49200 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755100AbaKSSLT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 13:11:19 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFA0050ZT6TV310@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 03:11:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Padmavathi Venna <padma.v@samsung.com>

In the i2s_set_sysclk() callback we are currently clearing all bits
of the IISMOD register when clk_id is SAMSUNG_I2S_CDCLK and dir
is SND_SOC_CLOCK_OUT. It's due to an incorrect mask used for the AND
operation and breaks the I2S interface operation when we attempt to
use the CDCLK output clock.

It fixes commit a5a56871f804edac93a53b5e871c0e9818fb9033
("ASoC: samsung: add support for exynos7 I2S controller") and restores
sound support for Odroid X2/U3.

Cc: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 947352d..8db8c66 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -494,7 +494,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 		if (dir == SND_SOC_CLOCK_IN)
 			mod |= 1 << i2s_regs->cdclkcon_off;
 		else
-			mod &= 0 << i2s_regs->cdclkcon_off;
+			mod &= ~(1 << i2s_regs->cdclkcon_off);
 
 		i2s->rfs = rfs;
 		break;
-- 
1.7.9.5
