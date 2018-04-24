From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/5] ARM: dts: exynos: Remove unnecessary address/size properties in Origen
Date: Tue, 24 Apr 2018 19:45:59 +0200
Message-ID: <20180424174602.3915-2-krzk@kernel.org>
References: <20180424174602.3915-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424174602.3915-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The children of gpio_keys node do not have reg/ranges properties so remove
address-cells and size-cells properties.  This fixes warnings for
Exynos4210 Origen:

    arch/arm/boot/dts/exynos4210-origen.dtb: Warning (avoid_unnecessary_addr_size):
        /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index aa7a96cecee1..a81714745820 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -52,8 +52,6 @@
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		up {
 			label = "Up";
-- 
2.14.1
