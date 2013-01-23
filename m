From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] cpufreq: exynos: Fix unsigned variable being checked for negative value
Date: Wed, 23 Jan 2013 14:52:11 +0530
Message-ID: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:43196 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104Ab3AWJbC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jan 2013 04:31:02 -0500
Received: by mail-pb0-f44.google.com with SMTP id uo1so4556412pbc.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jan 2013 01:31:01 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, rjw@sisk.pl, jhbird.choi@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

exynos_cpufreq_scale function returns signed value which was
assigned to an unsigned variable and checked for negative value which
is always false. Hence make it signed.

Fixes the following smatch warnings:
drivers/cpufreq/exynos-cpufreq.c:83 exynos_cpufreq_scale() warn:
unsigned 'old_index' is never less than zero.
drivers/cpufreq/exynos-cpufreq.c:89 exynos_cpufreq_scale() warn:
unsigned 'index' is never less than zero.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Rafael J. Wysocki suggested these 2 patches be taken through the
Samsung tree.
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 218b3ce..88401ba 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -65,7 +65,7 @@ static int exynos_cpufreq_scale(unsigned int target_freq)
 	struct cpufreq_policy *policy = cpufreq_cpu_get(0);
 	unsigned int arm_volt, safe_arm_volt = 0;
 	unsigned int mpll_freq_khz = exynos_info->mpll_freq_khz;
-	unsigned int index, old_index;
+	int index, old_index;
 	int ret = 0;
 
 	freqs.old = policy->cur;
-- 
1.7.4.1
