From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 4/7] ARM: EXYNOS: Enter a15 lowpower mode for Exynos3250
 based on Cortex-a7
Date: Fri, 18 Apr 2014 10:15:25 +0900
Message-ID: <1397783728-6193-5-git-send-email-cw00.choi@samsung.com>
References: <1397783728-6193-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42279 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbaDRBPa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 21:15:30 -0400
In-reply-to: <1397783728-6193-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, t.figa@samsung.com, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, cw00.choi@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, sajjan.linux@gmail.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

This patch decide proper lowpower mode of either a15 or a9 according to own ID
from Main ID register.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zynigier <marc.zyngier@arm.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/hotplug.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
index 5eead53..acf3119 100644
--- a/arch/arm/mach-exynos/hotplug.c
+++ b/arch/arm/mach-exynos/hotplug.c
@@ -135,16 +135,21 @@ void __ref exynos_cpu_die(unsigned int cpu)
 	int primary_part = 0;
 
 	/*
-	 * we're ready for shutdown now, so do it.
-	 * Exynos4 is A9 based while Exynos5 is A15; check the CPU part
-	 * number by reading the Main ID register and then perform the
-	 * appropriate sequence for entering low power.
+	 * Prepare the CPU for shutting down. The required sequence of
+	 * operations depends on core type. CPUID part number can be used to
+	 * determine the right way.
 	 */
-	asm("mrc p15, 0, %0, c0, c0, 0" : "=r"(primary_part) : : "cc");
-	if ((primary_part & 0xfff0) == 0xc0f0)
+	primary_part = read_cpuid_part_number();
+
+	switch (primary_part) {
+	case ARM_CPU_PART_CORTEX_A7:
+	case ARM_CPU_PART_CORTEX_A15:
 		cpu_enter_lowpower_a15();
-	else
+		break;
+	default:
 		cpu_enter_lowpower_a9();
+		break;
+	}
 
 	platform_do_lowpower(cpu, &spurious);
 
-- 
1.8.0
