From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/6] ARM: dts: Add MFC codec support for Exynos4 DT machines
Date: Tue, 29 Jan 2013 09:43:38 +0530
Message-ID: <1359432822-23846-3-git-send-email-sachin.kamat@linaro.org>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:61439 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab3A2EWu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 23:22:50 -0500
Received: by mail-pb0-f51.google.com with SMTP id un15so14962pbc.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 20:22:50 -0800 (PST)
In-Reply-To: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch adds MFC codec support for Exynos4 DT machines.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi         |    7 +++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c |   17 +++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e1347fc..1122fb1 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -289,4 +289,11 @@
 			interrupts = <0 34 0>;
 		};
 	};
+
+	mfc: codec@13400000 {
+		compatible = "samsung,mfc-v5";
+		reg = <0x13400000 0x10000>;
+		interrupts = <0 94 0>;
+		samsung,power-domain = <&pd_mfc>;
+	};
 };
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
