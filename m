From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] spi: spi-s3c24xx: remove redundant return value check
 of platform_get_resource()
Date: Fri, 20 Dec 2013 10:22:20 +0800
Message-ID: <CAPgLHd_Dii+mu4GmSUWjxTwy55Xxe6Qoq=TN73jQR1_NQUnAbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:47468 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932085Ab3LTCWV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 21:22:21 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, broonie@kernel.org, jg1.han@samsung.com
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove unneeded error handling on the result of a call
to platform_get_resource() when the value is passed to
devm_ioremap_resource().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/spi/spi-s3c24xx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-s3c24xx.c b/drivers/spi/spi-s3c24xx.c
index ebf80bb..2ccb28d 100644
--- a/drivers/spi/spi-s3c24xx.c
+++ b/drivers/spi/spi-s3c24xx.c
@@ -560,14 +560,7 @@ static int s3c24xx_spi_probe(struct platform_device *pdev)
 	dev_dbg(hw->dev, "bitbang at %p\n", &hw->bitbang);
 
 	/* find and map our resources */
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "Cannot get IORESOURCE_MEM\n");
-		err = -ENOENT;
-		goto err_no_pdata;
-	}
-
 	hw->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(hw->regs)) {
 		err = PTR_ERR(hw->regs);
