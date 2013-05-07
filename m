From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] usb: gadget: s3c2410_udc: fix error return code in s3c2410_udc_probe()
Date: Tue, 7 May 2013 19:48:22 +0800
Message-ID: <CAPgLHd9zzFi6dCBH0V=eeqVtd=UstiqM8fDcDsMCfujAfEDHTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:41722 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756225Ab3EGLsX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 May 2013 07:48:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code in the gpio_to_irq() error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/usb/gadget/s3c2410_udc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/s3c2410_udc.c b/drivers/usb/gadget/s3c2410_udc.c
index d0e75e1..c974776 100644
--- a/drivers/usb/gadget/s3c2410_udc.c
+++ b/drivers/usb/gadget/s3c2410_udc.c
@@ -1851,6 +1851,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		irq = gpio_to_irq(udc_info->vbus_pin);
 		if (irq < 0) {
 			dev_err(dev, "no irq for gpio vbus pin\n");
+			retval = irq;
 			goto err_gpio_claim;
 		}
 
