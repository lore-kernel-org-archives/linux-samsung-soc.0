From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: s3c2410: fix indentation for better readability
Date: Sun, 24 Apr 2016 23:28:11 +0200
Message-ID: <1461533338-17479-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41049 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753124AbcDXV3J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Apr 2016 17:29:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org

smatch rightfully says:

drivers/i2c/busses/i2c-s3c2410.c:1217 s3c24xx_i2c_probe() warn: inconsistent indenting

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/busses/i2c-s3c2410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 1bc756313cb8e4..315c88ea1fa153 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1214,8 +1214,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-	ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
-				dev_name(&pdev->dev), i2c);
+		ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
+				       dev_name(&pdev->dev), i2c);
 
 		if (ret != 0) {
 			dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
-- 
2.7.0
