From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/4] ARM: S5P64X0: Rename GPIOlib file to gpiolib.c
Date: Thu, 25 Nov 2010 14:30:17 +0900
Message-ID: <1290663017-9350-5-git-send-email-kgene.kim@samsung.com>
References: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58867 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984Ab0KYFlg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 00:41:36 -0500
In-Reply-To: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch renames S5P64X0 GPIOlib file according to other S5P SoCs.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/Makefile              |    2 +-
 arch/arm/mach-s5p64x0/{gpio.c => gpiolib.c} |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/mach-s5p64x0/{gpio.c => gpiolib.c} (99%)

diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makefile
index 835d51b..ae6bf6f 100644
--- a/arch/arm/mach-s5p64x0/Makefile
+++ b/arch/arm/mach-s5p64x0/Makefile
@@ -12,7 +12,7 @@ obj-				:=
 
 # Core support for S5P64X0 system
 
-obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o gpio.o
+obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o gpiolib.o
 obj-$(CONFIG_ARCH_S5P64X0)	+= setup-i2c0.o
 obj-$(CONFIG_CPU_S5P6440)	+= clock-s5p6440.o
 obj-$(CONFIG_CPU_S5P6450)	+= clock-s5p6450.o
diff --git a/arch/arm/mach-s5p64x0/gpio.c b/arch/arm/mach-s5p64x0/gpiolib.c
similarity index 99%
rename from arch/arm/mach-s5p64x0/gpio.c
rename to arch/arm/mach-s5p64x0/gpiolib.c
index 0670fcc..072668a 100644
--- a/arch/arm/mach-s5p64x0/gpio.c
+++ b/arch/arm/mach-s5p64x0/gpiolib.c
@@ -1,4 +1,4 @@
-/* linux/arch/arm/mach-s5p64x0/gpio.c
+/* linux/arch/arm/mach-s5p64x0/gpiolib.c
  *
  * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
-- 
1.6.2.5
