From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:37 +0100
Message-ID: <E1Xq3dp-0006lG-3m@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51646 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755388AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From a65db71af962d8e135ca04d245c05f9e6622f3eb Mon Sep 17 00:00:00 2001
Message-Id: <a65db71af962d8e135ca04d245c05f9e6622f3eb.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sun, 9 Nov 2014 19:59:46 +0100
Subject: [PATCH 7/8] ARM/DTS/S3C64XX: add OHCI support
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

With this entry there is no more need to enable the S3C64xx SoC specific OHCI
adaption (USB_OHCI_HCD_S3C2410). Just enable the generic platform device
support (USB_OHCI_HCD_PLATFORM=Y) and you are done.

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 arch/arm/boot/dts/s3c64xx.dtsi | 15 +++++++++++++++
 drivers/usb/host/Kconfig       |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index 4ee518c..465a147 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -60,6 +60,21 @@
 			#interrupt-cells = <1>;
 		};
 
+		usbhost: usb-host@74300000 {
+			compatible = "samsung,s3c6400-ohci", "generic-ohci";
+			/* note:
+			 * - port 1 can be routed via OTG phy (not supported)
+			 * - port 2 will be routed via USB 1.1 transceiver
+			 */
+			reg = <0x74300000 0x100000>;
+			interrupts-extended = <&vic1 15>;
+			clock-names = "usb-host", "usb-s-host";
+			clocks = <&clocks HCLK_UHOST>, <&clocks SCLK_UHOST>;
+			phy-names = "usb";
+			phys = <&usbphy 1>;
+			status = "disabled";
+		};
+
 		usbphy: otgphy@ec100000 {
 			compatible = "samsung,s3c6400-usb2-phy";
 			reg = <0x7c100000 0x100000>;
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index a3ca137..2864d39 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -427,7 +427,7 @@ config USB_OHCI_HCD_STI
 
 config USB_OHCI_HCD_S3C2410
         tristate "OHCI support for Samsung S3C24xx/S3C64xx SoC series"
-        depends on USB_OHCI_HCD && (ARCH_S3C24XX || ARCH_S3C64XX)
+        depends on USB_OHCI_HCD && (ARCH_S3C24XX || (ARCH_S3C64XX && !OF))
         default y
         ---help---
           Enables support for the on-chip OHCI controller on
-- 
1.8.1
