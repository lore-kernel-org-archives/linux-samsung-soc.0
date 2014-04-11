From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 07/20] ARM: exynos: cpuidle: Fix S5P_WAKEUP_STAT call
Date: Fri, 11 Apr 2014 12:40:02 +0200
Message-ID: <1397212815-16068-8-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:37210 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756632AbaDKKkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:07 -0400
Received: by mail-wg0-f47.google.com with SMTP id x12so5151900wgg.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:06 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

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
index 4d8bcfd..346c2d0 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -115,11 +115,10 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
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
