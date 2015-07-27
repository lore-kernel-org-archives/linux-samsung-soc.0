From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 06/12] ARM: SAMSUNG: local ata-core header in mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:09 +0900
Message-ID: <013f01d0c87c$a6ec0550$f4c40ff0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58916 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753316AbbG0O6L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:11 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS5027SRIWX54C0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:09 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves ata-core header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/ata-core.h | 3 +--
 arch/arm/mach-s3c64xx/s3c6410.c                                 | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/ata-core.h (92%)

diff --git a/arch/arm/plat-samsung/include/plat/ata-core.h b/arch/arm/mach-s3c64xx/ata-core.h
similarity index 92%
rename from arch/arm/plat-samsung/include/plat/ata-core.h
rename to arch/arm/mach-s3c64xx/ata-core.h
index f5a4ec7..5951f24 100644
--- a/arch/arm/plat-samsung/include/plat/ata-core.h
+++ b/arch/arm/mach-s3c64xx/ata-core.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/include/plat/ata-core.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c6410.c
index b2a7930..5081f08 100644
--- a/arch/arm/mach-s3c64xx/s3c6410.c
+++ b/arch/arm/mach-s3c64xx/s3c6410.c
@@ -41,11 +41,11 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/sdhci.h>
-#include <plat/ata-core.h>
 #include <plat/adc-core.h>
 #include <plat/iic-core.h>
 #include <plat/onenand-core.h>
 
+#include "ata-core.h"
 #include "common.h"
 
 void __init s3c6410_map_io(void)
-- 
2.0.0
