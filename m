From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/9] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Thu, 16 Oct 2014 14:57:57 +0200
Message-ID: <1413464285-24172-2-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a call to s3c_hsotg_disconnect() from 'end session'
interrupt to correctly notify gadget subsystem about unplugged usb
cable.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
