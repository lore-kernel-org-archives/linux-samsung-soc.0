From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH V2] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Mon, 12 Aug 2013 17:21:33 +0530
Message-ID: <1376308293-7766-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:33576 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754079Ab3HLLvp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 07:51:45 -0400
Received: by mail-pd0-f172.google.com with SMTP id z10so3305118pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2013 04:51:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds RTC DT node to Exynos5420 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
changes since v1:
	- made DT node status as "okay" in the dtsi file itself.
---
 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 arch/arm/boot/dts/exynos5420.dtsi |    7 +++++++
 3 files changed, 10 insertions(+), 2 deletions(-)

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
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 88589b7..c82137b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -178,9 +178,10 @@
 		samsung,power-domain = <&pd_mfc>;
 	};
 
-	rtc {
+	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
+		status = "okay";
 	};
 
 	tmu@10060000 {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9e90d1e..8f1bb08 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -145,4 +145,11 @@
 		clocks = <&clock 260>, <&clock 131>;
 		clock-names = "uart", "clk_uart_baud0";
 	};
+
+	rtc@101E0000 {
+		clocks = <&clock 317>;
+		clock-names = "rtc";
+		status = "okay";
+       };
+
 };
-- 
1.7.9.5
