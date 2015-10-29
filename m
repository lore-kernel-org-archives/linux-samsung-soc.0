From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Constify local exynos_pmu_data structure
Date: Thu, 29 Oct 2015 10:40:45 +0900
Message-ID: <1446082845-4974-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8558 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbbJ2BlD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 21:41:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pavel Fedin <p.fedin@samsung.com>

The Exynos5420 instance of exynos_pmu_data structure is not modified and
can be made const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Suggested-by: Pavel Fedin <p.fedin@samsung.com>
---
 arch/arm/mach-exynos/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index de68938ee6aa..5775154501d8 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -908,7 +908,7 @@ static const struct exynos_pmu_data exynos5250_pmu_data = {
 	.powerdown_conf	= exynos5_powerdown_conf,
 };
 
-static struct exynos_pmu_data exynos5420_pmu_data = {
+static const struct exynos_pmu_data exynos5420_pmu_data = {
 	.pmu_config	= exynos5420_pmu_config,
 	.pmu_init	= exynos5420_pmu_init,
 	.powerdown_conf	= exynos5420_powerdown_conf,
-- 
1.9.1
