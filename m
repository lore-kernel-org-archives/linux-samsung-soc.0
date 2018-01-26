From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Update x and y properties for mms114
 touchscreen
Date: Fri, 26 Jan 2018 15:04:54 +0900
Message-ID: <20180126060454.18082-1-andi.shyti@samsung.com>
References: <CGME20180126060503epcas2p4befe2d3d43f4a2158b1e1a123bf7906f@epcas2p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Simon Shields <simon@lineageos.org>, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

The mms114 binding [1] specifies that the 'x' and 'y' should be
called respectively 'touchscreen-size-x' and 'touchscreen-size-y'
in coherence with the touchscreen [2] binding.

Update the mms114 node for trats2 and trats dts according to the
binding.

[1] Documentation/devicetree/bindings/input/touchscreen/mms114.txt
[2] Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
Hi Krzysztof,

this patch depends on Simon's patchset [1] and must be applied after
that. If you want I can ping you when the patch gets or you can take
it in the next cycle.

Andi

[1] https://marc.info/?l=linux-kernel&m=151682273403098&w=2

 arch/arm/boot/dts/exynos4210-trats.dts  | 4 ++--
 arch/arm/boot/dts/exynos4412-trats2.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 7b6ab7265110..fc71a493b5cb 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -261,8 +261,8 @@
 		reg = <0x48>;
 		interrupt-parent = <&gpx0>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-		x-size = <720>;
-		y-size = <1280>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
 		avdd-supply = <&tsp_reg>;
 		vdd-supply = <&tsp_reg>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 220cdf109405..1808c4951538 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -635,8 +635,8 @@
 		reg = <0x48>;
 		interrupt-parent = <&gpm2>;
 		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
-		x-size = <720>;
-		y-size = <1280>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
 		avdd-supply = <&ldo23_reg>;
 		vdd-supply = <&ldo24_reg>;
 	};
-- 
2.15.1
