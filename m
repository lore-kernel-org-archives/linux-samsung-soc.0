From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH 2/2] cpufreq: exynos: Fix hang in pm handler due to frequency
 mismatch
Date: Thu, 31 Jan 2013 08:25:08 +0900
Message-ID: <000301cdff41$1bbeab10$533c0130$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32136 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805Ab3A3XZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 18:25:42 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHG00MR7P2OOB20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 31 Jan 2013 08:25:36 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.51.131])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHG00N09P2O2JU0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 31 Jan 2013 08:25:36 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

When pm handler set freq & voltage, frequency mismatch occurred.
Because freqs.new isn't set in pm handler.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c
b/drivers/cpufreq/exynos-cpufreq.c
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
 	struct cpufreq_frequency_table *freq_table =
exynos_info->freq_table;
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
1.7.4.1
