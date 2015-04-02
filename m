From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 4/6] arm64: dts: exynos: Add PWM dt node and pinctrl for
 Exynos5433 SoC
Date: Thu, 02 Apr 2015 17:34:35 +0900
Message-ID: <1427963677-32661-5-git-send-email-cw00.choi@samsung.com>
References: <1427963677-32661-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52490 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752436AbbDBIet (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 04:34:49 -0400
In-reply-to: <1427963677-32661-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, jaewon02.kim@samsung.com, beomho.seo@samsung.com, jy0922.shim@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Jaewon Kim <jaewon02.kim@samsung.com>

This patch adds PWM(Pulsle Width Modulation) device tree node
to support for PWM Timer on Exynos5433 SoC.

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 28 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 12 ++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
index c56bbf8..49be038 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
@@ -581,6 +581,34 @@
 		samsung,pin-drv = <0>;
 	};
 
+	pwm0_out: pwm0-out {
+		samsung,pins = "gpd2-4";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	pwm1_out: pwm1-out {
+		samsung,pins = "gpd2-5";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	pwm2_out: pwm2-out {
+		samsung,pins = "gpd2-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	pwm3_out: pwm3-out {
+		samsung,pins = "gpd2-7";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	spi1_bus: spi1-bus {
 		samsung,pins = "gpd6-2", "gpd6-4", "gpd6-5";
 		samsung,pin-function = <2>;
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9cca236..baeec299 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1052,6 +1052,18 @@
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
+
+		pwm: pwm@14dd0000 {
+			compatible = "samsung,exynos4210-pwm";
+			reg = <0x14dd0000 0x100>;
+			interrupts = <0 416 0>, <0 417 0>,
+				     <0 418 0>, <0 419 0>, <0 420 0>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+			clocks = <&cmu_peric CLK_PCLK_PWM>;
+			clock-names = "timers";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
1.8.5.5
