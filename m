From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos 3250: add hsotg and usb2phy device nodes
Date: Mon, 07 Jul 2014 11:39:46 +0200
Message-ID: <1404725986-12377-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37157 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383AbaGGJj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 05:39:57 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8C00BZP5IEF080@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Jul 2014 10:39:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch adds device tree nodes required to enable support for USB
device controller.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changelog:
v2:
- removed phandle to syscon, because mode switch register is not needed for 3250.
---
 arch/arm/boot/dts/exynos3250.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index eb457620975b..64a0ef44325a 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -309,6 +309,27 @@
 			status = "disabled";
 		};
 
+		hsotg: hsotg@12480000 {
+			compatible = "samsung,s3c6400-hsotg";
+			reg = <0x12480000 0x20000>;
+			interrupts = <0 141 0>;
+			clocks = <&cmu CLK_USBOTG>;
+			clock-names = "otg";
+			phys = <&exynos_usbphy 0>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
+		exynos_usbphy: exynos-usbphy@125B0000 {
+			compatible = "samsung,exynos3250-usb2-phy";
+			reg = <0x125B0000 0x100>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
+			clocks = <&cmu CLK_USBOTG>, <&xusbxti>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		serial_0: serial@13800000 {
 			compatible = "samsung,exynos4210-uart";
 			reg = <0x13800000 0x100>;
-- 
1.9.2
