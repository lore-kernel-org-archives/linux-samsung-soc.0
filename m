From: Simon Shields <simon@lineageos.org>
Subject: [PATCH] arm/dts/trats2: add bcm4334 device node
Date: Thu, 9 Nov 2017 00:01:32 +1100
Message-ID: <20171108130126.GA8455@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:52811 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751893AbdKHNBl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Nov 2017 08:01:41 -0500
Received: by mail-pf0-f195.google.com with SMTP id e64so1676410pfk.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Nov 2017 05:01:41 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

This patch allows the bcm4334 to power on and enables
wifi functionality on trats2.

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 2da6ced64ee0..c34982739d8d 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -240,6 +240,13 @@
 
 	};
 
+	wlan_pwrseq: sdhci3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpj0 0 GPIO_ACTIVE_LOW>;
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "ext_clock";
+	};
+
 	sound {
 		compatible = "samsung,trats2-audio";
 		samsung,i2s-controller = <&i2s0>;
@@ -1238,6 +1245,27 @@
 	status = "okay";
 };
 
+&sdhci_3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	broken-cd;
+	bus-width = <4>;
+
+	mmc-pwrseq = <&wlan_pwrseq>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
+	vmmc-supply = <&ldo21_reg>;
+	status = "okay";
+
+	brcmf: brcmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 0>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &serial_0 {
 	status = "okay";
 };
-- 
2.15.0
