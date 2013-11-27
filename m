From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Fix min voltage for vdd_arm on Arndale
Date: Wed, 27 Nov 2013 14:45:25 +0530
Message-ID: <1385543725-24037-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64194 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab3K0JRs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Nov 2013 04:17:48 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so9994744pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2013 01:17:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

The minimum recommended ARM voltage for Exynos5250 at 200MHz
on Arndale board is 0.9125V. Update accordingly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index bbfb23f942e1..6c92c4a827dc 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -266,7 +266,7 @@
 
 				buck2_reg: BUCK2 {
 					regulator-name = "vdd_arm";
-					regulator-min-microvolt = <925000>;
+					regulator-min-microvolt = <912500>;
 					regulator-max-microvolt = <1300000>;
 					regulator-always-on;
 					regulator-boot-on;
-- 
1.7.9.5
