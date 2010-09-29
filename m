From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P64XX: Remove redundant selection PLAT_S5P.
Date: Wed, 29 Sep 2010 21:23:51 +0900
Message-ID: <1285763031-4720-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40592 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755748Ab0I2Mll (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Sep 2010 08:41:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch removes redundant selection PLAT_S5P in the CPU_S5P64XX config.
Because PLAT_S5P is selected if select ARCH_S5P64XX in the plat-s5p/Kconfig.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/Kconfig |    1 -
 arch/arm/mach-s5p64x0/Kconfig |    2 --
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5p6442/Kconfig b/arch/arm/mach-s5p6442/Kconfig
index 0fda0a5..33569e4 100644
--- a/arch/arm/mach-s5p6442/Kconfig
+++ b/arch/arm/mach-s5p6442/Kconfig
@@ -11,7 +11,6 @@ if ARCH_S5P6442
 
 config CPU_S5P6442
 	bool
-	select PLAT_S5P
 	select S3C_PL330_DMA
 	help
 	  Enable S5P6442 CPU support
diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index fbcae93..164d278 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -9,14 +9,12 @@ if ARCH_S5P64X0
 
 config CPU_S5P6440
 	bool
-	select PLAT_S5P
 	select S3C_PL330_DMA
 	help
 	  Enable S5P6440 CPU support
 
 config CPU_S5P6450
 	bool
-	select PLAT_S5P
 	select S3C_PL330_DMA
 	help
 	  Enable S5P6450 CPU support
-- 
1.6.2.5
