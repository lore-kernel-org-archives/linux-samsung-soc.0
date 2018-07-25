From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] ARM: dts: exynos: Add compatible for s5m8767 clocks node on Itop Core
Date: Wed, 25 Jul 2018 17:55:17 +0200
Message-ID: <20180725155517.4872-4-krzk@kernel.org>
References: <20180725155517.4872-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725155517.4872-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The bindings for s2mps11/s5m8767 clocks driver require a compatible for
clocks node.  Parent MFD sec-core driver will also use it when
instantiating children.

The compatible is not needed for proper working because device will be
anyway created by parent MFD device.  Add it for correctness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
index ab7affab7f1c..8fdfd80c3acc 100644
--- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
@@ -446,6 +446,7 @@
 		};
 
 		s5m8767_osc: clocks {
+			compatible = "samsung,s5m8767-clk";
 			#clock-cells = <1>;
 			clock-output-names = "s5m8767_ap",
 					"s5m8767_cp", "s5m8767_bt";
-- 
2.14.1
