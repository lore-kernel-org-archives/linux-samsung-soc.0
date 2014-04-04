From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V2 16/17] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle directory
Date: Fri,  4 Apr 2014 15:43:08 +0200
Message-ID: <1396618989-2897-17-git-send-email-daniel.lezcano@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:62740 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752841AbaDDNnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 09:43:19 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so3453806wgh.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 06:43:18 -0700 (PDT)
In-Reply-To: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-exynos/Makefile                      |    1 -
 drivers/cpuidle/Kconfig.arm                        |    7 +++++++
 drivers/cpuidle/Makefile                           |    1 +
 .../cpuidle.c => drivers/cpuidle/cpuidle-exynos.c  |    0
 4 files changed, 8 insertions(+), 1 deletion(-)
 rename arch/arm/mach-exynos/cpuidle.c => drivers/cpuidle/cpuidle-exynos.c (100%)

diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index a656dbe..21bd364 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o
 
 obj-$(CONFIG_PM_SLEEP)		+= pm.o sleep.o
 obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
-obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
 
 obj-$(CONFIG_ARCH_EXYNOS)	+= pmu.o
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index d988948..92f0c12 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -44,3 +44,10 @@ config ARM_AT91_CPUIDLE
 	depends on ARCH_AT91
 	help
 	  Select this to enable cpuidle for AT91 processors
+
+config ARM_EXYNOS_CPUIDLE
+	bool "Cpu Idle Driver for the Exynos processors"
+	default y
+	depends on ARCH_EXYNOS
+	help
+	  Select this to enable cpuidle for Exynos processors
diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
index f71ae1b..0d1540a 100644
--- a/drivers/cpuidle/Makefile
+++ b/drivers/cpuidle/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_ARM_KIRKWOOD_CPUIDLE)	+= cpuidle-kirkwood.o
 obj-$(CONFIG_ARM_ZYNQ_CPUIDLE)		+= cpuidle-zynq.o
 obj-$(CONFIG_ARM_U8500_CPUIDLE)         += cpuidle-ux500.o
 obj-$(CONFIG_ARM_AT91_CPUIDLE)          += cpuidle-at91.o
+obj-$(CONFIG_ARM_EXYNOS_CPUIDLE)        += cpuidle-exynos.o
 
 ###############################################################################
 # POWERPC drivers
diff --git a/arch/arm/mach-exynos/cpuidle.c b/drivers/cpuidle/cpuidle-exynos.c
similarity index 100%
rename from arch/arm/mach-exynos/cpuidle.c
rename to drivers/cpuidle/cpuidle-exynos.c
-- 
1.7.9.5
