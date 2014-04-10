From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 19/20] ARM: exynos: cpuidle: Cleanup all unneeded headers from cpuidle.c
Date: Thu, 10 Apr 2014 11:55:50 +0200
Message-ID: <1397123751-1957-20-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:33403 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965695AbaDJJ4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:56:01 -0400
Received: by mail-we0-f180.google.com with SMTP id p61so3671812wes.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:56:00 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index ef592ad..52ef229a 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -8,25 +8,15 @@
  * published by the Free Software Foundation.
 */
 
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/cpuidle.h>
 #include <linux/cpu_pm.h>
-#include <linux/io.h>
 #include <linux/export.h>
-#include <linux/time.h>
 #include <linux/platform_device.h>
 
 #include <asm/proc-fns.h>
 #include <asm/suspend.h>
-#include <asm/unified.h>
 #include <asm/cpuidle.h>
 
-#include <plat/cpu.h>
-#include <plat/pm.h>
-
-#include <mach/map.h>
-
 static void (*exynos_enter_aftr)(void);
 
 static int idle_finisher(unsigned long flags)
-- 
1.7.9.5
