From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 09/22] ARM: dts: exynos: Prepare for inclusion of exynos5.dtsi in exynos5410.dtsi
Date: Sat, 28 May 2016 11:54:20 +0200
Message-ID: <1464429273-23457-10-git-send-email-krzk@kernel.org>
References: <1464429273-23457-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464429273-23457-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add 'sromc' label to SROM memory controller in common exynos5.dtsi so it
can be referenced by inheriting DTSI.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index c5d198c70b86..30a0b63b06c9 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -35,7 +35,7 @@
 		reg = <0x10000000 0x100>;
 	};
 
-	memory-controller@12250000 {
+	sromc: memory-controller@12250000 {
 		compatible = "samsung,exynos4210-srom";
 		reg = <0x12250000 0x14>;
 	};
-- 
2.7.4
