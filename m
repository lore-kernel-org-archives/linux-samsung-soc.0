From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] usb: dwc2: rework initialization of host and gadget in
 dual-role mode
Date: Mon, 19 Jan 2015 15:44:36 +0100
Message-ID: <1421678676-31266-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

If device is configured to work only in HOST or DEVICE mode, there is
no point in initializing both subdrivers. This patch also fixes
resource leakage if host subdriver fails to initialize.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc2/core.h     |  2 ++
 drivers/usb/dwc2/platform.c | 29 +++++++++++++++++++++--------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 7a70a1349334..f93b06daef97 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -570,6 +570,8 @@ struct dwc2_hsotg {
 	struct dwc2_core_params *core_params;
 	enum usb_otg_state op_state;
 	enum usb_dr_mode dr_mode;
+	unsigned int hcd_enabled:1;
+	unsigned int gadget_enabled:1;
 
 	struct phy *phy;
 	struct usb_phy *uphy;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 6a795aa2ff05..ee0b0b06d0fc 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -121,8 +121,10 @@ static int dwc2_driver_remove(struct platform_device *dev)
 {
 	struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
 
-	dwc2_hcd_remove(hsotg);
-	s3c_hsotg_remove(hsotg);
+	if (hsotg->hcd_enabled)
+		dwc2_hcd_remove(hsotg);
+	if (hsotg->gadget_enabled)
+		s3c_hsotg_remove(hsotg);
 
 	return 0;
 }
@@ -214,12 +216,23 @@ static int dwc2_driver_probe(struct platform_device *dev)
 
 	spin_lock_init(&hsotg->lock);
 	mutex_init(&hsotg->init_mutex);
-	retval = dwc2_gadget_init(hsotg, irq);
-	if (retval)
-		return retval;
-	retval = dwc2_hcd_init(hsotg, irq, params);
-	if (retval)
-		return retval;
+
+	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
+		retval = dwc2_gadget_init(hsotg, irq);
+		if (retval)
+			return retval;
+		hsotg->gadget_enabled = 1;
+	}
+
+	if (hsotg->dr_mode != USB_DR_MODE_PERIPHERAL) {
+		retval = dwc2_hcd_init(hsotg, irq, params);
+		if (retval) {
+			if (hsotg->gadget_enabled)
+				s3c_hsotg_remove(hsotg);
+			return retval;
+		}
+		hsotg->hcd_enabled = 1;
+	}
 
 	platform_set_drvdata(dev, hsotg);
 
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
