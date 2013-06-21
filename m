From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 5/8] ARM: s3c64xx: Add board file for boot using Device Tree
Date: Fri, 21 Jun 2013 02:35:21 +0200
Message-ID: <1371774924-9224-6-git-send-email-tomasz.figa@gmail.com>
References: <1371774924-9224-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371774924-9224-1-git-send-email-tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benoit Cousson <benoit.cousson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds board file that will be used to boot S3C64xx-based boards
using Device Tree.

Signed-off-by: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-s3c64xx/Kconfig           | 16 +++++++
 arch/arm/mach-s3c64xx/Makefile          |  1 +
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 83 +++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index f78a6a0..fb4258c 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -308,3 +308,19 @@ config MACH_WLF_CRAGG_6410
 	select SAMSUNG_GPIO_EXTRA128
 	help
 	  Machine support for the Wolfson Cragganmore S3C6410 variant.
+
+config MACH_S3C64XX_DT
+	bool "Samsung S3C6400/S3C6410 machine using Device Tree"
+	select CLKSRC_OF
+	select CPU_S3C6400
+	select CPU_S3C6410
+	select PINCTRL
+	select PINCTRL_S3C64XX
+	select USE_OF
+	help
+	  Machine support for Samsung S3C6400/S3C6410 machines with Device Tree
+	  enabled.
+	  Select this if a fdt blob is available for your S3C64XX SoC based
+	  board.
+	  Note: This is under development and not all peripherals can be
+	  supported with this machine file.
diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Makefile
index 645a8fe..6faedcf 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_MACH_SMARTQ7)		+= mach-smartq7.o
 obj-$(CONFIG_MACH_SMDK6400)		+= mach-smdk6400.o
 obj-$(CONFIG_MACH_SMDK6410)		+= mach-smdk6410.o
 obj-$(CONFIG_MACH_WLF_CRAGG_6410)	+= mach-crag6410.o mach-crag6410-module.o
+obj-$(CONFIG_MACH_S3C64XX_DT)		+= mach-s3c64xx-dt.o
diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
new file mode 100644
index 0000000..b904c9b
--- /dev/null
+++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
@@ -0,0 +1,83 @@
+/*
+ * Samsung's S3C64XX flattened device tree enabled machine
+ *
+ * Copyright (c) 2013 Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/clk-provider.h>
+#include <linux/of_platform.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <asm/system_misc.h>
+
+#include <plat/cpu.h>
+#include <plat/watchdog-reset.h>
+
+#include <mach/map.h>
+
+#include "common.h"
+
+/*
+ * IO mapping for shared system controller IP.
+ *
+ * FIXME: Make remaining drivers use dynamic mapping.
+ */
+static struct map_desc s3c64xx_dt_iodesc[] __initdata = {
+	{
+		.virtual	= (unsigned long)S3C_VA_SYS,
+		.pfn		= __phys_to_pfn(S3C64XX_PA_SYSCON),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	},
+};
+
+static void __init s3c64xx_dt_map_io(void)
+{
+	debug_ll_io_init();
+	iotable_init(s3c64xx_dt_iodesc, ARRAY_SIZE(s3c64xx_dt_iodesc));
+
+	s3c64xx_init_cpu();
+
+	if (!soc_is_s3c64xx())
+		panic("SoC is not S3C64xx!");
+}
+
+static void __init s3c64xx_dt_init_platform(void)
+{
+	of_clk_init(NULL);
+	samsung_wdt_reset_of_init();
+};
+
+static void __init s3c64xx_dt_init_machine(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+}
+
+static void s3c64xx_dt_restart(char mode, const char *cmd)
+{
+	if (mode != 's')
+		samsung_wdt_reset();
+
+	/* if all else fails, or mode was for soft, jump to 0 */
+	soft_restart(0);
+}
+
+static char const *s3c64xx_dt_compat[] __initdata = {
+	"samsung,s3c6400",
+	"samsung,s3c6410",
+	NULL
+};
+
+DT_MACHINE_START(S3C6400_DT, "Samsung S3C64xx (Flattened Device Tree)")
+	/* Maintainer: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
+	.dt_compat	= s3c64xx_dt_compat,
+	.map_io		= s3c64xx_dt_map_io,
+	.init_platform	= s3c64xx_dt_init_platform,
+	.init_machine	= s3c64xx_dt_init_machine,
+	.restart        = s3c64xx_dt_restart,
+MACHINE_END
-- 
1.8.2.1
