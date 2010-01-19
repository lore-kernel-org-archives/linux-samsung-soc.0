From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 07/10] ARM: S5PV210: Add SMDKC110 board support file
Date: Tue, 19 Jan 2010 11:28:14 +0900
Message-ID: <1263868094-31983-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45639 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822Ab0ASCfQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 21:35:16 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds SMDKC110 board support file.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/mach-smdkc110.c |  133 +++++++++++++++++++++++++++++++++
 1 files changed, 133 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/mach-smdkc110.c

diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
new file mode 100644
index 0000000..781e3f3
--- /dev/null
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -0,0 +1,133 @@
+/* linux/arch/arm/mach-s5pv210/mach-smdkc110.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/serial_core.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <asm/setup.h>
+#include <asm/mach-types.h>
+
+#include <mach/map.h>
+#include <mach/regs-clock.h>
+
+#include <plat/regs-serial.h>
+#include <plat/s5pv210.h>
+#include <plat/devs.h>
+#include <plat/cpu.h>
+
+/* Following are default values for UCON, ULCON and UFCON UART registers */
+#define S5PV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
+				 S3C2410_UCON_RXILEVEL |	\
+				 S3C2410_UCON_TXIRQMODE |	\
+				 S3C2410_UCON_RXIRQMODE |	\
+				 S3C2410_UCON_RXFIFO_TOI |	\
+				 S3C2443_UCON_RXERR_IRQEN)
+
+#define S5PV210_ULCON_DEFAULT	S3C2410_LCON_CS8
+
+#define S5PV210_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
+				 S5PV210_UFCON_TXTRIG4 |	\
+				 S5PV210_UFCON_RXTRIG4)
+
+static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata = {
+	[0] = {
+		.hwport		= 0,
+		.flags		= 0,
+		.ucon		= S5PV210_UCON_DEFAULT,
+		.ulcon		= S5PV210_ULCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT,
+	},
+	[1] = {
+		.hwport		= 1,
+		.flags		= 0,
+		.ucon		= S5PV210_UCON_DEFAULT,
+		.ulcon		= S5PV210_ULCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT,
+	},
+	[2] = {
+		.hwport		= 2,
+		.flags		= 0,
+		.ucon		= S5PV210_UCON_DEFAULT,
+		.ulcon		= S5PV210_ULCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT,
+	},
+	[3] = {
+		.hwport		= 3,
+		.flags		= 0,
+		.ucon		= S5PV210_UCON_DEFAULT,
+		.ulcon		= S5PV210_ULCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT,
+	},
+};
+
+static struct platform_device *smdkc110_devices[] __initdata = {
+};
+
+static void __init smdkc110_map_io(void)
+{
+	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
+}
+
+static void __init smdkc110_machine_init(void)
+{
+	platform_add_devices(smdkc110_devices, ARRAY_SIZE(smdkc110_devices));
+}
+
+static void __init smdkc110_fixup(struct machine_desc *desc, struct tag *tags,
+				  char **cmdline, struct meminfo *mi)
+{
+	mi->bank[0].start = 0x20000000;
+	mi->bank[0].node = 0;
+#if defined(CONFIG_S5PC110_B_TYPE)
+	mi->bank[0].size = 80 * SZ_1M;
+#elif defined(CONFIG_S5PC110_D_TYPE)
+	mi->bank[0].size = 80 * SZ_1M;
+#elif defined(CONFIG_S5PC110_H_TYPE)
+	mi->bank[0].size = 128 * SZ_1M;
+#endif
+
+	mi->bank[1].start = 0x40000000;
+	mi->bank[1].node = 1;
+#if defined(CONFIG_S5PC110_B_TYPE)
+	mi->bank[0].size = 256 * SZ_1M;
+#elif defined(CONFIG_S5PC110_D_TYPE)
+	mi->bank[0].size = 256 * SZ_1M;
+#elif defined(CONFIG_S5PC110_H_TYPE)
+	mi->bank[0].size = 128 * SZ_1M;
+#endif
+
+#if defined(CONFIG_S5PC110_D_TYPE)
+	mi->bank[2].start = 0x50000000;
+	mi->bank[2].size = 128 * SZ_1M;
+	mi->bank[2].node = 2;
+
+	mi->nr_banks = 3;
+#else
+	mi->nr_banks = 2;
+#endif
+}
+
+MACHINE_START(SMDKC110, "SMDKC110")
+	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
+	.phys_io	= S5P_PA_UART & 0xfff00000,
+	.io_pg_offst	= (((u32)S5P_VA_UART) >> 18) & 0xfffc,
+	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.fixup		= smdkc110_fixup,
+	.init_irq	= s5pv210_init_irq,
+	.map_io		= smdkc110_map_io,
+	.init_machine	= smdkc110_machine_init,
+	.timer		= &s3c24xx_timer,
+MACHINE_END
-- 
1.6.2.5
