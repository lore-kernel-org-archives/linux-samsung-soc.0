From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 04/12] ARM: SAMSUNG: local spi-core header in mach-s3c24xx
Date: Mon, 27 Jul 2015 23:57:41 +0900
Message-ID: <013d01d0c87c$965ad720$c3108560$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46177 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753316AbbG0O5n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:57:43 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS50111EIW5W900@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:57:41 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves spi-core header file into mach-s3c24xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/mach-s3c24xx/s3c2416.c                                 | 2 +-
 arch/arm/mach-s3c24xx/s3c2443.c                                 | 2 +-
 arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/spi-core.h | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c24xx}/spi-core.h (100%)

diff --git a/arch/arm/mach-s3c24xx/s3c2416.c b/arch/arm/mach-s3c24xx/s3c2416.c
index 2469b27..621b864 100644
--- a/arch/arm/mach-s3c24xx/s3c2416.c
+++ b/arch/arm/mach-s3c24xx/s3c2416.c
@@ -60,11 +60,11 @@
 
 #include <plat/iic-core.h>
 #include <plat/adc-core.h>
-#include <plat/spi-core.h>
 
 #include "common.h"
 #include "fb-core.h"
 #include "nand-core.h"
+#include "spi-core.h"
 
 static struct map_desc s3c2416_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index 5269d08..b559d37 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -42,10 +42,10 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/adc-core.h>
-#include <plat/spi-core.h>
 
 #include "fb-core.h"
 #include "nand-core.h"
+#include "spi-core.h"
 
 static struct map_desc s3c2443_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
diff --git a/arch/arm/plat-samsung/include/plat/spi-core.h b/arch/arm/mach-s3c24xx/spi-core.h
similarity index 100%
rename from arch/arm/plat-samsung/include/plat/spi-core.h
rename to arch/arm/mach-s3c24xx/spi-core.h
-- 
2.0.0
