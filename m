From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/6] ARM: dts: Add MFC codec support for Exynos4 DT machines
Date: Wed, 30 Jan 2013 12:41:25 +0530
Message-ID: <1359529889-26318-3-git-send-email-sachin.kamat@linaro.org>
References: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:48818 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753684Ab3A3HUk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 02:20:40 -0500
Received: by mail-pa0-f52.google.com with SMTP id kp6so913435pab.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 23:20:40 -0800 (PST)
In-Reply-To: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch adds MFC codec support for Exynos4 DT machines.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi         |    8 ++++++++
 arch/arm/mach-exynos/Kconfig           |    1 +
 arch/arm/mach-exynos/mach-exynos4-dt.c |   17 +++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e1347fc..6581bb2 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -131,6 +131,14 @@
 		status = "disabled";
 	};
 
+	mfc: codec@13400000 {
+		compatible = "samsung,mfc-v5";
+		reg = <0x13400000 0x10000>;
+		interrupts = <0 94 0>;
+		samsung,power-domain = <&pd_mfc>;
+		status = "disabled";
+	};
+
 	serial@13800000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x13800000 0x100>;
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e103c29..f0d8f09 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -415,6 +415,7 @@ config MACH_EXYNOS4_DT
 	select HAVE_SAMSUNG_KEYPAD if INPUT_KEYBOARD
 	select PINCTRL
 	select PINCTRL_EXYNOS4
+	select S5P_DEV_MFC
 	select USE_OF
 	help
 	  Machine support for Samsung Exynos4 machine with device tree enabled.
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index ab1dacc..8ae8da1 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -12,7 +12,9 @@
 */
 
 #include <linux/of_platform.h>
+#include <linux/of_fdt.h>
 #include <linux/serial_core.h>
+#include <linux/memblock.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -20,6 +22,7 @@
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
+#include <plat/mfc.h>
 
 #include "common.h"
 
@@ -80,6 +83,7 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
 				"exynos-tmu", NULL),
+	OF_DEV_AUXDATA("samsung,mfc-v5", 0x13400000, "s5p-mfc", NULL),
 	{},
 };
 
@@ -102,6 +106,18 @@ static char const *exynos4_dt_compat[] __initdata = {
 	NULL
 };
 
+static void __init exynos4_reserve(void)
+{
+#ifdef CONFIG_S5P_DEV_MFC
+	struct s5p_mfc_dt_meminfo mfc_mem;
+
+	/* Reserve memory for MFC only if it's available */
+	mfc_mem.compatible = "samsung,mfc-v5";
+	if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))
+		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
+				mfc_mem.lsize);
+#endif
+}
 DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
 	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
 	.smp		= smp_ops(exynos_smp_ops),
@@ -114,4 +130,5 @@ DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
 	.timer		= &exynos4_timer,
 	.dt_compat	= exynos4_dt_compat,
 	.restart        = exynos4_restart,
+	.reserve	= exynos4_reserve,
 MACHINE_END
-- 
1.7.4.1
