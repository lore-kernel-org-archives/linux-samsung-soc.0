From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v3] ARM: dts: exynos: add DT nodes for PRNG in Exynos5 SoCs
Date: Mon, 11 Dec 2017 09:54:15 +0100
Message-ID: <20171211085415.27947-1-l.stelmach@samsung.com>
References: <20171204120429.22892-1-l.stelmach@samsung.com>
        <CGME20171211085422eucas1p19a7e20669d9d3d4d41cf1b96c7039a33@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41011 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752336AbdLKIy0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 03:54:26 -0500
In-reply-to: <20171204120429.22892-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

Add nodes for PRNG in dts files decribing Exynos5 chips.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
Changes since v2:

- Rebased according to Krzysztof Kozłowski's request.

Changes since v1:

- Use "rng" as the node-name for all RNG regardles of their type.
- Introduce "samsung,exynos5250-prng" compatible (binding documentation
  will follow).

 arch/arm/boot/dts/exynos5.dtsi    | 6 ++++++
 arch/arm/boot/dts/exynos5250.dtsi | 5 +++++
 arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
 arch/arm/boot/dts/exynos5420.dtsi | 5 +++++
 4 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 347224589451..a7eb74617be4 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -211,11 +211,17 @@
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		prng: rng@10830400 {
+		      compatible = "samsung,exynos5250-prng";
+		      reg = <0x10830400 0x200>;
+		};
+
 		g2d: g2d@10850000 {
 			compatible = "samsung,exynos5250-g2d";
 			reg = <0x10850000 0x1000>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 232d8801d9e0..e55748798845 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -1061,6 +1061,11 @@
 	pinctrl-0 = <&i2c3_bus>;
 };
 
+&prng {
+	clocks = <&clock CLK_SSS>;
+	clock-names = "secss";
+};
+
 &pwm {
 	clocks = <&clock CLK_PWM>;
 	clock-names = "timers";
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 7b34970e6ac7..f5541000606b 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -333,6 +333,11 @@
 	clock-names = "fin_pll", "mct";
 };
 
+&prng {
+	clocks = <&clock CLK_SSS>;
+	clock-names = "secss";
+};
+
 &pwm {
 	clocks = <&clock CLK_PWM>;
 	clock-names = "timers";
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index a44aec348502..3611f5c05235 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1429,6 +1429,11 @@
 	clock-names = "fin_pll", "mct";
 };
 
+&prng {
+	clocks = <&clock CLK_SSS>;
+	clock-names = "secss";
+};
+
 &pwm {
 	clocks = <&clock CLK_PWM>;
 	clock-names = "timers";
-- 
2.11.0
