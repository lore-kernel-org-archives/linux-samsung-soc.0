From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: dts: exynos: Order nodes alphabetically in Arndale Octa
Date: Mon, 18 Feb 2019 20:48:41 +0100
Message-ID: <20190218194841.21374-2-krzk@kernel.org>
References: <20190218194841.21374-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218194841.21374-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Markus Reichl <reichl@t-online.de>
List-Id: linux-samsung-soc@vger.kernel.org

Having nodes and overrides-by-label ordered alphabetically reduces the
possibility of conflicts from simultaneous edits.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 2b227246c685..6b4bf5ee2e45 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -51,6 +51,10 @@
 	};
 };
 
+&cci {
+	status = "disabled";
+};
+
 &cpu0 {
 	cpu-supply = <&buck2_reg>;
 };
@@ -323,14 +327,6 @@
 	};
 };
 
-&usbdrd_dwc3_1 {
-	dr_mode = "host";
-};
-
-&cci {
-	status = "disabled";
-};
-
 &hdmi {
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	vdd_osc-supply = <&ldo7_reg>;
@@ -724,3 +720,7 @@
 	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
 	clock-names = "rtc", "rtc_src";
 };
+
+&usbdrd_dwc3_1 {
+	dr_mode = "host";
+};
-- 
2.17.1
