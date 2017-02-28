From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH V3] ARM: dts: exynos5440: support the phy-pcie node for pcie
Date: Tue, 28 Feb 2017 16:00:26 +0900
Message-ID: <20170228070026.8725-1-jh80.chung@samsung.com>
References: <CGME20170228070028epcas1p1dba363a5f02d2a6fd412679190f17139@epcas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46417 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbdB1HB0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Feb 2017 02:01:26 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, javier@osg.samsung.com, niyas.ahmed@samsung.com, alim.akhtar@samsung.com, pankaj.dubey@samsung.com, Jaehoon Chung <jh80.chung@samsung.com>

Add pcie-phy node for using phy-exynos-pcie.

There are some modifications.
1. Remove the configuration space values in "ranges" property.
- The getting configuration space from ranges is old way.
- Instead, It can be got from "config"

2. Use the reg-names as "elbi", "config".
- Can know the purpose of use with reg-names.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
Changelog on V3:
- Split from the patches relevant to pcie
- Modify the commit-message
- Keep the original comment in dt-file
- Send this patch after applying the other patches

Changelog on V2:
- Removes the child-node
- Fixes the typo
- Removes the unnecessary comments

 arch/arm/boot/dts/exynos5440.dtsi | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 2a2e570..a7165b5 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -290,11 +290,22 @@
 		clock-names = "usbhost";
 	};
 
+	pcie_phy0: pcie-phy@270000 {
+		#phy-cells = <0>;
+		compatible = "samsung,exynos5440-pcie-phy";
+		reg = <0x270000 0x1000>, <0x271000 0x40>;
+	};
+
+	pcie_phy1: pcie-phy@272000 {
+		#phy-cells = <0>;
+		compatible = "samsung,exynos5440-pcie-phy";
+		reg = <0x272000 0x1000>, <0x271040 0x40>;
+	};
+
 	pcie_0: pcie@290000 {
 		compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
-		reg = <0x290000 0x1000
-			0x270000 0x1000
-			0x271000 0x40>;
+		reg = <0x290000 0x1000>, <0x40000000 0x1000>;
+		reg-names = "elbi", "config";
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -303,8 +314,8 @@
 		#address-cells = <3>;
 		#size-cells = <2>;
 		device_type = "pci";
-		ranges = <0x00000800 0 0x40000000 0x40000000 0 0x00001000   /* configuration space */
-			  0x81000000 0 0	  0x40001000 0 0x00010000   /* downstream I/O */
+		phys = <&pcie_phy0>;
+		ranges = <0x81000000 0 0	  0x40001000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
@@ -315,9 +326,8 @@
 
 	pcie_1: pcie@2a0000 {
 		compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
-		reg = <0x2a0000 0x1000
-			0x272000 0x1000
-			0x271040 0x40>;
+		reg = <0x2a0000 0x1000>, <0x60000000 0x1000>;
+		reg-names = "elbi", "config";
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -326,8 +336,8 @@
 		#address-cells = <3>;
 		#size-cells = <2>;
 		device_type = "pci";
-		ranges = <0x00000800 0 0x60000000 0x60000000 0 0x00001000   /* configuration space */
-			  0x81000000 0 0	  0x60001000 0 0x00010000   /* downstream I/O */
+		phys = <&pcie_phy1>;
+		ranges = <0x81000000 0 0	  0x60001000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
-- 
2.10.2
