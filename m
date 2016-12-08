From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 5/5] arm64: dts: exynos5433: Add support of bus frequency
 using VDD_INT on TM2
Date: Thu, 08 Dec 2016 13:58:11 +0900
Message-ID: <1481173091-9728-6-git-send-email-cw00.choi@samsung.com>
References: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58916 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932636AbcLHE6X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 23:58:23 -0500
In-reply-to: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, robh+dt@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

This patch adds the bus Device-tree nodes for INT (Internal) block
to enable the bus frequency scaling.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index c08589970134..451788642b21 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -170,6 +170,58 @@
 	};
 };
 
+&bus_g2d_400 {
+	devfreq-events = <&ppmu_event0_d0_general>, <&ppmu_event0_d1_general>;
+	vdd-supply = <&buck4_reg>;
+	exynos,saturation-ratio = <10>;
+	status = "okay";
+};
+
+&bus_g2d_266 {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_gscl {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_hevc {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_jpeg {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_mfc {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_mscl {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_noc0 {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_noc1 {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
+&bus_noc2 {
+	devfreq = <&bus_g2d_400>;
+	status = "okay";
+};
+
 &cmu_aud {
 	assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>;
 	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
@@ -794,6 +846,24 @@
 	bus-width = <4>;
 };
 
+&ppmu_d0_general {
+	status = "okay";
+	events {
+		ppmu_event0_d0_general: ppmu-event0-d0-general {
+			event-name = "ppmu-event0-d0-general";
+		};
+	};
+};
+
+&ppmu_d1_general {
+	status = "okay";
+	events {
+		ppmu_event0_d1_general: ppmu-event0-d1-general {
+		       event-name = "ppmu-event0-d1-general";
+	       };
+       };
+};
+
 &pinctrl_alive {
 	pinctrl-names = "default";
 	pinctrl-0 = <&initial_alive>;
-- 
1.9.1
