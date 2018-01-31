From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] USB: dwc3: get extcon device by OF graph bindings
Date: Wed, 31 Jan 2018 16:57:17 +0100
Message-ID: <20180131155718.5237-2-a.hajda@samsung.com>
References: <20180131155718.5237-1-a.hajda@samsung.com>
        <CGME20180131155734eucas1p2b55ad1aab1d5086566dad7a79b25ccf3@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180131155718.5237-1-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

extcon device is used to detect host/device connection. Since extcon
OF property is deprecated, alternative method should be added.
This method uses OF graph bindings to locate extcon.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Hi all,

This patch implements alternative method to get extcon from DWC3.
The code works but is hacky, as DWC3 must traverse different DT nodes
to get extcon, in case of TM2 it is USB-PHY and MUIC, but other
platforms can have different paths.
I would be glad if it can be merged as is for now, but additional work
must be done to make it generic.
I guess on DT binding side it is OK. So the problem should be addressed
in the code.
My rough idea is to implement kind of extcon aliases/forwarder mechanism,
ie. USB-PHY will expect on its output remote port extcon, and it should register
extcon-forwarder pointing to this extcon. This way DWC3 can look for the extcon
on its PHY phandle, and it will receive via forwarding mechanism extcon
exposed by MUIC.
As I said this is rough idea for discussion, other propositions are welcome.

Regards
Andrzej
---
 drivers/usb/dwc3/drd.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index cc8ab9a8e9d2..eee2eca3d513 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/extcon.h>
+#include <linux/of_graph.h>
 
 #include "debug.h"
 #include "core.h"
@@ -38,24 +39,38 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
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
+	edev = extcon_get_edev_by_of_node(np_conn);
+	of_node_put(np_conn);
+	of_node_put(np_phy);
+
+	return edev;
+}
+
 int dwc3_drd_init(struct dwc3 *dwc)
 {
 	int ret;
 
-	if (dwc->dev->of_node) {
-		if (of_property_read_bool(dwc->dev->of_node, "extcon"))
-			dwc->edev = extcon_get_edev_by_phandle(dwc->dev, 0);
-
-		if (IS_ERR(dwc->edev))
-			return PTR_ERR(dwc->edev);
+	dwc->edev = dwc3_get_extcon(dwc);
+	if (IS_ERR(dwc->edev))
+		return PTR_ERR(dwc->edev);
 
-		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
-		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
-					       &dwc->edev_nb);
-		if (ret < 0) {
-			dev_err(dwc->dev, "couldn't register cable notifier\n");
-			return ret;
-		}
+	dwc->edev_nb.notifier_call = dwc3_drd_notifier;
+	ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
+				       &dwc->edev_nb);
+	if (ret < 0) {
+		dev_err(dwc->dev, "couldn't register cable notifier\n");
+		return ret;
 	}
 
 	dwc3_drd_update(dwc);
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
