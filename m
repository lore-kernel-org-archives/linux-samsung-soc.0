From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 7/9] usb: dwc2/gadget: use soft disconnect mode for
 implementing pullup control
Date: Thu, 16 Oct 2014 14:58:03 +0200
Message-ID: <1413464285-24172-8-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21232 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752445AbaJPM6b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 08:58:31 -0400
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

This patch moves PHY enable and disable calls from pullup method to
udc_start/stop functions and adds calls to recently introduces soft
disconnect mode in pullup method. This improves dwc2 gadget driver
compatibility with gadget API requirements (now pullup method really
forces soft disconnect mode instead of shutting down the whole hardware)
and as a side effect also solves the issue related to limited caller
context for PHY related functions (they cannot be called from
non-sleeping context).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index d039334967d7..cdf417a7ae63 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2883,6 +2883,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 			   struct usb_gadget_driver *driver)
 {
 	struct s3c_hsotg *hsotg = to_hsotg(gadget);
+	unsigned long flags;
 	int ret;
 
 	if (!hsotg) {
@@ -2919,7 +2920,15 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 		goto err;
 	}
 
+	s3c_hsotg_phy_enable(hsotg);
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+	s3c_hsotg_init(hsotg);
+	s3c_hsotg_core_init_disconnected(hsotg);
+	spin_unlock_irqrestore(&hsotg->lock, flags);
+
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
+
 	return 0;
 
 err:
@@ -2957,6 +2966,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
+	s3c_hsotg_phy_disable(hsotg);
+
 	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 
 	clk_disable(hsotg->clk);
@@ -2990,14 +3001,13 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
 
 	spin_lock_irqsave(&hsotg->lock, flags);
+
 	if (is_on) {
-		s3c_hsotg_phy_enable(hsotg);
 		clk_enable(hsotg->clk);
-		s3c_hsotg_core_init_disconnected(hsotg);
 		s3c_hsotg_core_connect(hsotg);
 	} else {
+		s3c_hsotg_core_disconnect(hsotg);
 		clk_disable(hsotg->clk);
-		s3c_hsotg_phy_disable(hsotg);
 	}
 
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-- 
1.9.2
