From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/5] ARM: dts: Remove duplicate and add missing G2D nodes
Date: Thu, 18 Apr 2013 16:45:16 +0530
Message-ID: <1366283719-9615-2-git-send-email-sachin.kamat@linaro.org>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:62626 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755314Ab3DRL1s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Apr 2013 07:27:48 -0400
Received: by mail-pd0-f169.google.com with SMTP id 10so1492373pdc.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Apr 2013 04:27:47 -0700 (PDT)
In-Reply-To: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

G2D node got added twice in exynos4412-smdk4412.dts instead of
getting added to exynos4412-origen.dts. Remove the duplicate entry
and add it to exynos4412-origen.dts.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts   |    4 ++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 790a999..ca73c42 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -98,6 +98,10 @@
 		};
 	};
 
+	g2d@10800000 {
+		status = "okay";
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index c52b01f..a8ba195 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -31,10 +31,6 @@
 		status = "okay";
 	};
 
-	g2d@10800000 {
-		status = "okay";
-	};
-
 	pinctrl@11000000 {
 		keypad_rows: keypad-rows {
 			samsung,pins = "gpx2-0", "gpx2-1", "gpx2-2";
-- 
1.7.9.5
