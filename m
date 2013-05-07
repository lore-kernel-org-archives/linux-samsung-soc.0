From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] ASoC: Samsung: i2s: Fix crash in i2s driver
Date: Tue, 07 May 2013 09:09:01 +0530
Message-ID: <1367897941-18439-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26609 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757553Ab3EGDhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 May 2013 23:37:22 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MME00H0ESQ898K0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 May 2013 12:37:20 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, alim.akhtar@samsung.com, thomas.ab@samsung.com

This patch fixes a null pointer deference in i2s driver in DT
case

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

This patch is dependent on below patch posted by Thomas Abraham.
https://patchwork.kernel.org/patch/2224801/

 sound/soc/samsung/i2s.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 7ce7c50..eaf6439 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1182,7 +1182,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		pri_dai->sec_dai = sec_dai;
 	}
 
-	if (i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
+	if (i2s_pdata && i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
 		dev_err(&pdev->dev, "Unable to configure gpio\n");
 		ret = -EINVAL;
 		goto err;
-- 
1.7.4.4
