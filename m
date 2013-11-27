From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add missing op_mode property to PMIC on Arndale
Date: Wed, 27 Nov 2013 14:44:23 +0530
Message-ID: <1385543663-23582-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:36296 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab3K0JQr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Nov 2013 04:16:47 -0500
Received: by mail-pd0-f180.google.com with SMTP id q10so9468347pdj.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2013 01:16:47 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Though the default value is 1, add it explicitly to avoid
unnecessary boot warnings and for consistency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index e1d79efadf02..6c92c4a827dc 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -302,11 +302,13 @@
 				buck7_reg: BUCK7 {
 					regulator-name = "PVDD_BUCK7";
 					regulator-always-on;
+					op_mode = <1>;
 				};
 
 				buck8_reg: BUCK8 {
 					regulator-name = "PVDD_BUCK8";
 					regulator-always-on;
+					op_mode = <1>;
 				};
 
 				buck9_reg: BUCK9 {
-- 
1.7.9.5
