From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH V7] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Tue,  3 Sep 2013 11:30:01 +0530
Message-ID: <1378188001-22216-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:56262 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754356Ab3ICGAR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 02:00:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

This patch adds the mmc device tree node entries for exynos5420 SOC.
Exynos5420 has a different version of DWMMC controller,so a new
compatible string is used to distinguish it from the prior SOC's.

This patch depends on
	[1]mmc: dw_mmc: exynos: configure SMU in exynos5420
	[2]mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
	[3]mmc: dw_mmc: update binding document exynos-dw-mshc.txt

changes since v6:
	1.renamed node name to mmc
	2.Used compatible string "samsung,exynos5420-dw-mshc"
	  for controller instance which does not have SMU.
	3.Used compatible string "samsung,exynos5420-dw-mshc-smu"
	  for controller instance which has SMU.

changes since v5:
	1.removed instance index from node name.
	2.changed the node name to mshc.
	3.changed the reg property value for mshc_2.

changes since v4:
	1.Droppped the bypass-smu binding property.
	2.Used compatible string "samsung,exynos5250-dw-mshc"
	  for controller instance which does not have SMU.

changes since V3:
	1.change fifo-depth size from 0x80 to 0x40
	2.Move the below properties
		a.card-detect-delay
		b.samsung,dw-mshc-ciu-div
		c.samsung,dw-mshc-sdr-timing
		d.samsung,dw-mshc-ddr-timing
	from SOC dts to board dts file as suggested by Doug Anderson

changes since V2:
	1.dropped num-slots property from node as its not required
	  if number of card slots available is 1.

	2.Move the below properties
		a.fifo-depth
		b.card-detect-delay
		c.samsung,dw-mshc-ciu-div
		d.samsung,dw-mshc-sdr-timing
		e.samsung,dw-mshc-ddr-timing
	from board dts to SOC dts,as these are not board specific properties.

	3.Updated the binding document exynos-dw-mshc.txt.

changes since V1:
	1.disable node by status = disabled in SOC file
	2.enable node by status = okay in board specific file

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   33 +++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   39 ++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
index 6d1c098..84cd56f 100644
--- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
@@ -16,6 +16,8 @@ Required Properties:
 	  specific extensions.
 	- "samsung,exynos5250-dw-mshc": for controllers with Samsung Exynos5250
 	  specific extensions.
+	- "samsung,exynos5420-dw-mshc": for controllers with Samsung Exynos5420
+	  specific extensions.
 
 * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
   unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index bafba25..8df4ddc 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -31,6 +31,39 @@
 		};
 	};
 
+	mmc@12200000 {
+		status = "okay";
+		broken-cd;
+		supports-highspeed;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <0 4>;
+		samsung,dw-mshc-ddr-timing = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
+	mmc@12220000 {
+		status = "okay";
+		supports-highspeed;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+		};
+	};
+
 	dp-controller@145B0000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&dp_hpd>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d537cd7..897f7f4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -22,6 +22,9 @@
 	compatible = "samsung,exynos5420";
 
 	aliases {
+		mshc0 = &mmc_0;
+		mshc1 = &mmc_1;
+		mshc2 = &mmc_2;
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
 		pinctrl2 = &pinctrl_2;
@@ -84,6 +87,42 @@
 		clock-names = "mfc";
 	};
 
+	mmc_0: mmc@12200000 {
+		compatible = "samsung,exynos5420-dw-mshc-smu";
+		interrupts = <0 75 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x12200000 0x2000>;
+		clocks = <&clock 351>, <&clock 132>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x40>;
+		status = "disabled";
+	};
+
+	mmc_1: mmc@12210000 {
+		compatible = "samsung,exynos5420-dw-mshc-smu";
+		interrupts = <0 76 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x12210000 0x2000>;
+		clocks = <&clock 352>, <&clock 133>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x40>;
+		status = "disabled";
+	};
+
+	mmc_2: mmc@12220000 {
+		compatible = "samsung,exynos5420-dw-mshc";
+		interrupts = <0 77 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x12220000 0x1000>;
+		clocks = <&clock 353>, <&clock 134>;
+		clock-names = "biu", "ciu";
+		fifo-depth = <0x40>;
+		status = "disabled";
+	};
+
 	mct@101C0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
-- 
1.7.9.5
