From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2] ARM: dts: odroidxu3: Enable USB3 regulators
Date: Fri, 29 May 2015 23:04:29 +0930
Message-ID: <1432906469-3856-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35074 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755260AbbE2Neu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 09:34:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Enable regulator for usbdrd3_0 and usbdrd3_1.
Looking at the schematic pin diagram for MAX77802
USB3_0 and USB3_1 is regulated by LDO9 and LD011.

Fix the boot message of failed.
[    3.503539] exynos-dwc3 usb@12000000: Looking up vdd33-supply from device tree
[    3.503556] exynos-dwc3 usb@12000000: Looking up vdd33-supply property in node /usb@12000000 failed
[    3.503568] usb@12000000 supply vdd33 not found, using dummy regulator
[    3.509154] exynos-dwc3 usb@12000000: Looking up vdd10-supply from device tree
[    3.509170] exynos-dwc3 usb@12000000: Looking up vdd10-supply property in node /usb@12000000 failed
[    3.509181] usb@12000000 supply vdd10 not found, using dummy regulator
[    3.917548] exynos-dwc3 usb@12400000: Looking up vdd33-supply from device tree
[    3.917565] exynos-dwc3 usb@12400000: Looking up vdd33-supply property in node /usb@12400000 failed
[    3.917578] usb@12400000 supply vdd33 not found, using dummy regulator
[    3.922731] exynos-dwc3 usb@12400000: Looking up vdd10-supply from device tree
[    3.922747] exynos-dwc3 usb@12400000: Looking up vdd10-supply property in node /usb@12400000 failed

---
This patch is based on Krzysztof github branch work-next/odroid-xu3-s2mps11-irq.
v2 - Fixed the comment.
---

Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 27014bb..a353a58 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -513,3 +513,13 @@
 &usbdrd_dwc3_1 {
 	dr_mode = "otg";
 };
+
+&usbdrd3_0 {
+	vdd33-supply = <&ldo9_reg>;
+	vdd10-supply = <&ldo11_reg>;
+};
+
+&usbdrd3_1 {
+	vdd33-supply = <&ldo9_reg>;
+	vdd10-supply = <&ldo11_reg>;
+};
-- 
1.9.1
