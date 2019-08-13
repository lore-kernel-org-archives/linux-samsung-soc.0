From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 4/9] ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
Date: Tue, 13 Aug 2019 17:08:22 +0200
Message-ID: <20190813150827.31972-5-s.nawrocki@samsung.com>
References: <20190813150827.31972-1-s.nawrocki@samsung.com>
        <CGME20190813150854eucas1p14716609be6697222ae5795328cb2ed04@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813150827.31972-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Pankaj Dubey <pankaj.dubey@samsung.com>

As now we have chipid driver to initialize SoC related information
let's include it in build by default.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1 (RFC):
 - none
---
 arch/arm/mach-exynos/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index d7422233a130..f83786640f94 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -13,6 +13,7 @@ menuconfig ARCH_EXYNOS
 	select ARM_AMBA
 	select ARM_GIC
 	select COMMON_CLK_SAMSUNG
+	select EXYNOS_CHIPID
 	select EXYNOS_THERMAL
 	select EXYNOS_PMU
 	select EXYNOS_SROM
-- 
2.17.1
