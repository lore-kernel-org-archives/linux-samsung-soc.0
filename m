From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] cpufreq: exynos: fix hang in pm handler due to frequency
 mismatch
Date: Thu, 17 Jan 2013 15:41:50 -0800
Message-ID: <1358466110-9010-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Jonghwan Choi <jhbird.choi@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonghwan Choi <jhbird.choi@samsung.com>

When pm handler set freq & voltage, frequency mismatch occurred.
Because freqs.new isn't set in pm handler.

Reported-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 6d6ba0d..48ee439 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -69,9 +69,10 @@ static int exynos_cpufreq_scale(unsigned int target_freq)
 	int ret = 0;
 
 	freqs.old = policy->cur;
+	freqs.new = target_freq;
 	freqs.cpu = policy->cpu;
 
-	if (target_freq == freqs.old)
+	if (freqs.new == freqs.old)
 		goto out;
 
 	/*
@@ -159,6 +160,7 @@ static int exynos_target(struct cpufreq_policy *policy,
 {
 	struct cpufreq_frequency_table *freq_table = exynos_info->freq_table;
 	unsigned int index;
+	unsigned int new_freq;
 	int ret = 0;
 
 	mutex_lock(&cpufreq_lock);
@@ -172,9 +174,9 @@ static int exynos_target(struct cpufreq_policy *policy,
 		goto out;
 	}
 
-	freqs.new = freq_table[index].frequency;
+	new_freq = freq_table[index].frequency;
 
-	ret = exynos_cpufreq_scale(freqs.new);
+	ret = exynos_cpufreq_scale(new_freq);
 
 out:
 	mutex_unlock(&cpufreq_lock);
-- 
1.7.10.4

