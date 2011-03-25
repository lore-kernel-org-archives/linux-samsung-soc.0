From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix SATA_AHCI_PLATFORM warnings
Date: Fri, 25 Mar 2011 10:10:02 +0900
Message-ID: <1301015402-16142-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60185 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932206Ab1CYBlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 21:41:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes following build warnings.
warning: (MACH_ARMLEX4210) selects SATA_AHCI_PLATFORM
         which has unmet direct dependencies (ATA)

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index a021b52..85b45fa 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -136,7 +136,7 @@ config MACH_ARMLEX4210
 	select S3C_DEV_HSMMC3
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_SDHCI
-	select SATA_AHCI_PLATFORM
+	select SATA_AHCI_PLATFORM if ATA
 	help
 	  Machine support for Samsung ARMLEX4210 based on EXYNOS4210
 
-- 
1.7.1
