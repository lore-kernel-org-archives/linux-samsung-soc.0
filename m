From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 24/26] ARM: S3C64XX: make regs-srom.h local
Date: Wed, 02 Jan 2013 14:24:01 -0800
Message-ID: <1357165443-3716-25-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41080 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752711Ab3ABWZE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:25:04 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000B7VRKLFV10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:25:04 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:25:03 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The header file can be local in mach-s3c64xx/.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c64xx/mach-mini6410.c                |    2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c                |    2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c                |    2 +-
 arch/arm/mach-s3c64xx/{include/mach => }/regs-srom.h |   11 +++++------
 4 files changed, 8 insertions(+), 9 deletions(-)
 rename arch/arm/mach-s3c64xx/{include/mach => }/regs-srom.h (90%)

diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index 67881e6d..7cec86c 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -31,7 +31,6 @@
 
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-srom.h>
 
 #include <plat/adc.h>
 #include <plat/cpu.h>
@@ -46,6 +45,7 @@
 
 #include "common.h"
 #include "regs-modem.h"
+#include "regs-srom.h"
 
 #define UCON S3C2410_UCON_DEFAULT
 #define ULCON (S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB)
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/mach-real6410.c
index f620b89..215693c 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -32,7 +32,6 @@
 
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-srom.h>
 
 #include <plat/adc.h>
 #include <plat/cpu.h>
@@ -47,6 +46,7 @@
 
 #include "common.h"
 #include "regs-modem.h"
+#include "regs-srom.h"
 
 #define UCON S3C2410_UCON_DEFAULT
 #define ULCON (S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB)
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index f49ecae..dcf41bd 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -59,7 +59,6 @@
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-sys.h>
-#include <mach/regs-srom.h>
 #include <linux/platform_data/ata-samsung_cf.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/fb.h>
@@ -75,6 +74,7 @@
 
 #include "common.h"
 #include "regs-modem.h"
+#include "regs-srom.h"
 
 #define UCON S3C2410_UCON_DEFAULT | S3C2410_UCON_UCLK
 #define ULCON S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB
diff --git a/arch/arm/mach-s3c64xx/include/mach/regs-srom.h b/arch/arm/mach-s3c64xx/regs-srom.h
similarity index 90%
rename from arch/arm/mach-s3c64xx/include/mach/regs-srom.h
rename to arch/arm/mach-s3c64xx/regs-srom.h
index 756731b..d56f338 100644
--- a/arch/arm/mach-s3c64xx/include/mach/regs-srom.h
+++ b/arch/arm/mach-s3c64xx/regs-srom.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c64xx/include/plat/regs-srom.h
- *
+/*
  * Copyright 2009 Andy Green <andy@warmcat.com>
  *
  * S3C64XX SROM definitions
@@ -9,8 +8,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __PLAT_REGS_SROM_H
-#define __PLAT_REGS_SROM_H __FILE__
+#ifndef __MACH_S3C64XX_REGS_SROM_H
+#define __MACH_S3C64XX_REGS_SROM_H __FILE__
 
 #define S3C64XX_SROMREG(x)	(S3C_VA_MEM + (x))
 
@@ -29,7 +28,7 @@
 #define S3C64XX_SROM_BW__DATAWIDTH__SHIFT	0
 #define S3C64XX_SROM_BW__WAITENABLE__SHIFT	2
 #define S3C64XX_SROM_BW__BYTEENABLE__SHIFT	3
-#define S3C64XX_SROM_BW__CS_MASK 0xf
+#define S3C64XX_SROM_BW__CS_MASK		0xf
 
 #define S3C64XX_SROM_BW__NCS0__SHIFT	0
 #define S3C64XX_SROM_BW__NCS1__SHIFT	4
@@ -56,4 +55,4 @@
 #define S3C64XX_SROM_BCX__TACS__SHIFT	28
 #define S3C64XX_SROM_BCX__TACS__MASK	0xf
 
-#endif /* _PLAT_REGS_SROM_H */
+#endif /* __MACH_S3C64XX_REGS_SROM_H */
-- 
1.7.10.4
