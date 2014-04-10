From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 17/20] ARM: exynos: cpuidle: Move S5P_CHECK_SLEEP into pm.c
Date: Thu, 10 Apr 2014 11:55:48 +0200
Message-ID: <1397123751-1957-18-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:33057 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965677AbaDJJz6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:55:58 -0400
Received: by mail-we0-f178.google.com with SMTP id u56so3719023wes.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:55:57 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

This macro is only used there.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/pm.c       |    3 ++-
 arch/arm/mach-exynos/regs-pmu.h |    2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index a943e97..aa23662 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -108,7 +108,8 @@ static int exynos_irq_set_wake(struct irq_data *data, unsigned int state)
 			S5P_INFORM6 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
 			(S5P_VA_SYSRAM + 0x20) : S5P_INFORM1))
 
-#define S5P_CHECK_AFTR 0xFCBA0D10
+#define S5P_CHECK_AFTR  0xFCBA0D10
+#define S5P_CHECK_SLEEP 0x00000BAD
 
 /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
 static void exynos_set_wakeupmask(long mask)
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 35c4eb3..d7803c4 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -119,8 +119,6 @@
 #define S5P_CORE_LOCAL_PWR_EN			0x3
 #define S5P_INT_LOCAL_PWR_EN			0x7
 
-#define S5P_CHECK_SLEEP				0x00000BAD
-
 /* Only for EXYNOS4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	S5P_PMUREG(0x1154)
 #define S5P_CMU_RESET_LCD1_LOWPWR	S5P_PMUREG(0x1174)
-- 
1.7.9.5
