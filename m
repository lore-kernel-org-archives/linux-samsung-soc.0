From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v4 4/4] ARM: exynos: extend cpuidle support to midas boards
Date: Wed, 17 Jan 2018 23:58:45 +1100
Message-ID: <20180117125845.3954-5-simon@lineageos.org>
References: <20180117125845.3954-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38883 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752925AbeAQM7f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 07:59:35 -0500
In-Reply-To: <20180117125845.3954-1-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Simon Shields <simon@lineageos.org>

Exynos4412 can only use cpuidle when running under a compatible
bootloader/firmware. The midas family of boards, including trats2,
have such a firmware, so allow them to use cpuidle.

Leave the trats2 check there in order to preserve the ABI.

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 arch/arm/mach-exynos/exynos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 9a9caac1125a..4ee60e31ea48 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -196,7 +196,8 @@ static void __init exynos_dt_machine_init(void)
 #endif
 	if (of_machine_is_compatible("samsung,exynos4210") ||
 	    (of_machine_is_compatible("samsung,exynos4412") &&
-	     of_machine_is_compatible("samsung,trats2")) ||
+	     (of_machine_is_compatible("samsung,trats2") ||
+		  of_machine_is_compatible("samsung,midas"))) ||
 	    of_machine_is_compatible("samsung,exynos3250") ||
 	    of_machine_is_compatible("samsung,exynos5250"))
 		platform_device_register(&exynos_cpuidle);
-- 
2.15.1
