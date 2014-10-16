From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 6/9] usb: dwc2/gadget: decouple setting soft disconnect from
 s3c_hsotg_core_init
Date: Thu, 16 Oct 2014 14:58:02 +0200
Message-ID: <1413464285-24172-7-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch changes s3c_hsotg_core_init function to leave hardware in
soft disconnect mode, so the actual moment of coupling the hardware to
the usb bus can be later controlled by the driver in the more accurate
way. For this purpose, separate functions for enabling and disabling
soft disconnect mode have been added.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc2/gadget.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 1ba0682fb252..d039334967d7 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2124,7 +2124,7 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
  *
  * Issue a soft reset to the core, and await the core finishing it.
  */
-static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_core_init_disconnected(struct s3c_hsotg *hsotg)
 {
 	s3c_hsotg_corereset(hsotg);
 
@@ -2241,14 +2241,23 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 		readl(hsotg->regs + DOEPCTL0));
 
 	/* clear global NAKs */
-	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK,
+	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK | DCTL_SFTDISCON,
 	       hsotg->regs + DCTL);
 
 	/* must be at-least 3ms to allow bus to see disconnect */
 	mdelay(3);
 
 	hsotg->last_rst = jiffies;
+}
+
+static void s3c_hsotg_core_disconnect(struct s3c_hsotg *hsotg)
+{
+	/* set the soft-disconnect bit */
+	__orr32(hsotg->regs + DCTL, DCTL_SFTDISCON);
+}
 
+static void s3c_hsotg_core_connect(struct s3c_hsotg *hsotg)
+{
 	/* remove the soft-disconnect and let's go */
 	__bic32(hsotg->regs + DCTL, DCTL_SFTDISCON);
 }
@@ -2348,7 +2357,8 @@ irq_retry:
 				kill_all_requests(hsotg, &hsotg->eps[0],
 							  -ECONNRESET, true);
 
-				s3c_hsotg_core_init(hsotg);
+				s3c_hsotg_core_init_disconnected(hsotg);
+				s3c_hsotg_core_connect(hsotg);
 			}
 		}
 	}
@@ -2983,7 +2993,8 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 	if (is_on) {
 		s3c_hsotg_phy_enable(hsotg);
 		clk_enable(hsotg->clk);
-		s3c_hsotg_core_init(hsotg);
+		s3c_hsotg_core_init_disconnected(hsotg);
+		s3c_hsotg_core_connect(hsotg);
 	} else {
 		clk_disable(hsotg->clk);
 		s3c_hsotg_phy_disable(hsotg);
@@ -3670,7 +3681,8 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
 
 	spin_lock_irqsave(&hsotg->lock, flags);
 	s3c_hsotg_phy_enable(hsotg);
-	s3c_hsotg_core_init(hsotg);
+	s3c_hsotg_core_init_disconnect(hsotg);
+	s3c_hsotg_core_connect(hsotg);
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
 	return ret;
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
