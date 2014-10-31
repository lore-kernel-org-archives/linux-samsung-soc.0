From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/2] usb: dwc2/gadget: add mutex to serialize init/deinit
 calls
Date: Fri, 31 Oct 2014 11:12:33 +0100
Message-ID: <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
References: <54535F82.7020406@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43953 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756230AbaJaKMq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 06:12:46 -0400
In-reply-to: <54535F82.7020406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

This patch adds mutex, which protects initialization and
deinitialization procedures against suspend/resume methods.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h   |  1 +
 drivers/usb/dwc2/gadget.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 9f77b4d1c5ff..58732a9a0019 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -187,6 +187,7 @@ struct s3c_hsotg {
 	struct s3c_hsotg_plat    *plat;
 
 	spinlock_t              lock;
+	struct mutex		init_mutex;
 
 	void __iomem            *regs;
 	int                     irq;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index d8dda39c9e16..a2e4272a904e 100644
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
@@ -2908,6 +2909,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 		return -EINVAL;
 	}
 
+	mutex_lock(&hsotg->init_mutex);
 	WARN_ON(hsotg->driver);
 
 	driver->driver.bus = NULL;
@@ -2933,9 +2935,12 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return 0;
 
 err:
+	mutex_unlock(&hsotg->init_mutex);
 	hsotg->driver = NULL;
 	return ret;
 }
@@ -2957,6 +2962,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 	if (!hsotg)
 		return -ENODEV;
 
+	mutex_lock(&hsotg->init_mutex);
+
 	/* all endpoints should be shutdown */
 	for (ep = 1; ep < hsotg->num_of_eps; ep++)
 		s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
@@ -2974,6 +2981,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 
 	clk_disable(hsotg->clk);
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return 0;
 }
 
@@ -3002,6 +3011,7 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 
 	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
 
+	mutex_lock(&hsotg->init_mutex);
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
 		clk_enable(hsotg->clk);
@@ -3013,6 +3023,7 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
+	mutex_unlock(&hsotg->init_mutex);
 
 	return 0;
 }
@@ -3507,6 +3518,7 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 	}
 
 	spin_lock_init(&hsotg->lock);
+	mutex_init(&hsotg->init_mutex);
 
 	hsotg->irq = ret;
 
@@ -3652,6 +3664,8 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
 	unsigned long flags;
 	int ret = 0;
 
+	mutex_lock(&hsotg->init_mutex);
+
 	if (hsotg->driver)
 		dev_info(hsotg->dev, "suspending usb gadget %s\n",
 			 hsotg->driver->driver.name);
@@ -3674,6 +3688,8 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
 		clk_disable(hsotg->clk);
 	}
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return ret;
 }
 
@@ -3683,7 +3699,9 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 	unsigned long flags;
 	int ret = 0;
 
+	mutex_lock(&hsotg->init_mutex);
 	if (hsotg->driver) {
+
 		dev_info(hsotg->dev, "resuming usb gadget %s\n",
 			 hsotg->driver->driver.name);
 
@@ -3699,6 +3717,8 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 	s3c_hsotg_core_connect(hsotg);
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
+	mutex_unlock(&hsotg->init_mutex);
+
 	return ret;
 }
 
-- 
1.9.2
