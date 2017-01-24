From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Tue, 24 Jan 2017 14:48:09 +0100
Message-ID: <20170124134809.23315-1-richard.genoud@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Huang Rui <ray.huang@amd.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Richard Genoud <richard.genoud@gmail.com>, stable@vger.kernel.org, #@vger.kernel.org, 4.4+@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Since commit 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores"),
the USB ports on odroid-XU4 don't work anymore.

Inserting an usb key (USB2.0) on the USB3.0 port result in:
[   64.488264] xhci-hcd xhci-hcd.2.auto: Port resume took longer than 20000 msec, port status = 0xc400fe3
[   74.568156] xhci-hcd xhci-hcd.2.auto: xHCI host not responding to stop endpoint command.
[   74.574806] xhci-hcd xhci-hcd.2.auto: Assuming host is dying, halting host.
[   74.601970] xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
[   74.606276] usb 3-1: USB disconnect, device number 2
[   74.613565] usb 4-1: USB disconnect, device number 2
[   74.621208] usb usb3-port1: couldn't allocate usb_device
NB: it's not related to USB2.0 devices, I get the same result with an USB3.0 device (SATA to USB3 for instance).
NB2: it doesn't happen on an odriod-XU3 board, that doesn't have the realtek RTL8153 chip.

If the lines:
	if (dwc->revision > DWC3_REVISION_194A)
		reg |= DWC3_GUSB3PIPECTL_SUSPHY;
are commented out, the USB3.0 start working.

For a full analyse: https://lkml.org/lkml/2017/1/18/678

Felipe suggested that suspend should be disabled temporarily while
what's wrong with DCW3 is figured out.

Tested on Odroid XU4

Suggested-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Tested-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Cc: stable@vger.kernel.org # 4.4+
Fixes: 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores")
---
 arch/arm/boot/dts/exynos5422-odroidxu4.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 2faf88627a48..f62dbd9b5ad3 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -43,6 +43,15 @@
 	status = "okay";
 };
 
+&usbdrd_dwc3_0 {
+	/*
+	 * without that, usb devices are not recognized when
+	 * they are plugged.
+	 * cf: https://lkml.org/lkml/2017/1/18/678
+	 */
+	snps,dis_u3_susphy_quirk;
+};
+
 &usbdrd_dwc3_1 {
 	dr_mode = "host";
 };
