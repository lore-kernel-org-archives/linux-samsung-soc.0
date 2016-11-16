From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/5] arm64: dts: exynos: TM2 - remove unused UART3 and set
 clocks directly on CMU
Date: Wed, 16 Nov 2016 14:06:55 +0100
Message-ID: <1479301615-11240-6-git-send-email-m.szyprowski@samsung.com>
References: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116130709eucas1p1fcf3fbb43f313d53bef47616a789dac4@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22568 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752344AbcKPNHO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:07:14 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ00JP5KFYU060@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:07:10 +0000 (GMT)
In-reply-to: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

UART3 device is not really needed for enabling audio block on TM2.
Enabling it made it working by enabling some common parent clocks,
what is now handled by improved exynos5433 clocks driver. Thus the UART3
device node can be safetly disabled. The assigned-clocks entries are
however still needed, so move them under the respective CMU node.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 506f8ab..5ab1028 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -891,10 +891,9 @@
 	status = "okay";
 };
 
-&serial_3 {
+&cmu_aud {
 	assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>;
 	assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
-	status = "okay";
 };
 
 &cmu_fsys {
-- 
1.9.1
