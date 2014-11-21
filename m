From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 3/3] usb: dwc2/gadget: rework suspend/resume code to
 correctly restore gadget state
Date: Fri, 21 Nov 2014 15:14:49 +0100
Message-ID: <1416579289-31939-3-git-send-email-m.szyprowski@samsung.com>
References: <1416579289-31939-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15284 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755232AbaKUOO7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 09:14:59 -0500
In-reply-to: <1416579289-31939-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

Suspend/resume code assumed that the gadget was always started and
enabled to connect to usb bus. This means that the actual state of the
gadget (started/stopped or connected/disconnected) was not correctly
preserved on suspend/resume cycle. This patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Since hsotg->driver is always set in udc_start and cleared in udc_stop,
it has been also used to track if gadget has been start (in previous
version a 'enabled' bool entry was used for this purpose). Because
'connected' bool entry has been used to track usb cable connection
state, to aboid confusion, I reused 'enable' bool entry to track
soft-disconnect mode.
---
 drivers/usb/dwc2/core.h   |  3 ++-
 drivers/usb/dwc2/gadget.c | 39 ++++++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 6b197550c133..7a70a1349334 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -688,8 +688,9 @@ struct dwc2_hsotg {
 	u8 ctrl_buff[8];
 
 	struct usb_gadget gadget;
+	unsigned int enabled:1;
 	unsigned int connected:1;
-	unsigned int setup;
+	unsigned int setup:1;
 	unsigned long last_rst;
 	struct s3c_hsotg_ep *eps;
 #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE */
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index baba8a862826..1ecc5ac16244 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2889,6 +2889,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 	spin_lock_irqsave(&hsotg->lock, flags);
 	s3c_hsotg_init(hsotg);
 	s3c_hsotg_core_init_disconnected(hsotg);
+	hsotg->enabled = 0;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
@@ -2929,6 +2930,7 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget)
 
 	hsotg->driver = NULL;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+	hsotg->enabled = 0;
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
@@ -2972,9 +2974,11 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
 		clk_enable(hsotg->clk);
+		hsotg->enabled = 1;
 		s3c_hsotg_core_connect(hsotg);
 	} else {
 		s3c_hsotg_core_disconnect(hsotg);
+		hsotg->enabled = 0;
 		clk_disable(hsotg->clk);
 	}
 
@@ -3585,20 +3589,21 @@ int s3c_hsotg_suspend(struct dwc2_hsotg *hsotg)
 
 	mutex_lock(&hsotg->init_mutex);
 
-	if (hsotg->driver)
+	if (hsotg->driver) {
+		int ep;
+
 		dev_info(hsotg->dev, "suspending usb gadget %s\n",
 			 hsotg->driver->driver.name);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-	s3c_hsotg_core_disconnect(hsotg);
-	s3c_hsotg_disconnect(hsotg);
-	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+		spin_lock_irqsave(&hsotg->lock, flags);
+		if (hsotg->enabled)
+			s3c_hsotg_core_disconnect(hsotg);
+		s3c_hsotg_disconnect(hsotg);
+		hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+		spin_unlock_irqrestore(&hsotg->lock, flags);
 
-	s3c_hsotg_phy_disable(hsotg);
+		s3c_hsotg_phy_disable(hsotg);
 
-	if (hsotg->driver) {
-		int ep;
 		for (ep = 0; ep < hsotg->num_of_eps; ep++)
 			s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
 
@@ -3626,16 +3631,16 @@ int s3c_hsotg_resume(struct dwc2_hsotg *hsotg)
 
 		clk_enable(hsotg->clk);
 		ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-				      hsotg->supplies);
-	}
-
-	s3c_hsotg_phy_enable(hsotg);
+					    hsotg->supplies);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-	s3c_hsotg_core_init_disconnected(hsotg);
-	s3c_hsotg_core_connect(hsotg);
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+		s3c_hsotg_phy_enable(hsotg);
 
+		spin_lock_irqsave(&hsotg->lock, flags);
+		s3c_hsotg_core_init_disconnected(hsotg);
+		if (hsotg->enabled)
+			s3c_hsotg_core_connect(hsotg);
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+	}
 	mutex_unlock(&hsotg->init_mutex);
 
 	return ret;
-- 
1.9.2
