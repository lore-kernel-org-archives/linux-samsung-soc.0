From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/4] ARM: s3c24xx: Removed unneeded dependency on ARCH_S3C24XX for boards
Date: Sat,  2 Mar 2013 13:22:51 +0400
Message-ID: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback1.mail.ru ([94.100.176.18]:50409 "EHLO
	fallback1.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751584Ab3CBJXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Mar 2013 04:23:39 -0500
Received: from smtp45.i.mail.ru (smtp45.i.mail.ru [94.100.177.105])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id C3910125FBDB
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Mar 2013 13:23:37 +0400 (MSK)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Alexander Shiyan <shc_work@mail.ru>

Board options are already under "if ARCH_S3C24XX" condition, so
additional dependencies on this symbol can be removed.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/mach-s3c24xx/Kconfig | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 37f513d..567d77b 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -36,7 +36,6 @@ config CPU_S3C2410
 
 config CPU_S3C2412
 	bool "SAMSUNG S3C2412"
-	depends on ARCH_S3C24XX
 	select CPU_ARM926T
 	select CPU_LLSERIAL_S3C2440
 	select S3C2412_DMA if S3C24XX_DMA
@@ -46,7 +45,6 @@ config CPU_S3C2412
 
 config CPU_S3C2416
 	bool "SAMSUNG S3C2416/S3C2450"
-	depends on ARCH_S3C24XX
 	select CPU_ARM926T
 	select CPU_LLSERIAL_S3C2440
 	select S3C2416_PM if PM
@@ -81,7 +79,6 @@ config CPU_S3C244X
 
 config CPU_S3C2443
 	bool "SAMSUNG S3C2443"
-	depends on ARCH_S3C24XX
 	select CPU_ARM920T
 	select CPU_LLSERIAL_S3C2440
 	select S3C2443_COMMON
@@ -133,7 +130,6 @@ config S3C24XX_SETUP_TS
 
 config S3C24XX_DMA
 	bool "S3C2410 DMA support"
-	depends on ARCH_S3C24XX
 	select S3C_DMA
 	help
 	  S3C2410 DMA support. This is needed for drivers like sound which
@@ -142,7 +138,7 @@ config S3C24XX_DMA
 
 config S3C2410_DMA_DEBUG
 	bool "S3C2410 DMA support debug"
-	depends on ARCH_S3C24XX && S3C2410_DMA
+	depends on S3C2410_DMA
 	help
 	  Enable debugging output for the DMA code. This option sends info
 	  to the kernel log, at priority KERN_DEBUG.
@@ -380,9 +376,8 @@ if CPU_S3C2412
 
 config CPU_S3C2412_ONLY
 	bool
-	depends on ARCH_S3C24XX && !CPU_S3C2410 && \
-		   !CPU_S3C2416 && !CPU_S3C2440 && !CPU_S3C2442 && \
-		   !CPU_S3C2443 && CPU_S3C2412
+	depends on !CPU_S3C2410 && !CPU_S3C2416 && !CPU_S3C2440 && \
+		   !CPU_S3C2442 && !CPU_S3C2443 && CPU_S3C2412
 	default y
 
 config S3C2412_CPUFREQ
-- 
1.7.12.4
