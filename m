From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: Samsung: Make PM_GENERIC_DOMAINS config depend on
 CONFIG_PM
Date: Tue, 27 Mar 2012 15:46:43 +0530
Message-ID: <1332843404-25476-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50069 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757992Ab2C0KMA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 06:12:00 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1J00EWGGBZ7FD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 19:11:59 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1J00FDQGB1YC50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 19:11:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com

For s3c64xx and exynos platforms, make the selection of PM_GENERIC_DOMAINS
depend on the CONFIG_PM.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/Kconfig  |    2 +-
 arch/arm/mach-s3c64xx/Kconfig |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 0491cee..6c8f17b 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -35,7 +35,7 @@ config CPU_EXYNOS4210
 	select ARM_CPU_SUSPEND if PM
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
-	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS if PM
 	help
 	  Enable EXYNOS4210 CPU support
 
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 82c0915..2609349 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -8,7 +8,7 @@ config PLAT_S3C64XX
 	bool
 	depends on ARCH_S3C64XX
 	select SAMSUNG_WAKEMASK
-	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS if PM
 	default y
 	help
 	  Base platform code for any Samsung S3C64XX device
-- 
1.6.6.rc2
