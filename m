From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: exynos: Use ADC for Exynos4x12 on Exyno4412
Date: Tue, 12 Feb 2019 18:45:50 +0100
Message-ID: <20190212174550.4383-3-krzk@kernel.org>
References: <20190212174550.4383-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212174550.4383-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Exynos4412 should use "samsung,exynos4212-adc" compatible to report
proper number of (four) channels.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 26ad6ab3c6af..e5c041ec0756 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -274,7 +274,7 @@
 		};
 
 		adc: adc@126c0000 {
-			compatible = "samsung,exynos-adc-v1";
+			compatible = "samsung,exynos4212-adc";
 			reg = <0x126C0000 0x100>;
 			interrupt-parent = <&combiner>;
 			interrupts = <10 3>;
-- 
2.17.1
