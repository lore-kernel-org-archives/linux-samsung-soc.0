From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix wrong constants in the hotplug assembly code.
Date: Wed, 23 Feb 2011 16:03:41 +0900
Message-ID: <1298444621-3739-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51583 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661Ab1BWHbc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Feb 2011 02:31:32 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>

This patch fixes wrong constants in the hotplug assembly code for
Exynos4 such as Russell's changing in vexpress hotplug and fixes
hard-coded control register constatns also.

Reported-by: Changhwan Youn <chaos.youn@samsung.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/hotplug.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos4/hotplug.c b/arch/arm/mach-exynos4/hotplug.c
index 4c42f9c..2b5909e 100644
--- a/arch/arm/mach-exynos4/hotplug.c
+++ b/arch/arm/mach-exynos4/hotplug.c
@@ -30,13 +30,13 @@ static inline void cpu_enter_lowpower(void)
 	 * Turn off coherency
 	 */
 	"	mrc	p15, 0, %0, c1, c0, 1\n"
-	"	bic	%0, %0, #0x20\n"
+	"	bic	%0, %0, %3\n"
 	"	mcr	p15, 0, %0, c1, c0, 1\n"
 	"	mrc	p15, 0, %0, c1, c0, 0\n"
 	"	bic	%0, %0, %2\n"
 	"	mcr	p15, 0, %0, c1, c0, 0\n"
 	  : "=&r" (v)
-	  : "r" (0), "Ir" (CR_C)
+	  : "r" (0), "Ir" (CR_C), "Ir" (0x40)
 	  : "cc");
 }
 
@@ -49,10 +49,10 @@ static inline void cpu_leave_lowpower(void)
 	"	orr	%0, %0, %1\n"
 	"	mcr	p15, 0, %0, c1, c0, 0\n"
 	"	mrc	p15, 0, %0, c1, c0, 1\n"
-	"	orr	%0, %0, #0x20\n"
+	"	orr	%0, %0, %2\n"
 	"	mcr	p15, 0, %0, c1, c0, 1\n"
 	  : "=&r" (v)
-	  : "Ir" (CR_C)
+	  : "Ir" (CR_C), "Ir" (0x40)
 	  : "cc");
 }
 
-- 
1.7.1
