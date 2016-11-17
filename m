From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 4/5] arm64: dts: exynos: Assign parent clock of the clkout
 clock for TM2 board
Date: Thu, 17 Nov 2016 09:58:00 +0100
Message-ID: <1479373081-11586-5-git-send-email-m.szyprowski@samsung.com>
References: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117085812eucas1p18c55c33c2d4dcafc5d6cd7e4aecac51b@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45885 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751287AbcKQI6Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:58:16 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00A3Z3L1US80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 08:58:13 +0000 (GMT)
In-reply-to: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

Without this patch the clkout clock is orphaned and sound doesn't
work properly.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 0f93e795ab2e..a0ccc9d3a716 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -979,6 +979,11 @@
 	};
 };
 
+&pmu_system_controller {
+	assigned-clocks = <&pmu_system_controller 0>;
+	assigned-clock-parents = <&xxti>;
+};
+
 &serial_1 {
 	status = "okay";
 };
-- 
1.9.1
