From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] ARM: EXYNOS: set clock parents of registered clocks on power-on
Date: Thu, 21 Apr 2016 23:24:57 +0300
Message-ID: <1461270297-31390-1-git-send-email-vz@mleia.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:56959 "EHLO mail.mleia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752034AbcDUUZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 16:25:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

If any of the clocks from stored on power down list are not registered
by chance, on power-on the for-loop of reassigning the clock parents
back from "oscclk" exits and the remaining clocks don't have a chance
to restore an original parent clock.

Fixes: 29e5eea06bc1 ("ARM: EXYNOS: Get current parent clock for power domain on/off")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Hi Krzysztof,

this is a functional and _untested_ change, but I hope it is okay,
please review. Here "if (a) break; if (a) continue;" code is quite
confusing.

 arch/arm/mach-exynos/pm_domains.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 7c21760..6a9993e 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -90,9 +90,6 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (power_on) {
 		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
 			if (IS_ERR(pd->clk[i]))
-				break;
-
-			if (IS_ERR(pd->clk[i]))
 				continue; /* Skip on first power up */
 			if (clk_set_parent(pd->clk[i], pd->pclk[i]))
 				pr_err("%s: error setting parent to clock%d\n",
-- 
2.1.4
