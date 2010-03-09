From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S5P6440: Add support for SDHCI interface.
Date: Tue, 09 Mar 2010 19:09:46 +0530
Message-ID: <1268141986-10983-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59063 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306Ab0CINij (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 08:38:39 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZ000JWOOKEYG@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZ0009BGOKAB7@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:38:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch adds support for SDHCI interface for Samsung's S5P6440 SoC.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s5p6440/Kconfig            |    9 +++++++++
 arch/arm/mach-s5p6440/cpu.c              |    4 ++++
 arch/arm/mach-s5p6440/include/mach/map.h |    3 +++
 arch/arm/plat-s5p/include/plat/s5p6440.h |    1 +
 drivers/mmc/host/Kconfig                 |    2 +-
 5 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kconfig
index 4c29ff8..7a73ae2 100644
--- a/arch/arm/mach-s5p6440/Kconfig
+++ b/arch/arm/mach-s5p6440/Kconfig
@@ -12,9 +12,18 @@ config CPU_S5P6440
 	help
 	  Enable S5P6440 CPU support
 
+config S5P6440_SETUP_SDHCI
+	bool
+	help
+	  Internal configuration for default SDHCI setup for S5P6440 SoC.
+
 config MACH_SMDK6440
 	bool "SMDK6440"
 	select CPU_S5P6440
+	select S5P6440_SETUP_SDHCI
+	select S3C_DEV_HSMMC
+	select S3C_DEV_HSMMC1
+	select S3C_DEV_HSMMC2
 	help
 	  Machine support for the Samsung SMDK6440
 
diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.c
index 1794131..16f6f0d 100644
--- a/arch/arm/mach-s5p6440/cpu.c
+++ b/arch/arm/mach-s5p6440/cpu.c
@@ -107,6 +107,10 @@ int __init s5p6440_init(void)
 {
 	printk(KERN_INFO "S5P6440: Initializing architecture\n");
 
+#ifdef CONFIG_MMC_SDHCI_S3C
+	s5p6440_setup_sdhci();
+#endif
+
 	/* set idle function */
 	pm_idle = s5p6440_idle;
 
diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach-s5p6440/include/mach/map.h
index 8924e5a..abf462b 100644
--- a/arch/arm/mach-s5p6440/include/mach/map.h
+++ b/arch/arm/mach-s5p6440/include/mach/map.h
@@ -64,5 +64,8 @@
 /* compatibiltiy defines. */
 #define S3C_PA_UART		S5P6440_PA_UART
 #define S3C_PA_IIC		S5P6440_PA_IIC0
+#define S3C_PA_HSMMC0           S5P6440_PA_HSMMC0
+#define S3C_PA_HSMMC1           S5P6440_PA_HSMMC1
+#define S3C_PA_HSMMC2           S5P6440_PA_HSMMC2
 
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/plat-s5p/include/plat/s5p6440.h b/arch/arm/plat-s5p/include/plat/s5p6440.h
index a4cd75a..0ca8daf 100644
--- a/arch/arm/plat-s5p/include/plat/s5p6440.h
+++ b/arch/arm/plat-s5p/include/plat/s5p6440.h
@@ -15,6 +15,7 @@
 extern void s5p6440_common_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 extern void s5p6440_register_clocks(void);
 extern void s5p6440_setup_clocks(void);
+extern void s5p6440_setup_sdhci(void);
 
 #ifdef CONFIG_CPU_S5P6440
 
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index ce1d288..811d00b 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -127,7 +127,7 @@ config MMC_SDHCI_PLTFM
 
 config MMC_SDHCI_S3C
 	tristate "SDHCI support on Samsung S3C SoC"
-	depends on MMC_SDHCI && (PLAT_S3C24XX || PLAT_S3C64XX)
+	depends on MMC_SDHCI && (PLAT_S3C24XX || PLAT_S3C64XX || PLAT_S5P)
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  often referrered to as the HSMMC block in some of the Samsung S3C
-- 
1.6.6.rc2
