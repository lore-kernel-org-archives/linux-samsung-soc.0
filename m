From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V2 12/17] ARM: exynos: cpuidle: Move S5P_CHECK_AFTR in a header
Date: Fri,  4 Apr 2014 15:43:04 +0200
Message-ID: <1396618989-2897-13-git-send-email-daniel.lezcano@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:53901 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774AbaDDNnN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 09:43:13 -0400
Received: by mail-wi0-f182.google.com with SMTP id d1so1281926wiv.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 06:43:12 -0700 (PDT)
In-Reply-To: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Move the S5P_CHECK_AFTR definition to the header it belongs to.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c  |    2 --
 arch/arm/mach-exynos/regs-pmu.h |    1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 81d7197..cd27dbf 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -37,8 +37,6 @@
 			S5P_INFORM6 : (samsung_rev() == EXYNOS4210_REV_1_0 ? \
 			(S5P_VA_SYSRAM + 0x20) : S5P_INFORM1))
 
-#define S5P_CHECK_AFTR		0xFCBA0D10
-
 #define EXYNOS5_PWR_CTRL1			(S5P_VA_CMU + 0x01020)
 #define EXYNOS5_PWR_CTRL2			(S5P_VA_CMU + 0x01024)
 
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 4f6a256..09c43c3 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -120,6 +120,7 @@
 #define S5P_INT_LOCAL_PWR_EN			0x7
 
 #define S5P_CHECK_SLEEP				0x00000BAD
+#define S5P_CHECK_AFTR				0xFCBA0D10
 
 /* Only for EXYNOS4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	S5P_PMUREG(0x1154)
-- 
1.7.9.5
