From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] cpufreq: exynos: fix uninitialized warning in exynos-cpufreq.c
Date: Thu, 17 Jan 2013 15:38:24 -0800
Message-ID: <1358465904-8869-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12865 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557Ab3AQXjO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 18:39:14 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Jonghwan Choi <jhbird.choi@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Fix "warning: 'ret' may be used uninitialized in this function"

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 459f7f6..6d6ba0d 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -159,7 +159,7 @@ static int exynos_target(struct cpufreq_policy *policy,
 {
 	struct cpufreq_frequency_table *freq_table = exynos_info->freq_table;
 	unsigned int index;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&cpufreq_lock);
 
-- 
1.7.10.4
