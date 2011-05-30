From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Fix secondary CPU boot after wake-up
Date: Mon, 30 May 2011 14:43:01 +0530
Message-ID: <1306746781-21511-1-git-send-email-inderpal.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:46406 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753901Ab1E3JOz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2011 05:14:55 -0400
Received: by pvg12 with SMTP id 12so1536803pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2011 02:14:55 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, samsung@lists.linaro.org, patches@linaro.org, Inderpal Singh <inderpal.s@samsung.com>

1. After wake-up, the system-wide flags register loses its value.
   Hence, write the address of secondary startup function to
   successfully boot the secondary CPU.

2. Fix to remove the "Unknown IPI message 0x1" message when
   secondary CPU boots.

Signed-off-by: Inderpal Singh <inderpal.s@samsung.com>
---
 arch/arm/mach-exynos4/platsmp.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exynos4/platsmp.c
index 6d35878..11234c7 100644
--- a/arch/arm/mach-exynos4/platsmp.c
+++ b/arch/arm/mach-exynos4/platsmp.c
@@ -100,11 +100,17 @@ int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
 	write_pen_release(cpu);
 
 	/*
+	 * After wake-up, the system-wide flags register loses its value.
+	 * Hence, write the address of secondary startup function again.
+	 */ 
+	 __raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)), S5P_VA_SYSRAM);
+
+	/*
 	 * Send the secondary CPU a soft interrupt, thereby causing
 	 * the boot monitor to read the system wide flags register,
 	 * and branch to the address found there.
 	 */
-	smp_cross_call(cpumask_of(cpu), 1);
+	smp_send_reschedule(cpu);
 
 	timeout = jiffies + (1 * HZ);
 	while (time_before(jiffies, timeout)) {
-- 
1.7.1
