From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 1/3] cpufreq: exynos: Remove error return even if no soc found
Date: Wed,  6 Feb 2013 11:39:20 -0800
Message-ID: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f53.google.com ([209.85.213.53]:35178 "EHLO
	mail-yh0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755031Ab3BFTjl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 14:39:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org

This change is needed for adding different type of cpufreq driver
and support single binary image.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 7012ea8..9d3690a 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -272,7 +272,7 @@ static int __init exynos_cpufreq_init(void)
 	else if (soc_is_exynos5250())
 		ret = exynos5250_cpufreq_init(exynos_info);
 	else
-		pr_err("%s: CPU type not found\n", __func__);
+		return 0;
 
 	if (ret)
 		goto err_vdd_arm;
-- 
1.7.10.4
