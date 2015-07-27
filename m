From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 11/12] ARM: SAMSUNG: local watchdog-reset header in mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:57 +0900
Message-ID: <014401d0c87c$c3c37190$4b4a54b0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39313 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbbG0O67 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:59 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS501F3DIYAW3A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:58 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves watchdog-reset header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/mach-s3c64xx/common.c                                        | 2 +-
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c                               | 3 +--
 arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/watchdog-reset.h | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/watchdog-reset.h (91%)

diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 316df5a..4a9621b 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -50,10 +50,10 @@
 #include <plat/gpio-cfg.h>
 #include <plat/pwm-core.h>
 #include <plat/regs-irqtype.h>
-#include <plat/watchdog-reset.h>
 
 #include "common.h"
 #include "irq-uart.h"
+#include "watchdog-reset.h"
 
 /* External clock frequency */
 static unsigned long xtal_f = 12000000, xusbxti_f = 48000000;
diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
index 2fddf38..ead3766 100644
--- a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
+++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
@@ -15,11 +15,10 @@
 #include <asm/system_misc.h>
 
 #include <plat/cpu.h>
-#include <plat/watchdog-reset.h>
-
 #include <mach/map.h>
 
 #include "common.h"
+#include "watchdog-reset.h"
 
 /*
  * IO mapping for shared system controller IP.
diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/mach-s3c64xx/watchdog-reset.h
similarity index 91%
rename from arch/arm/plat-samsung/include/plat/watchdog-reset.h
rename to arch/arm/mach-s3c64xx/watchdog-reset.h
index 0386b8f..42707df 100644
--- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+++ b/arch/arm/mach-s3c64xx/watchdog-reset.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/watchdog-reset.h
- *
+/*
  * Copyright (c) 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
-- 
2.0.0
