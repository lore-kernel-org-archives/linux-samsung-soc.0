From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 07/10] thermal/exynos: remove unnecessary header inclusions
Date: Thu, 11 Apr 2013 23:37:22 +0200
Message-ID: <1365716245-99231-8-git-send-email-arnd@arndb.de>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:59819 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab3DKVhm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 17:37:42 -0400
In-Reply-To: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Zhang Rui <rui.zhang@intel.com>

In multiplatform configurations, we cannot include headers
provided by only the exynos platform. Fortunately a number
of drivers that include those headers do not actually need
them, so we can just remove the inclusions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Eduardo Valentin <eduardo.valentin@ti.com>
Cc: Zhang Rui <rui.zhang@intel.com>
---
 drivers/thermal/exynos_thermal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/exynos_thermal.c b/drivers/thermal/exynos_thermal.c
index 46568c0..b777ae6 100644
--- a/drivers/thermal/exynos_thermal.c
+++ b/drivers/thermal/exynos_thermal.c
@@ -39,8 +39,6 @@
 #include <linux/cpu_cooling.h>
 #include <linux/of.h>
 
-#include <plat/cpu.h>
-
 /* Exynos generic registers */
 #define EXYNOS_TMU_REG_TRIMINFO		0x0
 #define EXYNOS_TMU_REG_CONTROL		0x20
-- 
1.8.1.2
