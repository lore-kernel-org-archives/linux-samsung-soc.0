From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 06/17] ARM: exynos: cpuidle: Fix S5P_WAKEUP_STAT call
Date: Fri,  4 Apr 2014 09:47:52 +0200
Message-ID: <1396597683-6969-7-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:33907 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101AbaDDHr4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:47:56 -0400
Received: by mail-wi0-f174.google.com with SMTP id d1so691047wiv.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:55 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

This function should be called only when the powerdown sequence fails.

Even if the current code does not hurt, by moving this line, we have the same
code than the one in pm.c.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 9cd1ed9..a1e1882 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -135,11 +135,10 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
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
