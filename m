From: Alexey Galakhov <agalakhov@gmail.com>
Subject: [PATCH] Fix compilation error on S3C2440
Date: Mon, 28 Jan 2013 23:07:03 +0600
Message-ID: <1359392823-30529-1-git-send-email-agalakhov@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:56225 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756242Ab3A1RHs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 12:07:48 -0500
Received: by mail-lb0-f181.google.com with SMTP id gm6so4238103lbb.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 09:07:47 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexey Galakhov <agalakhov@gmail.com>

There was a compilation error introduced on Dec 7, 2012
by commit a08485d8fdf6f67ca5f173b68d8f873c574745f2.

Combination of CONFIG_CPU_S3C2440 and CONFIG_SND_S3C24XX_I2S
caused the following:
sound/soc/samsung/s3c24xx-i2s.c: In function 's3c24xx_iis_dev_probe':
sound/soc/samsung/s3c24xx-i2s.c:472:2: error: implicit declaration of
function 's3c_i2sv2_register_dai' [-Werror=implicit-function-declaration]
sound/soc/samsung/s3c24xx-i2s.c:472:48: error: 's3c2412_i2s_dai'
undeclared (first use in this function)

This patch fixes the problem and makes S3C2440 I2S usable again.

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
