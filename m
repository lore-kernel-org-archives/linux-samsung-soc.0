From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 08/12] ARM: SAMSUNG: local irq-uart header in mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:34 +0900
Message-ID: <014101d0c87c$b5ec5a50$21c50ef0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39549 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831AbbG0O6g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:36 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS502ZO4IXMSG20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:34 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves irq-uart header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/mach-s3c64xx/common.c                                  | 2 +-
 arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/irq-uart.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/irq-uart.h (90%)

diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 16547f2..316df5a 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -48,12 +48,12 @@
 #include <plat/devs.h>
 #include <plat/pm.h>
 #include <plat/gpio-cfg.h>
-#include <plat/irq-uart.h>
 #include <plat/pwm-core.h>
 #include <plat/regs-irqtype.h>
 #include <plat/watchdog-reset.h>
 
 #include "common.h"
+#include "irq-uart.h"
 
 /* External clock frequency */
 static unsigned long xtal_f = 12000000, xusbxti_f = 48000000;
diff --git a/arch/arm/plat-samsung/include/plat/irq-uart.h b/arch/arm/mach-s3c64xx/irq-uart.h
similarity index 90%
rename from arch/arm/plat-samsung/include/plat/irq-uart.h
rename to arch/arm/mach-s3c64xx/irq-uart.h
index a9331e4..4b29613 100644
--- a/arch/arm/plat-samsung/include/plat/irq-uart.h
+++ b/arch/arm/mach-s3c64xx/irq-uart.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/irq-uart.h
- *
+/*
  * Copyright (c) 2010 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
-- 
2.0.0
