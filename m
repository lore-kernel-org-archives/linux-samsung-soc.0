From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v2 4/4] ARM: exynos: extend cpuidle support to midas boards
Date: Thu, 14 Dec 2017 23:50:15 +1100
Message-ID: <20171214125015.2611-5-simon@lineageos.org>
References: <20171214125015.2611-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:38065 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752346AbdLNMvX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 07:51:23 -0500
In-Reply-To: <20171214125015.2611-1-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Simon Shields <simon@lineageos.org>

Exynos4412 can only use cpuidle when running under a compatible
bootloader/firmware. The midas family of boards, including trats2,
have such a firmware, so allow them to use cpuidle.

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 arch/arm/mach-exynos/exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 9a9caac1125a..bfd119d7b63f 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -196,7 +196,7 @@ static void __init exynos_dt_machine_init(void)
 #endif
 	if (of_machine_is_compatible("samsung,exynos4210") ||
 	    (of_machine_is_compatible("samsung,exynos4412") &&
-	     of_machine_is_compatible("samsung,trats2")) ||
+	     of_machine_is_compatible("samsung,midas")) ||
 	    of_machine_is_compatible("samsung,exynos3250") ||
 	    of_machine_is_compatible("samsung,exynos5250"))
 		platform_device_register(&exynos_cpuidle);
-- 
2.15.1
