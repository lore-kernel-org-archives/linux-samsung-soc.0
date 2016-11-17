From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 5/5] arm64: dts: exynos: TM2 - remove unused UART3 and set
 clocks directly on CMU
Date: Thu, 17 Nov 2016 09:58:01 +0100
Message-ID: <1479373081-11586-6-git-send-email-m.szyprowski@samsung.com>
References: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117085812eucas1p2688dd5a172c52796b43001b108180d6e@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56369 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbcKQI6Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:58:16 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS005533L14U80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 08:58:13 +0000 (GMT)
In-reply-to: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

UART3 device is not really needed for enabling audio block on TM2.
Enabling it made it working by enabling some common parent clocks,
what is now handled by improved exynos5433 clocks driver. Thus the UART3
device node can be safely disabled. The assigned-clocks entries are
however still needed, so move them under the respective CMU node.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index a0ccc9d3a716..48da2095e381 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -165,6 +165,11 @@
 	};
 };
 
+&cmu_aud {
+	assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>;
+	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
+};
+
 &cmu_fsys {
 	assigned-clocks = <&cmu_top CLK_MOUT_SCLK_USBDRD30>,
 		<&cmu_top CLK_MOUT_SCLK_USBHOST30>,
@@ -988,12 +993,6 @@
 	status = "okay";
 };
 
-&serial_3 {
-	assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>;
-	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
-	status = "okay";
-};
-
 &spi_1 {
 	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
1.9.1
