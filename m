From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/6] [CPUFREQ] S5PV210: Add pm_notifier to prevent system unstable
Date: Wed, 22 Jun 2011 17:07:42 +0900
Message-ID: <1308730065-24737-4-git-send-email-kgene.kim@samsung.com>
References: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51258 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752828Ab1FVIQt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 04:16:49 -0400
In-Reply-To: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Huisung Kang <hs1218.kang@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Huisung Kang <hs1218.kang@samsung.com>

Minimum 800MHz is needed to enter/exit suspend mode due to voltage mismatch.

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |   34 ++++++++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index d2b3d25..ba7f2dc 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/cpufreq.h>
 #include <linux/regulator/consumer.h>
+#include <linux/suspend.h>
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
@@ -30,6 +31,9 @@ static struct cpufreq_freqs freqs;
 #define APLL_VAL_1000	((1 << 31) | (125 << 16) | (3 << 8) | 1)
 #define APLL_VAL_800	((1 << 31) | (100 << 16) | (3 << 8) | 1)
 
+/* Use 800MHz when entering sleep mode */
+#define SLEEP_FREQ	(800 * 1000)
+
 /*
  * relation has an additional symantics other than the standard of cpufreq
  * DISALBE_FURTHER_CPUFREQ: disable further access to target
@@ -560,6 +564,30 @@ out_dmc0:
 	return ret;
 }
 
+static int s5pv210_cpufreq_notifier_event(struct notifier_block *this,
+					  unsigned long event, void *ptr)
+{
+	int ret;
+
+	switch (event) {
+	case PM_SUSPEND_PREPARE:
+		ret = cpufreq_driver_target(cpufreq_cpu_get(0), SLEEP_FREQ,
+					    DISABLE_FURTHER_CPUFREQ);
+		if (ret < 0)
+			return NOTIFY_BAD;
+
+		return NOTIFY_OK;
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		cpufreq_driver_target(cpufreq_cpu_get(0), SLEEP_FREQ,
+				      ENABLE_FURTHER_CPUFREQ);
+
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static struct cpufreq_driver s5pv210_driver = {
 	.flags		= CPUFREQ_STICKY,
 	.verify		= s5pv210_verify_speed,
@@ -573,6 +601,10 @@ static struct cpufreq_driver s5pv210_driver = {
 #endif
 };
 
+static struct notifier_block s5pv210_cpufreq_notifier = {
+	.notifier_call = s5pv210_cpufreq_notifier_event,
+};
+
 static int __init s5pv210_cpufreq_init(void)
 {
 	arm_regulator = regulator_get(NULL, "vddarm");
@@ -588,6 +620,8 @@ static int __init s5pv210_cpufreq_init(void)
 		return PTR_ERR(int_regulator);
 	}
 
+	register_pm_notifier(&s5pv210_cpufreq_notifier);
+
 	return cpufreq_register_driver(&s5pv210_driver);
 }
 
-- 
1.7.1
