From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Re-organize RTC status for 5420
Date: Thu, 19 Dec 2013 16:27:53 +0530
Message-ID: <1387450673-331-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:46119 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab3LSLBG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 06:01:06 -0500
Received: by mail-pb0-f43.google.com with SMTP id rq2so1009619pbb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2013 03:01:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Some boards might not have RTC xtal, so RTC shouldn't really be
enabled by default. Enable it in the required board files.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |    4 ++++
 arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 9f3a3231158b..090117d595cb 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -38,6 +38,10 @@
 		};
 	};
 
+	rtc@101E0000 {
+		status = "okay";
+	};
+
 	mmc@12200000 {
 		status = "okay";
 		broken-cd;
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 62e1ebe4e989..edb4926f17d6 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -31,6 +31,10 @@
 		};
 	};
 
+	rtc@101E0000 {
+		status = "okay";
+	};
+
 	mmc@12200000 {
 		status = "okay";
 		broken-cd;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1c1a6a0db252..0b4bb87ae5f9 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -271,7 +271,7 @@
 	rtc@101E0000 {
 		clocks = <&clock 317>;
 		clock-names = "rtc";
-		status = "okay";
+		status = "disabled";
 	};
 
 	amba {
-- 
1.7.9.5
