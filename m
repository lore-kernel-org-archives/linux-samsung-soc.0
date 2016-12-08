From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos: Fix initial clocks configuration on
 Odroid X/X2/U3 boards
Date: Thu, 08 Dec 2016 12:01:54 +0100
Message-ID: <1481194914-20490-2-git-send-email-m.szyprowski@samsung.com>
References: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55383 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750827AbcLHLEW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 06:04:22 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHV01VHH5CDUN50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Dec 2016 20:02:37 +0900 (KST)
In-reply-to: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Move assigned clocks properties from sound node to audio subsystem clock
controller node. This way clocks topology and rates are set just after
probing audio clocks controller. Leaving those properties under sound
node doesn't guarantee to configure them before they are being used
(for example i2s hardware module can be probed in parallel and it also
require proper audio clocks configuration).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

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
