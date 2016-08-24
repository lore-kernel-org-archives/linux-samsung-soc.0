From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 2/7] Documentation: bindings: Add Exynos5433 PMU compatible
Date: Wed, 24 Aug 2016 22:49:06 +0900
Message-ID: <1472046551-703-3-git-send-email-cw00.choi@samsung.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, chanwoo@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the exynos5433 PMU compatible to support the access
of PMU (Power Management Unit) block.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 2d6356d8daf4..bf5fc59a6938 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -10,6 +10,7 @@ Properties:
 		   - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
 		   - "samsung,exynos5410-pmu" - for Exynos5410 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
+		   - "samsung,exynos5433-pmu" - for Exynos5433 SoC.
 		   - "samsung,exynos7-pmu" - for Exynos7 SoC.
 		second value must be always "syscon".
 
-- 
1.9.1
