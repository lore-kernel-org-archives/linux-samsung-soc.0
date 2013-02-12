From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S3C24XX: plat/common-smdk.h local
Date: Tue, 12 Feb 2013 09:36:38 -0800
Message-ID: <1360690598-6175-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12453 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932404Ab3BLRhs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 12:37:48 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI4002OPBMTGO30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 02:37:46 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI400JRZBMU1J30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 02:37:46 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The header file plat/common-smdk.h is used only in mach-s3c24xx/,
so this patch moves it into mach-s3c24xx directory.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/common-smdk.c                                |    3 ++-
 arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/common-smdk.h |    3 +--
 arch/arm/mach-s3c24xx/mach-qt2410.c                                |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2410.c                              |    3 +--
 arch/arm/mach-s3c24xx/mach-smdk2413.c                              |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2416.c                              |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2440.c                              |    3 +--
 arch/arm/mach-s3c24xx/mach-smdk2443.c                              |    2 +-
 8 files changed, 9 insertions(+), 11 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/common-smdk.h (86%)

diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 3b2cf6d..404444d 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -41,11 +41,12 @@
 
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 
-#include <plat/common-smdk.h>
 #include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
 
+#include "common-smdk.h"
+
 /* LED devices */
 
 static struct s3c24xx_led_platdata smdk_pdata_led4 = {
diff --git a/arch/arm/plat-samsung/include/plat/common-smdk.h b/arch/arm/mach-s3c24xx/common-smdk.h
similarity index 86%
rename from arch/arm/plat-samsung/include/plat/common-smdk.h
rename to arch/arm/mach-s3c24xx/common-smdk.h
index ba028f1..98f733e 100644
--- a/arch/arm/plat-samsung/include/plat/common-smdk.h
+++ b/arch/arm/mach-s3c24xx/common-smdk.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/include/plat/common-smdk.h
- *
+/*
  * Copyright (c) 2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 7b6ba13..c4ec809 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -55,13 +55,13 @@
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
-#include <plat/common-smdk.h>
 #include <plat/gpio-cfg.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
 
 #include "common.h"
+#include "common-smdk.h"
 
 static struct map_desc qt2410_iodesc[] __initdata = {
 	{ 0xe0000000, __phys_to_pfn(S3C2410_CS3+0x01000000), SZ_1M, MT_DEVICE }
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c24xx/mach-smdk2410.c
index 82796b9..469ce31 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -52,9 +52,8 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 
-#include <plat/common-smdk.h>
-
 #include "common.h"
+#include "common-smdk.h"
 
 static struct map_desc smdk2410_iodesc[] __initdata = {
   /* nothing here yet */
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index b9d5703..64e4a9f 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -47,7 +47,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 
-#include <plat/common-smdk.h>
+#include "common-smdk.h"
 
 static struct map_desc smdk2413_iodesc[] __initdata = {
 };
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index 2abb66f..eb3715f 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -54,7 +54,7 @@
 
 #include <plat/fb.h>
 
-#include <plat/common-smdk.h>
+#include "common-smdk.h"
 
 static struct map_desc smdk2416_iodesc[] __initdata = {
 	/* ISA IO Space map (memory space selected by A24) */
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index 0bba786..496bd4f 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -44,9 +44,8 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 
-#include <plat/common-smdk.h>
-
 #include "common.h"
+#include "common-smdk.h"
 
 static struct map_desc smdk2440_iodesc[] __initdata = {
 	/* ISA IO Space map (memory space selected by A24) */
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index 8b65a54..9a3997b 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -44,7 +44,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 
-#include <plat/common-smdk.h>
+#include "common-smdk.h"
 
 static struct map_desc smdk2443_iodesc[] __initdata = {
 	/* ISA IO Space map (memory space selected by A24) */
-- 
1.7.10.4
