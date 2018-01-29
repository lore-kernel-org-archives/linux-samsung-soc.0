From: Michael Lyle <mlyle@lyle.org>
Subject: [PATCH] ARM: dts: exynos-artik5: add support for wlan
Date: Sun, 28 Jan 2018 19:16:40 -0800
Message-ID: <20180129031640.17939-1-mlyle@lyle.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:42896 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750730AbeA2DRA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 28 Jan 2018 22:17:00 -0500
Received: by mail-pg0-f68.google.com with SMTP id j16so1947107pgn.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jan 2018 19:17:00 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, krzk@kernel.org, CHANHO PARK <chanho61.park@samsung.com>, Michael Lyle <mlyle@lyle.org>

On the Artik520 module, there's a bcm4354 attached to mshc_1.  Enable
it, and turn on the regulator used for it, so that both wifi & bluetooth
work.

Verified to work on the Artik 520 evaluation board.

Signed-off-by: Michael Lyle <mlyle@lyle.org>
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 0aa577fe9f95..b2d441b1a7e3 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -245,6 +245,7 @@
 				regulator-name = "VLDO23_1.8V";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 			};
 
 			ldo24_reg: LDO24 {
@@ -316,6 +317,41 @@
 	status = "okay";
 };
 
+&pinctrl_1 {
+	wlanen: wlanen {
+		samsung,pins = "gpx2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
+		samsung,pin-val = <1>;
+	};
+};
+
+&mshc_1 {
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	broken-cd;
+	bypass-smu;
+	keep-power-in-suspend;
+	fifo-depth = <0x40>;
+	vqmmc-supply = <&ldo11_reg>;
+	/* Voltage negotiation is broken for the SDIO periph so we
+	 * can't actually set the voltage here.
+	 * vmmc-supply = <&ldo23_reg>;
+	 */
+	card-detect-delay = <500>;
+	clock-frequency = <100000000>;
+	max-frequency = <100000000>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd1_cmd &sd1_clk &sd1_bus1 &sd1_bus4 &wlanen>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &rtc {
 	clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
 	clock-names = "rtc", "rtc_src";
-- 
2.14.1
