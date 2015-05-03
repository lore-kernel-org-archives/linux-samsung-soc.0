From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] i2c: s3c2410: fix oops in suspend callback for non-dt platforms
Date: Sun,  3 May 2015 21:13:10 +0300
Message-ID: <1430676790-30500-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:32836 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294AbbECSNj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 May 2015 14:13:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Initialize sysreg by default, otherwise driver will crash in suspend callback.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 958c8db..297e9c9 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1143,6 +1143,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	i2c->quirks = s3c24xx_get_device_quirks(pdev);
+	i2c->sysreg = ERR_PTR(-ENOENT);
 	if (pdata)
 		memcpy(i2c->pdata, pdata, sizeof(*pdata));
 	else
-- 
2.3.5
