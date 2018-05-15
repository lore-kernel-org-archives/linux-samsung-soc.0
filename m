From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 1/2] USB: dwc3: get extcon device by OF graph bindings
Date: Tue, 15 May 2018 14:12:38 +0200
Message-ID: <20180515121239.18192-2-a.hajda@samsung.com>
References: <20180515121239.18192-1-a.hajda@samsung.com>
        <CGME20180515121251eucas1p290dce20660eb0008f6eeff30fc42443e@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180515121239.18192-1-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

extcon device is used to detect host/device connection. Since extcon
OF property is deprecated, alternative method should be added.
This method uses OF graph bindings to locate extcon.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/usb/dwc3/drd.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 1d8c557e97e0..270682486f82 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/extcon.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
 #include "debug.h"
@@ -439,17 +440,38 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
+{
+	struct device *dev = dwc->dev;
+	struct device_node *np_phy, *np_conn;
+	struct extcon_dev *edev;
+
+	if (of_property_read_bool(dev->of_node, "extcon"))
+		return extcon_get_edev_by_phandle(dwc->dev, 0);
+
+	np_phy = of_parse_phandle(dev->of_node, "phys", 0);
+	np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+
+	if (np_conn)
+		edev = extcon_find_edev_by_node(np_conn);
+	else
+		edev = NULL;
+
+	of_node_put(np_conn);
+	of_node_put(np_phy);
+
+	return edev;
+}
+
 int dwc3_drd_init(struct dwc3 *dwc)
 {
 	int ret, irq;
 
-	if (dwc->dev->of_node &&
-	    of_property_read_bool(dwc->dev->of_node, "extcon")) {
-		dwc->edev = extcon_get_edev_by_phandle(dwc->dev, 0);
-
-		if (IS_ERR(dwc->edev))
-			return PTR_ERR(dwc->edev);
+	dwc->edev = dwc3_get_extcon(dwc);
+	if (IS_ERR(dwc->edev))
+		return PTR_ERR(dwc->edev);
 
+	if (dwc->edev) {
 		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
 		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
 					       &dwc->edev_nb);
-- 
2.17.0
