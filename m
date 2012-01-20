From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Remove build warning without enabling PM
Date: Fri, 20 Jan 2012 14:16:27 +0900
Message-ID: <00a901ccd732$ac2515f0$046f41d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18766 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052Ab2ATFQj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jan 2012 00:16:39 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LY200DMFZZMCWN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2012 14:16:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LY20072QZZKY5X0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2012 14:16:37 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Fixed following build warning with exynos4_defconfig.
arch/arm/mach-exynos/clock.c:33: warning: 'exynos4_clock_save' defined but not used
arch/arm/mach-exynos/clock-exynos4210.c:35: warning: 'exynos4210_clock_save' defined but not used
arch/arm/mach-exynos/clock-exynos4212.c:35: warning: 'exynos4212_clock_save' defined but not used

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---

 arch/arm/mach-exynos/clock-exynos4210.c |    2 ++
 arch/arm/mach-exynos/clock-exynos4212.c |    2 ++
 arch/arm/mach-exynos/clock.c            |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos4210.c b/arch/arm/mach-exynos/clock-exynos4210.c
index a5823a7..13312cc 100644
--- a/arch/arm/mach-exynos/clock-exynos4210.c
+++ b/arch/arm/mach-exynos/clock-exynos4210.c
@@ -32,6 +32,7 @@
 
 #include "common.h"
 
+#ifdef CONFIG_PM_SLEEP
 static struct sleep_save exynos4210_clock_save[] = {
 	SAVE_ITEM(S5P_CLKSRC_IMAGE),
 	SAVE_ITEM(S5P_CLKSRC_LCD1),
@@ -42,6 +43,7 @@ static struct sleep_save exynos4210_clock_save[] = {
 	SAVE_ITEM(S5P_CLKGATE_IP_LCD1),
 	SAVE_ITEM(S5P_CLKGATE_IP_PERIR_4210),
 };
+#endif
 
 static struct clksrc_clk *sysclks[] = {
 	/* nothing here yet */
diff --git a/arch/arm/mach-exynos/clock-exynos4212.c b/arch/arm/mach-exynos/clock-exynos4212.c
index 26a668b..48af285 100644
--- a/arch/arm/mach-exynos/clock-exynos4212.c
+++ b/arch/arm/mach-exynos/clock-exynos4212.c
@@ -32,12 +32,14 @@
 
 #include "common.h"
 
+#ifdef CONFIG_PM_SLEEP
 static struct sleep_save exynos4212_clock_save[] = {
 	SAVE_ITEM(S5P_CLKSRC_IMAGE),
 	SAVE_ITEM(S5P_CLKDIV_IMAGE),
 	SAVE_ITEM(S5P_CLKGATE_IP_IMAGE_4212),
 	SAVE_ITEM(S5P_CLKGATE_IP_PERIR_4212),
 };
+#endif
 
 static struct clk *clk_src_mpll_user_list[] = {
 	[0] = &clk_fin_mpll,
diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock.c
index 5a8c42e..187287a 100644
--- a/arch/arm/mach-exynos/clock.c
+++ b/arch/arm/mach-exynos/clock.c
@@ -30,6 +30,7 @@
 
 #include "common.h"
 
+#ifdef CONFIG_PM_SLEEP
 static struct sleep_save exynos4_clock_save[] = {
 	SAVE_ITEM(S5P_CLKDIV_LEFTBUS),
 	SAVE_ITEM(S5P_CLKGATE_IP_LEFTBUS),
@@ -93,6 +94,7 @@ static struct sleep_save exynos4_clock_save[] = {
 	SAVE_ITEM(S5P_CLKGATE_SCLKCPU),
 	SAVE_ITEM(S5P_CLKGATE_IP_CPU),
 };
+#endif
 
 struct clk clk_sclk_hdmi27m = {
 	.name		= "sclk_hdmi27m",
-- 
1.7.1
