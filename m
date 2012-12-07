From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH 3/5] cpufreq: exynos: Use APLL_FREQ macro for cpu divider value
Date: Fri, 07 Dec 2012 17:20:19 +0900
Message-ID: <009101cdd453$b1f15650$15d402f0$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18379 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753784Ab2LGIUV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Dec 2012 03:20:21 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEN00AFUJ5B8QQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Dec 2012 17:20:20 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MEN00F1SJ5S2960@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Dec 2012 17:20:19 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos/include/mach/cpufreq.h |   16 ++
 drivers/cpufreq/exynos4210-cpufreq.c        |  135 ++--------
 drivers/cpufreq/exynos4x12-cpufreq.c        |  378
++++-----------------------
 drivers/cpufreq/exynos5250-cpufreq.c        |  168 +++---------
 4 files changed, 136 insertions(+), 561 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/cpufreq.h
b/arch/arm/mach-exynos/include/mach/cpufreq.h
index 39f0dc6..ddde0d8 100644
--- a/arch/arm/mach-exynos/include/mach/cpufreq.h
+++ b/arch/arm/mach-exynos/include/mach/cpufreq.h
@@ -18,6 +18,22 @@ enum cpufreq_level_index {
        L20,
 };

+#define APLL_FREQ(f, a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, m, p, s)
\
+       {
\
+               .freq = (f) * 1000,
\
+               .clk_div_cpu0 = ((a0) | (a1) << 4 | (a2) << 8 | (a3) << 12 |
\
+                       (a4) << 16 | (a5) << 20 | (a6) << 24 | (a7) << 28),
\
+               .clk_div_cpu1 = (b0 << 0 | b1 << 4 | b2 << 8),
\
+               .mps = ((m) << 16 | (p) << 8 | (s)),
\
+       }
+
+struct apll_freq {
+       unsigned int freq;
+       u32 clk_div_cpu0;
+       u32 clk_div_cpu1;
+       u32 mps;
+};
+
 struct exynos_dvfs_info {
        unsigned long   mpll_freq_khz;
        unsigned int    pll_safe_idx;
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
b/drivers/cpufreq/exynos4210-cpufreq.c
index 5ae5c52..250dcf0 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -20,94 +20,37 @@
 #include <mach/regs-clock.h>
 #include <mach/cpufreq.h>

-#define CPUFREQ_LEVEL_END      L5
-
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
 static struct clk *mout_apll;

-struct cpufreq_clkdiv {
-       unsigned int index;
-       unsigned int clkdiv;
-};
-
-static unsigned int exynos4210_volt_table[CPUFREQ_LEVEL_END] = {
+static unsigned int exynos4210_volt_table[] = {
        1250000, 1150000, 1050000, 975000, 950000,
 };

-
-static struct cpufreq_clkdiv exynos4210_clkdiv_table[CPUFREQ_LEVEL_END];
-
 static struct cpufreq_frequency_table exynos4210_freq_table[] = {
-       {L0, 1200*1000},
-       {L1, 1000*1000},
-       {L2, 800*1000},
-       {L3, 500*1000},
-       {L4, 200*1000},
+       {L0, 1200 * 1000},
+       {L1, 1000 * 1000},
+       {L2,  800 * 1000},
 
77,1          Top
+       {L1, 1000 * 1000},
+       {L2,  800 * 1000},
+       {L3,  500 * 1000},
+       {L4,  200 * 1000},
        {0, CPUFREQ_TABLE_END},
 };

-static unsigned int clkdiv_cpu0[CPUFREQ_LEVEL_END][7] = {
+static struct apll_freq apll_freq_4210[] = {
        /*
-        * Clock divider value for following
-        * { DIVCORE, DIVCOREM0, DIVCOREM1, DIVPERIPH,
-        *              DIVATB, DIVPCLK_DBG, DIVAPLL }
+        * values:
+        * freq
+        * clock divider for CORE, COREM0, COREM1, PERIPH, ATB, PCLK_DBG,
APLL, RESERVED
+        * clock divider for COPY, HPM, RESERVED
+        * PLL M, P, S
         */
-
-       /* ARM L0: 1200MHz */
-       { 0, 3, 7, 3, 4, 1, 7 },
-
-       /* ARM L1: 1000MHz */
-       { 0, 3, 7, 3, 4, 1, 7 },
-
-       /* ARM L2: 800MHz */
-       { 0, 3, 7, 3, 3, 1, 7 },
-
-       /* ARM L3: 500MHz */
-       { 0, 3, 7, 3, 3, 1, 7 },
-
-       /* ARM L4: 200MHz */
-       { 0, 1, 3, 1, 3, 1, 0 },
-};
-
-static unsigned int clkdiv_cpu1[CPUFREQ_LEVEL_END][2] = {
-       /*
-        * Clock divider value for following
-        * { DIVCOPY, DIVHPM }
-        */
-
-       /* ARM L0: 1200MHz */
-       { 5, 0 },
-
-       /* ARM L1: 1000MHz */
-       { 4, 0 },
-
-       /* ARM L2: 800MHz */
-       { 3, 0 },
-
-       /* ARM L3: 500MHz */
-       { 3, 0 },
-
-       /* ARM L4: 200MHz */
-       { 3, 0 },
-};
-
-static unsigned int exynos4210_apll_pms_table[CPUFREQ_LEVEL_END] = {
-       /* APLL FOUT L0: 1200MHz */
-       ((150 << 16) | (3 << 8) | 1),
-
-       /* APLL FOUT L1: 1000MHz */
-       ((250 << 16) | (6 << 8) | 1),
-
-       /* APLL FOUT L2: 800MHz */
-       ((200 << 16) | (6 << 8) | 1),
-
-       /* APLL FOUT L3: 500MHz */
-       ((250 << 16) | (6 << 8) | 2),
-
-       /* APLL FOUT L4: 200MHz */
-       ((200 << 16) | (6 << 8) | 3),
+       APLL_FREQ(1200, 0, 3, 7, 3, 4, 1, 7, 0, 5, 0, 0, 150, 3, 1),
+       APLL_FREQ(1000, 0, 3, 7, 3, 4, 1, 7, 0, 4, 0, 0, 250, 6, 1),
+       APLL_FREQ(800,  0, 3, 7, 3, 3, 1, 7, 0, 3, 0, 0, 200, 6, 1),
+       APLL_FREQ(500,  0, 3, 7, 3, 3, 1, 7, 0, 3, 0, 0, 250, 6, 2),
 
76,1           8%
+       APLL_FREQ(800,  0, 3, 7, 3, 3, 1, 7, 0, 3, 0, 0, 200, 6, 1),
+       APLL_FREQ(500,  0, 3, 7, 3, 3, 1, 7, 0, 3, 0, 0, 250, 6, 2),
+       APLL_FREQ(200,  0, 1, 3, 1, 3, 1, 0, 0, 3, 0, 0, 200, 6, 3),
 };

 static void exynos4210_set_clkdiv(unsigned int div_index)
@@ -116,7 +59,7 @@ static void exynos4210_set_clkdiv(unsigned int div_index)

        /* Change Divider - CPU0 */

-       tmp = exynos4210_clkdiv_table[div_index].clkdiv;
+       tmp = apll_freq_4210[div_index].clk_div_cpu0;

        __raw_writel(tmp, EXYNOS4_CLKDIV_CPU);

@@ -126,12 +69,7 @@ static void exynos4210_set_clkdiv(unsigned int
div_index)

        /* Change Divider - CPU1 */

-       tmp = __raw_readl(EXYNOS4_CLKDIV_CPU1);
-
-       tmp &= ~((0x7 << 4) | 0x7);
-
-       tmp |= ((clkdiv_cpu1[div_index][0] << 4) |
-               (clkdiv_cpu1[div_index][1] << 0));
+       tmp = apll_freq_4210[div_index].clk_div_cpu1;

        __raw_writel(tmp, EXYNOS4_CLKDIV_CPU1);

@@ -159,7 +97,7 @@ static void exynos4210_set_apll(unsigned int index)
        /* 3. Change PLL PMS values */
        tmp = __raw_readl(EXYNOS4_APLL_CON0);
        tmp &= ~((0x3ff << 16) | (0x3f << 8) | (0x7 << 0));
-       tmp |= exynos4210_apll_pms_table[index];
+       tmp |= apll_freq_4210[index].mps;
        __raw_writel(tmp, EXYNOS4_APLL_CON0);

        /* 4. wait_lock_time */
@@ -178,8 +116,8 @@ static void exynos4210_set_apll(unsigned int index)

 bool exynos4210_pms_change(unsigned int old_index, unsigned int new_index)
 {
-       unsigned int old_pm = (exynos4210_apll_pms_table[old_index] >> 8);
-       unsigned int new_pm = (exynos4210_apll_pms_table[new_index] >> 8);
+       unsigned int old_pm = apll_freq_4210[old_index].mps >> 8;
+       unsigned int new_pm = apll_freq_4210[new_index].mps >> 8;

        return (old_pm == new_pm) ? 0 : 1;
 }
@@ -197,7 +135,7 @@ static void exynos4210_set_frequency(unsigned int
old_index,
                        /* 2. Change just s value in apll m,p,s value */
                        tmp = __raw_readl(EXYNOS4_APLL_CON0);
                        tmp &= ~(0x7 << 0);
-                       tmp |= (exynos4210_apll_pms_table[new_index] & 0x7);
+                       tmp |= apll_freq_4210[new_index].mps & 0x7;
                        __raw_writel(tmp, EXYNOS4_APLL_CON0);
                } else {
                        /* Clock Configuration Procedure */
@@ -211,7 +149,7 @@ static void exynos4210_set_frequency(unsigned int
old_index,
                        /* 1. Change just s value in apll m,p,s value */
                        tmp = __raw_readl(EXYNOS4_APLL_CON0);
                        tmp &= ~(0x7 << 0);
-                       tmp |= (exynos4210_apll_pms_table[new_index] & 0x7);
+                       tmp |= apll_freq_4210[new_index].mps & 0x7;
                        __raw_writel(tmp, EXYNOS4_APLL_CON0);

                        /* 2. Change the system clock divider values */
@@ -228,8 +166,6 @@ static void exynos4210_set_frequency(unsigned int
old_index,

 int exynos4210_cpufreq_init(struct exynos_dvfs_info *info)
 {
-       int i;
-       unsigned int tmp;
        unsigned long rate;

        cpu_clk = clk_get(NULL, "armclk");
@@ -250,29 +186,8 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info
*info)
 
151,1         16%
        cpu_clk = clk_get(NULL, "armclk");
@@ -250,29 +186,8 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info
*info)
        if (IS_ERR(mout_apll))
                goto err_mout_apll;

-       tmp = __raw_readl(EXYNOS4_CLKDIV_CPU);
-
-       for (i = L0; i <  CPUFREQ_LEVEL_END; i++) {
-               tmp &= ~(EXYNOS4_CLKDIV_CPU0_CORE_MASK |
-                       EXYNOS4_CLKDIV_CPU0_COREM0_MASK |
-                       EXYNOS4_CLKDIV_CPU0_COREM1_MASK |
-                       EXYNOS4_CLKDIV_CPU0_PERIPH_MASK |
-                       EXYNOS4_CLKDIV_CPU0_ATB_MASK |
-                       EXYNOS4_CLKDIV_CPU0_PCLKDBG_MASK |
-                       EXYNOS4_CLKDIV_CPU0_APLL_MASK);
-
-               tmp |= ((clkdiv_cpu0[i][0] <<
EXYNOS4_CLKDIV_CPU0_CORE_SHIFT) |
-                       (clkdiv_cpu0[i][1] <<
EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT) |
-                       (clkdiv_cpu0[i][2] <<
EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT) |
-                       (clkdiv_cpu0[i][3] <<
EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT) |
-                       (clkdiv_cpu0[i][4] << EXYNOS4_CLKDIV_CPU0_ATB_SHIFT)
|
-                       (clkdiv_cpu0[i][5] <<
EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT) |
-                       (clkdiv_cpu0[i][6] <<
EXYNOS4_CLKDIV_CPU0_APLL_SHIFT));
-
-               exynos4210_clkdiv_table[i].clkdiv = tmp;
-       }
-
        info->mpll_freq_khz = rate;
+       /* 800Mhz */
        info->pll_safe_idx = L2;
        info->cpu_clk = cpu_clk;
        info->volt_table = exynos4210_volt_table;
diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c
b/drivers/cpufreq/exynos4x12-cpufreq.c
index 29b41ab..224445d 100644
--- a/drivers/cpufreq/exynos4x12-cpufreq.c
+++ b/drivers/cpufreq/exynos4x12-cpufreq.c
@@ -20,23 +20,18 @@
 #include <mach/regs-clock.h>
 #include <mach/cpufreq.h>

-#define CPUFREQ_LEVEL_END      (L13 + 1)
-
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
 static struct clk *mout_apll;

-struct cpufreq_clkdiv {
-       unsigned int    index;
-       unsigned int    clkdiv;
-       unsigned int    clkdiv1;
+static unsigned int exynos4x12_volt_table[] = {
+       1350000, 1287500, 1250000, 1187500, 1137500, 1087500, 1037500,
+       1000000,  987500,  975000,  950000,  925000,  900000,  900000
 };

-static unsigned int exynos4x12_volt_table[CPUFREQ_LEVEL_END];
-
 static struct cpufreq_frequency_table exynos4x12_freq_table[] = {
-       {L0, 1500 * 1000},
+       {L0, CPUFREQ_ENTRY_INVALID},
        {L1, 1400 * 1000},
        {L2, 1300 * 1000},
        {L3, 1200 * 1000},
@@ -53,247 +48,54 @@ static struct cpufreq_frequency_table
exynos4x12_freq_table[] = {
        {0, CPUFREQ_TABLE_END},
 };

-static struct cpufreq_clkdiv exynos4x12_clkdiv_table[CPUFREQ_LEVEL_END];
+static struct apll_freq *apll_freq_4x12;

-static unsigned int clkdiv_cpu0_4212[CPUFREQ_LEVEL_END][8] = {
+static struct apll_freq apll_freq_4212[] = {
        /*
-        * Clock divider value for following
-        * { DIVCORE, DIVCOREM0, DIVCOREM1, DIVPERIPH,
-        *              DIVATB, DIVPCLK_DBG, DIVAPLL, DIVCORE2 }
 
226,3-9       24%
-        * { DIVCORE, DIVCOREM0, DIVCOREM1, DIVPERIPH,
-        *              DIVATB, DIVPCLK_DBG, DIVAPLL, DIVCORE2 }
+        * values:
+        * freq
+        * clock divider for CORE, COREM0, COREM1, PERIPH, ATB, PCLK_DBG,
APLL, CORE2
+        * clock divider for COPY, HPM, RESERVED
+        * PLL M, P, S
         */
-       /* ARM L0: 1500 MHz */
-       { 0, 3, 7, 0, 6, 1, 2, 0 },
-
-       /* ARM L1: 1400 MHz */
-       { 0, 3, 7, 0, 6, 1, 2, 0 },
-
-       /* ARM L2: 1300 MHz */
-       { 0, 3, 7, 0, 5, 1, 2, 0 },
-
-       /* ARM L3: 1200 MHz */
-       { 0, 3, 7, 0, 5, 1, 2, 0 },
-
-       /* ARM L4: 1100 MHz */
-       { 0, 3, 6, 0, 4, 1, 2, 0 },
-
-       /* ARM L5: 1000 MHz */
-       { 0, 2, 5, 0, 4, 1, 1, 0 },
-
-       /* ARM L6: 900 MHz */
-       { 0, 2, 5, 0, 3, 1, 1, 0 },
-
-       /* ARM L7: 800 MHz */
-       { 0, 2, 5, 0, 3, 1, 1, 0 },
-
-       /* ARM L8: 700 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L9: 600 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L10: 500 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L11: 400 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L12: 300 MHz */
-       { 0, 2, 4, 0, 2, 1, 1, 0 },
-
-       /* ARM L13: 200 MHz */
-       { 0, 1, 3, 0, 1, 1, 1, 0 },
+       APLL_FREQ(1500, 0, 3, 7, 0, 6, 1, 2, 0, 6, 2, 0, 250, 4, 0),
+       APLL_FREQ(1400, 0, 3, 7, 0, 6, 1, 2, 0, 6, 2, 0, 175, 3, 0),
+       APLL_FREQ(1300, 0, 3, 7, 0, 5, 1, 2, 0, 5, 2, 0, 325, 6, 0),
+       APLL_FREQ(1200, 0, 3, 7, 0, 5, 1, 2, 0, 5, 2, 0, 200, 4, 0),
+       APLL_FREQ(1100, 0, 3, 6, 0, 4, 1, 2, 0, 4, 2, 0, 275, 6, 0),
+       APLL_FREQ(1000, 0, 2, 5, 0, 4, 1, 1, 0, 4, 2, 0, 125, 3, 0),
+       APLL_FREQ(900,  0, 2, 5, 0, 3, 1, 1, 0, 3, 2, 0, 150, 4, 0),
+       APLL_FREQ(800,  0, 2, 5, 0, 3, 1, 1, 0, 3, 2, 0, 100, 3, 0),
+       APLL_FREQ(700,  0, 2, 4, 0, 3, 1, 1, 0, 3, 2, 0, 175, 3, 1),
+       APLL_FREQ(600,  0, 2, 4, 0, 3, 1, 1, 0, 3, 2, 0, 200, 4, 1),
+       APLL_FREQ(500,  0, 2, 4, 0, 3, 1, 1, 0, 3, 2, 0, 125, 3, 1),
+       APLL_FREQ(400,  0, 2, 4, 0, 3, 1, 1, 0, 3, 2, 0, 100, 3, 1),
+       APLL_FREQ(300,  0, 2, 4, 0, 2, 1, 1, 0, 3, 2, 0, 200, 4, 2),
+       APLL_FREQ(200,  0, 1, 3, 0, 1, 1, 1, 0, 3, 2, 0, 100, 3, 2),
 };

-static unsigned int clkdiv_cpu0_4412[CPUFREQ_LEVEL_END][8] = {
+static struct apll_freq apll_freq_4412[] = {
        /*
-        * Clock divider value for following
-        * { DIVCORE, DIVCOREM0, DIVCOREM1, DIVPERIPH,
-        *              DIVATB, DIVPCLK_DBG, DIVAPLL, DIVCORE2 }
+        * values:
+        * freq
+        * clock divider for CORE, COREM0, COREM1, PERIPH, ATB, PCLK_DBG,
APLL, CORE2
+        * clock divider for COPY, HPM, CORES
+        * PLL M, P, S
         */
 
301,1         32%
+        * PLL M, P, S
         */
-       /* ARM L0: 1500 MHz */
-       { 0, 3, 7, 0, 6, 1, 2, 0 },
-
-       /* ARM L1: 1400 MHz */
-       { 0, 3, 7, 0, 6, 1, 2, 0 },
-
-       /* ARM L2: 1300 MHz */
-       { 0, 3, 7, 0, 5, 1, 2, 0 },
-
-       /* ARM L3: 1200 MHz */
-       { 0, 3, 7, 0, 5, 1, 2, 0 },
-
-       /* ARM L4: 1100 MHz */
-       { 0, 3, 6, 0, 4, 1, 2, 0 },
-
-       /* ARM L5: 1000 MHz */
-       { 0, 2, 5, 0, 4, 1, 1, 0 },
-
-       /* ARM L6: 900 MHz */
-       { 0, 2, 5, 0, 3, 1, 1, 0 },
-
-       /* ARM L7: 800 MHz */
-       { 0, 2, 5, 0, 3, 1, 1, 0 },
-
-       /* ARM L8: 700 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L9: 600 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L10: 500 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L11: 400 MHz */
-       { 0, 2, 4, 0, 3, 1, 1, 0 },
-
-       /* ARM L12: 300 MHz */
-       { 0, 2, 4, 0, 2, 1, 1, 0 },
-
-       /* ARM L13: 200 MHz */
-       { 0, 1, 3, 0, 1, 1, 1, 0 },
-};
-
-static unsigned int clkdiv_cpu1_4212[CPUFREQ_LEVEL_END][2] = {
-       /* Clock divider value for following
-        * { DIVCOPY, DIVHPM }
-        */
-       /* ARM L0: 1500 MHz */
-       { 6, 0 },
-
-       /* ARM L1: 1400 MHz */
-       { 6, 0 },
-
-       /* ARM L2: 1300 MHz */
-       { 5, 0 },
-
-       /* ARM L3: 1200 MHz */
-       { 5, 0 },
-
-       /* ARM L4: 1100 MHz */
-       { 4, 0 },
-
-       /* ARM L5: 1000 MHz */
-       { 4, 0 },
-
-       /* ARM L6: 900 MHz */
-       { 3, 0 },
-
-       /* ARM L7: 800 MHz */
-       { 3, 0 },
-
-       /* ARM L8: 700 MHz */
-       { 3, 0 },
-
-       /* ARM L9: 600 MHz */
 
376,1         40%
-
-       /* ARM L9: 600 MHz */
-       { 3, 0 },
-
-       /* ARM L10: 500 MHz */
-       { 3, 0 },
-
-       /* ARM L11: 400 MHz */
-       { 3, 0 },
-
-       /* ARM L12: 300 MHz */
-       { 3, 0 },
-
-       /* ARM L13: 200 MHz */
-       { 3, 0 },
-};
-
-static unsigned int clkdiv_cpu1_4412[CPUFREQ_LEVEL_END][3] = {
-       /* Clock divider value for following
-        * { DIVCOPY, DIVHPM, DIVCORES }
-        */
-       /* ARM L0: 1500 MHz */
-       { 6, 0, 7 },
-
-       /* ARM L1: 1400 MHz */
-       { 6, 0, 6 },
-
-       /* ARM L2: 1300 MHz */
-       { 5, 0, 6 },
-
-       /* ARM L3: 1200 MHz */
-       { 5, 0, 5 },
-
-       /* ARM L4: 1100 MHz */
-       { 4, 0, 5 },
-
-       /* ARM L5: 1000 MHz */
-       { 4, 0, 4 },
-
-       /* ARM L6: 900 MHz */
-       { 3, 0, 4 },
-
-       /* ARM L7: 800 MHz */
-       { 3, 0, 3 },
-
-       /* ARM L8: 700 MHz */
-       { 3, 0, 3 },
-
-       /* ARM L9: 600 MHz */
-       { 3, 0, 2 },
-
-       /* ARM L10: 500 MHz */
-       { 3, 0, 2 },
-
-       /* ARM L11: 400 MHz */
-       { 3, 0, 1 },
-
-       /* ARM L12: 300 MHz */
-       { 3, 0, 1 },
-
-       /* ARM L13: 200 MHz */
-       { 3, 0, 0 },
-};
-
-static unsigned int exynos4x12_apll_pms_table[CPUFREQ_LEVEL_END] = {
-       /* APLL FOUT L0: 1500 MHz */
-       ((250 << 16) | (4 << 8) | (0x0)),
-
-       /* APLL FOUT L1: 1400 MHz */
-       ((175 << 16) | (3 << 8) | (0x0)),
-
-       /* APLL FOUT L2: 1300 MHz */
-       ((325 << 16) | (6 << 8) | (0x0)),
-
-       /* APLL FOUT L3: 1200 MHz */
-       ((200 << 16) | (4 << 8) | (0x0)),
-
 
451,1         48%
-       ((200 << 16) | (4 << 8) | (0x0)),
-
-       /* APLL FOUT L4: 1100 MHz */
-       ((275 << 16) | (6 << 8) | (0x0)),
-
-       /* APLL FOUT L5: 1000 MHz */
-       ((125 << 16) | (3 << 8) | (0x0)),
-
-       /* APLL FOUT L6: 900 MHz */
-       ((150 << 16) | (4 << 8) | (0x0)),
-
-       /* APLL FOUT L7: 800 MHz */
-       ((100 << 16) | (3 << 8) | (0x0)),
-
-       /* APLL FOUT L8: 700 MHz */
-       ((175 << 16) | (3 << 8) | (0x1)),
-
-       /* APLL FOUT L9: 600 MHz */
-       ((200 << 16) | (4 << 8) | (0x1)),
-
-       /* APLL FOUT L10: 500 MHz */
-       ((125 << 16) | (3 << 8) | (0x1)),
-
-       /* APLL FOUT L11 400 MHz */
-       ((100 << 16) | (3 << 8) | (0x1)),
-
-       /* APLL FOUT L12: 300 MHz */
-       ((200 << 16) | (4 << 8) | (0x2)),
-
-       /* APLL FOUT L13: 200 MHz */
-       ((100 << 16) | (3 << 8) | (0x2)),
-};
-
-static const unsigned int asv_voltage_4x12[CPUFREQ_LEVEL_END] = {
-       1350000, 1287500, 1250000, 1187500, 1137500, 1087500, 1037500,
-       1000000,  987500,  975000,  950000,  925000,  900000,  900000
+       APLL_FREQ(1500, 0, 3, 7, 0, 6, 1, 2, 0, 6, 0, 7, 250, 4, 0),
+       APLL_FREQ(1400, 0, 3, 7, 0, 6, 1, 2, 0, 6, 0, 6, 175, 3, 0),
+       APLL_FREQ(1300, 0, 3, 7, 0, 5, 1, 2, 0, 5, 0, 6, 325, 6, 0),
+       APLL_FREQ(1200, 0, 3, 7, 0, 5, 1, 2, 0, 5, 0, 5, 200, 4, 0),
+       APLL_FREQ(1100, 0, 3, 6, 0, 4, 1, 2, 0, 4, 0, 5, 275, 6, 0),
+       APLL_FREQ(1000, 0, 2, 5, 0, 4, 1, 1, 0, 4, 0, 4, 125, 3, 0),
+       APLL_FREQ(900,  0, 2, 5, 0, 3, 1, 1, 0, 3, 0, 4, 150, 4, 0),
+       APLL_FREQ(800,  0, 2, 5, 0, 3, 1, 1, 0, 3, 0, 3, 100, 3, 0),
+       APLL_FREQ(700,  0, 2, 4, 0, 3, 1, 1, 0, 3, 0, 3, 175, 3, 1),
+       APLL_FREQ(600,  0, 2, 4, 0, 3, 1, 1, 0, 3, 0, 2, 200, 4, 1),
+       APLL_FREQ(500,  0, 2, 4, 0, 3, 1, 1, 0, 3, 0, 2, 125, 3, 1),
+       APLL_FREQ(400,  0, 2, 4, 0, 3, 1, 1, 0, 3, 0, 1, 100, 3, 1),
+       APLL_FREQ(300,  0, 2, 4, 0, 2, 1, 1, 0, 3, 0, 1, 200, 4, 2),
+       APLL_FREQ(200,  0, 1, 3, 0, 1, 1, 1, 0, 3, 0, 0, 100, 3, 2),
 };

 static void exynos4x12_set_clkdiv(unsigned int div_index)
@@ -303,7 +105,7 @@ static void exynos4x12_set_clkdiv(unsigned int
div_index)

        /* Change Divider - CPU0 */

-       tmp = exynos4x12_clkdiv_table[div_index].clkdiv;
+       tmp = apll_freq_4x12[div_index].clk_div_cpu0;

        __raw_writel(tmp, EXYNOS4_CLKDIV_CPU);

@@ -311,7 +113,7 @@ static void exynos4x12_set_clkdiv(unsigned int
div_index)
                cpu_relax();

        /* Change Divider - CPU1 */
-       tmp = exynos4x12_clkdiv_table[div_index].clkdiv1;
+       tmp = apll_freq_4x12[div_index].clk_div_cpu1;

        __raw_writel(tmp, EXYNOS4_CLKDIV_CPU1);
        if (soc_is_exynos4212())
@@ -338,14 +140,14 @@ static void exynos4x12_set_apll(unsigned int index)
        } while (tmp != 0x2);

        /* 2. Set APLL Lock time */
-       pdiv = ((exynos4x12_apll_pms_table[index] >> 8) & 0x3f);
+       pdiv = ((apll_freq_4x12[index].mps >> 8) & 0x3f);
 
526,1         56%
-       pdiv = ((exynos4x12_apll_pms_table[index] >> 8) & 0x3f);
+       pdiv = ((apll_freq_4x12[index].mps >> 8) & 0x3f);

        __raw_writel((pdiv * 250), EXYNOS4_APLL_LOCK);

        /* 3. Change PLL PMS values */
        tmp = __raw_readl(EXYNOS4_APLL_CON0);
        tmp &= ~((0x3ff << 16) | (0x3f << 8) | (0x7 << 0));
-       tmp |= exynos4x12_apll_pms_table[index];
+       tmp |= apll_freq_4x12[index].mps;
        __raw_writel(tmp, EXYNOS4_APLL_CON0);

        /* 4. wait_lock_time */
@@ -366,8 +168,8 @@ static void exynos4x12_set_apll(unsigned int index)

 bool exynos4x12_pms_change(unsigned int old_index, unsigned int new_index)
 {
-       unsigned int old_pm = exynos4x12_apll_pms_table[old_index] >> 8;
-       unsigned int new_pm = exynos4x12_apll_pms_table[new_index] >> 8;
+       unsigned int old_pm = apll_freq_4x12[old_index].mps >> 8;
+       unsigned int new_pm = apll_freq_4x12[new_index].mps >> 8;

        return (old_pm == new_pm) ? 0 : 1;
 }
@@ -384,7 +186,7 @@ static void exynos4x12_set_frequency(unsigned int
old_index,
                        /* 2. Change just s value in apll m,p,s value */
                        tmp = __raw_readl(EXYNOS4_APLL_CON0);
                        tmp &= ~(0x7 << 0);
-                       tmp |= (exynos4x12_apll_pms_table[new_index] & 0x7);
+                       tmp |= apll_freq_4x12[new_index].mps & 0x7;
                        __raw_writel(tmp, EXYNOS4_APLL_CON0);

                } else {
@@ -399,7 +201,7 @@ static void exynos4x12_set_frequency(unsigned int
old_index,
                        /* 1. Change just s value in apll m,p,s value */
                        tmp = __raw_readl(EXYNOS4_APLL_CON0);
                        tmp &= ~(0x7 << 0);
-                       tmp |= (exynos4x12_apll_pms_table[new_index] & 0x7);
+                       tmp |= apll_freq_4x12[new_index].mps & 0x7;
                        __raw_writel(tmp, EXYNOS4_APLL_CON0);
                        /* 2. Change the system clock divider values */
                        exynos4x12_set_clkdiv(new_index);
@@ -413,25 +215,10 @@ static void exynos4x12_set_frequency(unsigned int
old_index,
        }
 }

-static void __init set_volt_table(void)
-{
-       unsigned int i;
-
-       /* Not supported */
-       exynos4x12_freq_table[L0].frequency = CPUFREQ_ENTRY_INVALID;
-
-       for (i = 0 ; i < CPUFREQ_LEVEL_END ; i++)
-               exynos4x12_volt_table[i] = asv_voltage_4x12[i];
-}
-
 int exynos4x12_cpufreq_init(struct exynos_dvfs_info *info)
 {
-       int i;
-       unsigned int tmp;
        unsigned long rate;

-       set_volt_table();
-
        cpu_clk = clk_get(NULL, "armclk");
        if (IS_ERR(cpu_clk))
                return PTR_ERR(cpu_clk);
@@ -450,62 +237,13 @@ int exynos4x12_cpufreq_init(struct exynos_dvfs_info
*info)
        if (IS_ERR(mout_apll))
                goto err_mout_apll;

-       for (i = L0; i <  CPUFREQ_LEVEL_END; i++) {
-
-               exynos4x12_clkdiv_table[i].index = i;
-
-               tmp = __raw_readl(EXYNOS4_CLKDIV_CPU);
 
601,1         64%
-
-               tmp = __raw_readl(EXYNOS4_CLKDIV_CPU);
-
-               tmp &= ~(EXYNOS4_CLKDIV_CPU0_CORE_MASK |
-                       EXYNOS4_CLKDIV_CPU0_COREM0_MASK |
-                       EXYNOS4_CLKDIV_CPU0_COREM1_MASK |
-                       EXYNOS4_CLKDIV_CPU0_PERIPH_MASK |
-                       EXYNOS4_CLKDIV_CPU0_ATB_MASK |
-                       EXYNOS4_CLKDIV_CPU0_PCLKDBG_MASK |
-                       EXYNOS4_CLKDIV_CPU0_APLL_MASK);
-
-               if (soc_is_exynos4212()) {
-                       tmp |= ((clkdiv_cpu0_4212[i][0] <<
EXYNOS4_CLKDIV_CPU0_CORE_SHIFT) |
-                               (clkdiv_cpu0_4212[i][1] <<
EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT) |
-                               (clkdiv_cpu0_4212[i][2] <<
EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT) |
-                               (clkdiv_cpu0_4212[i][3] <<
EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT) |
-                               (clkdiv_cpu0_4212[i][4] <<
EXYNOS4_CLKDIV_CPU0_ATB_SHIFT) |
-                               (clkdiv_cpu0_4212[i][5] <<
EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT) |
-                               (clkdiv_cpu0_4212[i][6] <<
EXYNOS4_CLKDIV_CPU0_APLL_SHIFT));
-               } else {
-                       tmp &= ~EXYNOS4_CLKDIV_CPU0_CORE2_MASK;
-
-                       tmp |= ((clkdiv_cpu0_4412[i][0] <<
EXYNOS4_CLKDIV_CPU0_CORE_SHIFT) |
-                               (clkdiv_cpu0_4412[i][1] <<
EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT) |
-                               (clkdiv_cpu0_4412[i][2] <<
EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT) |
-                               (clkdiv_cpu0_4412[i][3] <<
EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT) |
-                               (clkdiv_cpu0_4412[i][4] <<
EXYNOS4_CLKDIV_CPU0_ATB_SHIFT) |
-                               (clkdiv_cpu0_4412[i][5] <<
EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT) |
-                               (clkdiv_cpu0_4412[i][6] <<
EXYNOS4_CLKDIV_CPU0_APLL_SHIFT) |
-                               (clkdiv_cpu0_4412[i][7] <<
EXYNOS4_CLKDIV_CPU0_CORE2_SHIFT));
-               }
-
-               exynos4x12_clkdiv_table[i].clkdiv = tmp;
-
-               tmp = __raw_readl(EXYNOS4_CLKDIV_CPU1);
-
-               if (soc_is_exynos4212()) {
-                       tmp &= ~(EXYNOS4_CLKDIV_CPU1_COPY_MASK |
-                               EXYNOS4_CLKDIV_CPU1_HPM_MASK);
-                       tmp |= ((clkdiv_cpu1_4212[i][0] <<
EXYNOS4_CLKDIV_CPU1_COPY_SHIFT) |
-                               (clkdiv_cpu1_4212[i][1] <<
EXYNOS4_CLKDIV_CPU1_HPM_SHIFT));
-               } else {
-                       tmp &= ~(EXYNOS4_CLKDIV_CPU1_COPY_MASK |
-                               EXYNOS4_CLKDIV_CPU1_HPM_MASK |
-                               EXYNOS4_CLKDIV_CPU1_CORES_MASK);
-                       tmp |= ((clkdiv_cpu1_4412[i][0] <<
EXYNOS4_CLKDIV_CPU1_COPY_SHIFT) |
-                               (clkdiv_cpu1_4412[i][1] <<
EXYNOS4_CLKDIV_CPU1_HPM_SHIFT) |
-                               (clkdiv_cpu1_4412[i][2] <<
EXYNOS4_CLKDIV_CPU1_CORES_SHIFT));
-               }
-               exynos4x12_clkdiv_table[i].clkdiv1 = tmp;
-       }
+       if (soc_is_exynos4212())
+               apll_freq_4x12 = apll_freq_4212;
+       else
+               apll_freq_4x12 = apll_freq_4412;

        info->mpll_freq_khz = rate;
+       /* 800Mhz */
        info->pll_safe_idx = L7;
        info->cpu_clk = cpu_clk;
        info->volt_table = exynos4x12_volt_table;
diff --git a/drivers/cpufreq/exynos5250-cpufreq.c
b/drivers/cpufreq/exynos5250-cpufreq.c
index 8a5d733..736a5cf 100644
--- a/drivers/cpufreq/exynos5250-cpufreq.c
+++ b/drivers/cpufreq/exynos5250-cpufreq.c
@@ -21,21 +21,18 @@
 #include <mach/regs-clock.h>
 #include <mach/cpufreq.h>

-#define CPUFREQ_LEVEL_END      (L15 + 1)
-
 static struct clk *cpu_clk;
 static struct clk *moutcore;
 static struct clk *mout_mpll;
 static struct clk *mout_apll;

-struct cpufreq_clkdiv {
 
676,1         72%

-struct cpufreq_clkdiv {
-       unsigned int    index;
-       unsigned int    clkdiv;
-       unsigned int    clkdiv1;
+static unsigned int exynos5250_volt_table[] = {
+       1300000, 1250000, 1225000, 1200000, 1150000,
+       1125000, 1100000, 1075000, 1050000, 1025000,
+       1012500, 1000000,  975000,  950000,  937500,
+       925000
 };

-static unsigned int exynos5250_volt_table[CPUFREQ_LEVEL_END];
-
 static struct cpufreq_frequency_table exynos5250_freq_table[] = {
        {L0, 1700 * 1000},
        {L1, 1600 * 1000},
@@ -45,8 +42,8 @@ static struct cpufreq_frequency_table
exynos5250_freq_table[] = {
        {L5, 1200 * 1000},
        {L6, 1100 * 1000},
        {L7, 1000 * 1000},
-       {L8, 900 * 1000},
-       {L9, 800 * 1000},
+       {L8,  900 * 1000},
+       {L9,  800 * 1000},
        {L10, 700 * 1000},
        {L11, 600 * 1000},
        {L12, 500 * 1000},
@@ -56,78 +53,30 @@ static struct cpufreq_frequency_table
exynos5250_freq_table[] = {
        {0, CPUFREQ_TABLE_END},
 };

-static struct cpufreq_clkdiv exynos5250_clkdiv_table[CPUFREQ_LEVEL_END];
-
-static unsigned int clkdiv_cpu0_5250[CPUFREQ_LEVEL_END][8] = {
+static struct apll_freq apll_freq_5250[] = {
        /*
-        * Clock divider value for following
-        * { ARM, CPUD, ACP, PERIPH, ATB, PCLK_DBG, APLL, ARM2 }
-        */
-       { 0, 3, 7, 7, 7, 3, 5, 0 },     /* 1700 MHz */
-       { 0, 3, 7, 7, 7, 1, 4, 0 },     /* 1600 MHz */
-       { 0, 2, 7, 7, 7, 1, 4, 0 },     /* 1500 MHz */
-       { 0, 2, 7, 7, 6, 1, 4, 0 },     /* 1400 MHz */
-       { 0, 2, 7, 7, 6, 1, 3, 0 },     /* 1300 MHz */
-       { 0, 2, 7, 7, 5, 1, 3, 0 },     /* 1200 MHz */
-       { 0, 3, 7, 7, 5, 1, 3, 0 },     /* 1100 MHz */
-       { 0, 1, 7, 7, 4, 1, 2, 0 },     /* 1000 MHz */
-       { 0, 1, 7, 7, 4, 1, 2, 0 },     /* 900 MHz */
-       { 0, 1, 7, 7, 4, 1, 2, 0 },     /* 800 MHz */
-       { 0, 1, 7, 7, 3, 1, 1, 0 },     /* 700 MHz */
-       { 0, 1, 7, 7, 3, 1, 1, 0 },     /* 600 MHz */
-       { 0, 1, 7, 7, 2, 1, 1, 0 },     /* 500 MHz */
-       { 0, 1, 7, 7, 2, 1, 1, 0 },     /* 400 MHz */
-       { 0, 1, 7, 7, 1, 1, 1, 0 },     /* 300 MHz */
-       { 0, 1, 7, 7, 1, 1, 1, 0 },     /* 200 MHz */
-};
-
-static unsigned int clkdiv_cpu1_5250[CPUFREQ_LEVEL_END][2] = {
-       /* Clock divider value for following
-        * { COPY, HPM }
+        * values:
+        * freq
+        * clock divider for ARM, CPUD, ACP, PERIPH, ATB, PCLK_DBG, APLL,
ARM2
+        * clock divider for COPY, HPM, RESERVED
+        * PLL M, P, S
         */
-       { 0, 2 },       /* 1700 MHz */
-       { 0, 2 },       /* 1600 MHz */
-       { 0, 2 },       /* 1500 MHz */
-       { 0, 2 },       /* 1400 MHz */
-       { 0, 2 },       /* 1300 MHz */
-       { 0, 2 },       /* 1200 MHz */
-       { 0, 2 },       /* 1100 MHz */
-       { 0, 2 },       /* 1000 MHz */
-       { 0, 2 },       /* 900 MHz */
-       { 0, 2 },       /* 800 MHz */
 
751,1         80%
-       { 0, 2 },       /* 900 MHz */
-       { 0, 2 },       /* 800 MHz */
-       { 0, 2 },       /* 700 MHz */
-       { 0, 2 },       /* 600 MHz */
-       { 0, 2 },       /* 500 MHz */
-       { 0, 2 },       /* 400 MHz */
-       { 0, 2 },       /* 300 MHz */
-       { 0, 2 },       /* 200 MHz */
-};
-
-static unsigned int exynos5_apll_pms_table[CPUFREQ_LEVEL_END] = {
-       ((425 << 16) | (6 << 8) | 0),   /* 1700 MHz */
-       ((200 << 16) | (3 << 8) | 0),   /* 1600 MHz */
-       ((250 << 16) | (4 << 8) | 0),   /* 1500 MHz */
-       ((175 << 16) | (3 << 8) | 0),   /* 1400 MHz */
-       ((325 << 16) | (6 << 8) | 0),   /* 1300 MHz */
-       ((200 << 16) | (4 << 8) | 0),   /* 1200 MHz */
-       ((275 << 16) | (6 << 8) | 0),   /* 1100 MHz */
-       ((125 << 16) | (3 << 8) | 0),   /* 1000 MHz */
-       ((150 << 16) | (4 << 8) | 0),   /* 900 MHz */
-       ((100 << 16) | (3 << 8) | 0),   /* 800 MHz */
-       ((175 << 16) | (3 << 8) | 1),   /* 700 MHz */
-       ((200 << 16) | (4 << 8) | 1),   /* 600 MHz */
-       ((125 << 16) | (3 << 8) | 1),   /* 500 MHz */
-       ((100 << 16) | (3 << 8) | 1),   /* 400 MHz */
-       ((200 << 16) | (4 << 8) | 2),   /* 300 MHz */
-       ((100 << 16) | (3 << 8) | 2),   /* 200 MHz */
-};
-
-/* ASV group voltage table */
-static const unsigned int asv_voltage_5250[CPUFREQ_LEVEL_END] = {
-       1300000, 1250000, 1225000, 1200000, 1150000,
-       1125000, 1100000, 1075000, 1050000, 1025000,
-       1012500, 1000000,  975000,  950000,  937500,
-       925000
+       APLL_FREQ(1700, 0, 3, 7, 7, 7, 3, 5, 0, 0, 2, 0, 425, 6, 0),
+       APLL_FREQ(1600, 0, 3, 7, 7, 7, 1, 4, 0, 0, 2, 0, 200, 3, 0),
+       APLL_FREQ(1500, 0, 2, 7, 7, 7, 1, 4, 0, 0, 2, 0, 250, 4, 0),
+       APLL_FREQ(1400, 0, 2, 7, 7, 6, 1, 4, 0, 0, 2, 0, 175, 3, 0),
+       APLL_FREQ(1300, 0, 2, 7, 7, 6, 1, 3, 0, 0, 2, 0, 325, 6, 0),
+       APLL_FREQ(1200, 0, 2, 7, 7, 5, 1, 3, 0, 0, 2, 0, 200, 4, 0),
+       APLL_FREQ(1100, 0, 3, 7, 7, 5, 1, 3, 0, 0, 2, 0, 275, 6, 0),
+       APLL_FREQ(1000, 0, 1, 7, 7, 4, 1, 2, 0, 0, 2, 0, 125, 3, 0),
+       APLL_FREQ(900,  0, 1, 7, 7, 4, 1, 2, 0, 0, 2, 0, 150, 4, 0),
+       APLL_FREQ(800,  0, 1, 7, 7, 4, 1, 2, 0, 0, 2, 0, 100, 3, 0),
+       APLL_FREQ(700,  0, 1, 7, 7, 3, 1, 1, 0, 0, 2, 0, 175, 3, 1),
+       APLL_FREQ(600,  0, 1, 7, 7, 3, 1, 1, 0, 0, 2, 0, 200, 4, 1),
+       APLL_FREQ(500,  0, 1, 7, 7, 2, 1, 1, 0, 0, 2, 0, 125, 3, 1),
+       APLL_FREQ(400,  0, 1, 7, 7, 2, 1, 1, 0, 0, 2, 0, 100, 3, 1),
+       APLL_FREQ(300,  0, 1, 7, 7, 1, 1, 1, 0, 0, 2, 0, 200, 4, 2),
+       APLL_FREQ(200,  0, 1, 7, 7, 1, 1, 1, 0, 0, 2, 0, 100, 3, 2),
 };

 static void set_clkdiv(unsigned int div_index)
@@ -136,7 +85,7 @@ static void set_clkdiv(unsigned int div_index)

        /* Change Divider - CPU0 */

-       tmp = exynos5250_clkdiv_table[div_index].clkdiv;
+       tmp = apll_freq_5250[div_index].clk_div_cpu0;

        __raw_writel(tmp, EXYNOS5_CLKDIV_CPU0);

@@ -144,7 +93,7 @@ static void set_clkdiv(unsigned int div_index)
                cpu_relax();

        /* Change Divider - CPU1 */
-       tmp = exynos5250_clkdiv_table[div_index].clkdiv1;
+       tmp = apll_freq_5250[div_index].clk_div_cpu1;

        __raw_writel(tmp, EXYNOS5_CLKDIV_CPU1);

@@ -167,14 +116,14 @@ static void set_apll(unsigned int new_index,
        } while (tmp != 0x2);

        /* 2. Set APLL Lock time */
-       pdiv = ((exynos5_apll_pms_table[new_index] >> 8) & 0x3f);
 
826,1         88%
        /* 2. Set APLL Lock time */
-       pdiv = ((exynos5_apll_pms_table[new_index] >> 8) & 0x3f);
+       pdiv = ((apll_freq_5250[new_index].mps >> 8) & 0x3f);

        __raw_writel((pdiv * 250), EXYNOS5_APLL_LOCK);

        /* 3. Change PLL PMS values */
        tmp = __raw_readl(EXYNOS5_APLL_CON0);
        tmp &= ~((0x3ff << 16) | (0x3f << 8) | (0x7 << 0));
-       tmp |= exynos5_apll_pms_table[new_index];
+       tmp |= apll_freq_5250[new_index].mps;
        __raw_writel(tmp, EXYNOS5_APLL_CON0);

        /* 4. wait_lock_time */
@@ -196,8 +145,8 @@ static void set_apll(unsigned int new_index,

 bool exynos5250_pms_change(unsigned int old_index, unsigned int new_index)
 {
-       unsigned int old_pm = (exynos5_apll_pms_table[old_index] >> 8);
-       unsigned int new_pm = (exynos5_apll_pms_table[new_index] >> 8);
+       unsigned int old_pm = apll_freq_5250[old_index].mps >> 8;
+       unsigned int new_pm = apll_freq_5250[new_index].mps >> 8;

        return (old_pm == new_pm) ? 0 : 1;
 }
@@ -214,7 +163,7 @@ static void exynos5250_set_frequency(unsigned int
old_index,
                        /* 2. Change just s value in apll m,p,s value */
                        tmp = __raw_readl(EXYNOS5_APLL_CON0);
                        tmp &= ~(0x7 << 0);
-                       tmp |= (exynos5_apll_pms_table[new_index] & 0x7);
+                       tmp |= apll_freq_5250[new_index].mps & 0x7;
                        __raw_writel(tmp, EXYNOS5_APLL_CON0);

                } else {
@@ -229,7 +178,7 @@ static void exynos5250_set_frequency(unsigned int
old_index,
                        /* 1. Change just s value in apll m,p,s value */
                        tmp = __raw_readl(EXYNOS5_APLL_CON0);
                        tmp &= ~(0x7 << 0);
-                       tmp |= (exynos5_apll_pms_table[new_index] & 0x7);
+                       tmp |= apll_freq_5250[new_index].mps & 0x7;
                        __raw_writel(tmp, EXYNOS5_APLL_CON0);
                        /* 2. Change the system clock divider values */
                        set_clkdiv(new_index);
@@ -243,22 +192,10 @@ static void exynos5250_set_frequency(unsigned int
old_index,
        }
 }

-static void __init set_volt_table(void)
-{
-       unsigned int i;
-
-       for (i = 0 ; i < CPUFREQ_LEVEL_END ; i++)
-               exynos5250_volt_table[i] = asv_voltage_5250[i];
-}
-
 int exynos5250_cpufreq_init(struct exynos_dvfs_info *info)
 {
-       int i;
-       unsigned int tmp;
        unsigned long rate;

-       set_volt_table();
-
        cpu_clk = clk_get(NULL, "armclk");
        if (IS_ERR(cpu_clk))
                return PTR_ERR(cpu_clk);
@@ -277,37 +214,6 @@ int exynos5250_cpufreq_init(struct exynos_dvfs_info
*info)
        if (IS_ERR(mout_apll))
                goto err_mout_apll;

-       for (i = L0; i < CPUFREQ_LEVEL_END; i++) {
-
-               exynos5250_clkdiv_table[i].index = i;
-
-               tmp = __raw_readl(EXYNOS5_CLKDIV_CPU0);
-
-               tmp &= ~((0x7 << 0) | (0x7 << 4) | (0x7 << 8) |
 
901,3-9       96%
-
-               tmp &= ~((0x7 << 0) | (0x7 << 4) | (0x7 << 8) |
-                       (0x7 << 12) | (0x7 << 16) | (0x7 << 20) |
-                       (0x7 << 24) | (0x7 << 28));
-
-               tmp |= ((clkdiv_cpu0_5250[i][0] << 0) |
-                       (clkdiv_cpu0_5250[i][1] << 4) |
-                       (clkdiv_cpu0_5250[i][2] << 8) |
-                       (clkdiv_cpu0_5250[i][3] << 12) |
-                       (clkdiv_cpu0_5250[i][4] << 16) |
-                       (clkdiv_cpu0_5250[i][5] << 20) |
-                       (clkdiv_cpu0_5250[i][6] << 24) |
-                       (clkdiv_cpu0_5250[i][7] << 28));
-
-               exynos5250_clkdiv_table[i].clkdiv = tmp;
-
-               tmp = __raw_readl(EXYNOS5_CLKDIV_CPU1);
-
-               tmp &= ~((0x7 << 0) | (0x7 << 4));
-
-               tmp |= ((clkdiv_cpu1_5250[i][0] << 0) |
-                       (clkdiv_cpu1_5250[i][1] << 4));
-
-               exynos5250_clkdiv_table[i].clkdiv1 = tmp;
-       }
-
        info->mpll_freq_khz = rate;
        /* 800Mhz */
        info->pll_safe_idx = L9;
--
1.7.4.1
