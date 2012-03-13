From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3 01/12] ARM: EXYNOS: to declare static for mach-exynos/common.c
Date: Tue, 13 Mar 2012 08:30:32 -0700
Message-ID: <1331652643-12626-2-git-send-email-kgene.kim@samsung.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37236 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756191Ab2CMPbf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 11:31:35 -0400
Received: by iagz16 with SMTP id z16so910445iag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 08:31:34 -0700 (PDT)
In-Reply-To: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

According to commit cc511b8d84d8 ("ARM: 7257/1: EXYNOS: introduce
arch/arm/mach-exynos/common.[ch]"), we don't need to declare extern
for exynos4_map_io(), exynos4_init_clocks(), exynos4_init_uarts(),
and exynos_init(). And the exynos4210_register_clocks() and
exynos4212_register_clocks depend on each SoC not ARCH_EXYNOS4.
So this patch fixed above.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |   13 +++++++++----
 arch/arm/mach-exynos/common.h |   28 +++++++++++-----------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 34e8190..a1f8a99 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -50,6 +50,11 @@ static const char name_exynos4210[] = "EXYNOS4210";
 static const char name_exynos4212[] = "EXYNOS4212";
 static const char name_exynos4412[] = "EXYNOS4412";
 
+static void exynos4_map_io(void);
+static void exynos4_init_clocks(int xtal);
+static void exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no);
+static int exynos_init(void);
+
 static struct cpu_table cpu_ids[] __initdata = {
 	{
 		.idcode		= EXYNOS4210_CPU_ID,
@@ -225,7 +230,7 @@ void __init exynos_init_io(struct map_desc *mach_desc, int size)
 	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
 }
 
-void __init exynos4_map_io(void)
+static void __init exynos4_map_io(void)
 {
 	iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
 
@@ -256,7 +261,7 @@ void __init exynos4_map_io(void)
 	s5p_hdmi_setname("exynos4-hdmi");
 }
 
-void __init exynos4_init_clocks(int xtal)
+static void __init exynos4_init_clocks(int xtal)
 {
 	printk(KERN_DEBUG "%s: initializing clocks\n", __func__);
 
@@ -456,7 +461,7 @@ static int __init exynos4_l2x0_cache_init(void)
 early_initcall(exynos4_l2x0_cache_init);
 #endif
 
-int __init exynos_init(void)
+static int __init exynos_init(void)
 {
 	printk(KERN_INFO "EXYNOS: Initializing architecture\n");
 	return device_register(&exynos4_dev);
@@ -464,7 +469,7 @@ int __init exynos_init(void)
 
 /* uart registration process */
 
-void __init exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no)
+static void __init exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 {
 	struct s3c2410_uartcfg *tcfg = cfg;
 	u32 ucnt;
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 8c1efe6..b32c6b5 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -12,39 +12,33 @@
 #ifndef __ARCH_ARM_MACH_EXYNOS_COMMON_H
 #define __ARCH_ARM_MACH_EXYNOS_COMMON_H
 
+extern struct sys_timer exynos4_timer;
+
 void exynos_init_io(struct map_desc *mach_desc, int size);
 void exynos4_init_irq(void);
+void exynos4_restart(char mode, const char *cmd);
 
 #ifdef CONFIG_ARCH_EXYNOS4
 void exynos4_register_clocks(void);
 void exynos4_setup_clocks(void);
 
-void exynos4210_register_clocks(void);
-void exynos4212_register_clocks(void);
-
 #else
 #define exynos4_register_clocks()
 #define exynos4_setup_clocks()
-
-#define exynos4210_register_clocks()
-#define exynos4212_register_clocks()
 #endif
 
-void exynos4_restart(char mode, const char *cmd);
+#ifdef CONFIG_CPU_EXYNOS4210
+void exynos4210_register_clocks(void);
 
-extern struct sys_timer exynos4_timer;
+#else
+#define exynos4210_register_clocks()
+#endif
 
-#ifdef CONFIG_ARCH_EXYNOS
-extern  int exynos_init(void);
-extern void exynos4_map_io(void);
-extern void exynos4_init_clocks(int xtal);
-extern void exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no);
+#ifdef CONFIG_SOC_EXYNOS4212
+void exynos4212_register_clocks(void);
 
 #else
-#define exynos4_init_clocks NULL
-#define exynos4_init_uarts NULL
-#define exynos4_map_io NULL
-#define exynos_init NULL
+#define exynos4212_register_clocks()
 #endif
 
 #endif /* __ARCH_ARM_MACH_EXYNOS_COMMON_H */
-- 
1.7.4.4
