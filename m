From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 19/20] ARM: exynos: cpuidle: Cleanup all unneeded headers from cpuidle.c
Date: Fri, 11 Apr 2014 12:40:14 +0200
Message-ID: <1397212815-16068-20-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:41745 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756804AbaDKKkX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:23 -0400
Received: by mail-wi0-f180.google.com with SMTP id q5so765339wiv.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:22 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 1d1222e..1d09ebd 100644
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
