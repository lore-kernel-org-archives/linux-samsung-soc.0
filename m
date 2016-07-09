From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 3/3] ARM: dts: exynos: correct the rtc compatible value for exynos5
Date: Sat,  9 Jul 2016 17:23:46 +0800
Message-ID: <1468056226-19128-4-git-send-email-ayaka@soulik.info>
References: <1468056226-19128-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468056226-19128-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: k.kozlowski@samsung.com
Cc: alexandre.belloni@free-electrons.com, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Randy Li <ayaka@soulik.info>
List-Id: linux-samsung-soc@vger.kernel.org

Those platforms are reported to use the same rtc IP core
as exynos3250's.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 arch/arm/boot/dts/exynos5.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 62f3dcd..cdd69a0 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -208,7 +208,7 @@
 		};
 
 		rtc: rtc@10070000 {
-			compatible = "samsung,s3c6410-rtc";
+			compatible = "samsung,exynos3250-rtc";
 			reg = <0x10070000 0x100>;
 			interrupts = <0 73 0>, <0 74 0>;
 			interrupt-parent = <&pmu_system_controller>;
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index d5c0f18..71a1ad2 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -88,7 +88,7 @@
 	};
 
 	rtc: rtc@101E0000 {
-		compatible = "samsung,s3c6410-rtc";
+		compatible = "samsung,exynos3250-rtc";
 		reg = <0x101E0000 0x100>;
 		interrupts = <0 43 0>, <0 44 0>;
 		status = "disabled";
-- 
2.7.4
