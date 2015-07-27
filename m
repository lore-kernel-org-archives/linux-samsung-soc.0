From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 09/12] ARM: SAMSUNG: local keypad header in mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:44 +0900
Message-ID: <014201d0c87c$bbc9d150$335d73f0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56891 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831AbbG0O6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS5027FWIXXUMC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:45 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves keypad header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/keypad.h | 0
 arch/arm/mach-s3c64xx/mach-crag6410.c                         | 2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c                         | 2 +-
 arch/arm/mach-s3c64xx/setup-keypad.c                          | 3 ++-
 4 files changed, 4 insertions(+), 3 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/keypad.h (100%)

diff --git a/arch/arm/plat-samsung/include/plat/keypad.h b/arch/arm/mach-s3c64xx/keypad.h
similarity index 100%
rename from arch/arm/plat-samsung/include/plat/keypad.h
rename to arch/arm/mach-s3c64xx/keypad.h
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 65c426b..098c144 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -57,7 +57,6 @@
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/spi-s3c64xx.h>
 
-#include <plat/keypad.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/adc.h>
@@ -67,6 +66,7 @@
 
 #include "common.h"
 #include "crag6410.h"
+#include "keypad.h"
 #include "regs-gpio-memport.h"
 #include "regs-modem.h"
 #include "regs-sys.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index d590b88..4bb8b8b 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -67,11 +67,11 @@
 #include <plat/cpu.h>
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
-#include <plat/keypad.h>
 #include <plat/samsung-time.h>
 
 #include "backlight.h"
 #include "common.h"
+#include "keypad.h"
 #include "regs-modem.h"
 #include "regs-srom.h"
 #include "regs-sys.h"
diff --git a/arch/arm/mach-s3c64xx/setup-keypad.c b/arch/arm/mach-s3c64xx/setup-keypad.c
index 6ad9a89..128a803 100644
--- a/arch/arm/mach-s3c64xx/setup-keypad.c
+++ b/arch/arm/mach-s3c64xx/setup-keypad.c
@@ -12,9 +12,10 @@
 
 #include <linux/gpio.h>
 #include <plat/gpio-cfg.h>
-#include <plat/keypad.h>
 #include <mach/gpio-samsung.h>
 
+#include "keypad.h"
+
 void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols)
 {
 	/* Set all the necessary GPK pins to special-function 3: KP_ROW[x] */
-- 
2.0.0
