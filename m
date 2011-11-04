From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Enable write full line for zeros mode
Date: Fri,  4 Nov 2011 11:17:36 +0900
Message-ID: <1320373056-11718-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56502 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754543Ab1KDCjO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Nov 2011 22:39:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>

This patch enables the 'write full line for zeros mode' feature of cortex-A9.
The performance of memset() with zero is increased about 10% with this patch.

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 arch/arm/mach-exynos4/platsmp.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exynos4/platsmp.c
index d5f0f29..edf7054 100644
--- a/arch/arm/mach-exynos4/platsmp.c
+++ b/arch/arm/mach-exynos4/platsmp.c
@@ -90,6 +90,16 @@ static void __cpuinit exynos4_gic_secondary_init(void)
 	__raw_writel(1, cpu_base + GIC_CPU_CTRL);
 }
 
+static void enable_foz(void)
+{
+	u32 val;
+	asm volatile(
+	"mrc   p15, 0, %0, c1, c0, 1\n"
+	"orr   %0, %0, #(1 << 3)\n"
+	"mcr   p15, 0, %0, c1, c0, 1"
+	: "=r" (val));
+}
+
 void __cpuinit platform_secondary_init(unsigned int cpu)
 {
 	/*
@@ -106,6 +116,14 @@ void __cpuinit platform_secondary_init(unsigned int cpu)
 	write_pen_release(-1);
 
 	/*
+	* Enable write full line for zeros mode
+	*/
+	if (soc_is_exynos4210() | soc_is_exynos4212() | soc_is_exynos4412()) {
+		enable_foz();
+		smp_call_function((void (*)(void *))enable_foz, NULL, 0);
+	}
+
+	/*
 	 * Synchronise with the boot thread.
 	 */
 	spin_lock(&boot_lock);
-- 
1.7.1
