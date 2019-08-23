From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 9/9] ARM: dts: exynos: Remove not accurate secondary ADC compatible
Date: Fri, 23 Aug 2019 16:53:56 +0200
Message-ID: <20190823145356.6341-9-krzk@kernel.org>
References: <20190823145356.6341-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823145356.6341-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: notify@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos3250 ADC has its own compatible because of differences from
other Exynos SoCs.  Therefore it is not entirely compatible with
samsung,exynos-adc-v2.  Remove the samsung,exynos-adc-v2.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 5659c4a10729..784818490376 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -450,8 +450,7 @@
 		};
 
 		adc: adc@126c0000 {
-			compatible = "samsung,exynos3250-adc",
-				     "samsung,exynos-adc-v2";
+			compatible = "samsung,exynos3250-adc";
 			reg = <0x126C0000 0x100>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "adc", "sclk";
-- 
2.17.1
