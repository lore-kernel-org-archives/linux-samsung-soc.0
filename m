From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 02/12] ARM: SAMSUNG: local fb-core header in mach-s3c24xx
Date: Mon, 27 Jul 2015 23:57:27 +0900
Message-ID: <013b01d0c87c$8dbc6b60$a9354220$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35331 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753645AbbG0O53 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:57:29 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS5015AGIVSVUC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:57:28 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves fb-core header file into mach-s3c24xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/fb-core.h | 2 --
 arch/arm/mach-s3c24xx/s3c2416.c                                | 2 +-
 arch/arm/mach-s3c24xx/s3c2443.c                                | 3 ++-
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/fb-core.h (93%)

diff --git a/arch/arm/plat-samsung/include/plat/fb-core.h b/arch/arm/mach-s3c24xx/fb-core.h
similarity index 93%
rename from arch/arm/plat-samsung/include/plat/fb-core.h
rename to arch/arm/mach-s3c24xx/fb-core.h
index bca383e..103bdba 100644
--- a/arch/arm/plat-samsung/include/plat/fb-core.h
+++ b/arch/arm/mach-s3c24xx/fb-core.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/plat-samsung/include/plat/fb-core.h
- *
  * Copyright 2010 Samsung Electronics Co., Ltd.
  *	Pawel Osciak <p.osciak@samsung.com>
  *
diff --git a/arch/arm/mach-s3c24xx/s3c2416.c b/arch/arm/mach-s3c24xx/s3c2416.c
index 3f8ca2a..b911851 100644
--- a/arch/arm/mach-s3c24xx/s3c2416.c
+++ b/arch/arm/mach-s3c24xx/s3c2416.c
@@ -59,12 +59,12 @@
 #include <plat/pm.h>
 
 #include <plat/iic-core.h>
-#include <plat/fb-core.h>
 #include <plat/nand-core.h>
 #include <plat/adc-core.h>
 #include <plat/spi-core.h>
 
 #include "common.h"
+#include "fb-core.h"
 
 static struct map_desc s3c2416_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 87b6b89..91dd964 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -41,11 +41,12 @@
 #include <plat/gpio-cfg-helpers.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-#include <plat/fb-core.h>
 #include <plat/nand-core.h>
 #include <plat/adc-core.h>
 #include <plat/spi-core.h>
 
+#include "fb-core.h"
+
 static struct map_desc s3c2443_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
 	IODESC_ENT(CLKPWR),
-- 
2.0.0
