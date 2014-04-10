From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/6] ARM: EXYNOS: Remove duplicate lines in Makefile
Date: Thu, 10 Apr 2014 13:54:51 +0530
Message-ID: <1397118296-6846-2-git-send-email-sachin.kamat@linaro.org>
References: <1397118296-6846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:54457 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965596AbaDJIZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 04:25:42 -0400
Received: by mail-pd0-f171.google.com with SMTP id r10so3591281pdi.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 01:25:42 -0700 (PDT)
In-Reply-To: <1397118296-6846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, kgene.kim@samsung.com, sachin.kamat@linaro.org

Group all files compiled under common config option together.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Makefile |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index a656dbe3b78c..f6dcc256db56 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -12,20 +12,15 @@ obj-				:=
 
 # Core
 
-obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o
+obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o pmu.o exynos-smc.o firmware.o
 
 obj-$(CONFIG_PM_SLEEP)		+= pm.o sleep.o
 obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
 obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
 
-obj-$(CONFIG_ARCH_EXYNOS)	+= pmu.o
-
 obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
 
 obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
 
-obj-$(CONFIG_ARCH_EXYNOS)	+= exynos-smc.o
-obj-$(CONFIG_ARCH_EXYNOS)	+= firmware.o
-
 plus_sec := $(call as-instr,.arch_extension sec,+sec)
 AFLAGS_exynos-smc.o		:=-Wa,-march=armv7-a$(plus_sec)
-- 
1.7.9.5
