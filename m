From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS4: Add SYSTIMER IO Address mapping for MCT
Date: Mon, 28 Feb 2011 14:16:45 +0900
Message-ID: <1298870207-1850-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46900 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154Ab1B1Frj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 00:47:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

The MCT(Multi-Core Timer) is used for implementing kernel timers for
EXYNOS4210.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/cpu.c              |    5 +++++
 arch/arm/mach-exynos4/include/mach/map.h |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index b0ec6d3..479dfa1 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -31,6 +31,11 @@ extern void combiner_cascade_irq(unsigned int combiner_nr, unsigned int irq);
 /* Initial IO mappings */
 static struct map_desc exynos4_iodesc[] __initdata = {
 	{
+		.virtual	= (unsigned long)S5P_VA_SYSTIMER,
+		.pfn		= __phys_to_pfn(EXYNOS4_PA_SYSTIMER),
+		.length		= SZ_4K,
+		.type	 	= MT_DEVICE,
+	}, {
 		.virtual	= (unsigned long)S5P_VA_SYSRAM,
 		.pfn		= __phys_to_pfn(EXYNOS4_PA_SYSRAM),
 		.length		= SZ_4K,
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 80a41e0..d678f08 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -44,6 +44,7 @@
 #define EXYNOS4_PA_PMU			0x10020000
 #define EXYNOS4_PA_CMU			0x10030000
 
+#define EXYNOS4_PA_SYSTIMER		0x10050000
 #define EXYNOS4_PA_WATCHDOG		0x10060000
 #define EXYNOS4_PA_RTC			0x10070000
 
-- 
1.7.1
