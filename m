From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] ARM: dts: exynos5: add missing interrupts for pwm node
Date: Wed, 18 Jul 2018 09:34:50 +0000
Message-ID: <1531906490-1739-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing GIC interrupts property for pwm nodes.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 5d2f0a0..9406108 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -169,6 +169,11 @@
 		pwm: pwm@12dd0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x12DD0000 0x100>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 		};
-- 
2.7.4
