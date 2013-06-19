From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Update range for vdd_arm on EXYNOS4412-origen board
Date: Wed, 19 Jun 2013 15:28:39 +0530
Message-ID: <1371635919-16288-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:50154 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934617Ab3FSKN2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 06:13:28 -0400
Received: by mail-pa0-f51.google.com with SMTP id lf11so4997385pab.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 03:13:28 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, patches@linaro.org

EXYNOS4412 cpufreq driver requires the range of vdd_arm regulator to
be from .9v to 1.35v. Since vdd_arm regulator (BUCK2 on S5M8767) has
a supported range of .6v to 1.6v, the constraints are updated to
match the requirement from cpufreq driver.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 7993641..309a583 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -450,8 +450,8 @@
 
 				buck2_reg: BUCK2 {
 					regulator-name = "vdd_arm";
-					regulator-min-microvolt = <925000>;
-					regulator-max-microvolt	= <1300000>;
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt	= <1350000>;
 					regulator-always-on;
 					regulator-boot-on;
 					op_mode = <1>; /* Normal Mode */
-- 
1.7.9.5
