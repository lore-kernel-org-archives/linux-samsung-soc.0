From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: dts: exynos4210-universal_c210: enable USB
 functionality
Date: Tue, 20 May 2014 14:46:59 +0200
Message-ID: <1400590021-15422-3-git-send-email-m.szyprowski@samsung.com>
References: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:21475 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752017AbaETMrJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 08:47:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5V008ACI6ETO00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 13:47:02 +0100 (BST)
In-reply-to: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds device tree nodes necessary to enable USB support on
universalc210 board, this includes UDC controller (USB gadget) as well
as EHCI and OHCI host ports. LDO3 and LDO8 regulators are switched to
always on mode until EHCI and OHCI drivers will support them correctly.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 9296dee10e26..0a32b396306c 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -68,6 +68,12 @@
 		enable-active-high;
 	};
 
+	hsotg@12480000 {
+		vusb_d-supply = <&ldo3_reg>;
+		vusb_a-supply = <&ldo8_reg>;
+		status = "okay";
+	};
+
 	sdhci_emmc: sdhci@12510000 {
 		bus-width = <8>;
 		non-removable;
@@ -77,6 +83,18 @@
 		status = "okay";
 	};
 
+	ehci@12580000 {
+		status = "okay";
+	};
+
+	ohci@12590000 {
+		status = "okay";
+	};
+
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
@@ -216,6 +234,7 @@
 					regulator-name = "VUSB+MIPI_1.1V";
 					regulator-min-microvolt = <1100000>;
 					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
 				};
 
 				ldo4_reg: LDO4 {
@@ -246,6 +265,7 @@
 					regulator-name = "VUSB+VDAC_3.3V";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
 				};
 
 				ldo9_reg: LDO9 {
-- 
1.9.2
