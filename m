From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 5/5] ARM: dts: Update watchdog node name in exynos5440.dtsi
Date: Fri, 23 May 2014 11:38:58 +0530
Message-ID: <1400825338-1272-5-git-send-email-sachin.kamat@linaro.org>
References: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:62403 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbaEWGLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 02:11:18 -0400
Received: by mail-pa0-f52.google.com with SMTP id fa1so3652597pad.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 23:11:18 -0700 (PDT)
In-Reply-To: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Made it as per DT node naming convention <name@reg_addr>.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5440.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 84f77c2fe4d4..ae3a17c791f6 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -176,7 +176,7 @@
 		clock-names = "i2c";
 	};
 
-	watchdog {
+	watchdog@110000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x110000 0x1000>;
 		interrupts = <0 1 0>;
-- 
1.7.9.5
