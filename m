From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 6/6] S5PV210: Add reboot notifier to prevent system hang
Date: Fri, 24 Jun 2011 16:04:18 +0900
Message-ID: <1308899058-24318-7-git-send-email-kgene.kim@samsung.com>
References: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Huisung Kang <hs1218.kang@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Huisung Kang <hs1218.kang@samsung.com>

When system reboot, the CPUFREQ level should be 800MHz to prevent
system lockup.

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 155242c..7c4bb07 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/cpufreq.h>
+#include <linux/reboot.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 
@@ -590,6 +591,19 @@ static int s5pv210_cpufreq_notifier_event(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
+						 unsigned long event, void *ptr)
+{
+	int ret;
+
+	ret = cpufreq_driver_target(cpufreq_cpu_get(0), SLEEP_FREQ,
+				    DISABLE_FURTHER_CPUFREQ);
+	if (ret < 0)
+		return NOTIFY_BAD;
+
+	return NOTIFY_DONE;
+}
+
 static struct cpufreq_driver s5pv210_driver = {
 	.flags		= CPUFREQ_STICKY,
 	.verify		= s5pv210_verify_speed,
@@ -607,6 +621,10 @@ static struct notifier_block s5pv210_cpufreq_notifier = {
 	.notifier_call = s5pv210_cpufreq_notifier_event,
 };
 
+static struct notifier_block s5pv210_cpufreq_reboot_notifier = {
+	.notifier_call = s5pv210_cpufreq_reboot_notifier_event,
+};
+
 static int __init s5pv210_cpufreq_init(void)
 {
 	arm_regulator = regulator_get(NULL, "vddarm");
@@ -623,6 +641,7 @@ static int __init s5pv210_cpufreq_init(void)
 	}
 
 	register_pm_notifier(&s5pv210_cpufreq_notifier);
+	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
 
 	return cpufreq_register_driver(&s5pv210_driver);
 }
-- 
1.7.1

