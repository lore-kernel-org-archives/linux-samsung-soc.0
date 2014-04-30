From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 10/12] ARM: EXYNOS: Move "mach/map.h" inclusion from
 regs-pmu.h to platsmp.c
Date: Wed, 30 Apr 2014 14:17:35 +0900
Message-ID: <1398835057-3860-11-git-send-email-pankaj.dubey@samsung.com>
References: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63379 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755841AbaD3E7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 00:59:45 -0400
In-reply-to: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As we have removed static mappings from "regs-pmu.h" it does not
need map.h anymore. But "platsmp.c" needed this and till now it
got included indirectly. So lets move header inclusion of
"mach/map.h" from "regs-pmu.h" to "platsmp.c".

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c  |    1 +
 arch/arm/mach-exynos/regs-pmu.h |    2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 375ea4e..8f3b866 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -27,6 +27,7 @@
 #include <asm/firmware.h>
 
 #include <plat/cpu.h>
+#include <mach/map.h>
 
 #include "common.h"
 #include "regs-pmu.h"
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index a72b1bc..1d83c7e 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -12,8 +12,6 @@
 #ifndef __ASM_ARCH_REGS_PMU_H
 #define __ASM_ARCH_REGS_PMU_H __FILE__
 
-#include <mach/map.h>
-
 #define S5P_CENTRAL_SEQ_CONFIGURATION		0x0200
 
 #define S5P_CENTRAL_LOWPWR_CFG			(1 << 16)
-- 
1.7.10.4
