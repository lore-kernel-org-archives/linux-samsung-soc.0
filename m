From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Update vdd_arm regulator
Date: Thu,  6 Jun 2013 16:32:52 +0530
Message-ID: <1370516572-313-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:52166 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754200Ab3FFLRL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 07:17:11 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so3209151pdj.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2013 04:17:11 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Cpufreq driver for EXYNOS4210 is not a platform driver, hence it is not
possible to provide the regulator supply name through DT bindings.
Since the cpufreq driver requires the regulator to be named as
'vdd_arm', the related regulator name should be kept same.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index bcf8079..bd5f589 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -192,7 +192,7 @@
 				};
 
 				buck1_reg: BUCK1 {
-					regulator-name = "VDD_ARM_1.2V";
+					regulator-name = "vdd_arm";
 					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt	= <1350000>;
 					regulator-always-on;
-- 
1.7.9.5
