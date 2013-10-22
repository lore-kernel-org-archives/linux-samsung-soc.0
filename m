From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Remove RTC node from exynos4412-odroidx.dts
Date: Tue, 22 Oct 2013 16:06:55 +0530
Message-ID: <1382438215-13215-2-git-send-email-sachin.kamat@linaro.org>
References: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:40709 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826Ab3JVKiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 06:38:03 -0400
Received: by mail-pd0-f182.google.com with SMTP id q10so7577775pdj.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Oct 2013 03:38:02 -0700 (PDT)
In-Reply-To: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

RTC node is enabled in exynos4.dtsi file. Hence remove it from here.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 46c678e..ae161f0 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -71,10 +71,6 @@
 		regulator-boot-on;
 	};
 
-	rtc@10070000 {
-		status = "okay";
-	};
-
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-- 
1.7.9.5
