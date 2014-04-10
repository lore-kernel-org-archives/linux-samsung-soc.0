From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 20/20] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle directory
Date: Thu, 10 Apr 2014 11:55:51 +0200
Message-ID: <1397123751-1957-21-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:46811 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965630AbaDJJ4D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:56:03 -0400
Received: by mail-wi0-f180.google.com with SMTP id q5so4665319wiv.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:56:01 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/Makefile                      |    1 -
 drivers/cpuidle/Kconfig.arm                        |    6 ++++++
 drivers/cpuidle/Makefile                           |    1 +
 .../cpuidle.c => drivers/cpuidle/cpuidle-exynos.c  |    0
 4 files changed, 7 insertions(+), 1 deletion(-)
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
index d988948..364c984 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -44,3 +44,9 @@ config ARM_AT91_CPUIDLE
 	depends on ARCH_AT91
 	help
 	  Select this to enable cpuidle for AT91 processors
+
+config ARM_EXYNOS_CPUIDLE
+	bool "Cpu Idle Driver for the Exynos processors"
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
