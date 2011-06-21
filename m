From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Fix secondary CPU boot after wake-up
Date: Tue, 21 Jun 2011 11:03:05 +0530
Message-ID: <1308634385-8544-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:45265 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072Ab1FUFd6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 01:33:58 -0400
Received: by vws1 with SMTP id 1so1461999vws.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 22:33:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, inderpal.s@samsung.com, samsung@lists.linaro.org, Inderpal Singh <inderpal.singh@linaro.org>

1. After wake-up, the system-wide flags register loses its value.
   Hence, write the address of secondary startup function to
   successfully boot the secondary CPU.

2. Changes SGI1 to SGI0 for secondary CPU boot up

Signed-off-by: Inderpal Singh <inderpal.s@samsung.com>
---
1. The below patch is mandatory to boot secondary CPU after wake-up from sleep
http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/4850

2. The change SGI1 to SGI0 for secondary CPU boot up is done as discussed 
at following link
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/4877

 arch/arm/mach-exynos4/platsmp.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exynos4/platsmp.c
index c5e65a0..061260c 100644
--- a/arch/arm/mach-exynos4/platsmp.c
+++ b/arch/arm/mach-exynos4/platsmp.c
@@ -101,11 +101,18 @@ int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
 	write_pen_release(cpu);
 
 	/*
+	* After wake-up, the system-wide flags register loses its value.
+	* Hence, write the address of secondary startup function again.
+	*/ 
+	__raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)), S5P_VA_SYSRAM);
+
+
+	/*
 	 * Send the secondary CPU a soft interrupt, thereby causing
 	 * the boot monitor to read the system wide flags register,
 	 * and branch to the address found there.
 	 */
-	gic_raise_softirq(cpumask_of(cpu), 1);
+	gic_raise_softirq(cpumask_of(cpu), 0);
 
 	timeout = jiffies + (1 * HZ);
 	while (time_before(jiffies, timeout)) {
-- 
1.7.1
