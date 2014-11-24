From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH V2 2/2] arm64: exynos: Add bus1 pinctrl node on exynos7
Date: Mon, 24 Nov 2014 18:36:21 +0530
Message-ID: <1416834381-11314-1-git-send-email-gautam.vivek@samsung.com>
References: <CAGOxZ53TUvZhSDLfeCuyvBwVcrkQhFnftQzk1DbkU_krdoFbZA@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAGOxZ53TUvZhSDLfeCuyvBwVcrkQhFnftQzk1DbkU_krdoFbZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, robh+dt@kernel.org, linus.walleij@linaro.org, kgene@kernel.org, alim.akhtar@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

BUS1 pinctrl provides gpios for usb and power regulator
available on exynos7-espresso board. So add relevant device
node for pinctrl-bus1.

Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---

This patch was part of series:
"[PATCH 00/11] Exynos7: Adding USB 3.0 support"
 https://lkml.org/lkml/2014/11/21/247

Changes since V1:
 - Added support for all pin banks which are part of BUS1 pin controller.

 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi |   82 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         |    7 ++
 2 files changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
index 2eef4a2..c367f0a 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
@@ -335,6 +335,88 @@
 	};
 };
 
+&pinctrl_bus1 {
+	gpf0: gpf0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf5: gpf5 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg1: gpg1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg2: gpg2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph1: gph1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpv6: gpv6 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
 &pinctrl_nfc {
 	gpj0: gpj0 {
 		gpio-controller;
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 1d9e4c9..e633b02 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -26,6 +26,7 @@
 		pinctrl5 = &pinctrl_ese;
 		pinctrl6 = &pinctrl_fsys0;
 		pinctrl7 = &pinctrl_fsys1;
+		pinctrl8 = &pinctrl_bus1;
 	};
 
 	cpus {
@@ -242,6 +243,12 @@
 			interrupts = <0 383 0>;
 		};
 
+		pinctrl_bus1: pinctrl@14870000 {
+			compatible = "samsung,exynos7-pinctrl";
+			reg = <0x14870000 0x1000>;
+			interrupts = <0 384 0>;
+		};
+
 		pinctrl_nfc: pinctrl@14cd0000 {
 			compatible = "samsung,exynos7-pinctrl";
 			reg = <0x14cd0000 0x1000>;
-- 
1.7.10.4
