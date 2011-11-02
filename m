From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/5] EXYNOS4210: Add support ASV feature
Date: Wed, 02 Nov 2011 21:43:17 +0900
Message-ID: <005801cc995c$fee5dd60$fcb19820$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com, 'Jaecheol Lee' <jc.lee@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jaecheol Lee <jc.lee@samsung.com>

This patch adds support ASV on Exynos4210. Exynos4 CPUFREQ
driver uses Adaptive Supply Voltage to configure voltage table.

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/cpufreq.h |    7 +++
 drivers/cpufreq/exynos4210-cpufreq.c         |   76
+++++++++++++++++---------
 2 files changed, 57 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/cpufreq.h
b/arch/arm/mach-exynos4/include/mach/cpufreq.h
index 7e00931..16bb3e9 100644
--- a/arch/arm/mach-exynos4/include/mach/cpufreq.h
+++ b/arch/arm/mach-exynos4/include/mach/cpufreq.h
@@ -37,3 +37,10 @@ enum cpufreq_lock_ID {
 int exynos4_cpufreq_lock(unsigned int nId,
 			enum cpufreq_level_request cpufreq_level);
 void exynos4_cpufreq_lock_free(unsigned int nId);
+
+#define SUPPORT_1400MHZ		(1 << 31)
+#define SUPPORT_1200MHZ		(1 << 30)
+#define SUPPORT_1000MHZ		(1 << 29)
+
+#define SUPPORT_FREQ_SHIFT	29
+#define SUPPORT_FREQ_MASK	7
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
b/drivers/cpufreq/exynos4210-cpufreq.c
index 30e1949..8dcd9b1 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -60,6 +60,8 @@ static struct cpufreq_frequency_table exynos4_freq_table[]
= {
 	{0, CPUFREQ_TABLE_END},
 };
 
+static unsigned int exynos4_volt_table[CPUFREQ_LEVEL_END];
+
 /* This defines are for cpufreq lock */
 #define CPUFREQ_MIN_LEVEL	(CPUFREQ_LEVEL_END - 1)
 unsigned int cpufreq_lock_id;
@@ -111,30 +113,6 @@ static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] =
{
 	{ 3, 0 },
 };
 
-struct cpufreq_voltage_table {
-	unsigned int	index;		/* any */
-	unsigned int	arm_volt;	/* uV */
-};
-
-static struct cpufreq_voltage_table exynos4_volt_table[CPUFREQ_LEVEL_END] =
{
-	{
-		.index		= L0,
-		.arm_volt	= 1350000,
-	}, {
-		.index		= L1,
-		.arm_volt	= 1300000,
-	}, {
-		.index		= L2,
-		.arm_volt	= 1200000,
-	}, {
-		.index		= L3,
-		.arm_volt	= 1100000,
-	}, {
-		.index		= L4,
-		.arm_volt	= 1050000,
-	},
-};
-
 static unsigned int exynos4_apll_pms_table[CPUFREQ_LEVEL_END] = {
 	/* APLL FOUT L0: 1200MHz */
 	((150 << 16) | (3 << 8) | 1),
@@ -152,6 +130,26 @@ static unsigned int
exynos4_apll_pms_table[CPUFREQ_LEVEL_END] = {
 	((200 << 16) | (6 << 8) | 3),
 };
 
+/*
+ * ASV group voltage table
+ */
+static const unsigned int asv_voltage[CPUFREQ_LEVEL_END][8] = {
+	/*
+	 *	   SS, A1, A2, B1, B2, C1, C2, D
+	 * @1200 :
+	 * @1000 :
+	 * @800	 :	ASV_VOLTAGE_TABLE
+	 * @500  :
+	 * @200  :
+	 */
+	{ 1350000, 1350000, 1300000, 1275000, 1250000, 1225000, 1200000,
1175000 },
+	{ 1300000, 1250000, 1200000, 1175000, 1150000, 1125000, 1100000,
1075000 },
+	{ 1200000, 1150000, 1100000, 1075000, 1050000, 1025000, 1000000,
975000 },
+	{ 1100000, 1050000, 1000000, 975000, 975000, 950000, 925000, 925000
},
+	{ 1050000, 1000000, 975000, 950000, 950000, 925000, 925000, 925000
},
+
+};
+
 static int exynos4_verify_speed(struct cpufreq_policy *policy)
 {
 	return cpufreq_frequency_table_verify(policy, exynos4_freq_table);
@@ -312,7 +310,7 @@ static int exynos4_target(struct cpufreq_policy *policy,
 	}
 
 	/* get the voltage value */
-	arm_volt = exynos4_volt_table[index].arm_volt;
+	arm_volt = exynos4_volt_table[index];
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
@@ -392,7 +390,7 @@ int exynos4_cpufreq_lock(unsigned int id,
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
 		/* get the voltage value */
-		arm_volt = exynos4_volt_table[cpufreq_level].arm_volt;
+		arm_volt = exynos4_volt_table[cpufreq_level];
 		regulator_set_voltage(arm_regulator, arm_volt,
 				arm_volt);
 
@@ -518,11 +516,37 @@ static struct cpufreq_driver exynos4_driver = {
 #endif
 };
 
+static void __init set_volt_table(void)
+{
+	unsigned int tmp, i, asv_group = 0;
+
+	tmp = __raw_readl(S5P_INFORM2);
+
+	switch (tmp  & (SUPPORT_FREQ_MASK << SUPPORT_FREQ_SHIFT)) {
+	case SUPPORT_1200MHZ:
+		asv_group = (tmp & 0xF);
+		break;
+	case SUPPORT_1400MHZ:
+	case SUPPORT_1000MHZ:
+	default:
+		/* Not supported and assign typical ASV group */
+		asv_group = 2;
+		break;
+	}
+
+	printk(KERN_INFO "DVFS: VDD_ARM Voltage table set with %d Group\n",
asv_group);
+
+	for (i = 0 ; i < CPUFREQ_LEVEL_END ; i++)
+		exynos4_volt_table[i] = asv_voltage[i][asv_group];
+}
+
 static int __init exynos4_cpufreq_init(void)
 {
 	int i;
 	unsigned int tmp;
 
+	set_volt_table();
+
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
-- 
1.7.1

