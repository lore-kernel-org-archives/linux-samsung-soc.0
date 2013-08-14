From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH V3 1/2] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Wed, 14 Aug 2013 16:33:00 +0530
Message-ID: <1376478181-27539-2-git-send-email-vikas.sajjan@linaro.org>
References: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:53468 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759667Ab3HNLDQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:03:16 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so9245050pbc.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 04:03:15 -0700 (PDT)
In-Reply-To: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds RTC DT node to Exynos5420 SoC

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..4a8e223 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -95,7 +95,7 @@
 		interrupts = <0 54 0>;
 	};
 
-	rtc {
+	rtc@101E0000 {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
 		interrupts = <0 43 0>, <0 44 0>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9e90d1e..713bb5a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -126,6 +126,12 @@
 		interrupts = <0 47 0>;
 	};
 
+	rtc@101E0000 {
+		clocks = <&clock 317>;
+		clock-names = "rtc";
+		status = "okay";
+	};
+
 	serial@12C00000 {
 		clocks = <&clock 257>, <&clock 128>;
 		clock-names = "uart", "clk_uart_baud0";
-- 
1.7.9.5
