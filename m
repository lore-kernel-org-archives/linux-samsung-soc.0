From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 1/3] usb: dwc2/gadget: rework disconnect event handling
Date: Fri, 21 Nov 2014 15:14:47 +0100
Message-ID: <1416579289-31939-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15284 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbaKUOO6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 09:14:58 -0500
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
Acked-by: Paul Zimmerman <paulz@synopsys.com>
---
 drivers/usb/dwc2/core.h      |  3 +++
 drivers/usb/dwc2/core_intr.c |  9 +++++++++
 drivers/usb/dwc2/gadget.c    | 10 +++++++---
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 4710935fbad3..2cb0ac31ae86 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -687,6 +687,7 @@ struct dwc2_hsotg {
 	u8 ctrl_buff[8];
 
 	struct usb_gadget gadget;
+	unsigned int connected:1;
 	unsigned int setup;
 	unsigned long last_rst;
 	struct s3c_hsotg_ep *eps;
@@ -968,6 +969,7 @@ extern int s3c_hsotg_resume(struct dwc2_hsotg *dwc2);
 extern int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq);
 extern void s3c_hsotg_core_init_disconnected(struct dwc2_hsotg *dwc2);
 extern void s3c_hsotg_core_connect(struct dwc2_hsotg *hsotg);
+extern void s3c_hsotg_disconnect(struct dwc2_hsotg *dwc2);
 #else
 static inline int s3c_hsotg_remove(struct dwc2_hsotg *dwc2)
 { return 0; }
@@ -979,6 +981,7 @@ static inline int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 { return 0; }
 static inline void s3c_hsotg_core_init_disconnected(struct dwc2_hsotg *dwc2) {}
 static inline void s3c_hsotg_core_connect(struct dwc2_hsotg *hsotg) {}
+static inline void s3c_hsotg_disconnect(struct dwc2_hsotg *dwc2) {}
 #endif
 
 #if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index b176c2fc34e5..ad43c5bc1ef1 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -128,6 +128,9 @@ static void dwc2_handle_otg_intr(struct dwc2_hsotg *hsotg)
 			dwc2_op_state_str(hsotg));
 		gotgctl = readl(hsotg->regs + GOTGCTL);
 
+		if (dwc2_is_device_mode(hsotg))
+			s3c_hsotg_disconnect(hsotg);
+
 		if (hsotg->op_state == OTG_STATE_B_HOST) {
 			hsotg->op_state = OTG_STATE_B_PERIPHERAL;
 		} else {
@@ -314,6 +317,12 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
 
 	/* Clear interrupt */
 	writel(GINTSTS_SESSREQINT, hsotg->regs + GINTSTS);
+
+	/*
+	 * Report disconnect if there is any previous session established
+	 */
+	if (dwc2_is_device_mode(hsotg))
+		s3c_hsotg_disconnect(hsotg);
 }
 
 /*
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 685527b58bde..c0673ad4c4ad 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1030,7 +1030,6 @@ static int s3c_hsotg_process_req_feature(struct dwc2_hsotg *hsotg,
 }
 
 static void s3c_hsotg_enqueue_setup(struct dwc2_hsotg *hsotg);
-static void s3c_hsotg_disconnect(struct dwc2_hsotg *hsotg);
 
 /**
  * s3c_hsotg_stall_ep0 - stall ep0
@@ -1108,7 +1107,6 @@ static void s3c_hsotg_process_control(struct dwc2_hsotg *hsotg,
 	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
 		switch (ctrl->bRequest) {
 		case USB_REQ_SET_ADDRESS:
-			s3c_hsotg_disconnect(hsotg);
 			dcfg = readl(hsotg->regs + DCFG);
 			dcfg &= ~DCFG_DEVADDR_MASK;
 			dcfg |= (le16_to_cpu(ctrl->wValue) <<
@@ -2028,15 +2026,20 @@ static void kill_all_requests(struct dwc2_hsotg *hsotg,
  * transactions and signal the gadget driver that this
  * has happened.
  */
-static void s3c_hsotg_disconnect(struct dwc2_hsotg *hsotg)
+void s3c_hsotg_disconnect(struct dwc2_hsotg *hsotg)
 {
 	unsigned ep;
 
+	if (!hsotg->connected)
+		return;
+
+	hsotg->connected = 0;
 	for (ep = 0; ep < hsotg->num_of_eps; ep++)
 		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
 
 	call_gadget(hsotg, disconnect);
 }
+EXPORT_SYMBOL_GPL(s3c_hsotg_disconnect);
 
 /**
  * s3c_hsotg_irq_fifoempty - TX FIFO empty interrupt handler
@@ -2289,6 +2292,7 @@ irq_retry:
 		writel(GINTSTS_ENUMDONE, hsotg->regs + GINTSTS);
 
 		s3c_hsotg_irq_enumdone(hsotg);
+		hsotg->connected = 1;
 	}
 
 	if (gintsts & (GINTSTS_OEPINT | GINTSTS_IEPINT)) {
-- 
1.9.2
