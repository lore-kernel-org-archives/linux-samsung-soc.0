From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 1/3] ARM: dts: Fix the RTC DT node name for Exynos5250 SoC
Date: Wed, 14 Aug 2013 19:28:28 +0530
Message-ID: <1376488710-12124-2-git-send-email-vikas.sajjan@linaro.org>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:57298 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755752Ab3HNN6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 09:58:46 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so6364602pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 06:58:46 -0700 (PDT)
In-Reply-To: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Fixes the RTC DT node name for Exynos5250 SoC as per the DT node naming
convention.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
index 88589b7..f426ce6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -178,7 +178,7 @@
 		samsung,power-domain = <&pd_mfc>;
 	};
 
-	rtc {
+	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
 	};
-- 
1.7.9.5
