From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Consolidate CPU init code
Date: Wed, 22 Jan 2014 17:19:02 +0530
Message-ID: <1390391342-4344-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:45844 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755168AbaAVLxq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jan 2014 06:53:46 -0500
Received: by mail-pa0-f42.google.com with SMTP id kl14so291239pab.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jan 2014 03:53:45 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

cpu_table was used to distinguish between different Exynos4 and 5 SoCs
and assign the the initialization and io mapping pointers based on type.
exynos_init is dummy and no longer needed as we do a DT based booting.
By having a common io mapping function we can get rid of the whole
table and avoid populating it for every SoC.

Tested on Exynos4210, 5250 and 5420 based boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/common.c |   93 ++++++++---------------------------------
 1 file changed, 17 insertions(+), 76 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index f18be40e5b21..02d0aaa7af59 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -48,55 +48,7 @@
 #define L2_AUX_VAL 0x7C470001
 #define L2_AUX_MASK 0xC200ffff
 
-static const char name_exynos4210[] = "EXYNOS4210";
-static const char name_exynos4212[] = "EXYNOS4212";
-static const char name_exynos4412[] = "EXYNOS4412";
-static const char name_exynos5250[] = "EXYNOS5250";
-static const char name_exynos5420[] = "EXYNOS5420";
-static const char name_exynos5440[] = "EXYNOS5440";
-
-static void exynos4_map_io(void);
-static void exynos5_map_io(void);
-static int exynos_init(void);
-
-static struct cpu_table cpu_ids[] __initdata = {
-	{
-		.idcode		= EXYNOS4210_CPU_ID,
-		.idmask		= EXYNOS4_CPU_MASK,
-		.map_io		= exynos4_map_io,
-		.init		= exynos_init,
-		.name		= name_exynos4210,
-	}, {
-		.idcode		= EXYNOS4212_CPU_ID,
-		.idmask		= EXYNOS4_CPU_MASK,
-		.map_io		= exynos4_map_io,
-		.init		= exynos_init,
-		.name		= name_exynos4212,
-	}, {
-		.idcode		= EXYNOS4412_CPU_ID,
-		.idmask		= EXYNOS4_CPU_MASK,
-		.map_io		= exynos4_map_io,
-		.init		= exynos_init,
-		.name		= name_exynos4412,
-	}, {
-		.idcode		= EXYNOS5250_SOC_ID,
-		.idmask		= EXYNOS5_SOC_MASK,
-		.map_io		= exynos5_map_io,
-		.init		= exynos_init,
-		.name		= name_exynos5250,
-	}, {
-		.idcode		= EXYNOS5420_SOC_ID,
-		.idmask		= EXYNOS5_SOC_MASK,
-		.map_io		= exynos5_map_io,
-		.init		= exynos_init,
-		.name		= name_exynos5420,
-	}, {
-		.idcode		= EXYNOS5440_SOC_ID,
-		.idmask		= EXYNOS5_SOC_MASK,
-		.init		= exynos_init,
-		.name		= name_exynos5440,
-	},
-};
+static void exynos_map_io(void);
 
 /* Initial IO mappings */
 
@@ -355,28 +307,28 @@ void __init exynos_init_io(void)
 	/* detect cpu id and rev. */
 	s5p_init_cpu(S5P_VA_CHIPID);
 
-	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
+	exynos_map_io();
 }
 
-static void __init exynos4_map_io(void)
+static void __init exynos_map_io(void)
 {
-	iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
-
-	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_0)
-		iotable_init(exynos4_iodesc0, ARRAY_SIZE(exynos4_iodesc0));
-	else
-		iotable_init(exynos4_iodesc1, ARRAY_SIZE(exynos4_iodesc1));
-
-	if (soc_is_exynos4210())
+	if (soc_is_exynos4210() || soc_is_exynos4212() || soc_is_exynos4412())
+		iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
+
+	if (soc_is_exynos5250() || soc_is_exynos5420())
+		iotable_init(exynos5_iodesc, ARRAY_SIZE(exynos5_iodesc));
+
+	if (soc_is_exynos4210()) {
+		if (samsung_rev() == EXYNOS4210_REV_0)
+			iotable_init(exynos4_iodesc0,
+						ARRAY_SIZE(exynos4_iodesc0));
+		else
+			iotable_init(exynos4_iodesc1,
+						ARRAY_SIZE(exynos4_iodesc1));
 		iotable_init(exynos4210_iodesc, ARRAY_SIZE(exynos4210_iodesc));
+	}
 	if (soc_is_exynos4212() || soc_is_exynos4412())
 		iotable_init(exynos4x12_iodesc, ARRAY_SIZE(exynos4x12_iodesc));
-}
-
-static void __init exynos5_map_io(void)
-{
-	iotable_init(exynos5_iodesc, ARRAY_SIZE(exynos5_iodesc));
-
 	if (soc_is_exynos5250())
 		iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos5250_iodesc));
 }
@@ -386,10 +338,6 @@ struct bus_type exynos_subsys = {
 	.dev_name	= "exynos-core",
 };
 
-static struct device exynos4_dev = {
-	.bus	= &exynos_subsys,
-};
-
 static int __init exynos_core_init(void)
 {
 	return subsys_system_register(&exynos_subsys, NULL);
@@ -409,10 +357,3 @@ static int __init exynos4_l2x0_cache_init(void)
 	return 0;
 }
 early_initcall(exynos4_l2x0_cache_init);
-
-static int __init exynos_init(void)
-{
-	printk(KERN_INFO "EXYNOS: Initializing architecture\n");
-
-	return device_register(&exynos4_dev);
-}
-- 
1.7.9.5
