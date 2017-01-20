From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Disable pull down for audio pins in
 Exynos5433 SoCs
Date: Fri, 20 Jan 2017 07:56:53 +0100
Message-ID: <1484895413-9080-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170120065702eucas1p1dd0b370aa6cba11d26ce2ed1651f16b9@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20806 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751260AbdATG5F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 01:57:05 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OK200E87GN30640@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2017 06:57:04 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Common definition for I2S, PMC, SPDIF buses should not define any pull
control for the individual pins. Correct this by changing samsung,pin-pud
property to EXYNOS_PIN_PULL_NONE like it is defined for other Exynos SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
index d49879bd34bb..50403700274b 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
@@ -135,14 +135,14 @@
 		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
 				"gpz0-4", "gpz0-5", "gpz0-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
 	pcm0_bus: pcm0-bus {
 		samsung,pins = "gpz1-0", "gpz1-1", "gpz1-2", "gpz1-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
@@ -569,7 +569,7 @@
 		samsung,pins = "gpd4-0", "gpd4-1", "gpd4-2",
 				"gpd4-3", "gpd4-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
@@ -577,14 +577,14 @@
 		samsung,pins = "gpd4-0", "gpd4-1", "gpd4-2",
 				"gpd4-3", "gpd4-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
 	spdif_bus: spdif-bus {
 		samsung,pins = "gpd4-3", "gpd4-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
-- 
1.9.1
