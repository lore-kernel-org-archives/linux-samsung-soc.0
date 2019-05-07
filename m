From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] usb: core: verify devicetree nodes for disabled interfaces
Date: Tue, 07 May 2019 14:56:15 +0200
Message-ID: <20190507125615.9381-1-m.szyprowski@samsung.com>
References: <CGME20190507125630eucas1p1c5fd171a8dc2a6b8eb9dd317fe245f0c@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mans Rullgard <mans@mansr.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
add support for disabling given USB device interface by adding nodes to
the USB host controller device. The mentioned commit however identifies
the given USB interface node only by the 'reg' property in the host
controller children nodes and then checks for their the 'status'. The USB
device interface nodes however also has to have a 'compatible' property as
described in Documentation/devicetree/bindings/usb/usb-device.txt. This is
important, because USB host controller might have child-nodes for other
purposes. For example, Exynos EHCI and OHCI drivers already define
child-nodes for each physical root hub port and assigns respective PHY
controller and parameters for them. This conflicts with the proposed
approach and verifying for the presence of the compatible property fixes
this issue without changing the devicetree bindings and the way the PHY
controllers are handled by Exynos EHCI/OHCI drivers.

Reported-by: Markus Reichl <m.reichl@fivetechno.de>
Fixes: 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/core/message.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 82239f27c4cc..cd455c4add25 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2007,6 +2007,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		struct usb_interface *intf = cp->interface[i];
 
 		if (intf->dev.of_node &&
+		    of_device_is_compatible(intf->dev.of_node, NULL) &&
 		    !of_device_is_available(intf->dev.of_node)) {
 			dev_info(&dev->dev, "skipping disabled interface %d\n",
 				 intf->cur_altsetting->desc.bInterfaceNumber);
-- 
2.17.1
