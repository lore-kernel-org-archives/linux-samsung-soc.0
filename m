From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 2/4] ARM: dts: exynos: Remove unneeded address/size cells from fixed-clock on Exynos3250
Date: Mon, 15 Apr 2019 20:05:08 +0200
Message-ID: <20190415180510.6044-2-krzk@kernel.org>
References: <20190415180510.6044-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415180510.6044-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

xusbxti fixed-clock should not have address/size cells because it does
not have any children.  This also fixes DTC W=1 warning:

    arch/arm/boot/dts/exynos3250.dtsi:112.21-139.5:
        Warning (simple_bus_reg): /soc/fixed-rate-clocks: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index af54b306204b..6e74e6815b01 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -115,8 +115,6 @@
 
 			xusbxti: clock@0 {
 				compatible = "fixed-clock";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <0>;
 				clock-frequency = <0>;
 				#clock-cells = <0>;
-- 
2.17.1
