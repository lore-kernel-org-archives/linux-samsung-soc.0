From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 9/9] ARM: dts: exynos: Use camera label in
 exynos4412-itop-elite
Date: Mon, 05 Feb 2018 08:57:08 +0100
Message-ID: <1517817428-7898-10-git-send-email-m.purski@samsung.com>
References: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
        <CGME20180205075730eucas1p172e5eb26c498dbfa23cfad0f19401b8a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56132 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752682AbeBEH5e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 02:57:34 -0500
In-reply-to: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Camera label has been defined in exynos4.dtsi. Use it in
exynos4412-itop-elite instead of defining a new node.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index a4cd493..0dedeba 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -116,14 +116,6 @@
 		compatible = "pwm-beeper";
 		pwms = <&pwm 0 4000000 PWM_POLARITY_INVERTED>;
 	};
-
-	camera: camera {
-		pinctrl-0 = <&cam_port_a_clk_active>;
-		pinctrl-names = "default";
-		status = "okay";
-		assigned-clocks = <&clock CLK_MOUT_CAM0>;
-		assigned-clock-parents = <&clock CLK_XUSBXTI>;
-	};
 };
 
 &adc {
@@ -131,6 +123,14 @@
 	status = "okay";
 };
 
+&camera {
+	pinctrl-0 = <&cam_port_a_clk_active>;
+	pinctrl-names = "default";
+	status = "okay";
+	assigned-clocks = <&clock CLK_MOUT_CAM0>;
+	assigned-clock-parents = <&clock CLK_XUSBXTI>;
+};
+
 &clock_audss {
 	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
 			<&clock_audss EXYNOS_MOUT_I2S>,
-- 
2.7.4
