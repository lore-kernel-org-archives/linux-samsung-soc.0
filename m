From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 10/12] ARM: SAMSUNG: local onenand-core header in mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:50 +0900
Message-ID: <014301d0c87c$bf2669d0$3d733d70$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60464 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831AbbG0O6v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:51 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS501ABXIY2OMB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:50 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves onenand-core header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/onenand-core.h | 2 --
 arch/arm/mach-s3c64xx/s3c6400.c                                     | 2 +-
 arch/arm/mach-s3c64xx/s3c6410.c                                     | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/onenand-core.h (95%)

diff --git a/arch/arm/plat-samsung/include/plat/onenand-core.h b/arch/arm/mach-s3c64xx/onenand-core.h
similarity index 95%
rename from arch/arm/plat-samsung/include/plat/onenand-core.h
rename to arch/arm/mach-s3c64xx/onenand-core.h
index 7701cb7..925eb13 100644
--- a/arch/arm/plat-samsung/include/plat/onenand-core.h
+++ b/arch/arm/mach-s3c64xx/onenand-core.h
@@ -1,6 +1,4 @@
 /*
- * linux/arch/arm/plat-samsung/onenand-core.h
- *
  *  Copyright (c) 2010 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *  Marek Szyprowski <m.szyprowski@samsung.com>
diff --git a/arch/arm/mach-s3c64xx/s3c6400.c b/arch/arm/mach-s3c64xx/s3c6400.c
index 1ce48c5..33273ab 100644
--- a/arch/arm/mach-s3c64xx/s3c6400.c
+++ b/arch/arm/mach-s3c64xx/s3c6400.c
@@ -41,9 +41,9 @@
 #include <plat/devs.h>
 #include <plat/sdhci.h>
 #include <plat/iic-core.h>
-#include <plat/onenand-core.h>
 
 #include "common.h"
+#include "onenand-core.h"
 
 void __init s3c6400_map_io(void)
 {
diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c6410.c
index 5081f08..eadc48d 100644
--- a/arch/arm/mach-s3c64xx/s3c6410.c
+++ b/arch/arm/mach-s3c64xx/s3c6410.c
@@ -43,10 +43,10 @@
 #include <plat/sdhci.h>
 #include <plat/adc-core.h>
 #include <plat/iic-core.h>
-#include <plat/onenand-core.h>
 
 #include "ata-core.h"
 #include "common.h"
+#include "onenand-core.h"
 
 void __init s3c6410_map_io(void)
 {
-- 
2.0.0
