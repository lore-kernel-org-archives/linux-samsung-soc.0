From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/4] ARM: dts: exynos4210-universal_c210: enable USB
 functionality
Date: Thu, 22 May 2014 07:52:15 +0200
Message-ID: <1400737937-7368-3-git-send-email-m.szyprowski@samsung.com>
References: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30721 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbaEVFwz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:52:55 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5Y005E7OBEZN70@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 06:52:26 +0100 (BST)
In-reply-to: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds device tree nodes necessary to enable USB support on
universalc210 board, this includes UDC controller (USB gadget) as well
as EHCI and OHCI host ports. LDO3 and LDO8 regulators are switched to
always on mode until EHCI and OHCI drivers will support them correctly.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 9296dee10e26..5f90aeda74ad 100644
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
@@ -77,6 +83,24 @@
 		status = "okay";
 	};
 
+	ehci@12580000 {
+		status = "okay";
+		port@0 {
+			status = "okay";
+		};
+	};
+
+	ohci@12590000 {
+		status = "okay";
+		port@0 {
+			status = "okay";
+		};
+	};
+
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
@@ -216,6 +240,7 @@
 					regulator-name = "VUSB+MIPI_1.1V";
 					regulator-min-microvolt = <1100000>;
 					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
 				};
 
 				ldo4_reg: LDO4 {
@@ -246,6 +271,7 @@
 					regulator-name = "VUSB+VDAC_3.3V";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
 				};
 
 				ldo9_reg: LDO9 {
-- 
1.9.2
