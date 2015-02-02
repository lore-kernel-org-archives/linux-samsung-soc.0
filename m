From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V7 RESEND 1/2] usb: host: xhci-plat: Get PHYs for xhci's hcds
Date: Mon, 02 Feb 2015 18:12:03 +0530
Message-ID: <1422880924-14212-2-git-send-email-gautam.vivek@samsung.com>
References: <1422880924-14212-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1422880924-14212-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

The host controller by itself may sometimes need to handle PHY
and re-initialize it to re-configure some of the PHY parameters
to get full support out of the PHY controller.
Therefore, facilitate getting the two possible PHYs, viz.
USB 2.0 type (UTMI+) and USB 3.0 type (PIPE3), and initialize them.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/xhci-plat.c |   74 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 08d402b..c478627 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 #include <linux/slab.h>
 #include <linux/usb/xhci_pdriver.h>
 
@@ -127,10 +128,41 @@ static int xhci_plat_probe(struct platform_device *pdev)
 			goto put_hcd;
 	}
 
+	/* Get possile USB 2.0 type PHY (UTMI+) available with xhci */
+	hcd->phy = devm_phy_get(&pdev->dev, "usb2-phy");
+	if (IS_ERR(hcd->phy)) {
+		ret = PTR_ERR(hcd->phy);
+		if (ret == -EPROBE_DEFER) {
+			goto disable_clk;
+		} else if (ret != -ENOSYS && ret != -ENODEV) {
+			hcd->phy = NULL;
+			dev_warn(&pdev->dev,
+				 "Error retrieving usb2 phy: %d\n", ret);
+		}
+	}
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_clk;
 
+	/*
+	 * Initialize and power-on USB 2.0 PHY
+	 * FIXME: Isn't this a hacky way of initializing the PHY again ?
+	 * xhci's parent would have already initialized the PHY, but we
+	 * wanna do it again.
+	 */
+	hcd->phy->init_count = 0;
+	ret = phy_init(hcd->phy);
+	if (ret)
+		goto dealloc_usb2_hcd;
+
+	hcd->phy->power_count = 0;
+	ret = phy_power_on(hcd->phy);
+	if (ret) {
+		phy_exit(hcd->phy);
+		goto dealloc_usb2_hcd;
+	}
+
 	device_wakeup_enable(hcd->self.controller);
 
 	/* USB 2.0 roothub is stored in the platform_device now. */
@@ -156,12 +188,41 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
+	/* Get possile USB 3.0 type PHY (PIPE3) available with xhci */
+	xhci->shared_hcd->phy = devm_phy_get(&pdev->dev, "usb3-phy");
+	if (IS_ERR(xhci->shared_hcd->phy)) {
+		ret = PTR_ERR(xhci->shared_hcd->phy);
+		if (ret == -EPROBE_DEFER) {
+			goto put_usb3_hcd;
+		} else if (ret != -ENOSYS && ret != -ENODEV) {
+			xhci->shared_hcd->phy = NULL;
+			dev_warn(&pdev->dev,
+				 "Error retrieving usb3 phy: %d\n", ret);
+		}
+	}
+
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto put_usb3_hcd;
 
+	/* Initialize and power-on USB 3.0 PHY */
+	xhci->shared_hcd->phy->init_count = 0;
+	ret = phy_init(xhci->shared_hcd->phy);
+	if (ret)
+		goto dealloc_usb3_hcd;
+
+	xhci->shared_hcd->phy->power_count = 0;
+	ret = phy_power_on(xhci->shared_hcd->phy);
+	if (ret) {
+		phy_exit(xhci->shared_hcd->phy);
+		goto dealloc_usb3_hcd;
+	}
+
 	return 0;
 
+dealloc_usb3_hcd:
+	usb_remove_hcd(xhci->shared_hcd);
+
 put_usb3_hcd:
 	usb_put_hcd(xhci->shared_hcd);
 
@@ -184,9 +245,15 @@ static int xhci_plat_remove(struct platform_device *dev)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct clk *clk = xhci->clk;
 
+	phy_power_off(xhci->shared_hcd->phy);
+	phy_exit(xhci->shared_hcd->phy);
+
 	usb_remove_hcd(xhci->shared_hcd);
 	usb_put_hcd(xhci->shared_hcd);
 
+	phy_power_off(hcd->phy);
+	phy_exit(hcd->phy);
+
 	usb_remove_hcd(hcd);
 	if (!IS_ERR(clk))
 		clk_disable_unprepare(clk);
@@ -202,6 +269,8 @@ static int xhci_plat_suspend(struct device *dev)
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 
+	phy_exit(hcd->phy);
+
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
@@ -217,6 +286,11 @@ static int xhci_plat_resume(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	int ret;
+
+	ret = phy_init(hcd->phy);
+	if (ret)
+		return ret;
 
 	return xhci_resume(xhci, 0);
 }
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
