From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH] cpufreq: exynos: Get booting freq value in exynos_cpufreq_init
Date: Mon, 07 Jan 2013 17:31:04 +0900
Message-ID: <00b801cdecb1$57d55e20$07801a60$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20982 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798Ab3AGIbU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jan 2013 03:31:20 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG800213YBY1030@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Jan 2013 17:31:10 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG8006YHYBW3VA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Jan 2013 17:31:09 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Boot_freq is for saving booting freq. But exynos_cpufreq_cpu_init
is called in hotplug. If boot_freq is existed in exynos_cpufreq_cpu_init,
boot_freq could be changed.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c
b/drivers/cpufreq/exynos-cpufreq.c
index 7012ea8..41fc550 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -222,8 +222,6 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy
*policy)
 
 	cpufreq_frequency_table_get_attr(exynos_info->freq_table,
policy->cpu);
 
-	locking_frequency = exynos_getspeed(0);
-
 	/* set the transition latency value */
 	policy->cpuinfo.transition_latency = 100000;
 
@@ -288,6 +286,8 @@ static int __init exynos_cpufreq_init(void)
 		goto err_vdd_arm;
 	}
 
+	locking_frequency = exynos_getspeed(0);
+
 	register_pm_notifier(&exynos_cpufreq_nb);
 
 	if (cpufreq_register_driver(&exynos_driver)) {
-- 
1.7.4.1
