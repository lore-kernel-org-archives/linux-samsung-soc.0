From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v2 1/7] ARM: dts: Add labels to Exynos5 nodes
Date: Fri, 17 Apr 2015 22:56:20 +0900
Message-ID: <1429278986-4374-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1429278986-4374-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429278986-4374-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add new labels to certain nodes so they could be easily referenced by
Exynos5 board DTS files.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5.dtsi    | 6 +++---
 arch/arm/boot/dts/exynos5440.dtsi | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 056251599c69..e0f00bde7b14 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -81,14 +81,14 @@
 		interrupts = <0 54 0>;
 	};
 
-	rtc@101E0000 {
+	rtc: rtc@101E0000 {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
 		interrupts = <0 43 0>, <0 44 0>;
 		status = "disabled";
 	};
 
-	fimd@14400000 {
+	fimd: fimd@14400000 {
 		compatible = "samsung,exynos5250-fimd";
 		interrupt-parent = <&combiner>;
 		reg = <0x14400000 0x40000>;
@@ -98,7 +98,7 @@
 		status = "disabled";
 	};
 
-	dp-controller@145B0000 {
+	dp: dp-controller@145B0000 {
 		compatible = "samsung,exynos5-dp";
 		reg = <0x145B0000 0x1000>;
 		interrupts = <10 3>;
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 59d9416b3b03..f18b51f2eeaa 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -279,7 +279,7 @@
 		clock-names = "usbhost";
 	};
 
-	pcie@290000 {
+	pcie_0: pcie@290000 {
 		compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
 		reg = <0x290000 0x1000
 			0x270000 0x1000
@@ -300,7 +300,7 @@
 		status = "disabled";
 	};
 
-	pcie@2a0000 {
+	pcie_1: pcie@2a0000 {
 		compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
 		reg = <0x2a0000 0x1000
 			0x272000 0x1000
-- 
2.1.0
