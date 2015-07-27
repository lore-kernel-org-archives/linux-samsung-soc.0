From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 07/12] ARM: SAMSUNG: local backlight header in mach-s3c64xx
Date: Mon, 27 Jul 2015 23:58:22 +0900
Message-ID: <014001d0c87c$aea4cc00$0bee6400$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37794 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753967AbbG0O6Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:58:24 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS502SUUIXAV530@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:58:22 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves backlight header file into mach-s3c64xx.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/backlight.h | 3 +--
 arch/arm/mach-s3c64xx/dev-backlight.c                            | 3 ++-
 arch/arm/mach-s3c64xx/mach-smdk6410.c                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c64xx}/backlight.h (92%)

diff --git a/arch/arm/plat-samsung/include/plat/backlight.h b/arch/arm/mach-s3c64xx/backlight.h
similarity index 92%
rename from arch/arm/plat-samsung/include/plat/backlight.h
rename to arch/arm/mach-s3c64xx/backlight.h
index ad530c7..8dcacac 100644
--- a/arch/arm/plat-samsung/include/plat/backlight.h
+++ b/arch/arm/mach-s3c64xx/backlight.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/include/plat/backlight.h
- *
+/*
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *              http://www.samsung.com
  *
diff --git a/arch/arm/mach-s3c64xx/dev-backlight.c b/arch/arm/mach-s3c64xx/dev-backlight.c
index 62f4648..38c323e 100644
--- a/arch/arm/mach-s3c64xx/dev-backlight.c
+++ b/arch/arm/mach-s3c64xx/dev-backlight.c
@@ -17,7 +17,8 @@
 
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
-#include <plat/backlight.h>
+
+#include "backlight.h"
 
 struct samsung_bl_drvdata {
 	struct platform_pwm_backlight_data plat_data;
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index b7447a9..d590b88 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -68,9 +68,9 @@
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <plat/keypad.h>
-#include <plat/backlight.h>
 #include <plat/samsung-time.h>
 
+#include "backlight.h"
 #include "common.h"
 #include "regs-modem.h"
 #include "regs-srom.h"
-- 
2.0.0
