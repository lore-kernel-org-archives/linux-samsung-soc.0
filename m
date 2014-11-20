From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] ASoC: samsung: ASoC: samsung: Fix IISMOD setting in
 i2s_set_sysclk()
Date: Thu, 20 Nov 2014 15:33:17 +0530
Message-ID: <1416477797-27332-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54607 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575AbaKTKJ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 05:09:58 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFC00L961KHU310@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 19:09:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: broonie@kernel.org, kgene.kim@samsung.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

In the i2s_set_sysclk() callback we are currently clearing all bits
of the IISMOD register in i2s_set_sysclk. It's due to an incorrect
mask used for the AND operation which is introduced in commit
a5a56871f804edac93a53b5e871c0e9818fb9033 (ASoC: samsung:
add support for exynos7 I2S controller) and also adds the missing
break statement.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 sound/soc/samsung/i2s.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 0df6547..e1ace52 100644
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
@@ -551,10 +551,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 		}
 
 		if (clk_id == 0)
-			mod &= 0 << i2s_regs->rclksrc_off;
+			mod &= ~(1 << i2s_regs->rclksrc_off);
 		else
 			mod |= 1 << i2s_regs->rclksrc_off;
 
+		break;
 	default:
 		dev_err(&i2s->pdev->dev, "We don't serve that!\n");
 		return -EINVAL;
-- 
1.7.4.4
