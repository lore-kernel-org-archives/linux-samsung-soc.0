From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/9] ARM: EXYNOS: use exynos_init_uarts() instead of exynos4_init_uarts()
Date: Wed,  1 Feb 2012 00:39:06 +0900
Message-ID: <1328024354-4277-2-git-send-email-kgene.kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:36808 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753685Ab2AaPjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 10:39:37 -0500
Received: by mail-pz0-f46.google.com with SMTP id p15so45719dad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 07:39:37 -0800 (PST)
In-Reply-To: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, Kukjin Kim <kgene.kim@samsung.com>

Since exynos4_init_uarts() can be used for EXYNOS5 SoCs,
this patch changes the name of function to exynos_init_uarts().

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |    8 ++++----
 arch/arm/mach-exynos/common.h |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index c59e188..a168533 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -56,7 +56,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos4_init_uarts,
+		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4210,
 	}, {
@@ -64,7 +64,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos4_init_uarts,
+		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4212,
 	}, {
@@ -72,7 +72,7 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.idmask		= EXYNOS4_CPU_MASK,
 		.map_io		= exynos4_map_io,
 		.init_clocks	= exynos4_init_clocks,
-		.init_uarts	= exynos4_init_uarts,
+		.init_uarts	= exynos_init_uarts,
 		.init		= exynos_init,
 		.name		= name_exynos4412,
 	},
@@ -476,7 +476,7 @@ int __init exynos_init(void)
 
 /* uart registration process */
 
-void __init exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no)
+void __init exynos_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 {
 	struct s3c2410_uartcfg *tcfg = cfg;
 	u32 ucnt;
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 8c1efe6..2d79aba 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -36,15 +36,15 @@ extern struct sys_timer exynos4_timer;
 
 #ifdef CONFIG_ARCH_EXYNOS
 extern  int exynos_init(void);
+extern void exynos_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 extern void exynos4_map_io(void);
 extern void exynos4_init_clocks(int xtal);
-extern void exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 
 #else
-#define exynos4_init_clocks NULL
-#define exynos4_init_uarts NULL
-#define exynos4_map_io NULL
 #define exynos_init NULL
+#define exynos_init_uarts NULL
+#define exynos4_map_io NULL
+#define exynos4_init_clocks NULL
 #endif
 
 #endif /* __ARCH_ARM_MACH_EXYNOS_COMMON_H */
-- 
1.7.4.4
