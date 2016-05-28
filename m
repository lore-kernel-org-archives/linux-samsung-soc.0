From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 14/22] ARM: dts: exynos: MCT is not an interrupt controller and extend length of iomap
Date: Sat, 28 May 2016 11:54:25 +0200
Message-ID: <1464429273-23457-15-git-send-email-krzk@kernel.org>
References: <1464429273-23457-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464429273-23457-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Multi-Core Timer generates interrupts but it is not really an interrupt
controller so remove the "interrupt-controller" and "interrupt-cells"
properties. Additionally extend the length of mapped memory to cover all
registers (last SFR is at 0x0A40).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 4b16a9376a24..872dadf0f2d4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -263,9 +263,7 @@
 
 		mct: mct@101C0000 {
 			compatible = "samsung,exynos4210-mct";
-			reg = <0x101C0000 0x800>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
+			reg = <0x101C0000 0xB00>;
 			interrupt-parent = <&mct_map>;
 			interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
 					<8>, <9>, <10>, <11>;
-- 
2.7.4
