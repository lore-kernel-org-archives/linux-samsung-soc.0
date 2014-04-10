From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 06/20] ARM: exynos: cpuidle: Fix S5P_WAKEUP_STAT call
Date: Thu, 10 Apr 2014 11:55:37 +0200
Message-ID: <1397123751-1957-7-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:35541 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965541AbaDJJzm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:55:42 -0400
Received: by mail-we0-f181.google.com with SMTP id q58so3605767wes.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:55:41 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

This function should be called only when the powerdown sequence fails.

Even if the current code does not hurt, by moving this line, we have the same
code than the one in pm.c.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index cdfb1ae..6663349 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -134,11 +134,10 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 	if (!(tmp & S5P_CENTRAL_LOWPWR_CFG)) {
 		tmp |= S5P_CENTRAL_LOWPWR_CFG;
 		__raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
+		/* Clear wakeup state register */
+		__raw_writel(0x0, S5P_WAKEUP_STAT);
 	}
 
-	/* Clear wakeup state register */
-	__raw_writel(0x0, S5P_WAKEUP_STAT);
-
 	return index;
 }
 
-- 
1.7.9.5
