From: Naveen Krishna Ch <ch.naveen@samsung.com>
Subject: [PATCH 2/4] ARM: EXYNOS4: Update keypad base address
Date: Sat,  5 Mar 2011 10:25:15 +0900
Message-ID: <1299288317-13740-3-git-send-email-ch.naveen@samsung.com>
References: <1299288317-13740-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44022 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759871Ab1CEBxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 20:53:40 -0500
In-Reply-To: <1299288317-13740-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

This patch updates the keypad IF base address in the memory map
for EXYNOS4.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/map.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 80a41e0..d7e331a 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -47,6 +47,8 @@
 #define EXYNOS4_PA_WATCHDOG		0x10060000
 #define EXYNOS4_PA_RTC			0x10070000
 
+#define EXYNOS4_PA_KEYPAD		0x100A0000
+
 #define EXYNOS4_PA_DMC0			0x10400000
 
 #define EXYNOS4_PA_COMBINER		0x10448000
@@ -128,6 +130,8 @@
 #define S5P_PA_SYSCON			EXYNOS4_PA_SYSCON
 #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
 
+#define SAMSUNG_PA_KEYPAD		EXYNOS4_PA_KEYPAD
+
 /* UART */
 
 #define S3C_PA_UART			EXYNOS4_PA_UART
-- 
1.7.1
