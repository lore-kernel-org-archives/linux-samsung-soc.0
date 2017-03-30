From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v9 11/12] ARM: EXYNOS: move cpu_restart as a SoC specific
 hook to exynos_cpu_info
Date: Thu, 30 Mar 2017 18:47:05 +0530
Message-ID: <1490879826-16754-12-git-send-email-pankaj.dubey@samsung.com>
References: <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <CGME20170330131442epcas5p4f2be72cb3ec506847d8e832675e682c4@epcas5p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42585 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933498AbdC3NOv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 09:14:51 -0400
In-reply-to: <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, javier@osg.samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

To handle differences in cpu_restart functionality among various Exynos SoC
let's move cpu_restart as a SoC specific function hook to exynos_cpu_info.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 6f08b15..af9332c 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -39,11 +39,13 @@ extern void exynos4_secondary_startup(void);
  * @cpu_boot_reg: computes cpu boot address for requested cpu
  * @cpu_power_down: handles cpu power down routine for requested cpu
  * @cpu_power_up: handles cpu power up routine for requested cpu
+ * @cpu_restart: handles cpu restart routine for requested cpu
  */
 struct exynos_cpu_info {
 	void __iomem* (*cpu_boot_reg)(u32 cpu);
 	void (*cpu_power_down)(u32 cpu);
 	void (*cpu_power_up)(u32 cpu);
+	void (*cpu_restart)(u32 cpu);
 };
 
 static const struct exynos_cpu_info *cpu_info;
@@ -252,16 +254,19 @@ static inline void __iomem *cpu_boot_reg(int cpu)
 }
 
 /*
- * Set wake up by local power mode and execute software reset for given core.
- *
+ * exynos_core_restart : restart the specified cpu
+ * @core_id : the cpu to be restarted
  * Currently this is needed only when booting secondary CPU on Exynos3250.
  */
 void exynos_core_restart(u32 core_id)
 {
-	u32 val;
+	if (cpu_info && cpu_info->cpu_restart)
+		cpu_info->cpu_restart(core_id);
+}
 
-	if (!of_machine_is_compatible("samsung,exynos3250"))
-		return;
+static void exynos3250_core_restart(u32 core_id)
+{
+	u32 val;
 
 	while (!pmu_raw_readl(S5P_PMU_SPARE2))
 		udelay(10);
@@ -362,6 +367,7 @@ static const struct exynos_cpu_info exynos3250_cpu_info = {
 	.cpu_boot_reg = exynos_common_cpu_boot_reg,
 	.cpu_power_down = exynos_common_cpu_power_down,
 	.cpu_power_up = exynos3250_cpu_power_up,
+	.cpu_restart = exynos3250_core_restart,
 };
 
 static const struct exynos_cpu_info exynos5420_cpu_info = {
-- 
2.7.4
