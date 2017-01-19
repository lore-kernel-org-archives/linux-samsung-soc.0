From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Fix i2s0 pins pull control for Exynos5433
 SoCs
Date: Thu, 19 Jan 2017 14:58:30 +0100
Message-ID: <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170119135856eucas1p149239f274848d61b9aa785e8497d957a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38636 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752694AbdASN7A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 08:59:00 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OK100G135I9T980@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jan 2017 13:58:58 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Common definition for I2S0 bus should not define any pull control for
the individual I2S pins. Correct this by changing samsung,pin-pud property
to EXYNOS_PIN_PULL_NONE like it is used for other Exynos SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
index d49879bd34bb..2171ff965212 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
@@ -135,7 +135,7 @@
 		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
 				"gpz0-4", "gpz0-5", "gpz0-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
 	};
 
-- 
1.9.1
