From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v5 3/5] arm: exynos: Add generic cluster power control functions
Date: Mon,  5 May 2014 21:56:59 +0530
Message-ID: <1399307221-8659-4-git-send-email-a.kesavan@samsung.com>
References: <1399307221-8659-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:42456 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753713AbaEEQ1m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 12:27:42 -0400
In-Reply-To: <1399307221-8659-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nicolas.pitre@linaro.org, Dave.Martin@arm.com, lorenzo.pieralisi@arm.com, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, abrestic@chromium.org, thomas.ab@samsung.com, inderpal.s@samsung.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org

Add generic cluster power control functions for exynos based SoCS
for cluster power up/down and to know the cluster status.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos/common.h   |    3 +++
 arch/arm/mach-exynos/pm.c       |   30 ++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h |    6 ++++++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index a7dbb5f..03b8bb2 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -66,5 +66,8 @@ extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
 extern void exynos_cpu_powerdown(int cpu);
 extern void exynos_cpu_powerup(int cpu);
 extern int  exynos_cpu_power_state(int cpu);
+extern void exynos_cluster_powerdown(int cluster);
+extern void exynos_cluster_powerup(int cluster);
+extern int  exynos_cluster_power_state(int cluster);
 
 #endif /* __ARCH_ARM_MACH_EXYNOS_COMMON_H */
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 6651028..f02d864 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -136,6 +136,36 @@ int exynos_cpu_power_state(int cpu)
 			S5P_CORE_LOCAL_PWR_EN);
 }
 
+/**
+ * exynos_common_powerdown : power down the specified cluster
+ * @cluster : the cluster to power down
+ */
+void exynos_cluster_powerdown(int cluster)
+{
+	__raw_writel(0, EXYNOS_COMMON_CONFIGURATION(cluster));
+}
+
+/**
+ * exynos_cluster_powerup : power up the specified cluster
+ * @cluster : the cluster to power up
+ */
+void exynos_cluster_powerup(int cluster)
+{
+	__raw_writel(S5P_CORE_LOCAL_PWR_EN,
+		     EXYNOS_COMMON_CONFIGURATION(cluster));
+}
+
+/**
+ * exynos_cluster_power_state : returns the power state of the cluster
+ * @cluster : the cluster to retrieve the power state from
+ *
+ */
+int exynos_cluster_power_state(int cluster)
+{
+	return (__raw_readl(EXYNOS_COMMON_STATUS(cluster)) &
+			S5P_CORE_LOCAL_PWR_EN);
+}
+
 /* For Cortex-A9 Diagnostic and Power control register */
 static unsigned int save_arm_register[2];
 
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 0bdfcbc..6685ebf 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -127,6 +127,12 @@
 #define EXYNOS_ARM_CORE_STATUS(_nr)		\
 			(EXYNOS_ARM_CORE_CONFIGURATION(_nr) + 0x4)
 
+#define EXYNOS_ARM_COMMON_CONFIGURATION		S5P_PMUREG(0x2500)
+#define EXYNOS_COMMON_CONFIGURATION(_nr)	\
+			(EXYNOS_ARM_COMMON_CONFIGURATION + (0x80 * (_nr)))
+#define EXYNOS_COMMON_STATUS(_nr)		\
+			(EXYNOS_COMMON_CONFIGURATION(_nr) + 0x4)
+
 /* Only for EXYNOS4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	S5P_PMUREG(0x1154)
 #define S5P_CMU_RESET_LCD1_LOWPWR	S5P_PMUREG(0x1174)
-- 
1.7.9.5
