From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 08/10] usb: dwc2/gadget: use soft-disconnect udc feature in
 pullup() method
Date: Mon, 20 Oct 2014 12:45:38 +0200
Message-ID: <1413801940-31086-9-git-send-email-m.szyprowski@samsung.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:33978 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753529AbaJTKp4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 06:45:56 -0400
In-reply-to: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

This patch moves udc initialization from pullup() method to
s3c_hsotg_udc_start(), so that method ends with hardware fully
initialized and left in soft-disconnected state. After this change, the
pullup() method simply clears soft-disconnect start() when called with
is_on=1. For completeness, a call to s3c_hsotg_core_disconnect() has
been added when pullup() method is called with is_on=0, what puts the
udc hardware back to soft-disconnected state.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 98adf8d17493..e8ffc080e6c7 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2883,6 +2883,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 			   struct usb_gadget_driver *driver)
 {
 	struct s3c_hsotg *hsotg = to_hsotg(gadget);
+	unsigned long flags;
 	int ret;
 
 	if (!hsotg) {
@@ -2921,7 +2922,13 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 
 	s3c_hsotg_phy_enable(hsotg);
 
+	spin_lock_irqsave(&hsotg->lock, flags);
+	s3c_hsotg_init(hsotg);
+	s3c_hsotg_core_init_disconnected(hsotg);
+	spin_unlock_irqrestore(&hsotg->lock, flags);
+
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
+
 	return 0;
 
 err:
@@ -2994,9 +3001,9 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
 		clk_enable(hsotg->clk);
-		s3c_hsotg_core_init_disconnected(hsotg);
 		s3c_hsotg_core_connect(hsotg);
 	} else {
+		s3c_hsotg_core_disconnect(hsotg);
 		clk_disable(hsotg->clk);
 	}
 
-- 
1.9.2
