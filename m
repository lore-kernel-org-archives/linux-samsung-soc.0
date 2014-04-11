From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 11/20] ARM: exynos: cpuidle: Pass wakeup mask parameter to function
Date: Fri, 11 Apr 2014 12:40:06 +0200
Message-ID: <1397212815-16068-12-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:65376 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757225AbaDKKkM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:12 -0400
Received: by mail-wg0-f46.google.com with SMTP id b13so5246320wgh.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:11 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Pass the wakeup mask to 'exynos_set_wakeupmask' as this function could be used
for different idle states with different mask.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 95826c6..169db74 100644
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
