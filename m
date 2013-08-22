From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v6 1/3] ARM: dts: Fix the RTC DT node name for Exynos5250
Date: Thu, 22 Aug 2013 18:29:01 +0530
Message-ID: <1377176343-24859-2-git-send-email-vikas.sajjan@linaro.org>
References: <1377176343-24859-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:52093 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753112Ab3HVM7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 08:59:19 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz10so2171247pad.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 05:59:18 -0700 (PDT)
In-Reply-To: <1377176343-24859-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Fixes the RTC DT node name for Exynos5250 as per the DT node naming
convention.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi           |    2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts |    2 +-
 arch/arm/boot/dts/exynos5250-snow.dts    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 6afa57d..074739d 100644
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
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 452d0b0..264913f 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -538,7 +538,7 @@
 		};
 	};
 
-	rtc {
+	rtc@101E0000 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e79331d..24413a6 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -171,7 +171,7 @@
 		};
 	};
 
-	rtc {
+	rtc@101E0000 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 1eec646..b278b00 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -180,7 +180,7 @@
 		clock-names = "mfc";
 	};
 
-	rtc {
+	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
 	};
-- 
1.7.9.5
