From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 03/27] ARM: dts: exynos: Add fin_pll node for clock driver
Date: Tue, 10 May 2016 22:09:06 +0200
Message-ID: <1462910970-1812-4-git-send-email-krzk@kernel.org>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

For consistency between Exynos5410 and Exynos542x/5800 switch to similar
way of defining fin_pll/oscclk. Add a node early, before implementing
this in driver to preserve bisectability.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/boot/dts/exynos5410-smdk5410.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index 0f6429e1b75c..d7d658deeff4 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -31,6 +31,13 @@
 		#clock-cells = <0>;
 	};
 
+	fixed-rate-clocks {
+		oscclk {
+			compatible = "samsung,exynos5420-oscclk";
+			clock-frequency = <24000000>;
+		};
+	};
+
 	firmware@02037000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02037000 0x1000>;
-- 
2.5.0

