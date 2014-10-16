From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 8/9] usb: dwc2/gadget: fix calls to phy control functions in
 suspend/resume code
Date: Thu, 16 Oct 2014 14:58:04 +0200
Message-ID: <1413464285-24172-9-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch moves calls to phy enable/disable out of spinlock protected
blocks in device suspend/resume to fix incorrect caller context. Phy
related functions must not be called from atomic context.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc2/gadget.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index cdf417a7ae63..052b1a857291 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3656,11 +3656,13 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
 			 hsotg->driver->driver.name);
 
 	spin_lock_irqsave(&hsotg->lock, flags);
+	s3c_hsotg_core_disconnect(hsotg);
 	s3c_hsotg_disconnect(hsotg);
-	s3c_hsotg_phy_disable(hsotg);
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
+	s3c_hsotg_phy_disable(hsotg);
+
 	if (hsotg->driver) {
 		int ep;
 		for (ep = 0; ep < hsotg->num_of_eps; ep++)
@@ -3689,9 +3691,10 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 				      hsotg->supplies);
 	}
 
-	spin_lock_irqsave(&hsotg->lock, flags);
 	s3c_hsotg_phy_enable(hsotg);
-	s3c_hsotg_core_init_disconnect(hsotg);
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+	s3c_hsotg_core_init_disconnected(hsotg);
 	s3c_hsotg_core_connect(hsotg);
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
