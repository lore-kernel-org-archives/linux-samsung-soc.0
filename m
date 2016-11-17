From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/5] arm64: dts: exynos: Add missing parent clocks to audio
 block in Exynos 5433 SoC
Date: Thu, 17 Nov 2016 09:57:58 +0100
Message-ID: <1479373081-11586-3-git-send-email-m.szyprowski@samsung.com>
References: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117085811eucas1p12d1530da1de3dc2b9693ecb25fb038ea@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45885 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbcKQI6O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:58:14 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00A3X3L0US80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 08:58:12 +0000 (GMT)
In-reply-to: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Audio PLL and oscillator clocks are proper parent clocks for AUD CMU.
They are not visible as such on first glance on Exynos 5433 SoC docs,
but they are needed for this CMU to operate properly.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 6564875344fa..a80eb4c22c7a 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -374,6 +374,8 @@
 			compatible = "samsung,exynos5433-cmu-aud";
 			reg = <0x114c0000 0x1000>;
 			#clock-cells = <1>;
+			clock-names = "oscclk", "fout_aud_pll";
+			clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
 		};
 
 		cmu_bus0: clock-controller@13600000 {
-- 
1.9.1
