From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/5] ARM: dts: Enable RTC node on Origen boards
Date: Fri, 23 May 2014 11:38:54 +0530
Message-ID: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:56265 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752165AbaEWGLJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 02:11:09 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so3606167pab.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 23:11:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Enabled RTC node on Origen 4210 and 4412 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    4 ++++
 arch/arm/boot/dts/exynos4412-origen.dts |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 72fb11f7ea21..95efb1189cf0 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -48,6 +48,10 @@
 		};
 	};
 
+	rtc@10070000 {
+		status = "okay";
+	};
+
 	tmu@100C0000 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index e2c0dcab4d81..934fe7ecca7e 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -48,6 +48,10 @@
 		};
 	};
 
+	rtc@10070000 {
+		status = "okay";
+	};
+
 	pinctrl@11000000 {
 		keypad_rows: keypad-rows {
 			samsung,pins = "gpx2-0", "gpx2-1", "gpx2-2";
-- 
1.7.9.5
