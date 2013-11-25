From: Jonghwan Choi <jhbird.choi@gmail.com>
Subject: [PATCH 2/2] cpufreq: exynos: Frequency lock should be considered in hibernation also.
Date: Mon, 25 Nov 2013 22:39:30 +0900
Message-ID: <1385386770-4118-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:42687 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976Ab3KYNjg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 08:39:36 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>

The Frequency lock value should be higher or same than the booting frequency,
which is set by the bootloader. To eliminate possible inconsistency
in frequency, we save and restore frequency during suspend & resume
and disable CPUFREQ activity. This should be considered in hibernation also.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index f3c2287..cd05b0a 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -187,6 +187,7 @@ static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
 	int ret;
 
 	switch (pm_event) {
+	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
 		mutex_lock(&cpufreq_lock);
 		frequency_locked = true;
@@ -198,6 +199,8 @@ static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
 
 		break;
 
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
 	case PM_POST_SUSPEND:
 		mutex_lock(&cpufreq_lock);
 		frequency_locked = false;
-- 
1.8.1.2
