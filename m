From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v6 21/21] ARM: dts: Add support of bus frequency for
 exynos4412-trats/odroidu3
Date: Mon, 28 Mar 2016 08:38:10 +0900
Message-ID: <1459121890-4601-22-git-send-email-cw00.choi@samsung.com>
References: <1459121890-4601-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46765 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753328AbcC0XiX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Mar 2016 19:38:23 -0400
In-reply-to: <1459121890-4601-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com, kgene@kernel.org
Cc: rjw@rjwysocki.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux.amoon@gmail.com, m.reichl@fivetechno.de, tjakobi@math.uni-bielefeld.de, inki.dae@samsung.com, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

THis patch adds the bus device tree nodes for both MIF (Memory) and INT
(Internal) block to enable the bus frequency.

The DMC bus is parent device in MIF block using VDD_MIF and the LEFTBUS
bus is parent device in INT block using VDD_INT.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
[m.reichl and linux.amoon: Tested it on exynos4412-odroidu3 board]
Tested-by: Markus Reichl <m.reichl@fivetechno.de>
Tested-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 47 +++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts         | 47 +++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index b4983cbc4f8c..2015f10071f9 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -109,6 +109,53 @@
 	};
 };
 
+&bus_dmc {
+	devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
+	vdd-supply = <&buck1_reg>;
+	status = "okay";
+};
+
+&bus_acp {
+	devfreq = <&bus_dmc>;
+	status = "okay";
+};
+
+&bus_c2c {
+	devfreq = <&bus_dmc>;
+	status = "okay";
+};
+
+&bus_leftbus {
+	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
+	vdd-supply = <&buck3_reg>;
+	status = "okay";
+};
+
+&bus_rightbus {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_display {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_fsys {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_peri {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_mfc {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index dce3cebe0606..9f3fb9a7f5f4 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -289,6 +289,53 @@
 	status = "okay";
 };
 
+&bus_dmc {
+	devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
+	vdd-supply = <&buck1_reg>;
+	status = "okay";
+};
+
+&bus_acp {
+	devfreq = <&bus_dmc>;
+	status = "okay";
+};
+
+&bus_c2c {
+	devfreq = <&bus_dmc>;
+	status = "okay";
+};
+
+&bus_leftbus {
+	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
+	vdd-supply = <&buck3_reg>;
+	status = "okay";
+};
+
+&bus_rightbus {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_display {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_fsys {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_peri {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_mfc {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
-- 
1.9.1
