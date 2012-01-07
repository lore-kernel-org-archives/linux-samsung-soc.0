From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH RE-SEND 2/2] [CPUFREQ] EXYNOS: Removed useless headers and codes
Date: Sat, 07 Jan 2012 20:18:39 +0900
Message-ID: <00f701cccd2e$1b019520$5104bf60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13602 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab2AGLSm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jan 2012 06:18:42 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: 'Dave Jones' <davej@redhat.com>, jc.lee@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Jaecheol Lee <jc.lee@samsung.com>

This patch removes no referencing header files and cleaned up
useless code.

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c     |    8 +-------
 drivers/cpufreq/exynos4210-cpufreq.c |   14 +-------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 24e4dd4..5467879 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -9,7 +9,6 @@
  * published by the Free Software Foundation.
 */
 
-#include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/err.h>
 #include <linux/clk.h>
@@ -18,15 +17,10 @@
 #include <linux/regulator/consumer.h>
 #include <linux/cpufreq.h>
 #include <linux/suspend.h>
-#include <linux/reboot.h>
 
-#include <mach/map.h>
-#include <mach/regs-clock.h>
-#include <mach/regs-mem.h>
 #include <mach/cpufreq.h>
 
-#include <plat/clock.h>
-#include <plat/pm.h>
+#include <plat/cpu.h>
 
 static struct exynos_dvfs_info *exynos_info;
 
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index 6bc4ada..065da5b 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -9,25 +9,17 @@
  * published by the Free Software Foundation.
 */
 
-#include <linux/types.h>
+#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/regulator/consumer.h>
 #include <linux/cpufreq.h>
-#include <linux/notifier.h>
-#include <linux/suspend.h>
 
-#include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/regs-mem.h>
 #include <mach/cpufreq.h>
 
-#include <plat/clock.h>
-#include <plat/pm.h>
-
 #define CPUFREQ_LEVEL_END	L5
 
 static int max_support_idx = L0;
@@ -38,10 +30,6 @@ static struct clk *moutcore;
 static struct clk *mout_mpll;
 static struct clk *mout_apll;
 
-static struct regulator *arm_regulator;
-
-static struct cpufreq_freqs freqs;
-
 struct cpufreq_clkdiv {
 	unsigned int index;
 	unsigned int clkdiv;
-- 
1.7.1
