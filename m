From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 10/10] usb: dwc2/gadget: rework suspend/resume code to
 correctly restore gadget state
Date: Mon, 20 Oct 2014 12:45:40 +0200
Message-ID: <1413801940-31086-11-git-send-email-m.szyprowski@samsung.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1413801940-31086-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Suspend/resume code assumed that the gadget was always enabled and
connected to usb bus. This means that the actual state of the gadget
(soft-enabled/disabled or connected/disconnected) was not correctly
preserved on suspend/resume cycle. This patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc2/core.h   |  4 +++-
 drivers/usb/dwc2/gadget.c | 43 +++++++++++++++++++++++++++----------------
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index bf015ab3b44c..3648b76a18b4 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -210,7 +210,9 @@ struct s3c_hsotg {
 	u8                      ctrl_buff[8];
 
 	struct usb_gadget       gadget;
-	unsigned int            setup;
+	unsigned int            setup:1;
+	unsigned int		connected:1;
+	unsigned int		enabled:1;
 	unsigned long           last_rst;
 	struct s3c_hsotg_ep     *eps;
 };
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 0d34cfc71bfb..c6c6cf982c90 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2925,6 +2925,8 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 	spin_lock_irqsave(&hsotg->lock, flags);
 	s3c_hsotg_init(hsotg);
 	s3c_hsotg_core_init_disconnected(hsotg);
+	hsotg->enabled = 1;
+	hsotg->connected = 0;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
@@ -2961,6 +2963,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 
 	hsotg->driver = NULL;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+	hsotg->enabled = 0;
+	hsotg->connected = 0;
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
@@ -2999,11 +3003,14 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
 
 	spin_lock_irqsave(&hsotg->lock, flags);
+
 	if (is_on) {
 		clk_enable(hsotg->clk);
+		hsotg->connected = 1;
 		s3c_hsotg_core_connect(hsotg);
 	} else {
 		s3c_hsotg_core_disconnect(hsotg);
+		hsotg->connected = 0;
 		clk_disable(hsotg->clk);
 	}
 
@@ -3652,16 +3659,18 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
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
 
@@ -3679,21 +3688,23 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 	unsigned long flags;
 	int ret = 0;
 
-	if (hsotg->driver) {
+	if (hsotg->driver)
 		dev_info(hsotg->dev, "resuming usb gadget %s\n",
 			 hsotg->driver->driver.name);
 
+	if (hsotg->enabled) {
 		clk_enable(hsotg->clk);
 		ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-				      hsotg->supplies);
-	}
+					    hsotg->supplies);
 
-	s3c_hsotg_phy_enable(hsotg);
+		s3c_hsotg_phy_enable(hsotg);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-	s3c_hsotg_core_init_disconnected(hsotg);
-	s3c_hsotg_core_connect(hsotg);
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+		spin_lock_irqsave(&hsotg->lock, flags);
+		s3c_hsotg_core_init_disconnected(hsotg);
+		if (hsotg->connected)
+			s3c_hsotg_core_connect(hsotg);
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+	}
 
 	return ret;
 }
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
