From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2] ARM: EXYNOS4: Fix build warning on regarding SATA_AHCI_PLATFORM
Date: Fri, 25 Mar 2011 10:55:13 +0900
Message-ID: <1301018113-27905-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60622 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754610Ab1CYC0f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 22:26:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes following build warnings.

warning: (MACH_ARMLEX4210) selects SATA_AHCI_PLATFORM
          which has unmet direct dependencies (ATA)

And adds EXYNOX4_DEV_AHCI for building machines which are
not suppoort for AHCI feature on board.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1:
- Added EXYNOS4_DEV_AHCI

 arch/arm/mach-exynos4/Kconfig  |    7 ++++++-
 arch/arm/mach-exynos4/Makefile |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index a021b52..e849f67 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -20,6 +20,11 @@ config EXYNOS4_MCT
 	help
 	  Use MCT (Multi Core Timer) as kernel timers
 
+config EXYNOS4_DEV_AHCI
+	bool
+	help
+	  Compile in platform device definitions for AHCI
+
 config EXYNOS4_DEV_PD
 	bool
 	help
@@ -134,9 +139,9 @@ config MACH_ARMLEX4210
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
+	select EXYNOS4_DEV_AHCI
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_SDHCI
-	select SATA_AHCI_PLATFORM
 	help
 	  Machine support for Samsung ARMLEX4210 based on EXYNOS4210
 
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index b8f0e7d..9be104f 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_MACH_NURI)			+= mach-nuri.o
 # device support
 
 obj-y					+= dev-audio.o
+obj-$(CONFIG_EXYNOS4_DEV_AHCI)		+= dev-ahci.o
 obj-$(CONFIG_EXYNOS4_DEV_PD)		+= dev-pd.o
 obj-$(CONFIG_EXYNOS4_DEV_SYSMMU)	+= dev-sysmmu.o
 
@@ -53,4 +54,3 @@ obj-$(CONFIG_EXYNOS4_SETUP_I2C7)	+= setup-i2c7.o
 obj-$(CONFIG_EXYNOS4_SETUP_KEYPAD)	+= setup-keypad.o
 obj-$(CONFIG_EXYNOS4_SETUP_SDHCI)	+= setup-sdhci.o
 obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
-obj-$(CONFIG_SATA_AHCI_PLATFORM)	+= dev-ahci.o
-- 
1.7.1
