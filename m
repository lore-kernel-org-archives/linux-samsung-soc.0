From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 2/4] ARM: EXYNOS4: Update Kconfig and Makefile for s5p_timer
Date: Tue,  5 Apr 2011 09:28:43 +0900
Message-ID: <1301963325-22349-3-git-send-email-sbkim73@samsung.com>
References: <1301963325-22349-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50714 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184Ab1DEA7C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2011 20:59:02 -0400
In-Reply-To: <1301963325-22349-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

This patch add s5p_timer support configuration
and change Makefile for deleting useless object file.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig  |    2 ++
 arch/arm/mach-exynos4/Makefile |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e849f67..f3bb2f2 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -12,6 +12,7 @@ if ARCH_EXYNOS4
 config CPU_EXYNOS4210
 	bool
 	select S3C_PL330_DMA
+	select S5P_HRT
 	help
 	  Enable EXYNOS4210 CPU support
 
@@ -127,6 +128,7 @@ config MACH_SMDKV310
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_KEYPAD
+	select SAMSUNG_DEV_PWM
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for Samsung SMDKV310
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index 9be104f..2583340 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -22,7 +22,6 @@ obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
 ifeq ($(CONFIG_EXYNOS4_MCT),y)
 obj-y				+= mct.o
 else
-obj-y				+= time.o
 obj-$(CONFIG_LOCAL_TIMERS)	+= localtimer.o
 endif
 
-- 
1.7.1
