From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV310: Add support system mmu
Date: Mon,  3 Jan 2011 19:48:57 +0900
Message-ID: <1294051737-4278-2-git-send-email-sbkim73@samsung.com>
References: <1294051737-4278-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45996 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753275Ab1ACLKS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jan 2011 06:10:18 -0500
In-Reply-To: <1294051737-4278-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Donguk Ryu <du.ryu@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Donguk Ryu <du.ryu@samsung.com>

This patch adds support system mmu for S5PV310 and S5PC210

Signed-off-by: Donguk Ryu <du.ryu at samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv310/Kconfig             |    6 +
 arch/arm/mach-s5pv310/Makefile            |    1 +
 arch/arm/mach-s5pv310/dev-sysmmu.c        |  187 +++++++++++++++++++++++++++++
 arch/arm/mach-s5pv310/mach-smdkc210.c     |    1 +
 arch/arm/mach-s5pv310/mach-smdkv310.c     |    1 +
 arch/arm/plat-samsung/include/plat/devs.h |    2 +
 6 files changed, 198 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/dev-sysmmu.c

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index b7aa3cd..3363327 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -66,6 +66,11 @@ config S5PV310_SETUP_SDHCI_GPIO
 	help
 	  Common setup code for SDHCI gpio.
 
+config S5PV310_SETUP_SYSMMU
+	bool
+	help
+	  Common setup code for SYSTEM MMU in S5PV310
+
 # machine support
 
 menu "S5PC210 Machines"
@@ -83,6 +88,7 @@ config MACH_SMDKC210
 	select S5PV310_DEV_PD
 	select S5PV310_SETUP_I2C1
 	select S5PV310_SETUP_SDHCI
+	select S5PV310_SETUP_SYSMMU
 	help
 	  Machine support for Samsung SMDKC210
 	  S5PC210(MCP) is one of package option of S5PV310
diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/Makefile
index e01a4d0..0a9e7e2 100644
--- a/arch/arm/mach-s5pv310/Makefile
+++ b/arch/arm/mach-s5pv310/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
 
 obj-y					+= dev-audio.o
 obj-$(CONFIG_S5PV310_DEV_PD)		+= dev-pd.o
+obj-$(CONFIG_S5PV310_SETUP_SYSMMU)	+= dev-sysmmu.o
 
 obj-$(CONFIG_S5PV310_SETUP_I2C1)	+= setup-i2c1.o
 obj-$(CONFIG_S5PV310_SETUP_I2C2)	+= setup-i2c2.o
