From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Thu, 16 Oct 2014 14:57:59 +0200
Message-ID: <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57455 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbaJPM62 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 08:58:28 -0400
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Enabling and disabling usb gadget by writing to
/sys/class/udc/*hsotg/soft_connect results in calling udc_start/udc_stop
functions with the same usb gadget driver, so the driver should not WARN
about such case.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 8870e38c1d82..37fda4c03397 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 		return -EINVAL;
 	}
 
-	WARN_ON(hsotg->driver);
+	WARN_ON(hsotg->driver && hsotg->driver != driver);
 
 	driver->driver.bus = NULL;
 	hsotg->driver = driver;
-- 
1.9.2
