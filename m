From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/4] EXYNOS4210: Change CPU table and divider
Date: Tue,  5 Jul 2011 17:06:17 +0900
Message-ID: <1309853179-19438-3-git-send-email-kgene.kim@samsung.com>
References: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com, Jongpill Lee <boyko.lee@samsung.com>, SangWook Ju <sw.ju@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jongpill Lee <boyko.lee@samsung.com>

This patch adds support 1.2GHz CPU frequency and changes
CPU table and divider for stable working.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: SangWook Ju <sw.ju@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |   69 ++++++++++++++++++++--------------
 1 files changed, 41 insertions(+), 28 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index 28b3d53..0a9ef1a 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -35,14 +35,15 @@ static struct regulator *arm_regulator;
 static struct cpufreq_freqs freqs;
 
 enum cpufreq_level_index {
-	L0, L1, L2, L3, CPUFREQ_LEVEL_END,
+	L0, L1, L2, L3, L4, CPUFREQ_LEVEL_END,
 };
 
 static struct cpufreq_frequency_table exynos4_freq_table[] = {
-	{L0, 1000*1000},
-	{L1, 800*1000},
-	{L2, 400*1000},
-	{L3, 100*1000},
+	{L0, 1200*1000},
+	{L1, 1000*1000},
+	{L2, 800*1000},
+	{L3, 500*1000},
+	{L4, 200*1000},
 	{0, CPUFREQ_TABLE_END},
 };
 
@@ -53,17 +54,20 @@ static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END][7] = {
 	 *		DIVATB, DIVPCLK_DBG, DIVAPLL }
 	 */
 
-	/* ARM L0: 1000MHz */
-	{ 0, 3, 7, 3, 3, 0, 1 },
+	/* ARM L0: 1200MHz */
+	{ 0, 3, 7, 3, 4, 1, 7 },
 
-	/* ARM L1: 800MHz */
-	{ 0, 3, 7, 3, 3, 0, 1 },
+	/* ARM L1: 1000MHz */
+	{ 0, 3, 7, 3, 4, 1, 7 },
 
-	/* ARM L2: 400MHz */
-	{ 0, 1, 3, 1, 3, 0, 1 },
+	/* ARM L2: 800MHz */
+	{ 0, 3, 7, 3, 3, 1, 7 },
 
-	/* ARM L3: 100MHz */
-	{ 0, 0, 1, 0, 3, 1, 1 },
+	/* ARM L3: 500MHz */
+	{ 0, 3, 7, 3, 3, 1, 7 },
+
+	/* ARM L4: 200MHz */
+	{ 0, 1, 3, 1, 3, 1, 0 },
 };
 
 static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
@@ -72,16 +76,19 @@ static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
 	 * { DIVCOPY, DIVHPM }
 	 */
 
-	 /* ARM L0: 1000MHz */
-	{ 3, 0 },
+	 /* ARM L0: 1200MHz */
+	{ 5, 0 },
+
+	/* ARM L1: 1000MHz */
+	{ 4, 0 },
 
-	/* ARM L1: 800MHz */
+	/* ARM L2: 800MHz */
 	{ 3, 0 },
 
-	/* ARM L2: 400MHz */
+	/* ARM L3: 500MHz */
 	{ 3, 0 },
 
-	/* ARM L3: 100MHz */
+	/* ARM L4: 200MHz */
 	{ 3, 0 },
 };
 
@@ -93,31 +100,37 @@ struct cpufreq_voltage_table {
 static struct cpufreq_voltage_table exynos4_volt_table[CPUFREQ_LEVEL_END] = {
 	{
 		.index		= L0,
-		.arm_volt	= 1200000,
+		.arm_volt	= 1350000,
 	}, {
 		.index		= L1,
-		.arm_volt	= 1100000,
+		.arm_volt	= 1300000,
 	}, {
 		.index		= L2,
-		.arm_volt	= 1000000,
+		.arm_volt	= 1200000,
 	}, {
 		.index		= L3,
-		.arm_volt	= 900000,
+		.arm_volt	= 1100000,
+	}, {
+		.index		= L4,
+		.arm_volt	= 1050000,
 	},
 };
 
 static unsigned int exynos4_apll_pms_table[CPUFREQ_LEVEL_END] = {
-	/* APLL FOUT L0: 1000MHz */
+	/* APLL FOUT L0: 1200MHz */
+	((150 << 16) | (3 << 8) | 1),
+
+	/* APLL FOUT L1: 1000MHz */
 	((250 << 16) | (6 << 8) | 1),
 
-	/* APLL FOUT L1: 800MHz */
+	/* APLL FOUT L2: 800MHz */
 	((200 << 16) | (6 << 8) | 1),
 
-	/* APLL FOUT L2 : 400MHz */
-	((200 << 16) | (6 << 8) | 2),
+	/* APLL FOUT L3: 500MHz */
+	((250 << 16) | (6 << 8) | 2),
 
-	/* APLL FOUT L3: 100MHz */
-	((200 << 16) | (6 << 8) | 4),
+	/* APLL FOUT L4: 200MHz */
+	((200 << 16) | (6 << 8) | 3),
 };
 
 int exynos4_verify_speed(struct cpufreq_policy *policy)
-- 
1.7.1

