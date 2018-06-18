From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] arm64: dts: exynos: Remove leading 0x from unit addresses in Exynos5433
Date: Mon, 18 Jun 2018 19:42:15 +0200
Message-ID: <20180618174216.24801-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Remove leading 0x from recently introduced unit addresses to fix DTC
warnings:

    Warning (unit_address_format): /soc/sysmmu@0x15040000: unit name should not have leading "0x"

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 038c99792ccb..3a9b4c4b9c63 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1171,7 +1171,7 @@
 			power-domains = <&pd_gscl>;
 		};
 
-		sysmmu_scaler_0: sysmmu@0x15040000 {
+		sysmmu_scaler_0: sysmmu@15040000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15040000 0x1000>;
 			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
@@ -1182,7 +1182,7 @@
 			power-domains = <&pd_mscl>;
 		};
 
-		sysmmu_scaler_1: sysmmu@0x15050000 {
+		sysmmu_scaler_1: sysmmu@15050000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15050000 0x1000>;
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.14.1
