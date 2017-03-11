From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 4/5] mfd: exynos-lpass: Use common soc/exynos-regs-pmu.h header
Date: Sat, 11 Mar 2017 22:00:20 +0200
Message-ID: <20170311200021.5827-5-krzk@kernel.org>
References: <20170311200021.5827-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933424AbdCKUBR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 15:01:17 -0500
In-Reply-To: <20170311200021.5827-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, Inha Song <ideal.song@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The MFD-specific header will go away because it duplicates defines from
exynos-regs-pmu.h.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
