From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 01/10] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Mon, 20 Oct 2014 12:45:31 +0200
Message-ID: <1413801940-31086-2-git-send-email-m.szyprowski@samsung.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16259 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753245AbaJTKpv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 06:45:51 -0400
In-reply-to: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

This patch adds a call to s3c_hsotg_disconnect() from 'end session'
interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
about unplugged usb cable. 'disconnected' interrupt (DISCONNINT) might
look a bit more suitable for this event, but it is asserted only in
host mode, so in device mode we need to use something else.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 7b5856fadd93..119c8a3effc2 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2279,6 +2279,12 @@ irq_retry:
 		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
 
 		writel(otgint, hsotg->regs + GOTGINT);
+
+		if (otgint & GOTGINT_SES_END_DET) {
+			if (hsotg->gadget.speed != USB_SPEED_UNKNOWN)
+				s3c_hsotg_disconnect(hsotg);
+			hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+		}
 	}
 
 	if (gintsts & GINTSTS_SESSREQINT) {
-- 
1.9.2
