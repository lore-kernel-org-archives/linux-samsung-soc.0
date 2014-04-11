From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
Date: Fri, 11 Apr 2014 12:40:13 +0200
Message-ID: <1397212815-16068-19-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:38774 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756741AbaDKKkW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:22 -0400
Received: by mail-we0-f172.google.com with SMTP id t61so5227875wes.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:21 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

No more dependency on the arch code. The platform_data field is used to set the
PM callback as the other cpuidle drivers.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    4 +++-
 arch/arm/mach-exynos/exynos.c  |    5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 02609ac..1d1222e 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -27,7 +27,7 @@
 
 #include <mach/map.h>
 
-#include "common.h"
+static void (*exynos_enter_aftr)(void);
 
 static int idle_finisher(unsigned long flags)
 {
@@ -86,6 +86,8 @@ static int exynos_cpuidle_probe(struct platform_device *pdev)
 {
 	int ret;
 
+	exynos_enter_aftr = (void *)(pdev->dev.platform_data);
+
 	ret = cpuidle_register(&exynos_idle_driver, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register cpuidle driver\n");
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index fe8dac8..d22f0e4 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -221,8 +221,9 @@ void exynos_restart(enum reboot_mode mode, const char *cmd)
 }
 
 static struct platform_device exynos_cpuidle = {
-	.name		= "exynos_cpuidle",
-	.id		= -1,
+	.name              = "exynos_cpuidle",
+	.dev.platform_data = exynos_enter_aftr,
+	.id                = -1,
 };
 
 void __init exynos_cpuidle_init(void)
-- 
1.7.9.5
