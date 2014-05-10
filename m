From: y@samsung.com
Subject: [PATCH v3 4/6] ARM:  EXYNOS: Remove unused header inclusion from
 hotplug.c
Date: Sat, 10 May 2014 16:18:05 +0900
Message-ID: <1399706287-13919-5-git-send-email-y@samsung.com>
References: <1399706287-13919-1-git-send-email-y@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1399706287-13919-1-git-send-email-y@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, arnd@arndb.de, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Pankaj Dubey <pankaj.dubey@samsung.com>

This patch removed "plat/cpu.h" inclusion from hotplug.c as it
is not required.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/hotplug.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
index 0243ef3..5e19601 100644
--- a/arch/arm/mach-exynos/hotplug.c
+++ b/arch/arm/mach-exynos/hotplug.c
@@ -19,8 +19,6 @@
 #include <asm/cp15.h>
 #include <asm/smp_plat.h>
 
-#include <plat/cpu.h>
-
 #include "common.h"
 #include "regs-pmu.h"
 
-- 
1.7.10.4
