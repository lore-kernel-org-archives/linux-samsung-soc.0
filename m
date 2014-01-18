From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH] ARM: dts: fix incorrect vdd_arm voltage range for Exynos4412 based boards
Date: Sat, 18 Jan 2014 16:41:23 +0530
Message-ID: <1390043483-1219-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:39568 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830AbaARLLn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 Jan 2014 06:11:43 -0500
Received: by mail-pa0-f41.google.com with SMTP id fa1so2844768pad.28
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jan 2014 03:11:42 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Dongjin Kim <tobetter@gmail.com>

From: Thomas Abraham <thomas.ab@samsung.com>

To allow Exynos4412 based Odroidx and Origen-quad boards to operate between
200MHz to 1.4Ghz, update the vdd_arm voltage range to operate between these
cpu clock speeds.

Cc: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts |    2 +-
 arch/arm/boot/dts/exynos4412-origen.dts  |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 9804fcb..12459b0 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -251,7 +251,7 @@
 				buck2_reg: BUCK2 {
 					regulator-name = "vdd_arm";
 					regulator-min-microvolt = <900000>;
-					regulator-max-microvolt = <1300000>;
+					regulator-max-microvolt = <1350000>;
 					regulator-always-on;
 					regulator-boot-on;
 				};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 6bc0539..388f035 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -459,8 +459,8 @@
 
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
1.6.6.rc2
