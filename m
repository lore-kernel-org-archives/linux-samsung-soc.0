From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Correct I2S DAI suspend/resume ops
Date: Fri, 04 Jul 2014 16:05:45 +0200
Message-ID: <1404482745-29177-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31048 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600AbaGDOGB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 10:06:01 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N86005DBXU0FVB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jul 2014 23:06:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

We should save/restore relevant I2S registers regardless of
the dai->active flag, otherwise some settings are being lost
after system suspend/resume cycle. E.g. I2S slave mode set only
during dai initialization is not preserved and the device ends
up in master mode after system resume.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |   16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 2ac76fa..5f9b255 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -920,11 +920,9 @@ static int i2s_suspend(struct snd_soc_dai *dai)
 {
 	struct i2s_dai *i2s = to_info(dai);
 
-	if (dai->active) {
-		i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
-		i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
-		i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
-	}
+	i2s->suspend_i2smod = readl(i2s->addr + I2SMOD);
+	i2s->suspend_i2scon = readl(i2s->addr + I2SCON);
+	i2s->suspend_i2spsr = readl(i2s->addr + I2SPSR);
 
 	return 0;
 }
@@ -933,11 +931,9 @@ static int i2s_resume(struct snd_soc_dai *dai)
 {
 	struct i2s_dai *i2s = to_info(dai);
 
-	if (dai->active) {
-		writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
-		writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
-		writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
-	}
+	writel(i2s->suspend_i2scon, i2s->addr + I2SCON);
+	writel(i2s->suspend_i2smod, i2s->addr + I2SMOD);
+	writel(i2s->suspend_i2spsr, i2s->addr + I2SPSR);
 
 	return 0;
 }
-- 
1.7.9.5
