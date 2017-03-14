From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 4/5] mfd: exynos-lpass: Use common soc/exynos-regs-pmu.h header
Date: Tue, 14 Mar 2017 18:46:52 +0200
Message-ID: <20170314164653.15771-5-krzk@kernel.org>
References: <20170314164653.15771-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170314164653.15771-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The MFD-specific header will go away because it duplicates defines from
exynos-regs-pmu.h.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/mfd/exynos-lpass.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 2e064fb8826f..8bebad92a385 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -18,11 +18,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mfd/syscon/exynos5-pmu.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/types.h>
 
 /* LPASS Top register definitions */
@@ -83,7 +83,7 @@ static void exynos_lpass_enable(struct exynos_lpass *lpass)
 
 	/* Activate related PADs from retention state */
 	regmap_write(lpass->pmu, EXYNOS5433_PAD_RETENTION_AUD_OPTION,
-		     EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR);
+		     EXYNOS_WAKEUP_FROM_LOWPWR);
 
 	exynos_lpass_core_sw_reset(lpass, LPASS_I2S_SW_RESET);
 	exynos_lpass_core_sw_reset(lpass, LPASS_DMA_SW_RESET);
-- 
2.9.3
