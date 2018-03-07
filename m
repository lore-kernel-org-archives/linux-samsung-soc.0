From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/4] ARM: dts: Add audio clocks configuration for
 exynos5250-snow
Date: Wed, 07 Mar 2018 18:27:09 +0100
Message-ID: <20180307172711.15697-2-s.nawrocki@samsung.com>
References: <20180307172711.15697-1-s.nawrocki@samsung.com>
        <CGME20180307172734epcas1p49c88df114f4e3b32999fbfb6159773ed@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180307172711.15697-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Currently the audio subsystem clocks are not configured properly on Snow
and sound is not working. The MAX98095 CODEC is not getting its master clock
on the MCLK pin connected to the SOC's CLKOUT GPIO. This patch adds CLKOUT
and other clocks configuration so HDMI audio can also be supported.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 59cf1b202849..bdf59dd3654b 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -225,6 +225,16 @@
 	};
 };
 
+&clock {
+	assigned-clocks = <&clock CLK_FOUT_EPLL>;
+	assigned-clock-rates = <49152000>;
+};
+
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-parents = <&clock CLK_FOUT_EPLL>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
@@ -649,6 +659,11 @@
 	};
 };
 
+&pmu_system_controller {
+	assigned-clocks = <&pmu_system_controller 0>;
+	assigned-clock-parents = <&clock CLK_FIN_PLL>;
+};
+
 &rtc {
 	status = "okay";
 	clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
-- 
2.14.2
