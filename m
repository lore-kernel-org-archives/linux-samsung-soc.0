From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] [CPUFREQ] Move compile for S3C64XX cpufreq to /drivers/cpufreq
Date: Mon,  6 Jun 2011 18:43:01 -0700
Message-ID: <1307410981-20392-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:42906 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756721Ab1FGBnN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2011 21:43:13 -0400
Received: by pzk9 with SMTP id 9so2228911pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2011 18:43:13 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dave Jones <davej@redhat.com>

Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Dave Jones <davej@redhat.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/Kconfig                                 |    4 ----
 drivers/cpufreq/Kconfig.arm                      |    9 +++++++++
 drivers/cpufreq/Makefile                         |    2 +-
 drivers/cpufreq/{s3c64xx.c => s3c64xx-cpufreq.c} |    0
 4 files changed, 10 insertions(+), 5 deletions(-)
 rename drivers/cpufreq/{s3c64xx.c => s3c64xx-cpufreq.c} (100%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9adc278..31c2899 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1875,10 +1875,6 @@ config CPU_FREQ_PXA
 	default y
 	select CPU_FREQ_DEFAULT_GOV_USERSPACE
 
-config CPU_FREQ_S3C64XX
-	bool "CPUfreq support for Samsung S3C64XX CPUs"
-	depends on CPU_FREQ && CPU_S3C6410
-
 config CPU_FREQ_S3C
 	bool
 	help
diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index e5c56c7..500982f 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -2,6 +2,15 @@
 # ARM CPU Frequency scaling drivers
 #
 
+config ARM_S3C64XX_CPUFREQ
+	bool "Samsung S3C64XX"
+	depends on CPU_S3C6410
+	default y
+	help
+	  This adds the CPUFreq driver for Samsung S5C6410 SoC.
+
+	  If in doubt, say N.
+
 config ARM_S5PV210_CPUFREQ
 	bool "Samsung S5PV210 and S5PC110"
 	depends on CPU_S5PV210
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 5419478..ab75e57 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -40,6 +40,6 @@ obj-$(CONFIG_X86_CPUFREQ_NFORCE2)	+= cpufreq-nforce2.o
 ##################################################################################
 # ARM SoC drivers
 obj-$(CONFIG_UX500_SOC_DB8500)		+= db8500-cpufreq.o
-obj-$(CONFIG_CPU_FREQ_S3C64XX)		+= s3c64xx.o
+obj-$(CONFIG_ARM_S3C64XX_CPUFREQ)	+= s3c64xx-cpufreq.o
 obj-$(CONFIG_ARM_S5PV210_CPUFREQ)	+= s5pv210-cpufreq.o
 obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ)	+= exynos4210-cpufreq.o
diff --git a/drivers/cpufreq/s3c64xx.c b/drivers/cpufreq/s3c64xx-cpufreq.c
similarity index 100%
rename from drivers/cpufreq/s3c64xx.c
rename to drivers/cpufreq/s3c64xx-cpufreq.c
-- 
1.7.4.4
