From: kgene@kernel.org
Subject: [PATCH 07/11] ARM: EXYNOS: local definitions for pm.c into mach-exynos
 dir
Date: Tue, 17 Dec 2013 20:52:36 +0900
Message-ID: <116501cefb1e$7a9c3010$6fd49030$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10970 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752413Ab3LQLwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 06:52:37 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXY00KX38ZOYQ30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Dec 2013 20:52:36 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Kukjin Kim <kgene.kim@samsung.com>

Some of definitions in the regs-clock.h are used only for pm.c,
so this moves them into the file.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/regs-clock.h |   26
------------------------
 arch/arm/mach-exynos/pm.c                      |   26
+++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/regs-clock.h
b/arch/arm/mach-exynos/include/mach/regs-clock.h
index 855f1b2..5acc06e 100644
--- a/arch/arm/mach-exynos/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos/include/mach/regs-clock.h
@@ -18,25 +18,6 @@
 
 #define EXYNOS_CLKREG(x)			(S5P_VA_CMU + (x))
 
-#define EXYNOS4_EPLL_LOCK			EXYNOS_CLKREG(0x0C010)
-#define EXYNOS4_VPLL_LOCK			EXYNOS_CLKREG(0x0C020)
-
-#define EXYNOS4_EPLL_CON0			EXYNOS_CLKREG(0x0C110)
-#define EXYNOS4_EPLL_CON1			EXYNOS_CLKREG(0x0C114)
-#define EXYNOS4_VPLL_CON0			EXYNOS_CLKREG(0x0C120)
-#define EXYNOS4_VPLL_CON1			EXYNOS_CLKREG(0x0C124)
-
-#define EXYNOS4_CLKSRC_MASK_TOP
EXYNOS_CLKREG(0x0C310)
-#define EXYNOS4_CLKSRC_MASK_CAM
EXYNOS_CLKREG(0x0C320)
-#define EXYNOS4_CLKSRC_MASK_TV			EXYNOS_CLKREG(0x0C324)
-#define EXYNOS4_CLKSRC_MASK_LCD0		EXYNOS_CLKREG(0x0C334)
-#define EXYNOS4_CLKSRC_MASK_MAUDIO		EXYNOS_CLKREG(0x0C33C)
-#define EXYNOS4_CLKSRC_MASK_FSYS		EXYNOS_CLKREG(0x0C340)
-#define EXYNOS4_CLKSRC_MASK_PERIL0		EXYNOS_CLKREG(0x0C350)
-#define EXYNOS4_CLKSRC_MASK_PERIL1		EXYNOS_CLKREG(0x0C354)
-
-#define EXYNOS4_CLKSRC_MASK_DMC
EXYNOS_CLKREG(0x10300)
-
 #define EXYNOS4_CLKSRC_CPU			EXYNOS_CLKREG(0x14200)
 #define EXYNOS4_CLKMUX_STATCPU			EXYNOS_CLKREG(0x14400)
 
@@ -45,16 +26,9 @@
 #define EXYNOS4_CLKDIV_STATCPU			EXYNOS_CLKREG(0x14600)
 #define EXYNOS4_CLKDIV_STATCPU1
EXYNOS_CLKREG(0x14604)
 
-#define EXYNOS4_EPLLCON0_LOCKED_SHIFT		(29)
-#define EXYNOS4_VPLLCON0_LOCKED_SHIFT		(29)
-
 #define EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT	(16)
 #define EXYNOS4_CLKMUX_STATCPU_MUXCORE_MASK	(0x7 <<
EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT)
 
-/* Only for EXYNOS4210 */
-
-#define EXYNOS4210_CLKSRC_MASK_LCD1		EXYNOS_CLKREG(0x0C338)
-
 /* For EXYNOS5250 */
 
 #define EXYNOS5_APLL_LOCK			EXYNOS_CLKREG(0x00000)
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index d4a3368..7f89213 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -29,12 +29,36 @@
 #include <plat/pll.h>
 #include <plat/regs-srom.h>
 
-#include <mach/regs-clock.h>
+#include <mach/map.h>
 #include <mach/pm-core.h>
 
 #include "common.h"
 #include "regs-pmu.h"
 
+#define EXYNOS4_EPLL_LOCK			(S5P_VA_CMU + 0x0C010)
+#define EXYNOS4_VPLL_LOCK			(S5P_VA_CMU + 0x0C020)
+
+#define EXYNOS4_EPLL_CON0			(S5P_VA_CMU + 0x0C110)
+#define EXYNOS4_EPLL_CON1			(S5P_VA_CMU + 0x0C114)
+#define EXYNOS4_VPLL_CON0			(S5P_VA_CMU + 0x0C120)
+#define EXYNOS4_VPLL_CON1			(S5P_VA_CMU + 0x0C124)
+
+#define EXYNOS4_CLKSRC_MASK_TOP			(S5P_VA_CMU +
0x0C310)
+#define EXYNOS4_CLKSRC_MASK_CAM			(S5P_VA_CMU +
0x0C320)
+#define EXYNOS4_CLKSRC_MASK_TV			(S5P_VA_CMU + 0x0C324)
+#define EXYNOS4_CLKSRC_MASK_LCD0		(S5P_VA_CMU + 0x0C334)
+#define EXYNOS4_CLKSRC_MASK_MAUDIO		(S5P_VA_CMU + 0x0C33C)
+#define EXYNOS4_CLKSRC_MASK_FSYS		(S5P_VA_CMU + 0x0C340)
+#define EXYNOS4_CLKSRC_MASK_PERIL0		(S5P_VA_CMU + 0x0C350)
+#define EXYNOS4_CLKSRC_MASK_PERIL1		(S5P_VA_CMU + 0x0C354)
+
+#define EXYNOS4_CLKSRC_MASK_DMC			(S5P_VA_CMU +
0x10300)
+
+#define EXYNOS4_EPLLCON0_LOCKED_SHIFT		(29)
+#define EXYNOS4_VPLLCON0_LOCKED_SHIFT		(29)
+
+#define EXYNOS4210_CLKSRC_MASK_LCD1		(S5P_VA_CMU + 0x0C338)
+
 static struct sleep_save exynos4_set_clksrc[] = {
 	{ .reg = EXYNOS4_CLKSRC_MASK_TOP		, .val = 0x00000001,
},
 	{ .reg = EXYNOS4_CLKSRC_MASK_CAM		, .val = 0x11111111,
},
-- 
1.7.10.4
