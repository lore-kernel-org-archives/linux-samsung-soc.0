From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] ARM: Drop fixed 200 Hz timer requirement from Samsung platforms
Date: Fri, 18 Nov 2016 09:16:58 +0200
Message-ID: <1479453418-25314-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751139AbcKRHRa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 02:17:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

All Samsung platforms, including the Exynos, are selecting HZ_FIXED with
200 Hz.  Unfortunately in case of multiplatform image this affects also
other platforms when Exynos is enabled.

This looks like an very old legacy code, dating back to initial
upstreaming of S3C24xx.  Probably it was required for s3c24xx timer
driver, which was removed in commit ad38bdd15d5b ("ARM: SAMSUNG: Remove
unused plat-samsung/time.c").

Since then, this fixed 200 Hz spread everywhere, including out-of-tree
Samsung kernels (SoC vendor's and Tizen's).  I believe this choice
was rather an effect of coincidence instead of conscious choice.

Exynos uses its own MCT or arch timer and can work with all HZ values.
Older platforms use newer Samsung PWM timer driver which should handle
down to 100 Hz.

Few perf mem and sched tests on Odroid XU3 board (Exynos5422, 4x Cortex
A7, 4x Cortex A15) show no regressions when switching from 200 Hz to
other values.

Reported-by: Lee Jones <lee.jones@linaro.org>
[Dropping 200_HZ from S3C/S5P suggested by Arnd]
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Tested on Exynos5422 and Exynos5800 (by Javier). It would be
appreciated if anyone could test it on S3C24xx or S5PV210.

Changes since v1:
1. Add Javier's tested-by.
2. Drop HZ_FIXED also from ARCH_S5PV210 and ARCH_S3C24XX after Arnd
   suggestions and analysis.
---
 arch/arm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b5d529fdffab..ced2e08a9d08 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1496,8 +1496,7 @@ source kernel/Kconfig.preempt
 
 config HZ_FIXED
 	int
-	default 200 if ARCH_EBSA110 || ARCH_S3C24XX || \
-		ARCH_S5PV210 || ARCH_EXYNOS4
+	default 200 if ARCH_EBSA110
 	default 128 if SOC_AT91RM9200
 	default 0
 
-- 
2.7.4
