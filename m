From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 5/6] ARM: S5P6442: Add SMDK6442 board support file
Date: Mon, 25 Jan 2010 08:54:14 +0900
Message-ID: <1264377254-9267-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48346 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754008Ab0AYABa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 19:01:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds SMDK6442 board support file.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/mach-smdk6442.c |   91 +++++++++++++++++++++++++++++++++
 1 files changed, 91 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p6442/mach-smdk6442.c

diff --git a/arch/arm/mach-s5p6442/mach-smdk6442.c b/arch/arm/mach-s5p6442/mach-smdk6442.c
new file mode 100644
index 0000000..1c4fbb0
--- /dev/null
+++ b/arch/arm/mach-s5p6442/mach-smdk6442.c
@@ -0,0 +1,91 @@
+/* linux/arch/arm/mach-s5p6442/mach-smdk6442.c
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
+#include <plat/s5p6442.h>
+#include <plat/devs.h>
+#include <plat/cpu.h>
+
+/* Following are default values for UCON, ULCON and UFCON UART registers */
+#define S5P6442_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
+				 S3C2410_UCON_RXILEVEL |	\
+				 S3C2410_UCON_TXIRQMODE |	\
+				 S3C2410_UCON_RXIRQMODE |	\
+				 S3C2410_UCON_RXFIFO_TOI |	\
+				 S3C2443_UCON_RXERR_IRQEN)
+
+#define S5P6442_ULCON_DEFAULT	S3C2410_LCON_CS8
+
+#define S5P6442_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
+				 S5PV210_UFCON_TXTRIG4 |	\
+				 S5PV210_UFCON_RXTRIG4)
+
+static struct s3c2410_uartcfg smdk6442_uartcfgs[] __initdata = {
+	[0] = {
+		.hwport		= 0,
+		.flags		= 0,
+		.ucon		= S5P6442_UCON_DEFAULT,
+		.ulcon		= S5P6442_ULCON_DEFAULT,
+		.ufcon		= S5P6442_UFCON_DEFAULT,
+	},
+	[1] = {
+		.hwport		= 1,
+		.flags		= 0,
+		.ucon		= S5P6442_UCON_DEFAULT,
+		.ulcon		= S5P6442_ULCON_DEFAULT,
+		.ufcon		= S5P6442_UFCON_DEFAULT,
+	},
+	[2] = {
+		.hwport		= 2,
+		.flags		= 0,
+		.ucon		= S5P6442_UCON_DEFAULT,
+		.ulcon		= S5P6442_ULCON_DEFAULT,
+		.ufcon		= S5P6442_UFCON_DEFAULT,
+	},
+};
+
+static struct platform_device *smdk6442_devices[] __initdata = {
+};
+
+static void __init smdk6442_map_io(void)
+{
+	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+	s3c24xx_init_clocks(12000000);
+	s3c24xx_init_uarts(smdk6442_uartcfgs, ARRAY_SIZE(smdk6442_uartcfgs));
+}
+
+static void __init smdk6442_machine_init(void)
+{
+	platform_add_devices(smdk6442_devices, ARRAY_SIZE(smdk6442_devices));
+}
+
+MACHINE_START(SMDK6442, "SMDK6442")
+	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
+	.phys_io	= S5P_PA_UART & 0xfff00000,
+	.io_pg_offst	= (((u32)S5P_VA_UART) >> 18) & 0xfffc,
+	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.init_irq	= s5p6442_init_irq,
+	.map_io		= smdk6442_map_io,
+	.init_machine	= smdk6442_machine_init,
+	.timer		= &s3c24xx_timer,
+MACHINE_END
-- 
1.6.2.5
