From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynos: Remove unneeded unit names in Exynos5433 nodes
Date: Tue, 10 Jan 2017 14:38:32 -0300
Message-ID: <1484069912-6534-4-git-send-email-javier@osg.samsung.com>
References: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The "samsung,exynos5433-mipi-video-phy" and "samsung,exynos5250-dwusb3"
DT bindings don't specify a reg property for these nodes, so having a
unit name leads to the following DTC warnings:

Node /soc/video-phy@105c0710 has a unit name, but no reg property
Node /soc/usb@15400000 has a unit name, but no reg property
Node /soc/usb@15a00000 has a unit name, but no reg property

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 3695ddaf2e04..17e5dafd392c 100644
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
@@ -1285,7 +1285,7 @@
 			status = "disabled";
 		};
 
-		usbdrd30: usb@15400000  {
+		usbdrd30: usb-0  {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				<&cmu_fsys CLK_SCLK_USBDRD30>;
@@ -1332,7 +1332,7 @@
 			status = "disabled";
 		};
 
-		usbhost30: usb@15a00000 {
+		usbhost30: usb-1 {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				<&cmu_fsys CLK_SCLK_USBHOST30>;
-- 
2.7.4
