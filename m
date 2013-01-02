From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 02/26] cpufreq: exynos: cleanup exynos-cpufreq header
Date: Wed, 02 Jan 2013 14:23:39 -0800
Message-ID: <1357165443-3716-3-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41046 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367Ab3ABWYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:24:39 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000B7VRKLFV10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:38 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:38 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c                                   |    4 ++--
 .../include/mach/cpufreq.h => drivers/cpufreq/exynos-cpufreq.h     |    3 +--
 drivers/cpufreq/exynos4210-cpufreq.c                               |    3 ++-
 drivers/cpufreq/exynos4x12-cpufreq.c                               |    3 ++-
 drivers/cpufreq/exynos5250-cpufreq.c                               |    3 ++-
 5 files changed, 9 insertions(+), 7 deletions(-)
 rename arch/arm/mach-exynos/include/mach/cpufreq.h => drivers/cpufreq/exynos-cpufreq.h (94%)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 7012ea8..caf638b 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -18,10 +18,10 @@
 #include <linux/cpufreq.h>
 #include <linux/suspend.h>
 
-#include <mach/cpufreq.h>
-
 #include <plat/cpu.h>
 
+#include "exynos-cpufreq.h"
+
 static struct exynos_dvfs_info *exynos_info;
 
 static struct regulator *arm_regulator;
diff --git a/arch/arm/mach-exynos/include/mach/cpufreq.h b/drivers/cpufreq/exynos-cpufreq.h
similarity index 94%
rename from arch/arm/mach-exynos/include/mach/cpufreq.h
rename to drivers/cpufreq/exynos-cpufreq.h
index 7517c3f..25c748b 100644
--- a/arch/arm/mach-exynos/include/mach/cpufreq.h
+++ b/drivers/cpufreq/exynos-cpufreq.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/mach-exynos/include/mach/cpufreq.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index fb148fa..a5d0a81 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -18,7 +18,8 @@
 #include <linux/cpufreq.h>
 
 #include <mach/regs-clock.h>
-#include <mach/cpufreq.h>
+
+#include "exynos-cpufreq.h"
 
 #define CPUFREQ_LEVEL_END	L5
 
diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c b/drivers/cpufreq/exynos4x12-cpufreq.c
index 8c5a7af..63ff74e 100644
--- a/drivers/cpufreq/exynos4x12-cpufreq.c
+++ b/drivers/cpufreq/exynos4x12-cpufreq.c
@@ -18,7 +18,8 @@
 #include <linux/cpufreq.h>
 
 #include <mach/regs-clock.h>
-#include <mach/cpufreq.h>
+
+#include "exynos-cpufreq.h"
 
 #define CPUFREQ_LEVEL_END	(L13 + 1)
 
diff --git a/drivers/cpufreq/exynos5250-cpufreq.c b/drivers/cpufreq/exynos5250-cpufreq.c
index e64c253..407126c 100644
--- a/drivers/cpufreq/exynos5250-cpufreq.c
+++ b/drivers/cpufreq/exynos5250-cpufreq.c
@@ -19,7 +19,8 @@
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/cpufreq.h>
+
+#include "exynos-cpufreq.h"
 
 #define CPUFREQ_LEVEL_END	(L15 + 1)
 
-- 
1.7.10.4
