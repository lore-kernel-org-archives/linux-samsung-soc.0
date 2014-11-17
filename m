From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5] usb: dwc2/gadget: rework disconnect event handling
Date: Mon, 17 Nov 2014 09:59:42 +0100
Message-ID: <1416214782-13911-1-git-send-email-m.szyprowski@samsung.com>
References: <54699561.5040303@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34397 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464AbaKQI7n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 03:59:43 -0500
In-reply-to: <54699561.5040303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

This patch adds a call to s3c_hsotg_disconnect() from 'end session'
interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
about unplugged usb cable. DISCONNINT interrupt cannot be used for this
purpose, because it is asserted only in host mode.

To avoid reporting disconnect event more than once, a disconnect call has
been moved from USB_REQ_SET_ADDRESS handling function to SESSREQINT
interrupt. This way driver ensures that disconnect event is reported
either when usb cable is unplugged or every time the host starts a new
session. To handle devices which has been synthesized without
SRP support, connected state is set in ENUMDONE interrupt.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h   |  1 +
 drivers/usb/dwc2/gadget.c | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 55c90c53f2d6..e54c3c50cd48 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -210,6 +210,7 @@ struct s3c_hsotg {
 	u8                      ctrl_buff[8];
 
 	struct usb_gadget       gadget;
+	unsigned int		connected:1;
 	unsigned int            setup;
 	unsigned long           last_rst;
 	struct s3c_hsotg_ep     *eps;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index fcd2bb55ccca..89b1bea50ee3 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1029,7 +1029,6 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
 }
 
 static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg);
-static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg);
 
 /**
  * s3c_hsotg_stall_ep0 - stall ep0
@@ -1107,7 +1106,6 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
 		switch (ctrl->bRequest) {
 		case USB_REQ_SET_ADDRESS:
-			s3c_hsotg_disconnect(hsotg);
 			dcfg = readl(hsotg->regs + DCFG);
 			dcfg &= ~DCFG_DEVADDR_MASK;
 			dcfg |= (le16_to_cpu(ctrl->wValue) <<
@@ -2031,6 +2029,10 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
 {
 	unsigned ep;
 
+	if (!hsotg->connected)
+		return;
+
+	hsotg->connected = 0;
 	for (ep = 0; ep < hsotg->num_of_eps; ep++)
 		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
 
@@ -2290,17 +2292,27 @@ irq_retry:
 		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
 
 		writel(otgint, hsotg->regs + GOTGINT);
+
+		if (otgint & GOTGINT_SES_END_DET) {
+			s3c_hsotg_disconnect(hsotg);
+			hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+		}
 	}
 
 	if (gintsts & GINTSTS_SESSREQINT) {
 		dev_dbg(hsotg->dev, "%s: SessReqInt\n", __func__);
 		writel(GINTSTS_SESSREQINT, hsotg->regs + GINTSTS);
+		/*
+		 * Report disconnect if there is any previous session established
+		 */
+		s3c_hsotg_disconnect(hsotg);
 	}
 
 	if (gintsts & GINTSTS_ENUMDONE) {
 		writel(GINTSTS_ENUMDONE, hsotg->regs + GINTSTS);
 
 		s3c_hsotg_irq_enumdone(hsotg);
+		hsotg->connected = 1;
 	}
 
 	if (gintsts & GINTSTS_CONIDSTSCHNG) {
-- 
1.9.2
