From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 1/6] [CPUFREQ] S5PV210: Add additional symantics for "relation" in cpufreq with pm
Date: Fri, 24 Jun 2011 16:04:13 +0900
Message-ID: <1308899058-24318-2-git-send-email-kgene.kim@samsung.com>
References: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33332 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753014Ab1FXHMP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jun 2011 03:12:15 -0400
In-Reply-To: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Huisung Kang <hs1218.kang@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Huisung Kang <hs1218.kang@samsung.com>

Relation has an additional symantics other than standard.
s5pv310_target funtion have below additional relation.
- DISABLE_FURTHER_CPUFREQ : disable further access to target
- ENABLE_FURTHER_CPUFRER : enable access to target

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index a7cb338..48a4a90 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -30,6 +30,18 @@ static struct cpufreq_freqs freqs;
 #define APLL_VAL_800	((1 << 31) | (100 << 16) | (3 << 8) | 1)
 
 /*
+ * relation has an additional symantics other than the standard of cpufreq
+ * DISALBE_FURTHER_CPUFREQ: disable further access to target
+ * ENABLE_FURTUER_CPUFREQ: enable access to target
+ */
+enum cpufreq_access {
+	DISABLE_FURTHER_CPUFREQ = 0x10,
+	ENABLE_FURTHER_CPUFREQ = 0x20,
+};
+
+static bool no_cpufreq_access;
+
+/*
  * DRAM configurations to calculate refresh counter for changing
  * frequency of memory.
  */
@@ -146,6 +158,22 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 	unsigned int pll_changing = 0;
 	unsigned int bus_speed_changing = 0;
 
+	if (relation & ENABLE_FURTHER_CPUFREQ)
+		no_cpufreq_access = false;
+
+	if (no_cpufreq_access) {
+#ifdef CONFIG_PM_VERBOSE
+		pr_err("%s:%d denied access to %s as it is disabled"
+				"temporarily\n", __FILE__, __LINE__, __func__);
+#endif
+		return -EINVAL;
+	}
+
+	if (relation & DISABLE_FURTHER_CPUFREQ)
+		no_cpufreq_access = true;
+
+	relation &= ~(ENABLE_FURTHER_CPUFREQ | DISABLE_FURTHER_CPUFREQ);
+
 	freqs.old = s5pv210_getspeed(0);
 
 	if (cpufreq_frequency_table_target(policy, s5pv210_freq_table,
-- 
1.7.1
