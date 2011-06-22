From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/6] [CPUFREQ] S5PV210: Add arm/int voltage control support
Date: Wed, 22 Jun 2011 17:07:41 +0900
Message-ID: <1308730065-24737-3-git-send-email-kgene.kim@samsung.com>
References: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51260 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752837Ab1FVIQt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 04:16:49 -0400
In-Reply-To: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |   75 ++++++++++++++++++++++++++++++++++++-
 1 files changed, 74 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 48a4a90..d2b3d25 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/cpufreq.h>
+#include <linux/regulator/consumer.h>
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
@@ -77,6 +78,40 @@ static struct cpufreq_frequency_table s5pv210_freq_table[] = {
 	{0, CPUFREQ_TABLE_END},
 };
 
+static struct regulator *arm_regulator;
+static struct regulator *int_regulator;
+
+struct s5pv210_dvs_conf {
+	int arm_volt;	/* uV */
+	int int_volt;	/* uV */
+};
+
+static const int arm_volt_max = 1350000;
+static const int int_volt_max = 1250000;
+
+static struct s5pv210_dvs_conf dvs_conf[] = {
+	[L0] = {
+		.arm_volt	= 1250000,
+		.int_volt	= 1100000,
+	},
+	[L1] = {
+		.arm_volt	= 1200000,
+		.int_volt	= 1100000,
+	},
+	[L2] = {
+		.arm_volt	= 1050000,
+		.int_volt	= 1100000,
+	},
+	[L3] = {
+		.arm_volt	= 950000,
+		.int_volt	= 1100000,
+	},
+	[L4] = {
+		.arm_volt	= 950000,
+		.int_volt	= 1000000,
+	},
+};
+
 static u32 clkdiv_val[5][11] = {
 	/*
 	 * Clock divider value for following
@@ -157,6 +192,8 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 	unsigned int index, priv_index;
 	unsigned int pll_changing = 0;
 	unsigned int bus_speed_changing = 0;
+	int arm_volt, int_volt;
+	int ret = 0;
 
 	if (relation & ENABLE_FURTHER_CPUFREQ)
 		no_cpufreq_access = false;
@@ -191,12 +228,27 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 					   freqs.old, relation, &priv_index))
 		return -EINVAL;
 
-	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	arm_volt = dvs_conf[index].arm_volt;
+	int_volt = dvs_conf[index].int_volt;
 
 	if (freqs.new > freqs.old) {
 		/* Voltage up: will be implemented */
+		if (!IS_ERR(arm_regulator) &&
+				!IS_ERR(int_regulator)) {
+			ret = regulator_set_voltage(arm_regulator,
+					arm_volt, arm_volt_max);
+			if (ret)
+				return ret;
+
+			ret = regulator_set_voltage(int_regulator,
+					int_volt, int_volt_max);
+			if (ret)
+				return ret;
+		}
 	}
 
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
 	/* Check if there need to change PLL */
 	if ((index == L0) || (priv_index == L0))
 		pll_changing = 1;
@@ -409,6 +461,14 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 
 	if (freqs.new < freqs.old) {
 		/* Voltage down: will be implemented */
+		if (!IS_ERR(arm_regulator) &&
+				!IS_ERR(int_regulator)) {
+			regulator_set_voltage(int_regulator,
+					int_volt, int_volt_max);
+
+			regulator_set_voltage(arm_regulator,
+					arm_volt, arm_volt_max);
+		}
 	}
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
@@ -515,6 +575,19 @@ static struct cpufreq_driver s5pv210_driver = {
 
 static int __init s5pv210_cpufreq_init(void)
 {
+	arm_regulator = regulator_get(NULL, "vddarm");
+	if (IS_ERR(arm_regulator)) {
+		pr_err("failed to get regulator vddarm");
+		return PTR_ERR(arm_regulator);
+	}
+
+	int_regulator = regulator_get(NULL, "vddint");
+	if (IS_ERR(int_regulator)) {
+		pr_err("failed to get regulator vddint");
+		regulator_put(arm_regulator);
+		return PTR_ERR(int_regulator);
+	}
+
 	return cpufreq_register_driver(&s5pv210_driver);
 }
 
-- 
1.7.1
