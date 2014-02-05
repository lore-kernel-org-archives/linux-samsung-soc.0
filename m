From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH V2 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Wed, 05 Feb 2014 10:46:13 +0530
Message-ID: <1391577375-17625-2-git-send-email-rahul.sharma@samsung.com>
References: <1391577375-17625-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14415 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbaBEFQx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 00:16:53 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0I00E88C045750@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Feb 2014 14:16:52 +0900 (KST)
In-reply-to: <1391577375-17625-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

This patch add basic arch side support for exynos5260 SoC.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/Kconfig                 |    9 +++++++++
 arch/arm/mach-exynos/common.c                |   18 ++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h      |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c       |    1 +
 arch/arm/plat-samsung/include/plat/cpu.h     |    8 ++++++++
 arch/arm/plat-samsung/include/plat/map-s5p.h |    1 +
 6 files changed, 38 insertions(+)
 mode change 100644 => 100755 arch/arm/mach-exynos/include/mach/map.h
 mode change 100644 => 100755 arch/arm/mach-exynos/mach-exynos5-dt.c
 mode change 100644 => 100755 arch/arm/plat-samsung/include/plat/cpu.h

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4c414af..5c96248 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -91,6 +91,15 @@ config SOC_EXYNOS5250
 	help
 	  Enable EXYNOS5250 SoC support
 
+config SOC_EXYNOS5260
+	bool "SAMSUNG EXYNOS5260"
+	default y
+	depends on ARCH_EXYNOS5
+	select AUTO_ZRELADDR
+	select SAMSUNG_DMADEV
+	help
+	  Enable EXYNOS5260 SoC support
+
 config SOC_EXYNOS5420
 	bool "SAMSUNG EXYNOS5420"
 	default y
diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 72ae5d3..4ee14ed 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -52,6 +52,7 @@ static const char name_exynos4210[] = "EXYNOS4210";
 static const char name_exynos4212[] = "EXYNOS4212";
 static const char name_exynos4412[] = "EXYNOS4412";
 static const char name_exynos5250[] = "EXYNOS5250";
+static const char name_exynos5260[] = "EXYNOS5260";
 static const char name_exynos5420[] = "EXYNOS5420";
 static const char name_exynos5440[] = "EXYNOS5440";
 
@@ -85,6 +86,12 @@ static struct cpu_table cpu_ids[] __initdata = {
 		.init		= exynos_init,
 		.name		= name_exynos5250,
 	}, {
+		.idcode		= EXYNOS5260_SOC_ID,
+		.idmask		= EXYNOS5_SOC_MASK,
+		.map_io		= exynos5_map_io,
+		.init		= exynos_init,
+		.name		= name_exynos5260,
+	}, {
 		.idcode		= EXYNOS5420_SOC_ID,
 		.idmask		= EXYNOS5_SOC_MASK,
 		.map_io		= exynos5_map_io,
@@ -263,6 +270,15 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 	},
 };
 
+static struct map_desc exynos5260_iodesc[] __initdata = {
+	{
+		.virtual	= (unsigned long)S5P_VA_SYSRAM_NS,
+		.pfn		= __phys_to_pfn(EXYNOS5260_PA_SYSRAM_NS),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	},
+};
+
 void exynos4_restart(enum reboot_mode mode, const char *cmd)
 {
 	__raw_writel(0x1, S5P_SWRESET);
@@ -374,6 +390,8 @@ static void __init exynos5_map_io(void)
 
 	if (soc_is_exynos5250())
 		iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos5250_iodesc));
+	if (soc_is_exynos5260())
+		iotable_init(exynos5260_iodesc, ARRAY_SIZE(exynos5260_iodesc));
 }
 
 struct bus_type exynos_subsys = {
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
old mode 100644
new mode 100755
index 7b046b5..bd6fa02
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -29,6 +29,7 @@
 #define EXYNOS4210_PA_SYSRAM_NS		0x0203F000
 #define EXYNOS4x12_PA_SYSRAM_NS		0x0204F000
 #define EXYNOS5250_PA_SYSRAM_NS		0x0204F000
+#define EXYNOS5260_PA_SYSRAM_NS		0x02073000
 
 #define EXYNOS_PA_CHIPID		0x10000000
 
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
old mode 100644
new mode 100755
index 65a4646..18aee57
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -50,6 +50,7 @@ static void __init exynos5_dt_machine_init(void)
 
 static char const *exynos5_dt_compat[] __initdata = {
 	"samsung,exynos5250",
+	"samsung,exynos5260",
 	"samsung,exynos5420",
 	"samsung,exynos5440",
 	NULL
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
old mode 100644
new mode 100755
index 335beb3..60687aa
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -46,6 +46,7 @@ extern unsigned long samsung_cpu_id;
 #define EXYNOS4_CPU_MASK	0xFFFE0000
 
 #define EXYNOS5250_SOC_ID	0x43520000
+#define EXYNOS5260_SOC_ID	0xE5260000
 #define EXYNOS5420_SOC_ID	0xE5420000
 #define EXYNOS5440_SOC_ID	0xE5440000
 #define EXYNOS5_SOC_MASK	0xFFFFF000
@@ -68,6 +69,7 @@ IS_SAMSUNG_CPU(exynos4210, EXYNOS4210_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos4212, EXYNOS4212_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
 IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
+IS_SAMSUNG_CPU(exynos5260, EXYNOS5260_SOC_ID, EXYNOS5_SOC_MASK)
 IS_SAMSUNG_CPU(exynos5420, EXYNOS5420_SOC_ID, EXYNOS5_SOC_MASK)
 IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 
@@ -148,6 +150,12 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos5250()	0
 #endif
 
+#if defined(CONFIG_SOC_EXYNOS5260)
+# define soc_is_exynos5260()	is_samsung_exynos5260()
+#else
+# define soc_is_exynos5260()	0
+#endif
+
 #if defined(CONFIG_SOC_EXYNOS5420)
 # define soc_is_exynos5420()	is_samsung_exynos5420()
 #else
diff --git a/arch/arm/plat-samsung/include/plat/map-s5p.h b/arch/arm/plat-samsung/include/plat/map-s5p.h
index c186786..804597c 100644
--- a/arch/arm/plat-samsung/include/plat/map-s5p.h
+++ b/arch/arm/plat-samsung/include/plat/map-s5p.h
@@ -23,6 +23,7 @@
 
 #define S5P_VA_SYSRAM		S3C_ADDR(0x02400000)
 #define S5P_VA_SYSRAM_NS	S3C_ADDR(0x02410000)
+
 #define S5P_VA_DMC0		S3C_ADDR(0x02440000)
 #define S5P_VA_DMC1		S3C_ADDR(0x02480000)
 #define S5P_VA_SROMC		S3C_ADDR(0x024C0000)
-- 
1.7.9.5
