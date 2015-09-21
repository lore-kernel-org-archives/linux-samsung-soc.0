From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 2/4] usb: dwc2: remove non-functional clock gating
Date: Mon, 21 Sep 2015 12:16:10 +0200
Message-ID: <1442830572-6765-3-git-send-email-m.szyprowski@samsung.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

During typical gadget operation, dwc2 clock was enabled 3 times: from
dwc2_gadget_init(), dwc2_hsotg_udc_start() and dwc2_hsotg_pullup(), and
then disabled in s3c_hsotg_pullup(), s3c_hsotg_udc_stop() and
dwc2_hsotg_remove(). This really makes no sense, so leave clock control
code only in dwc2_gadget_init/remove functions.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 410ea6e..3f656d9 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3068,8 +3068,6 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
 	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 
-	clk_enable(hsotg->clk);
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
 				    hsotg->supplies);
 	if (ret) {
@@ -3139,8 +3137,6 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 
 	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 
-	clk_disable(hsotg->clk);
-
 	mutex_unlock(&hsotg->init_mutex);
 
 	return 0;
@@ -3174,7 +3170,6 @@ static int dwc2_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	mutex_lock(&hsotg->init_mutex);
 	spin_lock_irqsave(&hsotg->lock, flags);
 	if (is_on) {
-		clk_enable(hsotg->clk);
 		hsotg->enabled = 1;
 		dwc2_hsotg_core_init_disconnected(hsotg, false);
 		dwc2_hsotg_core_connect(hsotg);
@@ -3182,7 +3177,6 @@ static int dwc2_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 		dwc2_hsotg_core_disconnect(hsotg);
 		dwc2_hsotg_disconnect(hsotg);
 		hsotg->enabled = 0;
-		clk_disable(hsotg->clk);
 	}
 
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-- 
1.9.2
