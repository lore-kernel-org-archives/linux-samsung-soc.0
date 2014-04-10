From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 11/20] ARM: exynos: cpuidle: Pass wakeup mask parameter to function
Date: Thu, 10 Apr 2014 11:55:42 +0200
Message-ID: <1397123751-1957-12-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:62037 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965630AbaDJJzu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:55:50 -0400
Received: by mail-wi0-f173.google.com with SMTP id z2so10367685wiv.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:55:48 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Pass the wakeup mask to 'exynos_set_wakeupmask' as this function could be used
for different idle states with different mask.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 97a441f..ddbb2c5 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -40,14 +40,14 @@
 #define S5P_CHECK_AFTR		0xFCBA0D10
 
 /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
-static void exynos_set_wakeupmask(void)
+static void exynos_set_wakeupmask(long mask)
 {
-	__raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
+	__raw_writel(mask, S5P_WAKEUP_MASK);
 }
 
 static int idle_finisher(unsigned long flags)
 {
-	exynos_set_wakeupmask();
+	exynos_set_wakeupmask(0x0000ff3e);
 
 	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
 	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
-- 
1.7.9.5
