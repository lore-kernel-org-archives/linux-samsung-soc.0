From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 2/3] usb: dwc2/gadget: add mutex to serialize init/deinit
 calls
Date: Fri, 21 Nov 2014 15:14:48 +0100
Message-ID: <1416579289-31939-2-git-send-email-m.szyprowski@samsung.com>
References: <1416579289-31939-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1416579289-31939-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds mutex, which protects initialization and
deinitialization procedures against suspend/resume methods. This mutex
will be needed by the updated suspend/resume calls, which tracks gadget
state.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/dwc2/core.h     |  1 +
 drivers/usb/dwc2/gadget.c   | 19 +++++++++++++++++++
 drivers/usb/dwc2/platform.c |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 2cb0ac31ae86..6b197550c133 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -576,6 +576,7 @@ struct dwc2_hsotg {
 	struct regulator_bulk_data supplies[ARRAY_SIZE(s3c_hsotg_supply_names)];
 
 	spinlock_t lock;
+	struct mutex init_mutex;
 	void *priv;
 	int     irq;
 	struct clk *clk;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c0673ad4c4ad..baba8a862826 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
+#include <linux/mutex.h>
 #include <linux/seq_file.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -2866,6 +2867,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 		return -EINVAL;
 	}
 
+	mutex_lock(&hsotg->init_mutex);
 	WARN_ON(hsotg->driver);
 
 	driver->driver.bus = NULL;
@@ -2891,9 +2893,12 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return 0;
 
 err:
+	mutex_unlock(&hsotg->init_mutex);
 	hsotg->driver = NULL;
 	return ret;
 }
@@ -2914,6 +2919,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget)
 	if (!hsotg)
 		return -ENODEV;
 
+	mutex_lock(&hsotg->init_mutex);
+
 	/* all endpoints should be shutdown */
 	for (ep = 1; ep < hsotg->num_of_eps; ep++)
 		s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
@@ -2931,6 +2938,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget)
 
 	clk_disable(hsotg->clk);
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return 0;
 }
 
@@ -2959,6 +2968,7 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 
 	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
 
+	mutex_lock(&hsotg->init_mutex);
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
 		clk_enable(hsotg->clk);
@@ -2970,6 +2980,7 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
+	mutex_unlock(&hsotg->init_mutex);
 
 	return 0;
 }
@@ -3572,6 +3583,8 @@ int s3c_hsotg_suspend(struct dwc2_hsotg *hsotg)
 	unsigned long flags;
 	int ret = 0;
 
+	mutex_lock(&hsotg->init_mutex);
+
 	if (hsotg->driver)
 		dev_info(hsotg->dev, "suspending usb gadget %s\n",
 			 hsotg->driver->driver.name);
@@ -3594,6 +3607,8 @@ int s3c_hsotg_suspend(struct dwc2_hsotg *hsotg)
 		clk_disable(hsotg->clk);
 	}
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(s3c_hsotg_suspend);
@@ -3603,6 +3618,8 @@ int s3c_hsotg_resume(struct dwc2_hsotg *hsotg)
 	unsigned long flags;
 	int ret = 0;
 
+	mutex_lock(&hsotg->init_mutex);
+
 	if (hsotg->driver) {
 		dev_info(hsotg->dev, "resuming usb gadget %s\n",
 			 hsotg->driver->driver.name);
@@ -3619,6 +3636,8 @@ int s3c_hsotg_resume(struct dwc2_hsotg *hsotg)
 	s3c_hsotg_core_connect(hsotg);
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(s3c_hsotg_resume);
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 57eb8a3e022b..ec5658ac52ba 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -40,6 +40,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_device.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 
 #include <linux/usb/of.h>
@@ -212,6 +213,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	hsotg->dr_mode = of_usb_get_dr_mode(dev->dev.of_node);
 
 	spin_lock_init(&hsotg->lock);
+	mutex_init(&hsotg->init_mutex);
 	retval = dwc2_gadget_init(hsotg, irq);
 	if (retval)
 		return retval;
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
