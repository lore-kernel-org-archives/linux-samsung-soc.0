From: Jonghwan Choi <jhbird.choi@gmail.com>
Subject: [PATCH 3/4] PM / devfreq: Consider hibernation in pm notifier
Date: Tue, 19 Nov 2013 22:30:09 +0900
Message-ID: <1384867809-15332-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:45229 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752611Ab3KSNaP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Nov 2013 08:30:15 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>

Frequency lock should be considered in suspend/hibernation.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/devfreq/exynos/exynos4_bus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/devfreq/exynos/exynos4_bus.c b/drivers/devfreq/exynos/exynos4_bus.c
index cede6f7..dd6947e 100644
--- a/drivers/devfreq/exynos/exynos4_bus.c
+++ b/drivers/devfreq/exynos/exynos4_bus.c
@@ -962,6 +962,7 @@ static int exynos4_busfreq_pm_notifier_event(struct notifier_block *this,
 	int err = 0;
 
 	switch (event) {
+	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
 		/* Set Fastest and Deactivate DVFS */
 		mutex_lock(&data->lock);
@@ -1005,6 +1006,7 @@ unlock:
 		if (err)
 			return err;
 		return NOTIFY_OK;
+	case PM_POST_HIBERNATION:
 	case PM_POST_RESTORE:
 	case PM_POST_SUSPEND:
 		/* Reactivate */
-- 
1.8.1.2
