From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 3/3] ARM: S5PV310: Update Kconfig and Makefile for supporting CPUFREQ
Date: Fri, 17 Dec 2010 17:14:35 +0900
Message-ID: <1292573675-15643-4-git-send-email-sbkim73@samsung.com>
References: <1292573675-15643-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43195 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842Ab0LQIba (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Dec 2010 03:31:30 -0500
In-Reply-To: <1292573675-15643-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, SangWook Ju <sw.ju@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: SangWook Ju <sw.ju@samsung.com>

This patch adds ARCH_HAS_CPUFREQ in Kconfig of ARCH_S5PV310 and updates
Makefile for supporting build S5PV310 CPUFREQ driver

Signed-off-by: Sangwook Ju <sw.ju@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv310/Kconfig  |    1 +
 arch/arm/mach-s5pv310/Makefile |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index d64efe0..6c1c62e 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -68,6 +68,7 @@ menu "S5PC210 Machines"
 config MACH_SMDKC210
 	bool "SMDKC210"
 	select CPU_S5PV310
+	select ARCH_HAS_CPUFREQ
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC
diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/Makefile
index 61e3cb6..3af462d 100644
--- a/arch/arm/mach-s5pv310/Makefile
+++ b/arch/arm/mach-s5pv310/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_CPU_S5PV310)	+= setup-i2c0.o time.o gpiolib.o irq-eint.o dma.o
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
 obj-$(CONFIG_LOCAL_TIMERS)	+= localtimer.o
 obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
+obj-$(CONFIG_CPU_FREQ)		+= cpufreq.o
 
 # machine support
 
-- 
1.6.3.3
