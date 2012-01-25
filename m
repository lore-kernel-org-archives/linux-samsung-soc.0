From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] EXYNOS: Initialize locking_frequency with initial frequency
Date: Wed, 25 Jan 2012 10:15:13 +0530
Message-ID: <1327466713-29101-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, jc.lee@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

As per definition, locking_frequency is the initial frequency which is
set by boot-loader. Hence the value is updated with the initial value
during boot time init call.

This code was present in exynos210-cpufreq.c before this consolidation
patch.
- a125a17fa61a ([CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver).

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
The patch is based on v3.3-rc1.

 drivers/cpufreq/exynos-cpufreq.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 5467879..7cfb516 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -210,6 +210,8 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 	cpufreq_frequency_table_get_attr(exynos_info->freq_table, policy->cpu);
 
+	locking_frequency = exynos_getspeed(0);
+
 	/* set the transition latency value */
 	policy->cpuinfo.transition_latency = 100000;
 
-- 
1.7.4.1

