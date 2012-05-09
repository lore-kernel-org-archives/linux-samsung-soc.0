From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix the hotplug for Cortex-A15
Date: Wed, 09 May 2012 21:37:28 +0900
Message-ID: <01a301cd2de0$7ebaada0$7c3008e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21133 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758865Ab2EIMhb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 08:37:31 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R00CAL9QH2540@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:37:29 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R0055S9QGPE00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:37:29 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: chaos.youn@samsung.com, 'Russell King' <rmk+kernel@arm.linux.org.uk>

From: Changhwan Youn <chaos.youn@samsung.com>

The sequence of cpu_enter_lowpower() for Cortex-A15
is different from the sequence for Cortex-A9.
This patch implements cpu_enter_lowpower() for EXYNOS5
SoC which has Cortex-A15 cores.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Note, I didn't see common code for fix of hotplug for Cortex-A15.
If any regarding patch, please kindly let me know, thanks.

 arch/arm/mach-exynos/hotplug.c |   39 +++++++++++++++++++++++++++++++++++++--
 1 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
index 9c17a0a..2a444b1 100644
--- a/arch/arm/mach-exynos/hotplug.c
+++ b/arch/arm/mach-exynos/hotplug.c
@@ -21,9 +21,11 @@
 
 #include <mach/regs-pmu.h>
 
+#include <plat/cpu.h>
+
 extern volatile int pen_release;
 
-static inline void cpu_enter_lowpower(void)
+static inline void cpu_enter_lowpower_a9(void)
 {
 	unsigned int v;
 
@@ -45,6 +47,35 @@ static inline void cpu_enter_lowpower(void)
 	  : "cc");
 }
 
+static inline void cpu_enter_lowpower_a15(void)
+{
+	unsigned int v;
+
+	asm volatile(
+	"	mrc	p15, 0, %0, c1, c0, 0\n"
+	"	bic	%0, %0, %1\n"
+	"	mcr	p15, 0, %0, c1, c0, 0\n"
+	  : "=&r" (v)
+	  : "Ir" (CR_C)
+	  : "cc");
+
+	flush_cache_all();
+
+	asm volatile(
+	/*
+	* Turn off coherency
+	*/
+	"	mrc	p15, 0, %0, c1, c0, 1\n"
+	"	bic	%0, %0, %1\n"
+	"	mcr	p15, 0, %0, c1, c0, 1\n"
+	: "=&r" (v)
+	: "Ir" (0x40)
+	: "cc");
+
+	isb();
+	dsb();
+}
+
 static inline void cpu_leave_lowpower(void)
 {
 	unsigned int v;
@@ -112,7 +143,11 @@ void platform_cpu_die(unsigned int cpu)
 	/*
 	 * we're ready for shutdown now, so do it
 	 */
-	cpu_enter_lowpower();
+	if (soc_is_exynos5250())
+		cpu_enter_lowpower_a15();
+	else
+		cpu_enter_lowpower_a9();
+
 	platform_do_lowpower(cpu, &spurious);
 
 	/*
-- 
1.7.1
