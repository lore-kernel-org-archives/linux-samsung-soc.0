From: Jonghwan Choi <jhbird.choi@gmail.com>
Subject: [PATCH] ARM: EXYNOS: Fix compile error in exynos5250-cpufreq.c
Date: Fri,  6 Apr 2012 01:24:08 -0400
Message-ID: <1333689848-10932-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48038 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752634Ab2DFFYV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 01:24:21 -0400
Received: by pbcun15 with SMTP id un15so2300579pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 22:24:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>

This patch is omitted in v2 patch of Jaecheol Lee.

drivers/cpufreq/exynos5250-cpufreq.c: In function 'set_clkdiv':
drivers/cpufreq/exynos5250-cpufreq.c:144: error: 'EXYNOS5_CLKDIV_STATCPU0' undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:144: error: (Each undeclared identifier is reported only once
drivers/cpufreq/exynos5250-cpufreq.c:144: error: for each function it appears in.)
drivers/cpufreq/exynos5250-cpufreq.c:150: error: 'EXYNOS5_CLKDIV_CPU1' undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:152: error: 'EXYNOS5_CLKDIV_STATCPU1' undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c: In function 'set_apll':
drivers/cpufreq/exynos5250-cpufreq.c:166: error: 'EXYNOS5_CLKMUX_STATCPU' undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c:173: error: 'EXYNOS5_APLL_LOCK' undeclared (first use in this function)
drivers/cpufreq/exynos5250-cpufreq.c: In function 'exynos5250_cpufreq_init':
drivers/cpufreq/exynos5250-cpufreq.c:312: error: 'EXYNOS5_CLKDIV_CPU1' undeclared (first use in this function)

Cc: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-clock.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h b/arch/arm/mach-exynos/include/mach/regs-clock.h
index e141c1f..6a47d47 100644
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
@@ -255,13 +255,18 @@
 
 /* For EXYNOS5250 */
 
+#define EXYNOS5_APLL_LOCK			EXYNOS_CLKREG(0x00000)
 #define EXYNOS5_APLL_CON0			EXYNOS_CLKREG(0x00100)
 #define EXYNOS5_CLKSRC_CPU			EXYNOS_CLKREG(0x00200)
+#define EXYNOS5_CLKMUX_STATCPU			EXYNOS_CLKREG(0x00400)
 #define EXYNOS5_CLKDIV_CPU0			EXYNOS_CLKREG(0x00500)
 #define EXYNOS5_MPLL_CON0			EXYNOS_CLKREG(0x04100)
 #define EXYNOS5_CLKSRC_CORE1			EXYNOS_CLKREG(0x04204)
 
 #define EXYNOS5_CLKGATE_IP_CORE			EXYNOS_CLKREG(0x04900)
+#define EXYNOS5_CLKDIV_CPU1			EXYNOS_CLKREG(0x00504)
+#define EXYNOS5_CLKDIV_STATCPU0			EXYNOS_CLKREG(0x00600)
+#define EXYNOS5_CLKDIV_STATCPU1			EXYNOS_CLKREG(0x00604)
 
 #define EXYNOS5_CLKDIV_ACP			EXYNOS_CLKREG(0x08500)
 
-- 
1.7.0.4
