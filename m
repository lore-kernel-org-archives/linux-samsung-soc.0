From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH RFC] usb: dwc3: Get PHY from platform specific dwc3 dt node.
Date: Thu, 31 Jan 2013 16:50:32 +0530
Message-ID: <1359631232-7107-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61394 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751695Ab3AaLNq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 06:13:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, kishon@ti.com

With device tree support in place for dwc3-core layer,
it gets PHY from "synopsis-dwc3" node.
Some controllers may not have separate memory maps and interrupts
for dwc3 core and platform glue layers. In such case only glue
layer's node will exist.
Moreover, SoCs having multiple dwc3 controllers will have multiple
PHYs, which eventually be added using usb_add_phy_dev(), and not
using usb_add_phy(). So each dwc3 controller won't be able to
get PHYs by simply calling devm_usb_get_phy() also.
In such cases, dwc3 should expect PHYs from its parent's node.
So, adding provision for getting PHY from platform specific
device tree node.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---

Based on 'usb-next'.

 drivers/usb/dwc3/core.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 9999094..75439c0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -423,6 +423,11 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (node) {
 		dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
 		dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 1);
+	} else if (dev->parent->of_node) {
+		dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev->parent,
+								"usb-phy", 0);
+		dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev->parent,
+								"usb-phy", 1);
 	} else {
 		dwc->usb2_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 		dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
-- 
1.7.6.5
