From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 4/4] ARM: dts: Exynos: Add cpu clock table and armclk divider
 table for Exynos3250
Date: Fri, 13 Jun 2014 15:08:13 +0900
Message-ID: <1402639693-31108-5-git-send-email-cw00.choi@samsung.com>
References: <1402639693-31108-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41453 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517AbaFMGIh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 02:08:37 -0400
In-reply-to: <1402639693-31108-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de, kyungmin.park@samsung.com, cw00.choi@samsung.com

This patch add cpu clock table and armclk divier table to support
generic cpufreq-cpu0 driver for Exynos3250.

Cc: Tomas Abraham <thomas.ab@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 3e678fa..df0efd0 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -50,6 +50,21 @@
 			compatible = "arm,cortex-a7";
 			reg = <0>;
 			clock-frequency = <1000000000>;
+			clocks = <&cmu CLK_DIV_CORE2>;
+			clock-names = "cpu";
+
+			operating-points = <
+				1000000 1150000
+				900000  1112500
+				800000  1075000
+				700000  1037500
+				600000  1000000
+				500000  962500
+				400000  925000
+				300000  887500
+				200000  850000
+				100000  850000
+			>;
 		};
 
 		cpu1: cpu@1 {
@@ -159,6 +174,19 @@
 			compatible = "samsung,exynos3250-cmu";
 			reg = <0x10030000 0x20000>;
 			#clock-cells = <1>;
+
+			samsung,armclk-cells = <7>;
+			samsung,armclk-divider-table =
+				<1000000 1 4 7 1 7 7>,
+				<900000  1 3 7 1 7 7>,
+				<800000  1 3 7 1 7 7>,
+				<700000  1 3 7 1 7 7>,
+				<600000  1 3 7 1 7 7>,
+				<500000  1 3 7 1 7 7>,
+				<400000  1 3 7 1 7 7>,
+				<300000  1 3 5 1 7 7>,
+				<200000  1 3 3 1 7 7>,
+				<100000  1 1 1 1 7 7>;
 		};
 
 		rtc: rtc@10070000 {
-- 
1.8.0
