From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 03/12] ARM: SAMSUNG: local nand-core header in mach-s3c24xx
Date: Mon, 27 Jul 2015 23:57:37 +0900
Message-ID: <013c01d0c87c$93a61760$baf24620$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46343 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753316AbbG0O5j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:57:39 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS5027F9IW1UMC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:57:37 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves nand-core header file into mach-s3c24xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/nand-core.h | 3 +--
 arch/arm/mach-s3c24xx/s3c2412.c                                  | 2 +-
 arch/arm/mach-s3c24xx/s3c2416.c                                  | 2 +-
 arch/arm/mach-s3c24xx/s3c2443.c                                  | 2 +-
 arch/arm/mach-s3c24xx/s3c244x.c                                  | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/nand-core.h (93%)

diff --git a/arch/arm/plat-samsung/include/plat/nand-core.h b/arch/arm/mach-s3c24xx/nand-core.h
similarity index 93%
rename from arch/arm/plat-samsung/include/plat/nand-core.h
rename to arch/arm/mach-s3c24xx/nand-core.h
index 6de2078..7e811fe 100644
--- a/arch/arm/plat-samsung/include/plat/nand-core.h
+++ b/arch/arm/mach-s3c24xx/nand-core.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/nand-core.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
diff --git a/arch/arm/mach-s3c24xx/s3c2412.c b/arch/arm/mach-s3c24xx/s3c2412.c
index 64a1360..fb5ee8d 100644
--- a/arch/arm/mach-s3c24xx/s3c2412.c
+++ b/arch/arm/mach-s3c24xx/s3c2412.c
@@ -40,11 +40,11 @@
 #include <plat/cpu.h>
 #include <plat/cpu-freq.h>
 #include <plat/devs.h>
-#include <plat/nand-core.h>
 #include <plat/pm.h>
 #include <plat/regs-spi.h>
 
 #include "common.h"
+#include "nand-core.h"
 #include "regs-dsc.h"
 #include "s3c2412-power.h"
 
diff --git a/arch/arm/mach-s3c24xx/s3c2416.c b/arch/arm/mach-s3c24xx/s3c2416.c
index b911851..2469b27 100644
--- a/arch/arm/mach-s3c24xx/s3c2416.c
+++ b/arch/arm/mach-s3c24xx/s3c2416.c
@@ -59,12 +59,12 @@
 #include <plat/pm.h>
 
 #include <plat/iic-core.h>
-#include <plat/nand-core.h>
 #include <plat/adc-core.h>
 #include <plat/spi-core.h>
 
 #include "common.h"
 #include "fb-core.h"
+#include "nand-core.h"
 
 static struct map_desc s3c2416_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 91dd964..5269d08 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -41,11 +41,11 @@
 #include <plat/gpio-cfg-helpers.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/nand-core.h>
 #include <plat/adc-core.h>
 #include <plat/spi-core.h>
 
 #include "fb-core.h"
+#include "nand-core.h"
 
 static struct map_desc s3c2443_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
diff --git a/arch/arm/mach-s3c24xx/s3c244x.c b/arch/arm/mach-s3c24xx/s3c244x.c
index b141195..31fd273 100644
--- a/arch/arm/mach-s3c24xx/s3c244x.c
+++ b/arch/arm/mach-s3c24xx/s3c244x.c
@@ -41,9 +41,9 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
-#include <plat/nand-core.h>
 
 #include "common.h"
+#include "nand-core.h"
 #include "regs-dsc.h"
 
 static struct map_desc s3c244x_iodesc[] __initdata = {
-- 
2.0.0
