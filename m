From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: EXYNOS: Add secure firmware support for Exynos5420
Date: Wed, 18 Dec 2013 13:38:11 +0530
Message-ID: <1387354092-4084-2-git-send-email-sachin.kamat@linaro.org>
References: <1387354092-4084-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61624 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258Ab3LRIL0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 03:11:26 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so8098765pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 00:11:25 -0800 (PST)
In-Reply-To: <1387354092-4084-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org

Secure firmware support for booting secondary CPUs on Exynos5420
based boards with trustzone support.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/firmware.c        |    6 +++++-
 arch/arm/mach-exynos/mach-exynos5-dt.c |    1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 932129ef26c6..4711f29b331d 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -17,6 +17,7 @@
 #include <asm/firmware.h>
 
 #include <mach/map.h>
+#include <plat/cpu.h>
 
 #include "smc.h"
 
@@ -34,7 +35,10 @@ static int exynos_cpu_boot(int cpu)
 
 static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 {
-	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
+	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
+
+	if (!soc_is_exynos5420())
+		boot_reg += 4 * cpu;
 
 	__raw_writel(boot_addr, boot_reg);
 	return 0;
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 5bf767fec19d..4c071d50bf35 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -76,6 +76,7 @@ DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
 	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
 	.smp		= smp_ops(exynos_smp_ops),
 	.map_io		= exynos_init_io,
+	.init_early	= exynos_firmware_init,
 	.init_machine	= exynos5_dt_machine_init,
 	.init_late	= exynos_init_late,
 	.dt_compat	= exynos5_dt_compat,
-- 
1.7.9.5
