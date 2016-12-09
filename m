From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/2] ARM: dts: exynos: Fix initial audio clocks
 configuration on Exynos4 boards
Date: Fri, 09 Dec 2016 08:22:11 +0100
Message-ID: <1481268131-1264-2-git-send-email-m.szyprowski@samsung.com>
References: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52418 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751983AbcLIHWj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 02:22:39 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHW013BJPTP1R10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2016 16:22:37 +0900 (KST)
In-reply-to: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Move assigned clocks properties from sound node to audio subsystem clock
controller node. This way clocks topology and rates are set just after
probing audio clocks controller. Leaving those properties under
sound node doesn't guarantee to configure them before they are being used
(for example i2s hardware module can be probed in parallel and it also
require proper audio clocks configuration).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changelog:
v2:
- added changes for exynos4412-itop-elite board
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts     | 21 ++++++++++-----------
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 1ac9129..d660930 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -82,17 +82,6 @@
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "wm-sound";
 
-		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
-				<&clock_audss EXYNOS_MOUT_I2S>,
-				<&clock_audss EXYNOS_DOUT_SRP>,
-				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
-		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
-				<&clock_audss EXYNOS_MOUT_AUDSS>;
-		assigned-clock-rates = <0>,
-				<0>,
-				<112896000>,
-				<11289600>;
-
 		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&link0_codec>;
 		simple-audio-card,frame-master = <&link0_codec>;
@@ -145,6 +134,16 @@
 	status = "okay";
 };
 
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+			<&clock_audss EXYNOS_MOUT_I2S>,
+			<&clock_audss EXYNOS_DOUT_SRP>,
+			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
+	assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
+			<&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-rates = <0>, <0>, <112896000>, <11289600>;
+};
+
 &ehci {
 	status = "okay";
 	/* In order to reset USB ethernet */
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 7815efd..b6b0f50 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -43,16 +43,6 @@
 
 	sound: sound {
 		compatible = "simple-audio-card";
-		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
-				<&clock_audss EXYNOS_MOUT_I2S>,
-				<&clock_audss EXYNOS_DOUT_SRP>,
-				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
-		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
-				<&clock_audss EXYNOS_MOUT_AUDSS>;
-		assigned-clock-rates = <0>,
-				<0>,
-				<192000000>,
-				<19200000>;
 
 		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&link0_codec>;
@@ -157,6 +147,16 @@
 	status = "okay";
 };
 
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+			<&clock_audss EXYNOS_MOUT_I2S>,
+			<&clock_audss EXYNOS_DOUT_SRP>,
+			<&clock_audss EXYNOS_DOUT_AUD_BUS>;
+	assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
+			<&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-rates = <0>, <0>, <192000000>, <19200000>;
+};
+
 &cpu0 {
 	cpu0-supply = <&buck2_reg>;
 };
-- 
1.9.1
