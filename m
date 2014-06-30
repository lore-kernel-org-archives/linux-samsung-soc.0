From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] usb: gadget: s3c2410: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 30 Jun 2014 22:13:29 +0300
Message-ID: <1404155609-3103-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:55576 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754527AbaF3TPl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:15:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/usb/gadget/s3c2410_udc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/s3c2410_udc.c b/drivers/usb/gadget/s3c2410_udc.c
index 7987aa0..357b58e 100644
--- a/drivers/usb/gadget/s3c2410_udc.c
+++ b/drivers/usb/gadget/s3c2410_udc.c
@@ -1788,7 +1788,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		return PTR_ERR(usb_bus_clock);
 	}
 
-	clk_enable(usb_bus_clock);
+	clk_prepare_enable(usb_bus_clock);
 
 	udc_clock = clk_get(NULL, "usb-device");
 	if (IS_ERR(udc_clock)) {
@@ -1796,7 +1796,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		return PTR_ERR(udc_clock);
 	}
 
-	clk_enable(udc_clock);
+	clk_prepare_enable(udc_clock);
 
 	mdelay(10);
 
@@ -1952,13 +1952,13 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 	release_mem_region(rsrc_start, rsrc_len);
 
 	if (!IS_ERR(udc_clock) && udc_clock != NULL) {
-		clk_disable(udc_clock);
+		clk_disable_unprepare(udc_clock);
 		clk_put(udc_clock);
 		udc_clock = NULL;
 	}
 
 	if (!IS_ERR(usb_bus_clock) && usb_bus_clock != NULL) {
-		clk_disable(usb_bus_clock);
+		clk_disable_unprepare(usb_bus_clock);
 		clk_put(usb_bus_clock);
 		usb_bus_clock = NULL;
 	}
-- 
2.0.0
