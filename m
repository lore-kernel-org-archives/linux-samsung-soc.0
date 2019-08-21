From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] soc: samsung: Select missing dependency for
 EXYNOS_CHIPID
Date: Wed, 21 Aug 2019 17:39:26 +0200
Message-ID: <20190821153926.12297-1-s.nawrocki@samsung.com>
References: <20190821150711.31398-1-s.nawrocki@samsung.com>
        <CGME20190821153936eucas1p22cd1a6105806cb5ad7b43252852fec05@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821150711.31398-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The chipid driver uses the MFD syscon API but it was not covered
properly in Kconfig.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/soc/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 2905f5262197..33ad0de2de3c 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -10,6 +10,7 @@ if SOC_SAMSUNG
 config EXYNOS_CHIPID
 	bool "Exynos Chipid controller driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || COMPILE_TEST
+	select MFD_SYSCON
 	select SOC_BUS
 
 config EXYNOS_PMU
-- 
2.17.1
