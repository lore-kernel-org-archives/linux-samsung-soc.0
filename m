From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] soc: samsung: Add missing Kconfig dependencies for
 EXYNOS_CHIPID
Date: Wed, 21 Aug 2019 17:07:11 +0200
Message-ID: <20190821150711.31398-1-s.nawrocki@samsung.com>
References: <CGME20190821150719eucas1p26bddabb16499647860805e61a8b63010@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: jonathanh@nvidia.com, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The chipid driver uses the regmap and the MFD syscon API
but it was not covered properly in Kconfig.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/soc/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 2905f5262197..a03f83492716 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -9,7 +9,7 @@ if SOC_SAMSUNG
 
 config EXYNOS_CHIPID
 	bool "Exynos Chipid controller driver" if COMPILE_TEST
-	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on (ARCH_EXYNOS && REGMAP && MFD_SYSCON) || COMPILE_TEST
 	select SOC_BUS
 
 config EXYNOS_PMU
-- 
2.17.1
