From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Modify the voltage range for BUCK2 for exynos7
Date: Wed,  6 Jul 2016 01:58:57 +0530
Message-ID: <1467750537-13911-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:33054 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752103AbcGEQVg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 12:21:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, k.kozlowski@samsung.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org

Change the BUCK2 (vdd_atlas) voltage range to '500 - 1200mv' since
CPU DVFS requires it.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index d8767b0..299f3ce 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -249,7 +249,7 @@
 
 			buck2_reg: BUCK2 {
 				regulator-name = "vdd_atlas";
-				regulator-min-microvolt = <1200000>;
+				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
-- 
1.9.1
