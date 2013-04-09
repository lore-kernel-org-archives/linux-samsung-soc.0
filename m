From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH] thermal: exynos: fix handling of invalid frequency table entries
Date: Tue,  9 Apr 2013 14:59:18 -0700
Message-ID: <1365544758-15245-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f73.google.com ([209.85.219.73]:51645 "EHLO
	mail-oa0-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761010Ab3DIV7V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 17:59:21 -0400
Received: by mail-oa0-f73.google.com with SMTP id o6so1888527oag.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 14:59:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <eduardo.valentin@ti.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>

Similar to the error described in "thermal: cpu_cooling: fix handling
of invalid frequency table entries," exynos_get_frequency_level() will
enter an infinite loop if any CPU frequency table entries are invalid.
This patch fixes the handling of invalid frequency entries so that
there is no infinite loop and the correct level is returned.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 drivers/thermal/exynos_thermal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/exynos_thermal.c b/drivers/thermal/exynos_thermal.c
index d5e6267..524b2a0 100644
--- a/drivers/thermal/exynos_thermal.c
+++ b/drivers/thermal/exynos_thermal.c
@@ -237,7 +237,7 @@ static int exynos_get_crit_temp(struct thermal_zone_device *thermal,
 
 static int exynos_get_frequency_level(unsigned int cpu, unsigned int freq)
 {
-	int i = 0, ret = -EINVAL;
+	int i, level = 0, ret = -EINVAL;
 	struct cpufreq_frequency_table *table = NULL;
 #ifdef CONFIG_CPU_FREQ
 	table = cpufreq_frequency_get_table(cpu);
@@ -245,12 +245,12 @@ static int exynos_get_frequency_level(unsigned int cpu, unsigned int freq)
 	if (!table)
 		return ret;
 
-	while (table[i].frequency != CPUFREQ_TABLE_END) {
+	for (i = 0; table[i].frequency != CPUFREQ_TABLE_END; i++) {
 		if (table[i].frequency == CPUFREQ_ENTRY_INVALID)
 			continue;
 		if (table[i].frequency == freq)
-			return i;
-		i++;
+			return level;
+		level++;
 	}
 	return ret;
 }
-- 
1.8.1.3
