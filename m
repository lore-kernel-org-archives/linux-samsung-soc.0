From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v3] arm64: dts: exynos: Remove unneeded unit names in Exynos5433 nodes
Date: Wed, 18 Jan 2017 12:50:13 -0300
Message-ID: <1484754613-2425-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:41788
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752628AbdARPuh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 10:50:37 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

The "samsung,exynos5433-mipi-video-phy" and "samsung,exynos5250-dwusb3"
DT bindings don't specify a reg property for these nodes, so having a
unit name leads to the following DTC warnings:

Node /soc/video-phy@105c0710 has a unit name, but no reg property
Node /soc/usb@15400000 has a unit name, but no reg property
Node /soc/usb@15a00000 has a unit name, but no reg property

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v3:
  - Use proper device node names, suggested by Krzysztof.

Changes in v2:
  - Fix subject line since I forgot the "exynos" prefix.

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 59788d89b686..57c7bbeb65a7 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -706,7 +706,7 @@
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 
-		mipi_phy: video-phy@105c0710 {
+		mipi_phy: video-phy {
 			compatible = "samsung,exynos5433-mipi-video-phy";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
@@ -1357,7 +1357,7 @@
 			status = "disabled";
 		};
 
-		usbdrd30: usb@15400000  {
+		usbdrd30: usbdrd {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				<&cmu_fsys CLK_SCLK_USBDRD30>;
@@ -1404,7 +1404,7 @@
 			status = "disabled";
 		};
 
-		usbhost30: usb@15a00000 {
+		usbhost30: usbhost {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				<&cmu_fsys CLK_SCLK_USBHOST30>;
-- 
2.7.4
