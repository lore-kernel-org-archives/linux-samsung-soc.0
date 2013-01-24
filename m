From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH] Asoc: Samsung: Add I2S S/W RST in startup function
Date: Thu, 24 Jan 2013 18:05:31 +0530
Message-ID: <1359030931-27354-2-git-send-email-rcsekar@samsung.com>
References: <1359030931-27354-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63707 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753065Ab3AXMjk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 07:39:40 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH40077IR63OU01@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jan 2013 21:39:39 +0900 (KST)
Received: from sekar-ubuntu.sisodomain.com ([107.108.73.178])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH4007KRR2EEQ50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jan 2013 21:39:38 +0900 (KST)
In-reply-to: <1359030931-27354-1-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com, Padmavathi Venna <padma.v@samsung.com>

From: Padmavathi Venna <padma.v@samsung.com>

I2S module need to be reset after S2R. Keeping the S/W rst
control part in resume didn't help in playing audio after resume.
So this patch adds S/W RST control part in startup function which
gets triggered for every new audio stream playback.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>
---
 sound/soc/samsung/i2s.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 27a5ab1..9f098cd 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -651,6 +651,9 @@ static int i2s_startup(struct snd_pcm_substream *substream,
 	/* Enforce set_sysclk in Master mode */
 	i2s->rclk_srcrate = 0;
 
+	if (!any_active(i2s) && (i2s->quirks & QUIRK_NEED_RSTCLR))
+		writel(CON_RSTCLR, i2s->addr + I2SCON);
+
 	spin_unlock_irqrestore(&lock, flags);
 
 	return 0;
-- 
1.7.9.5
