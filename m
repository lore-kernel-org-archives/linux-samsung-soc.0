From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v3] arm/dts/trats2: add bcm4334 device node
Date: Thu, 9 Nov 2017 19:37:03 +1100
Message-ID: <20171109083657.GA27597@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:57049 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753360AbdKIIhN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 03:37:13 -0500
Received: by mail-pg0-f67.google.com with SMTP id m18so4114092pgd.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Nov 2017 00:37:13 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

This patch allows the bcm4334 to power on and enables
wifi functionality on trats2.

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 2da6ced64ee0..f34fdc9c57ad 100644
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
+	non-removable;
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
+		interrupts = <5 IRQ_TYPE_NONE>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &serial_0 {
 	status = "okay";
 };
-- 
2.15.0
