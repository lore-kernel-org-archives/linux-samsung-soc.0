From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 1/4] ARM: S5P: Change s5p_timer for local timer support
Date: Tue,  5 Apr 2011 09:28:42 +0900
Message-ID: <1301963325-22349-2-git-send-email-sbkim73@samsung.com>
References: <1301963325-22349-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50710 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125Ab1DEA7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2011 20:59:01 -0400
In-Reply-To: <1301963325-22349-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Sangbeom Kim <sbkim73@samsung.com>

This patch adds local timer support for s5p_timer
and Change Kconfig for SCHED_CLOCK support

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/Kconfig             |    1 +
 arch/arm/plat-s5p/s5p-time.c |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7c0effb..828f2d5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -782,6 +782,7 @@ config ARCH_EXYNOS4
 	select HAVE_CLK
 	select ARCH_HAS_CPUFREQ
 	select GENERIC_CLOCKEVENTS
+	select HAVE_SCHED_CLOCK
 	select HAVE_S3C_RTC if RTC_CLASS
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
diff --git a/arch/arm/plat-s5p/s5p-time.c b/arch/arm/plat-s5p/s5p-time.c
index 8090403..736b138 100644
--- a/arch/arm/plat-s5p/s5p-time.c
+++ b/arch/arm/plat-s5p/s5p-time.c
@@ -438,6 +438,10 @@ static void __init s5p_timer_resources(void)
 
 static void __init s5p_timer_init(void)
 {
+#ifdef CONFIG_LOCAL_TIMERS
+	twd_base = S5P_VA_TWD;
+#endif
+
 	s5p_timer_resources();
 	s5p_clockevent_init();
 	s5p_clocksource_init();
-- 
1.7.1
