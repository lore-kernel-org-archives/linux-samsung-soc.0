From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 2/2] arm: exynos4: Add a new Exynos4 device tree enabled
 machine
Date: Sun, 17 Jul 2011 10:28:20 +0530
Message-ID: <1310878700-1507-3-git-send-email-thomas.abraham@linaro.org>
References: <1310878700-1507-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28201 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984Ab1GQEqg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jul 2011 00:46:36 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOG00DU9NXL5P10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:46:35 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOG00J0INXHII@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:46:35 +0900 (KST)
In-reply-to: <1310878700-1507-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org

Basic Exynos4 machine with device tree support that can boot on a
Exynos4 processor based board and bring up the console.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 Documentation/devicetree/bindings/arm/samsung.txt |   11 +-
 arch/arm/mach-exynos4/Kconfig                     |   10 ++
 arch/arm/mach-exynos4/Makefile                    |    1 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c           |  112 +++++++++++++++++++++
 4 files changed, 128 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c

diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Documentation/devicetree/bindings/arm/samsung.txt
index 594cb97..5676bca 100644
--- a/Documentation/devicetree/bindings/arm/samsung.txt
+++ b/Documentation/devicetree/bindings/arm/samsung.txt
@@ -1,9 +1,8 @@
-Samsung Exynos4 S5PV310 SoC based SMDKV310 eval board
+Samsung Exynos4 architecture based SMDKV310 eval board
 
-    SMDKV310 eval board is based on S5PV310 SoC which belongs to
-    Samsung's Exynos4 family of application processors.
+  SMDKV310 eval board is based on Samsung's Exynos4210 application processor.
 
 Required root node properties:
-    - compatible = "samsung,smdkv310","samsung,s5pv310"
-        (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval board.
-        (b) "samsung,s5pv310"  - for boards based on S5PV310 SoC.
+  - compatible = "samsung,smdkv310", "samsung,exynos4210'.
+      (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval board.
+      (b) "samsung,exynos4210" - for boards based on Exynos4210 processor.
diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 1435fc3..bb97b7e 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -186,6 +186,16 @@ config MACH_NURI
 	help
 	  Machine support for Samsung Mobile NURI Board.
 
+config MACH_EXYNOS4_DT
+	bool "Samsung Exynos4 Machine using device tree"
+	select CPU_EXYNOS4210
+	select USE_OF
+	select S3C_DEV_HSMMC
+	select S3C_DEV_HSMMC2
+	select EXYNOS4_SETUP_SDHCI
+	help
+	  Machine support for Samsung Exynos4 machine with device tree enabled.
+
 endmenu
 
 comment "Configuration for HSMMC bus width"
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index 60fe5ec..6491e5b 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_MACH_SMDKV310)		+= mach-smdkv310.o
 obj-$(CONFIG_MACH_ARMLEX4210)		+= mach-armlex4210.o
 obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
 obj-$(CONFIG_MACH_NURI)			+= mach-nuri.o
+obj-$(CONFIG_MACH_EXYNOS4_DT)		+= mach-exynos4-dt.o
 
 # device support
 
diff --git a/arch/arm/mach-exynos4/mach-exynos4-dt.c b/arch/arm/mach-exynos4/mach-exynos4-dt.c
new file mode 100644
index 0000000..120665a
--- /dev/null
+++ b/arch/arm/mach-exynos4/mach-exynos4-dt.c
@@ -0,0 +1,112 @@
+/*
+ * Samsung's Exynos4 device tree enabled machine.
+ *
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2010-2011 Linaro Ltd.
+ *		www.linaro.org
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/serial_core.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/irq.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach-types.h>
+
+#include <plat/regs-serial.h>
+#include <plat/exynos4.h>
+#include <plat/cpu.h>
+#include <plat/sdhci.h>
+
+#include <mach/map.h>
+
+/* Following are default values for UCON, ULCON and UFCON UART registers */
+#define SMDKV310_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
+				 S3C2410_UCON_RXILEVEL |	\
+				 S3C2410_UCON_TXIRQMODE |	\
+				 S3C2410_UCON_RXIRQMODE |	\
+				 S3C2410_UCON_RXFIFO_TOI |	\
+				 S3C2443_UCON_RXERR_IRQEN)
+
+#define SMDKV310_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
+				 S5PV210_UFCON_TXTRIG4 |	\
+				 S5PV210_UFCON_RXTRIG4)
+
+static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
+	[0] = {
+		.hwport		= 0,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+	[1] = {
+		.hwport		= 1,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+	[2] = {
+		.hwport		= 2,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+	[3] = {
+		.hwport		= 3,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+};
+
+/*
+ * The following lookup table is used to override device names when devices
+ * are registered from device tree. Optionally, the platform data can also
+ * to supplied. The sdhci driver requires the device name to be overridden
+ * and also requires a platform data to be supplied.
+ *
+ * This is temporarily added to enable device tree support.
+ */
+static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
+	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", EXYNOS4_PA_HSMMC(2),
+				"s3c-sdhci.2", &s3c_hsmmc2_def_platdata),
+	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", EXYNOS4_PA_HSMMC(0),
+				"s3c-sdhci.0", &s3c_hsmmc0_def_platdata),
+	{},
+};
+
+static void __init exynos4_dt_map_io(void)
+{
+	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
+}
+
+static const struct of_device_id intc_of_match[] __initconst = {
+	{ .compatible = "samsung,exynos4-gic", },
+	{}
+};
+
+static void __init exynos4_dt_machine_init(void)
+{
+	irq_domain_generate_simple(intc_of_match, EXYNOS4_PA_GIC_DIST, 0);
+	of_platform_populate(NULL, of_default_bus_match_table,
+				exynos4_auxdata_lookup, NULL);
+}
+
+static char const *exynos4_dt_compat[] __initdata = {
+	"samsung,exynos4210",
+	NULL
+};
+
+DT_MACHINE_START(SMDKV310, "Samsung Exynos4 DT")
+	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
+	.init_irq	= exynos4_init_irq,
+	.map_io		= exynos4_dt_map_io,
+	.init_machine	= exynos4_dt_machine_init,
+	.timer		= &exynos4_timer,
+	.dt_compat	= exynos4_dt_compat,
+MACHINE_END
-- 
1.7.1
