From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 04/26] ARM: S5P64X0: move i2c.h into local directory
Date: Wed, 02 Jan 2013 14:23:41 -0800
Message-ID: <1357165443-3716-5-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27486 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709Ab3ABWYm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:24:42 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000LLVRKZPW30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:40 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:40 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The <mach/i2c.h> can be moved into mach-s5p64x0/.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/{include/mach => }/i2c.h |    3 +--
 arch/arm/mach-s5p64x0/mach-smdk6440.c          |    2 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c          |    2 +-
 arch/arm/mach-s5p64x0/setup-i2c0.c             |    2 +-
 arch/arm/mach-s5p64x0/setup-i2c1.c             |    2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)
 rename arch/arm/mach-s5p64x0/{include/mach => }/i2c.h (91%)

diff --git a/arch/arm/mach-s5p64x0/include/mach/i2c.h b/arch/arm/mach-s5p64x0/i2c.h
similarity index 91%
rename from arch/arm/mach-s5p64x0/include/mach/i2c.h
rename to arch/arm/mach-s5p64x0/i2c.h
index 887d252..1e5bb4e 100644
--- a/arch/arm/mach-s5p64x0/include/mach/i2c.h
+++ b/arch/arm/mach-s5p64x0/i2c.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/mach-s5p64x0/include/mach/i2c.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 1af8235..3fb4de3 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -38,7 +38,6 @@
 #include <mach/hardware.h>
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/i2c.h>
 #include <mach/regs-gpio.h>
 
 #include <plat/regs-serial.h>
@@ -56,6 +55,7 @@
 #include <plat/sdhci.h>
 
 #include "common.h"
+#include "i2c.h"
 
 #define SMDK6440_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index 62526cc..53a576d 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -38,7 +38,6 @@
 #include <mach/hardware.h>
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/i2c.h>
 #include <mach/regs-gpio.h>
 
 #include <plat/regs-serial.h>
@@ -56,6 +55,7 @@
 #include <plat/sdhci.h>
 
 #include "common.h"
+#include "i2c.h"
 
 #define SMDK6450_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
diff --git a/arch/arm/mach-s5p64x0/setup-i2c0.c b/arch/arm/mach-s5p64x0/setup-i2c0.c
index a32edc5..569b76a 100644
--- a/arch/arm/mach-s5p64x0/setup-i2c0.c
+++ b/arch/arm/mach-s5p64x0/setup-i2c0.c
@@ -21,7 +21,7 @@ struct platform_device; /* don't need the contents */
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
-#include <mach/i2c.h>
+#include "i2c.h"
 
 void s5p6440_i2c0_cfg_gpio(struct platform_device *dev)
 {
diff --git a/arch/arm/mach-s5p64x0/setup-i2c1.c b/arch/arm/mach-s5p64x0/setup-i2c1.c
index ca2c5c7..867374e 100644
--- a/arch/arm/mach-s5p64x0/setup-i2c1.c
+++ b/arch/arm/mach-s5p64x0/setup-i2c1.c
@@ -21,7 +21,7 @@ struct platform_device; /* don't need the contents */
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
-#include <mach/i2c.h>
+#include "i2c.h"
 
 void s5p6440_i2c1_cfg_gpio(struct platform_device *dev)
 {
-- 
1.7.10.4
