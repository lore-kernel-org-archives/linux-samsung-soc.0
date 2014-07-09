From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/4] usb: host: xhci-plat: Get PHYs for xhci's hcds
Date: Wed,  9 Jul 2014 15:31:34 +0530
Message-ID: <1404900096-1721-3-git-send-email-gautam.vivek@samsung.com>
References: <1404900096-1721-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404900096-1721-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pratyush.anand-qxv4g6HH51o@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The host controller by itself may sometimes need to handle PHY
and/or calibrate some of the PHY settings to get full support out
of the PHY controller. The PHY core provides a calibration
funtionality now to do so.
Therefore, facilitate getting the two possible PHYs, viz.
USB 2.0 type (UTMI+) and USB 3.0 type (PIPE3), provided
by the parent - Synopsys's DWC3 controller

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/xhci-plat.c |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 29d8adb..e50bd7d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 #include <linux/slab.h>
 
 #include "xhci.h"
@@ -101,6 +102,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct clk              *clk;
 	int			ret;
 	int			irq;
+	struct device		*parent;
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -165,6 +167,23 @@ static int xhci_plat_probe(struct platform_device *pdev)
 			goto unmap_registers;
 	}
 
+	parent = pdev->dev.parent;
+	/*
+	 * Get possile USB 2.0 type PHY (UTMI+) registered by xhci's parent:
+	 * Synopsys-dwc3
+	 */
+	if (of_device_is_compatible(parent->of_node, "synopsys,dwc3") ||
+	    of_device_is_compatible(parent->of_node, "snps,dwc3")) {
+		hcd->gen_phy = devm_phy_get(&pdev->dev, "usb2-phy");
+		if (IS_ERR(hcd->gen_phy)) {
+			ret = PTR_ERR(hcd->gen_phy);
+			if (ret != -ENOSYS && ret != -ENODEV) {
+				dev_err(&pdev->dev, "no usb2 phy configured\n");
+				return ret;
+			}
+		}
+	}
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_clk;
@@ -191,6 +210,23 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
+	/*
+	 * Get possile USB 3.0 type PHY (PIPE3) registered by xhci's parent:
+	 * Synopsys-dwc3
+	 */
+	if (of_device_is_compatible(parent->of_node, "synopsys,dwc3") ||
+	    of_device_is_compatible(parent->of_node, "snps,dwc3")) {
+		xhci->shared_hcd->gen_phy = devm_phy_get(&pdev->dev,
+							 "usb3-phy");
+		if (IS_ERR(xhci->shared_hcd->gen_phy)) {
+			ret = PTR_ERR(xhci->shared_hcd->gen_phy);
+			if (ret != -ENOSYS && ret != -ENODEV) {
+				dev_err(&pdev->dev, "no usb3 phy configured\n");
+				return ret;
+			}
+		}
+	}
+
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto put_usb3_hcd;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
