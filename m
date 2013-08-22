From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 1/3] ARM: dts: Fix the RTC DT node name for Exynos5250 SoC
Date: Thu, 22 Aug 2013 17:03:26 +0530
Message-ID: <1377171208-23515-2-git-send-email-vikas.sajjan@linaro.org>
References: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:57998 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752885Ab3HVLdn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 07:33:43 -0400
Received: by mail-pa0-f53.google.com with SMTP id lb1so2095613pab.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 04:33:43 -0700 (PDT)
In-Reply-To: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Fixes the RTC DT node name for Exynos5250 SoC as per the DT node naming
convention.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
