From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Enable AX88760 USB hub on Origen board
Date: Wed, 11 May 2016 09:06:52 +0200
Message-ID: <1462950412-16681-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Matthew Leach <matthew@mattleach.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Matthew Leach <matthew@mattleach.net>

Enable the Origen's usb phy and ohci devices in the device tree.  Also
add the "samsung,vbus-gpio" property to enable the GPX3(5) gpio pin so
the AX88760 hub is powered.

Signed-off-by: Matthew Leach <matthew@mattleach.net>
[k.kozlowski: Extend nodes by label notation instead of path]
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-origen.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 8bca699b7f20..4c59bdb0e6f3 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -77,12 +77,29 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
 };
 
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
 
+&exynos_usbphy {
+	status = "okay";
+};
+
+&ehci {
+	samsung,vbus-gpio = <&gpx3 5 1>;
+	status = "okay";
+
+	port@1{
+		status = "okay";
+	};
+	port@2 {
+		status = "okay";
+	};
+};
+
 &fimd {
 	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
 	pinctrl-names = "default";
-- 
1.9.1
