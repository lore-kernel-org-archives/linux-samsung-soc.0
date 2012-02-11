From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] i2c-s3c2410: move resume state flag to end of resume
Date: Sat, 11 Feb 2012 12:22:21 +0900
Message-ID: <018401cce86c$5df94130$19ebc390$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14955 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753976Ab2BKDWX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 22:22:23 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com

From: Kisoo Yu <ksoo.yu@samsung.com>

need to set flag after finishing its work

Signed-off-by: Kisoo Yu <ksoo.yu@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 4c17180..7d6d2b7 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1082,10 +1082,10 @@ static int s3c24xx_i2c_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
-	i2c->suspended = 0;
 	clk_enable(i2c->clk);
 	s3c24xx_i2c_init(i2c);
 	clk_disable(i2c->clk);
+	i2c->suspended = 0;
 
 	return 0;
 }
-- 
1.7.1
