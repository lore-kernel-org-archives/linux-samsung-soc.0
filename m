From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 5/6] [CPUFREQ] S5PV210: Adjust udelay prior to voltage scaling down
Date: Fri, 24 Jun 2011 16:04:17 +0900
Message-ID: <1308899058-24318-6-git-send-email-kgene.kim@samsung.com>
References: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33322 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753028Ab1FXHMP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jun 2011 03:12:15 -0400
In-Reply-To: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, Todd Poynor <toddpoynor@google.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Todd Poynor <toddpoynor@google.com>

Voltage scaling accesses the MAX8998 regulators over bit-banged I2C
with lots of udelays.  In the case of decreasing CPU speed, the
number of loops per us for udelay needs to be adjusted prior to
decreasing voltage to avoid delaying for up to 10X too long.

Signed-off-by: Todd Poynor <toddpoynor@google.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 7fba356..155242c 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -467,6 +467,8 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 		}
 	}
 
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
 	if (freqs.new < freqs.old) {
 		regulator_set_voltage(int_regulator,
 				int_volt, int_volt_max);
@@ -475,8 +477,6 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 				arm_volt, arm_volt_max);
 	}
 
-	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	printk(KERN_DEBUG "Perf changed[L%d]\n", index);
 
 exit:
-- 
1.7.1
