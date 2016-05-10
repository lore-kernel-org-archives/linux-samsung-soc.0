From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 11/27] ARM: dts: exynos: Configure Exynos5410 pinctrl for eMMC and SD card
Date: Tue, 10 May 2016 22:09:14 +0200
Message-ID: <1462910970-1812-12-git-send-email-krzk@kernel.org>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Configure the pinctrl for MMC0 (eMMC) and MMC2 (microSD card).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Important changes since v2:
1. Re-order the eMMC pins by pin-name, not by label.
---
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
index f9aa6bb55464..ddacafa1e907 100644
--- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -277,6 +277,83 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
+	sd0_clk: sd0-clk {
+		samsung,pins = "gpc0-0";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_cmd: sd0-cmd {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_cd: sd0-cd {
+		samsung,pins = "gpc0-2";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_bus1: sd0-bus-width1 {
+		samsung,pins = "gpc0-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_bus4: sd0-bus-width4 {
+		samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_clk: sd2-clk {
+		samsung,pins = "gpc2-0";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_cmd: sd2-cmd {
+		samsung,pins = "gpc2-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_cd: sd2-cd {
+		samsung,pins = "gpc2-2";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_bus1: sd2-bus-width1 {
+		samsung,pins = "gpc2-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd2_bus4: sd2-bus-width4 {
+		samsung,pins = "gpc2-4", "gpc2-5", "gpc2-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
+
+	sd0_bus8: sd0-bus-width8 {
+		samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <3>;
+	};
 };
 
 &pinctrl_1 {
-- 
2.5.0
