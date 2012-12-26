From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH] cpufreq: exynos: Add the missing cpufreq_cpu_put function
Date: Wed, 26 Dec 2012 13:35:34 -0800
Message-ID: <1356557734-15640-1-git-send-email-amit.daniel@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-pm@lists.linux-foundation.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the missing cpufreq_cpu_put function needed for
returning the cpufreq policy instance.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 7012ea8..a2b7adc 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -208,6 +208,7 @@ static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
 	}
 out:
 	mutex_unlock(&cpufreq_lock);
+	cpufreq_cpu_put(policy);
 
 	return NOTIFY_OK;
 }
-- 
1.7.5.4

