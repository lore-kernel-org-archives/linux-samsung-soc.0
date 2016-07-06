From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] soc: samsung: pmu: Constify arrays with PMU data
Date: Wed, 06 Jul 2016 09:03:46 +0200
Message-ID: <1467788626-6591-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60912 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886AbcGFHDz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 03:03:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Arrays storing values for Power Management Unit for given sleep mode can
be made const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/soc/samsung/exynos3250-pmu.c | 2 +-
 drivers/soc/samsung/exynos5420-pmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos3250-pmu.c b/drivers/soc/samsung/exynos3250-pmu.c
index 20b3ab8aa790..af2f54e14b83 100644
--- a/drivers/soc/samsung/exynos3250-pmu.c
+++ b/drivers/soc/samsung/exynos3250-pmu.c
@@ -14,7 +14,7 @@
 
 #include "exynos-pmu.h"
 
-static struct exynos_pmu_conf exynos3250_pmu_config[] = {
+static const struct exynos_pmu_conf exynos3250_pmu_config[] = {
 	/* { .offset = offset, .val = { AFTR, W-AFTR, SLEEP } */
 	{ EXYNOS3_ARM_CORE0_SYS_PWR_REG,		{ 0x0, 0x0, 0x2} },
 	{ EXYNOS3_DIS_IRQ_ARM_CORE0_LOCAL_SYS_PWR_REG,	{ 0x0, 0x0, 0x0} },
diff --git a/drivers/soc/samsung/exynos5420-pmu.c b/drivers/soc/samsung/exynos5420-pmu.c
index b962fb6a5d22..3f2c64180ef8 100644
--- a/drivers/soc/samsung/exynos5420-pmu.c
+++ b/drivers/soc/samsung/exynos5420-pmu.c
@@ -17,7 +17,7 @@
 
 #include "exynos-pmu.h"
 
-static struct exynos_pmu_conf exynos5420_pmu_config[] = {
+static const struct exynos_pmu_conf exynos5420_pmu_config[] = {
 	/* { .offset = offset, .val = { AFTR, LPA, SLEEP } */
 	{ EXYNOS5_ARM_CORE0_SYS_PWR_REG,		{ 0x0, 0x0, 0x0} },
 	{ EXYNOS5_DIS_IRQ_ARM_CORE0_LOCAL_SYS_PWR_REG,	{ 0x0, 0x0, 0x0} },
-- 
1.9.1
