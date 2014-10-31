From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 2/2] usb: dwc2/gadget: rework suspend/resume code to
 correctly restore gadget state
Date: Fri, 31 Oct 2014 11:12:34 +0100
Message-ID: <1414750354-19571-2-git-send-email-m.szyprowski@samsung.com>
References: <54535F82.7020406@samsung.com>
 <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48051 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757442AbaJaKMv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 06:12:51 -0400
In-reply-to: <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

Suspend/resume code assumed that the gadget was always enabled and
connected to usb bus. This means that the actual state of the gadget
(soft-enabled/disabled or connected/disconnected) was not correctly
preserved on suspend/resume cycle. This patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h   |  4 +++-
 drivers/usb/dwc2/gadget.c | 41 +++++++++++++++++++++++++----------------
 2 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 58732a9a0019..a1aa9ecf052e 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -211,7 +211,9 @@ struct s3c_hsotg {
 	u8                      ctrl_buff[8];
 
 	struct usb_gadget       gadget;
-	unsigned int            setup;
+	unsigned int            setup:1;
+	unsigned int		connected:1;
+	unsigned int		enabled:1;
 	unsigned long           last_rst;
 	unsigned int		address;
 	struct s3c_hsotg_ep     *eps;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index a2e4272a904e..e61bb1c4275d 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2931,6 +2931,8 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 	spin_lock_irqsave(&hsotg->lock, flags);
 	s3c_hsotg_init(hsotg);
 	s3c_hsotg_core_init_disconnected(hsotg);
+	hsotg->enabled = 1;
+	hsotg->connected = 0;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
@@ -2972,6 +2974,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 
 	hsotg->driver = NULL;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+	hsotg->enabled = 0;
+	hsotg->connected = 0;
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
@@ -3015,9 +3019,11 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
 		clk_enable(hsotg->clk);
+		hsotg->connected = 1;
 		s3c_hsotg_core_connect(hsotg);
 	} else {
 		s3c_hsotg_core_disconnect(hsotg);
+		hsotg->connected = 0;
 		clk_disable(hsotg->clk);
 	}
 
@@ -3670,16 +3676,18 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
 		dev_info(hsotg->dev, "suspending usb gadget %s\n",
 			 hsotg->driver->driver.name);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-	s3c_hsotg_core_disconnect(hsotg);
-	s3c_hsotg_disconnect(hsotg);
-	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+	if (hsotg->enabled) {
+		int ep;
 
-	s3c_hsotg_phy_disable(hsotg);
+		spin_lock_irqsave(&hsotg->lock, flags);
+		if (hsotg->connected)
+			s3c_hsotg_core_disconnect(hsotg);
+		s3c_hsotg_disconnect(hsotg);
+		hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+
+		s3c_hsotg_phy_disable(hsotg);
 
-	if (hsotg->driver) {
-		int ep;
 		for (ep = 0; ep < hsotg->num_of_eps; ep++)
 			s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
 
@@ -3705,18 +3713,19 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 		dev_info(hsotg->dev, "resuming usb gadget %s\n",
 			 hsotg->driver->driver.name);
 
+	if (hsotg->enabled) {
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
+		if (hsotg->connected)
+			s3c_hsotg_core_connect(hsotg);
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+	}
 	mutex_unlock(&hsotg->init_mutex);
 
 	return ret;
-- 
1.9.2
