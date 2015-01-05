From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] ARM: EXYNOS: do not try to map PMU for exynos5440
Date: Mon, 05 Jan 2015 14:44:28 +0530
Message-ID: <1420449268-24707-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18368 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753807AbbAEJWL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 04:22:11 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHP009QL60XRH00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Jan 2015 18:22:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Commit id: 2e94ac42898f84d76e3c21dd91bc is not taking care
of mapping of exynos5440 PMU register which will result in kernel panic
on exynos5440.

As exynos5440 DTS does not have PMU node, and also we are skipping
exynos_pm_init in case of exynos5440, let's avoid mapping of exynos5440 PMU.

Reported-by: Ming Lei <tom.leiming@gmail.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/exynos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index c13d083..1891b8c 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -208,7 +208,8 @@ static void __init exynos_init_irq(void)
 	 * DT is not unflatten so we can't use DT APIs before
 	 * init_irq
 	 */
-	exynos_map_pmu();
+	if (!of_machine_is_compatible("samsung,exynos5440"))
+		exynos_map_pmu();
 }
 
 static void __init exynos_dt_machine_init(void)
-- 
2.2.0
