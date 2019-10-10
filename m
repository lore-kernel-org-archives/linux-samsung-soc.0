From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 07/36] ARM: exynos: use private samsung_cpu_id copy
Date: Thu, 10 Oct 2019 22:29:51 +0200
Message-ID: <20191010203043.1241612-7-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The only part of plat-samsung that is shared with arch-exynos
is the CPU identification code.

Having a separate exynos_cpu_id variable makes the two completely
independent and is actually a bit less code in total.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-exynos/common.h                |  6 +++---
 arch/arm/mach-exynos/exynos.c                | 19 +++++++++++++++----
 arch/arm/mach-exynos/include/mach/map.h      | 18 ------------------
 arch/arm/mach-exynos/platsmp.c               |  4 +---
 arch/arm/mach-exynos/pm.c                    |  8 ++++----
 arch/arm/plat-samsung/cpu.c                  | 17 -----------------
 arch/arm/plat-samsung/include/plat/cpu.h     |  2 --
 arch/arm/plat-samsung/include/plat/map-s5p.h |  2 --
 8 files changed, 23 insertions(+), 53 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/map.h

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 56411bb63d45..adf7db9c0885 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -24,12 +24,12 @@
 #define EXYNOS5800_SOC_ID	0xE5422000
 #define EXYNOS5_SOC_MASK	0xFFFFF000
 
-extern unsigned long samsung_cpu_id;
+extern unsigned long exynos_cpu_id;
 
 #define IS_SAMSUNG_CPU(name, id, mask)		\
 static inline int is_samsung_##name(void)	\
 {						\
-	return ((samsung_cpu_id & mask) == (id & mask));	\
+	return ((exynos_cpu_id & mask) == (id & mask));	\
 }
 
 IS_SAMSUNG_CPU(exynos3250, EXYNOS3250_SOC_ID, EXYNOS3_SOC_MASK)
@@ -147,7 +147,7 @@ extern struct cpuidle_exynos_data cpuidle_coupled_exynos_data;
 
 extern void exynos_set_delayed_reset_assertion(bool enable);
 
-extern unsigned int samsung_rev(void);
+extern unsigned int exynos_rev(void);
 extern void exynos_core_restart(u32 core_id);
 extern int exynos_set_boot_addr(u32 core_id, unsigned long boot_addr);
 extern int exynos_get_boot_addr(u32 core_id, unsigned long *boot_addr);
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 9aa483366ebc..da9300d655c6 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -19,11 +19,10 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/map.h>
-#include <plat/cpu.h>
-
 #include "common.h"
 
