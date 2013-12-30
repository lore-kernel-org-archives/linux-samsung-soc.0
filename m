From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: SAMSUNG: Reorganize calls to reserve memory for MFC
Date: Mon, 30 Dec 2013 15:56:45 +0530
Message-ID: <1388399205-3111-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:59831 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754490Ab3L3KaX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:30:23 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so11531064pbc.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:30:22 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jtp.park@samsung.com, k.debski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Reorganize code so that "plat/mfc.h" is no more referred from
mach-exynos folder.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

Rebased on top of next-20131224.

 arch/arm/mach-exynos/mach-exynos4-dt.c   |   10 ++--------
 arch/arm/mach-exynos/mach-exynos5-dt.c   |   10 ++--------
 arch/arm/plat-samsung/include/plat/mfc.h |    3 ---
 arch/arm/plat-samsung/s5p-dev-mfc.c      |   17 ++++++++++-------
 4 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index 4603e6b..66b4a6e 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -15,9 +15,9 @@
 #include <linux/of_fdt.h>
 
 #include <asm/mach/arch.h>
-#include <plat/mfc.h>
 
 #include "common.h"
+#include "mfc.h"
 
 static void __init exynos4_dt_machine_init(void)
 {
@@ -36,13 +36,7 @@ static char const *exynos4_dt_compat[] __initdata = {
 static void __init exynos4_reserve(void)
 {
 #ifdef CONFIG_S5P_DEV_MFC
-	struct s5p_mfc_dt_meminfo mfc_mem;
-
-	/* Reserve memory for MFC only if it's available */
-	mfc_mem.compatible = "samsung,mfc-v5";
-	if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))
-		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
-				mfc_mem.lsize);
+	of_scan_flat_dt(s5p_fdt_alloc_mfc_mem, "samsung,mfc-v5");
 #endif
 }
 DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 9bb6eac..36b36f4 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -14,9 +14,9 @@
 #include <linux/io.h>
 
 #include <asm/mach/arch.h>
-#include <plat/mfc.h>
 
 #include "common.h"
+#include "mfc.h"
 #include "regs-pmu.h"
 
 static void __init exynos5_dt_machine_init(void)
@@ -59,13 +59,7 @@ static char const *exynos5_dt_compat[] __initdata = {
 static void __init exynos5_reserve(void)
 {
 #ifdef CONFIG_S5P_DEV_MFC
-	struct s5p_mfc_dt_meminfo mfc_mem;
-
-	/* Reserve memory for MFC only if it's available */
-	mfc_mem.compatible = "samsung,mfc-v6";
-	if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))
-		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
-				mfc_mem.lsize);
+	of_scan_flat_dt(s5p_fdt_alloc_mfc_mem, "samsung,mfc-v6");
 #endif
 }
 
diff --git a/arch/arm/plat-samsung/include/plat/mfc.h b/arch/arm/plat-samsung/include/plat/mfc.h
index e6d7c42..033654e 100644
--- a/arch/arm/plat-samsung/include/plat/mfc.h
+++ b/arch/arm/plat-samsung/include/plat/mfc.h
@@ -32,7 +32,4 @@ struct s5p_mfc_dt_meminfo {
 void __init s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
 				phys_addr_t lbase, unsigned int lsize);
 
-int __init s5p_fdt_find_mfc_mem(unsigned long node, const char *uname,
-				int depth, void *data);
-
 #endif /* __PLAT_SAMSUNG_MFC_H */
diff --git a/arch/arm/plat-samsung/s5p-dev-mfc.c b/arch/arm/plat-samsung/s5p-dev-mfc.c
index ad51f85..98087b6 100644
--- a/arch/arm/plat-samsung/s5p-dev-mfc.c
+++ b/arch/arm/plat-samsung/s5p-dev-mfc.c
@@ -122,32 +122,35 @@ device_initcall(s5p_mfc_memory_init);
 #endif
 
 #ifdef CONFIG_OF
-int __init s5p_fdt_find_mfc_mem(unsigned long node, const char *uname,
+int __init s5p_fdt_alloc_mfc_mem(unsigned long node, const char *uname,
 				int depth, void *data)
 {
 	__be32 *prop;
 	unsigned long len;
-	struct s5p_mfc_dt_meminfo *mfc_mem = data;
+	struct s5p_mfc_dt_meminfo mfc_mem;
 
 	if (!data)
 		return 0;
 
-	if (!of_flat_dt_is_compatible(node, mfc_mem->compatible))
+	if (!of_flat_dt_is_compatible(node, data))
 		return 0;
 
 	prop = of_get_flat_dt_prop(node, "samsung,mfc-l", &len);
 	if (!prop || (len != 2 * sizeof(unsigned long)))
 		return 0;
 
-	mfc_mem->loff = be32_to_cpu(prop[0]);
-	mfc_mem->lsize = be32_to_cpu(prop[1]);
+	mfc_mem.loff = be32_to_cpu(prop[0]);
+	mfc_mem.lsize = be32_to_cpu(prop[1]);
 
 	prop = of_get_flat_dt_prop(node, "samsung,mfc-r", &len);
 	if (!prop || (len != 2 * sizeof(unsigned long)))
 		return 0;
 
-	mfc_mem->roff = be32_to_cpu(prop[0]);
-	mfc_mem->rsize = be32_to_cpu(prop[1]);
+	mfc_mem.roff = be32_to_cpu(prop[0]);
+	mfc_mem.rsize = be32_to_cpu(prop[1]);
+
+	s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize,
+			mfc_mem.loff, mfc_mem.lsize);
 
 	return 1;
 }
-- 
1.7.9.5
