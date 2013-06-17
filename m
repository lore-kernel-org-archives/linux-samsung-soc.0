From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 38/38] ARM: EXYNOS: Remove remaining dead code after non-DT
 support removal
Date: Mon, 17 Jun 2013 18:34:23 +0200
Message-ID: <1371486863-12398-39-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752392Ab3FQQfB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:35:01 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:59 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch removes remaining small bits of unused code that was left
after removing non-DT support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig                | 17 -----------------
 arch/arm/mach-exynos/common.c               |  4 +---
 arch/arm/mach-exynos/include/mach/pm-core.h |  7 +------
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index fcebdfb..fa14283 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -110,23 +110,6 @@ config MACH_EXYNOS5_DT
 	  Machine support for Samsung EXYNOS5 machine with device tree enabled.
 	  Select this if a fdt blob is available for the EXYNOS5 SoC based board.
 
-if ARCH_EXYNOS4
-
-comment "Configuration for HSMMC 8-bit bus width"
-
-config EXYNOS4_SDHCI_CH0_8BIT
-	bool "Channel 0 with 8-bit bus"
-	help
-	  Support HSMMC Channel 0 8-bit bus.
-	  If selected, Channel 1 is disabled.
-
-config EXYNOS4_SDHCI_CH2_8BIT
-	bool "Channel 2 with 8-bit bus"
-	help
-	  Support HSMMC Channel 2 8-bit bus.
-	  If selected, Channel 3 is disabled.
-endif
-
 endmenu
 
 endif
diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index e886154..81e6320 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -60,8 +60,6 @@ static void exynos5_map_io(void);
 static void exynos5440_map_io(void);
 static int exynos_init(void);
 
-unsigned long xxti_f = 0, xusbxti_f = 0;
-
 static struct cpu_table cpu_ids[] __initdata = {
 	{
 		.idcode		= EXYNOS4210_CPU_ID,
@@ -322,7 +320,7 @@ void __init exynos_init_late(void)
 	exynos_pm_late_initcall();
 }
 
-int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
+static int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
 					int depth, void *data)
 {
 	struct map_desc iodesc;
diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h b/arch/arm/mach-exynos/include/mach/pm-core.h
index 71e6b89..2b00833 100644
--- a/arch/arm/mach-exynos/include/mach/pm-core.h
+++ b/arch/arm/mach-exynos/include/mach/pm-core.h
@@ -34,12 +34,7 @@ static inline void s3c_pm_debug_init_uart(void)
 
 static inline void s3c_pm_arch_prepare_irqs(void)
 {
-	u32 eintmask = s3c_irqwake_eintmask;
-
-	if (of_have_populated_dt())
-		eintmask = exynos_get_eint_wake_mask();
-
-	__raw_writel(eintmask, S5P_EINT_WAKEUP_MASK);
+	__raw_writel(exynos_get_eint_wake_mask(), S5P_EINT_WAKEUP_MASK);
 	__raw_writel(s3c_irqwake_intmask & ~(1 << 31), S5P_WAKEUP_MASK);
 }
 
-- 
1.8.2.1
