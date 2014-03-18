From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 3/6] ARM: EXYNOS: Fix compilation error in cpuidle.c
Date: Tue, 18 Mar 2014 18:16:01 +0100
Message-ID: <1395162964-5916-3-git-send-email-t.figa@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44998 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756657AbaCRRQg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:16:36 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N00FKV6NA7V90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:16:22 +0000 (GMT)
In-reply-to: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>

The big series refactoring Exynos suspend to RAM handling missed the
cpuidle driver that is disabled in exynos_defconfig, leaving it
including old mach/pm_core.h header and using old s3c_cpu_resume symbol
instead of new exynos_cpu_resume, resulting in compilation failures with
CONFIG_ARCH_EXYNOS and CONFIG_CPU_IDLE enabled.

This patch fixes that silly mistake and performs necessary modification
to arhc/arm/exynos/cpuidle.c to make it compile again.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index f57cb91..b530231 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -26,7 +26,6 @@
 #include <plat/cpu.h>
 #include <plat/pm.h>
 
-#include <mach/pm-core.h>
 #include <mach/map.h>
 
 #include "common.h"
@@ -127,7 +126,7 @@ static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
 	/* Set value of power down register for aftr mode */
 	exynos_sys_powerdown_conf(SYS_AFTR);
 
-	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
+	__raw_writel(virt_to_phys(exynos_cpu_resume), REG_DIRECTGO_ADDR);
 	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
 
 	save_cpu_arch_register();
-- 
1.9.0
