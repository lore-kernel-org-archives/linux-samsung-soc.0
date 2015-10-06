From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 1/2] usb: dwc2: remove no longer needed init_mutex
Date: Tue, 06 Oct 2015 10:55:48 +0200
Message-ID: <1444121749-22494-1-git-send-email-m.szyprowski@samsung.com>
References: <874mi4gale.fsf@saruman.tx.rr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <874mi4gale.fsf@saruman.tx.rr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

init_mutex is a leftover from the time, when s3c-hsotg driver did not
implement proper pull up/down control and emulated it by enabling
enabling/disabling usb phy. Proper pull up/down control has been added
by commit 5b9451f8c4fbaf0549139755fb45ff2b57975b7f ("usb: dwc2: gadget:
use soft-disconnect udc feature in pullup() method"), so init_muxtex can
be removed now to avoid potential deadlocks with other locks.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h     |  1 -
 drivers/usb/dwc2/gadget.c   | 17 -----------------
 drivers/usb/dwc2/platform.c |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index ebf2504..89091db 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -712,7 +712,6 @@ struct dwc2_hsotg {
 	struct regulator_bulk_data supplies[ARRAY_SIZE(dwc2_hsotg_supply_names)];
 
 	spinlock_t lock;
-	struct mutex init_mutex;
 	void *priv;
 	int     irq;
 	struct clk *clk;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 7e5670c..79d9f3b 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3193,7 +3193,6 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
 		return -EINVAL;
 	}
 
-	mutex_lock(&hsotg->init_mutex);
 	WARN_ON(hsotg->driver);
 
 	driver->driver.bus = NULL;
@@ -3220,12 +3219,9 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
 
 	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
 
-	mutex_unlock(&hsotg->init_mutex);
-
 	return 0;
 
 err:
-	mutex_unlock(&hsotg->init_mutex);
 	hsotg->driver = NULL;
 	return ret;
 }
@@ -3246,8 +3242,6 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 	if (!hsotg)
 		return -ENODEV;
 
-	mutex_lock(&hsotg->init_mutex);
-
 	/* all endpoints should be shutdown */
 	for (ep = 1; ep < hsotg->num_of_eps; ep++) {
 		if (hsotg->eps_in[ep])
@@ -3270,8 +3264,6 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 
 	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 
-	mutex_unlock(&hsotg->init_mutex);
-
 	return 0;
 }
 
@@ -3307,7 +3299,6 @@ static int dwc2_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 		return 0;
 	}
 
-	mutex_lock(&hsotg->init_mutex);
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
 		hsotg->enabled = 1;
@@ -3321,7 +3312,6 @@ static int dwc2_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 	spin_unlock_irqrestore(&hsotg->lock, flags);
-	mutex_unlock(&hsotg->init_mutex);
 
 	return 0;
 }
@@ -3832,8 +3822,6 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
 	if (hsotg->lx_state != DWC2_L0)
 		return ret;
 
-	mutex_lock(&hsotg->init_mutex);
-
 	if (hsotg->driver) {
 		int ep;
 
@@ -3861,8 +3849,6 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
 		clk_disable(hsotg->clk);
 	}
 
-	mutex_unlock(&hsotg->init_mutex);
-
 	return ret;
 }
 
@@ -3874,8 +3860,6 @@ int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg)
 	if (hsotg->lx_state == DWC2_L2)
 		return ret;
 
-	mutex_lock(&hsotg->init_mutex);
-
 	if (hsotg->driver) {
 		dev_info(hsotg->dev, "resuming usb gadget %s\n",
 			 hsotg->driver->driver.name);
@@ -3892,7 +3876,6 @@ int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg)
 			dwc2_hsotg_core_connect(hsotg);
 		spin_unlock_irqrestore(&hsotg->lock, flags);
 	}
-	mutex_unlock(&hsotg->init_mutex);
 
 	return ret;
 }
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index b920e43..581e9ca 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -252,7 +252,6 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	}
 
 	spin_lock_init(&hsotg->lock);
-	mutex_init(&hsotg->init_mutex);
 
 	/* Detect config values from hardware */
 	retval = dwc2_get_hwparams(hsotg);
-- 
1.9.2
