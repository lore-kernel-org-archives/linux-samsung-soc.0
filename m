From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V3 2/7] ARM: S5PV310: Define missing CMU register for CPUFREQ
Date: Thu, 23 Dec 2010 14:49:52 +0900
Message-ID: <1293083397-15969-3-git-send-email-kgene.kim@samsung.com>
References: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56535 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258Ab0LWGHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 01:07:50 -0500
In-Reply-To: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Sangwook Ju <sw.ju@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Sangwook Ju <sw.ju@samsung.com>

This patch adds missing CMU(Clock Management Unit) registers for
updated S5PV310 CPUFREQ driver.

Signed-off-by: Sangwook Ju <sw.ju@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/regs-clock.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/regs-clock.h b/arch/arm/mach-s5pv310/include/mach/regs-clock.h
index 9e9e44c..b5c4ada 100644
--- a/arch/arm/mach-s5pv310/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv310/include/mach/regs-clock.h
@@ -89,7 +89,9 @@
 #define S5P_CLKMUX_STATCPU		S5P_CLKREG(0x14400)
 
 #define S5P_CLKDIV_CPU			S5P_CLKREG(0x14500)
+#define S5P_CLKDIV_CPU1			S5P_CLKREG(0x14504)
 #define S5P_CLKDIV_STATCPU		S5P_CLKREG(0x14600)
+#define S5P_CLKDIV_STATCPU1		S5P_CLKREG(0x14604)
 
 #define S5P_CLKGATE_SCLKCPU		S5P_CLKREG(0x14800)
 
@@ -100,6 +102,7 @@
 #define S5P_APLLCON0_ENABLE_SHIFT	(31)
 #define S5P_APLLCON0_LOCKED_SHIFT	(29)
 #define S5P_APLL_VAL_1000		((250 << 16) | (6 << 8) | 1)
+#define S5P_APLL_VAL_800		((200 << 16) | (6 << 8) | 1)
 
 /* CLK_SRC_CPU */
 #define S5P_CLKSRC_CPU_MUXCORE_SHIFT	(16)
-- 
1.6.2.5