+#define S5P_VA_CHIPID	((void __iomem __force *)0xF8000000)
+
 static struct platform_device exynos_cpuidle = {
 	.name              = "exynos_cpuidle",
 #ifdef CONFIG_ARM_EXYNOS_CPUIDLE
@@ -36,6 +35,14 @@ void __iomem *sysram_base_addr __ro_after_init;
 phys_addr_t sysram_base_phys __ro_after_init;
 void __iomem *sysram_ns_base_addr __ro_after_init;
 
+unsigned long exynos_cpu_id;
+static unsigned int exynos_cpu_rev;
+
+unsigned int exynos_rev(void)
+{
+	return exynos_cpu_rev;
+}
+
 void __init exynos_sysram_init(void)
 {
 	struct device_node *node;
@@ -86,7 +93,11 @@ static void __init exynos_init_io(void)
 	of_scan_flat_dt(exynos_fdt_map_chipid, NULL);
 
 	/* detect cpu id and rev. */
-	s5p_init_cpu(S5P_VA_CHIPID);
+	exynos_cpu_id = readl_relaxed(S5P_VA_CHIPID);
+	exynos_cpu_rev = exynos_cpu_id & 0xFF;
+
+	pr_info("Samsung CPU ID: 0x%08lx\n", exynos_cpu_id);
+
 }
 
 /*
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
deleted file mode 100644
index 22ebe3654633..000000000000
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * EXYNOS - Memory map definitions
- */
-
-#ifndef __ASM_ARCH_MAP_H
-#define __ASM_ARCH_MAP_H __FILE__
-
-#include <plat/map-base.h>
-
-#include <plat/map-s5p.h>
-
-#define EXYNOS_PA_CHIPID		0x10000000
-
-#endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 0cbbae8bf1f8..d7fedbb2eefe 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -22,8 +22,6 @@
 #include <asm/smp_scu.h>
 #include <asm/firmware.h>
 
-#include <mach/map.h>
-
 #include "common.h"
 
 extern void exynos4_secondary_startup(void);
@@ -188,7 +186,7 @@ void exynos_scu_enable(void)
 
 static void __iomem *cpu_boot_reg_base(void)
 {
-	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_1_1)
+	if (soc_is_exynos4210() && exynos_rev() == EXYNOS4210_REV_1_1)
 		return pmu_base_addr + S5P_INFORM5;
 	return sysram_base_addr;
 }
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 48e7fb38613e..624585641a9c 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -26,18 +26,18 @@
 
 static inline void __iomem *exynos_boot_vector_addr(void)
 {
-	if (samsung_rev() == EXYNOS4210_REV_1_1)
+	if (exynos_rev() == EXYNOS4210_REV_1_1)
 		return pmu_base_addr + S5P_INFORM7;
-	else if (samsung_rev() == EXYNOS4210_REV_1_0)
+	else if (exynos_rev() == EXYNOS4210_REV_1_0)
 		return sysram_base_addr + 0x24;
 	return pmu_base_addr + S5P_INFORM0;
 }
 
 static inline void __iomem *exynos_boot_vector_flag(void)
 {
-	if (samsung_rev() == EXYNOS4210_REV_1_1)
+	if (exynos_rev() == EXYNOS4210_REV_1_1)
 		return pmu_base_addr + S5P_INFORM6;
-	else if (samsung_rev() == EXYNOS4210_REV_1_0)
+	else if (exynos_rev() == EXYNOS4210_REV_1_0)
 		return sysram_base_addr + 0x20;
 	return pmu_base_addr + S5P_INFORM1;
 }
diff --git a/arch/arm/plat-samsung/cpu.c b/arch/arm/plat-samsung/cpu.c
index e1ba88ba31d8..8acba21bbf4b 100644
--- a/arch/arm/plat-samsung/cpu.c
+++ b/arch/arm/plat-samsung/cpu.c
@@ -14,13 +14,6 @@
 #include <plat/cpu.h>
 
 unsigned long samsung_cpu_id;
-static unsigned int samsung_cpu_rev;
-
-unsigned int samsung_rev(void)
-{
-	return samsung_cpu_rev;
-}
-EXPORT_SYMBOL(samsung_rev);
 
 void __init s3c64xx_init_cpu(void)
 {
@@ -34,15 +27,5 @@ void __init s3c64xx_init_cpu(void)
 		samsung_cpu_id = readl_relaxed(S3C_VA_SYS + 0xA1C);
 	}
 
-	samsung_cpu_rev = 0;
-
-	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
-}
-
-void __init s5p_init_cpu(const void __iomem *cpuid_addr)
-{
-	samsung_cpu_id = readl_relaxed(cpuid_addr);
-	samsung_cpu_rev = samsung_cpu_id & 0xFF;
-
 	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
 }
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index fadcddbea064..02d7f991d5a3 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -111,8 +111,6 @@ extern void s3c24xx_init_io(struct map_desc *mach_desc, int size);
 extern void s3c64xx_init_cpu(void);
 extern void s5p_init_cpu(const void __iomem *cpuid_addr);
 
-extern unsigned int samsung_rev(void);
-
 extern void s3c24xx_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 
 extern void s3c24xx_init_clocks(int xtal);
diff --git a/arch/arm/plat-samsung/include/plat/map-s5p.h b/arch/arm/plat-samsung/include/plat/map-s5p.h
index d69a0ca09fb5..3812085f8761 100644
--- a/arch/arm/plat-samsung/include/plat/map-s5p.h
+++ b/arch/arm/plat-samsung/include/plat/map-s5p.h
@@ -9,8 +9,6 @@
 #ifndef __ASM_PLAT_MAP_S5P_H
 #define __ASM_PLAT_MAP_S5P_H __FILE__
 
-#define S5P_VA_CHIPID		S3C_ADDR(0x02000000)
-
 #define VA_VIC(x)		(S3C_VA_IRQ + ((x) * 0x10000))
 #define VA_VIC0			VA_VIC(0)
 #define VA_VIC1			VA_VIC(1)
-- 
2.20.0
