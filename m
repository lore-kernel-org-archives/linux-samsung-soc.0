From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/6] [CPUFREQ] S5PV210: Adjust udelay prior to voltage scaling down
Date: Wed, 22 Jun 2011 17:07:44 +0900
Message-ID: <1308730065-24737-6-git-send-email-kgene.kim@samsung.com>
References: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51248 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688Ab1FVIQt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 04:16:49 -0400
In-Reply-To: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
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
 drivers/cpufreq/s5pv210-cpufreq.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index e9b9b7f..78c88a0 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -471,6 +471,8 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 		}
 	}
 
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
 	if (freqs.new < freqs.old) {
 		/* Voltage down: will be implemented */
 		if (!IS_ERR(arm_regulator) &&
@@ -483,7 +485,6 @@ static int s5pv210_target(struct cpufreq_policy *policy,
 		}
 	}
 
-	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
 	printk(KERN_DEBUG "Perf changed[L%d]\n", index);
 
-- 
1.7.1
