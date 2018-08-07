From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/2] ARM: dts: exynos: Mark 1GHz CPU OPP as suspend OPP
Date: Tue,  7 Aug 2018 12:48:49 +0200
Message-ID: <20180807104908eucas1p13c3a771369e556e884c81f648d80ad44~IlH93f82B2008420084eucas1p1o@eucas1p1.samsung.com>
References: <20180807104757eucas1p201bd787714f50a798ee7457bdaf2c2f9~IlG8LJVcj1319313193eucas1p2R@eucas1p2.samsung.com>
        <20180807104849.15384-1-m.szyprowski@samsung.com>
        <CGME20180807104908eucas1p13c3a771369e556e884c81f648d80ad44@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180807104849.15384-1-m.szyprowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

1GHz CPU OPP is the default boot value for the Exynos5250 SOC, so mark it
as suspend OPP. This fixes suspend/resume on Samsung Exynos5250 Snow
Chomebook, which was broken since switching to generic cpufreq-dt driver
in v4.3.

CC: <stable@vger.kernel.org> # 4.3.x: cd6f55457eb4  ARM: dts: exynos: Remove "cooling-{min|max}-level" for CPU nodes
CC: <stable@vger.kernel.org> # 4.3.x: 672f33198bee  arm: dts: exynos: Add missing cooling device properties for CPUs
CC: <stable@vger.kernel.org> # 4.3.x
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 8746189990eb..b85527faa6ea 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -118,6 +118,7 @@
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <1075000>;
 			clock-latency-ns = <140000>;
+			opp-suspend;
 		};
 		opp-1100000000 {
 			opp-hz = /bits/ 64 <1100000000>;
-- 
2.17.1
