From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Fri, 25 Oct 2013 16:52:48 +0530
Message-ID: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:61467 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492Ab3JYLX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 07:23:57 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so4989523pad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2013 04:23:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org

Adds missing GPIO entries for sd_bus nodes in exynos5420-pinctrl.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index e695aba..fcb8206 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -181,7 +181,7 @@
 		};
 
 		sd0_bus4: sd0-bus-width4 {
-			samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
+			samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
 			samsung,pin-drv = <3>;
@@ -230,7 +230,7 @@
 		};
 
 		sd1_bus4: sd1-bus-width4 {
-			samsung,pins = "gpc1-4", "gpc1-5", "gpc1-6";
+			samsung,pins = "gpc1-3", "gpc1-4", "gpc1-5", "gpc1-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
 			samsung,pin-drv = <3>;
@@ -272,7 +272,7 @@
 		};
 
 		sd2_bus4: sd2-bus-width4 {
-			samsung,pins = "gpc2-4", "gpc2-5", "gpc2-6";
+			samsung,pins = "gpc2-3", "gpc2-4", "gpc2-5", "gpc2-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
 			samsung,pin-drv = <3>;
-- 
1.7.9.5
