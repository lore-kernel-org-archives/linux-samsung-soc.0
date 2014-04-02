From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 04/10] ARM: EXYNOS: Remove regs-pmu.h file dependency from
 pm_domain
Date: Wed, 02 Apr 2014 16:50:55 +0900
Message-ID: <1396425058-4012-5-git-send-email-pankaj.dubey@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14709 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758000AbaDBHeC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 03:34:02 -0400
In-reply-to: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, Young-Gun Jang <yg1004.jang@samsung.com>

From: Young-Gun Jang <yg1004.jang@samsung.com>

Current "pm_domain.c" file uses "S5P_INT_LOCAL_PWR_EN" definition from
"regs-pmu.h" and hence needs to include this header file. As there is
no other user of "S5P_INT_LOCAL_PWR_EN" definition other than pm_domain,
to remove "regs-pmu.h" header file dependency from "pm_domain.c"  it's
better we define this definition in "pm_domain.c" file itself and thus it
will help in removing header file inclusion from "pm_domain.c".

Signed-off-by: Young-Gun Jang <yg1004.jang@samsung.com>
---
 arch/arm/mach-exynos/pm_domains.c |    2 +-
 arch/arm/mach-exynos/regs-pmu.h   |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index fe6570e..f676b0a 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -22,7 +22,7 @@
 #include <linux/of_platform.h>
 #include <linux/sched.h>
 
-#include "regs-pmu.h"
+#define S5P_INT_LOCAL_PWR_EN 0x7
 
 /*
  * Exynos specific wrapper around the generic power domain
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 4ee706d..bfebe84 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -116,7 +116,6 @@
 #define S5P_PAD_RET_EBIB_OPTION			S5P_PMUREG(0x31A8)
 
 #define S5P_CORE_LOCAL_PWR_EN			0x3
-#define S5P_INT_LOCAL_PWR_EN			0x7
 
 #define S5P_CHECK_SLEEP				0x00000BAD
 
-- 
1.7.10.4