diff --git a/arch/arm/mach-s5pv310/dev-sysmmu.c b/arch/arm/mach-s5pv310/dev-sysmmu.c
new file mode 100644
index 0000000..e1bb200
--- /dev/null
+++ b/arch/arm/mach-s5pv310/dev-sysmmu.c
@@ -0,0 +1,187 @@
+/* linux/arch/arm/mach-s5pv310/dev-sysmmu.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+
+#include <mach/map.h>
+#include <mach/irqs.h>
+
+static struct resource s5pv310_sysmmu_resource[] = {
+	[0] = {
+		.start	= S5PV310_PA_SYSMMU_MDMA,
+		.end	= S5PV310_PA_SYSMMU_MDMA + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= IRQ_SYSMMU_MDMA0_0,
+		.end	= IRQ_SYSMMU_MDMA0_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start	= S5PV310_PA_SYSMMU_SSS,
+		.end	= S5PV310_PA_SYSMMU_SSS + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[3] = {
+		.start	= IRQ_SYSMMU_SSS_0,
+		.end	= IRQ_SYSMMU_SSS_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[4] = {
+		.start	= S5PV310_PA_SYSMMU_FIMC0,
+		.end	= S5PV310_PA_SYSMMU_FIMC0 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[5] = {
+		.start	= IRQ_SYSMMU_FIMC0_0,
+		.end	= IRQ_SYSMMU_FIMC0_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[6] = {
+		.start	= S5PV310_PA_SYSMMU_FIMC1,
+		.end	= S5PV310_PA_SYSMMU_FIMC1 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[7] = {
+		.start	= IRQ_SYSMMU_FIMC1_0,
+		.end	= IRQ_SYSMMU_FIMC1_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[8] = {
+		.start	= S5PV310_PA_SYSMMU_FIMC2,
+		.end	= S5PV310_PA_SYSMMU_FIMC2 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[9] = {
+		.start	= IRQ_SYSMMU_FIMC2_0,
+		.end	= IRQ_SYSMMU_FIMC2_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[10] = {
+		.start	= S5PV310_PA_SYSMMU_FIMC3,
+		.end	= S5PV310_PA_SYSMMU_FIMC3 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[11] = {
+		.start	= IRQ_SYSMMU_FIMC3_0,
+		.end	= IRQ_SYSMMU_FIMC3_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[12] = {
+		.start	= S5PV310_PA_SYSMMU_JPEG,
+		.end	= S5PV310_PA_SYSMMU_JPEG + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[13] = {
+		.start	= IRQ_SYSMMU_JPEG_0,
+		.end	= IRQ_SYSMMU_JPEG_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[14] = {
+		.start	= S5PV310_PA_SYSMMU_FIMD0,
+		.end	= S5PV310_PA_SYSMMU_FIMD0 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[15] = {
+		.start	= IRQ_SYSMMU_LCD0_M0_0,
+		.end	= IRQ_SYSMMU_LCD0_M0_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[16] = {
+		.start	= S5PV310_PA_SYSMMU_FIMD1,
+		.end	= S5PV310_PA_SYSMMU_FIMD1 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[17] = {
+		.start	= IRQ_SYSMMU_LCD1_M1_0,
+		.end	= IRQ_SYSMMU_LCD1_M1_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[18] = {
+		.start	= S5PV310_PA_SYSMMU_PCIe,
+		.end	= S5PV310_PA_SYSMMU_PCIe + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[19] = {
+		.start	= IRQ_SYSMMU_PCIE_0,
+		.end	= IRQ_SYSMMU_PCIE_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[20] = {
+		.start	= S5PV310_PA_SYSMMU_G2D,
+		.end	= S5PV310_PA_SYSMMU_G2D + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[21] = {
+		.start	= IRQ_SYSMMU_2D_0,
+		.end	= IRQ_SYSMMU_2D_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[22] = {
+		.start	= S5PV310_PA_SYSMMU_ROTATOR,
+		.end	= S5PV310_PA_SYSMMU_ROTATOR + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[23] = {
+		.start	= IRQ_SYSMMU_ROTATOR_0,
+		.end	= IRQ_SYSMMU_ROTATOR_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[24] = {
+		.start	= S5PV310_PA_SYSMMU_MDMA2,
+		.end	= S5PV310_PA_SYSMMU_MDMA2 + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[25] = {
+		.start	= IRQ_SYSMMU_MDMA1_0,
+		.end	= IRQ_SYSMMU_MDMA1_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[26] = {
+		.start	= S5PV310_PA_SYSMMU_TV,
+		.end	= S5PV310_PA_SYSMMU_TV + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[27] = {
+		.start	= IRQ_SYSMMU_TV_M0_0,
+		.end	= IRQ_SYSMMU_TV_M0_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[28] = {
+		.start	= S5PV310_PA_SYSMMU_MFC_L,
+		.end	= S5PV310_PA_SYSMMU_MFC_L + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[29] = {
+		.start	= IRQ_SYSMMU_MFC_M0_0,
+		.end	= IRQ_SYSMMU_MFC_M0_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[30] = {
+		.start	= S5PV310_PA_SYSMMU_MFC_R,
+		.end	= S5PV310_PA_SYSMMU_MFC_R + SZ_64K - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[31] = {
+		.start	= IRQ_SYSMMU_MFC_M1_0,
+		.end	= IRQ_SYSMMU_MFC_M1_0,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device s5pv310_device_sysmmu = {
+	.name		= "s5p-sysmmu",
+	.id		= 32,
+	.num_resources	= ARRAY_SIZE(s5pv310_sysmmu_resource),
+	.resource	= s5pv310_sysmmu_resource,
+};
+
+EXPORT_SYMBOL(s5pv310_device_sysmmu);
diff --git a/arch/arm/mach-s5pv310/mach-smdkc210.c b/arch/arm/mach-s5pv310/mach-smdkc210.c
index 9262966..2d49273 100644
--- a/arch/arm/mach-s5pv310/mach-smdkc210.c
+++ b/arch/arm/mach-s5pv310/mach-smdkc210.c
@@ -164,6 +164,7 @@ static struct platform_device *smdkc210_devices[] __initdata = {
 	&s5pv310_device_pd[PD_TV],
 	&s5pv310_device_pd[PD_GPS],
 	&smdkc210_smsc911x,
+	&s5pv310_device_sysmmu,
 };
 
 static void __init smdkc210_smsc911x_init(void)
diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.c b/arch/arm/mach-s5pv310/mach-smdkv310.c
index 3eb029c..28680cf 100644
--- a/arch/arm/mach-s5pv310/mach-smdkv310.c
+++ b/arch/arm/mach-s5pv310/mach-smdkv310.c
@@ -164,6 +164,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s5pv310_device_pd[PD_TV],
 	&s5pv310_device_pd[PD_GPS],
 	&smdkv310_smsc911x,
+	&s5pv310_device_sysmmu,
 };
 
 static void __init smdkv310_smsc911x_init(void)
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 165fa84..1be1922 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -137,6 +137,8 @@ extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
 
+extern struct platform_device s5pv310_device_sysmmu;
+
 /* s3c2440 specific devices */
 
 #ifdef CONFIG_CPU_S3C2440
-- 
1.6.3.3
