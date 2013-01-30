From: Alexey Galakhov <agalakhov@gmail.com>
Subject: [PATCH] Fix compilation error on S3C2440
Date: Wed, 30 Jan 2013 15:35:22 +0600
Message-ID: <1359538522-4738-1-git-send-email-agalakhov@gmail.com>
References: <20130130021857.GF4945@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:38953 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754293Ab3A3Jfm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 04:35:42 -0500
Received: by mail-la0-f41.google.com with SMTP id fo12so945044lab.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jan 2013 01:35:40 -0800 (PST)
In-Reply-To: <20130130021857.GF4945@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, bkim73@samsung.com, Alexey Galakhov <agalakhov@gmail.com>

The commit a08485d8 ("ASoC: Samsung: Do not register samsung audio dma
device as pdev") introduced compilation error.

Combination of CONFIG_CPU_S3C2440 and CONFIG_SND_S3C24XX_I2S
caused undefined symbols 's3c_i2sv2_register_dai' and 's3c2412_i2s_dai'
in sound/soc/samsung/s3c24xx-i2s.c.

This patch fixes the problem and makes S3C2440 I2S usable again. It does
not affect S3C2412 (aka I2S-v2).

Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>
---
 sound/soc/samsung/s3c24xx-i2s.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index ee10e87..13f6dd1 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -469,7 +469,7 @@ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 
-	ret = s3c_i2sv2_register_dai(&pdev->dev, -1, &s3c2412_i2s_dai);
+	ret = snd_soc_register_dai(&pdev->dev, &s3c24xx_i2s_dai);
 	if (ret) {
 		pr_err("failed to register the dai\n");
 		return ret;
-- 
1.7.10.4
