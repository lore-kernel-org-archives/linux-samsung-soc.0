From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/3] ARM: S5PV310: Add SYSTIMER IO Address mapping for MCT
Date: Tue,  4 Jan 2011 14:45:24 +0900
Message-ID: <1294119926-23189-2-git-send-email-kgene.kim@samsung.com>
References: <1294119926-23189-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39974 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926Ab1ADGKc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 01:10:32 -0500
In-Reply-To: <1294119926-23189-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

The MCT(Multi-Core Timer) is used for implementing kernel timers for
S5PV310 and S5PC210.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/cpu.c              |    5 +++++
 arch/arm/mach-s5pv310/include/mach/map.h |    2 ++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
index 3d0c1cb..99b5dc3 100644
--- a/arch/arm/mach-s5pv310/cpu.c
+++ b/arch/arm/mach-s5pv310/cpu.c
@@ -33,6 +33,11 @@ extern void combiner_cascade_irq(unsigned int combiner_nr, unsigned int irq);
 /* Initial IO mappings */
 static struct map_desc s5pv310_iodesc[] __initdata = {
 	{
+		.virtual	= (unsigned long)S5P_VA_SYSTIMER,
+		.pfn		= __phys_to_pfn(S5PV310_PA_SYSTIMER),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	}, {
 		.virtual	= (unsigned long)S5P_VA_SYSRAM,
 		.pfn		= __phys_to_pfn(S5PV310_PA_SYSRAM),
 		.length		= SZ_4K,
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 7acf4e7..c37e2db 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -41,6 +41,8 @@
 
 #define S5PV310_PA_CMU			(0x10030000)
 
+#define S5PV310_PA_SYSTIMER		(0x10050000)
+
 #define S5PV310_PA_WATCHDOG		(0x10060000)
 #define S5PV310_PA_RTC			(0x10070000)
 
-- 
1.6.2.5
