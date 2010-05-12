From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 14/15] ARM: S3C2413: Update GPIO pull-up support
Date: Wed, 12 May 2010 03:36:05 +0100
Message-ID: <1273631766-15693-14-git-send-email-ben-linux@fluff.org>
References: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60957 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752350Ab0ELCgI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 May 2010 22:36:08 -0400
In-Reply-To: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Ensure the right get/set pull code is selected and assigned to the GPIO
core.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2416/Kconfig   |    1 +
 arch/arm/mach-s3c2416/s3c2416.c |    7 +++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/Kconfig b/arch/arm/mach-s3c2416/Kconfig
index a1308d4..6d077b2 100644
--- a/arch/arm/mach-s3c2416/Kconfig
+++ b/arch/arm/mach-s3c2416/Kconfig
@@ -10,6 +10,7 @@ config CPU_S3C2416
 	select CPU_ARM926T
 	select S3C2416_DMA if S3C2410_DMA
 	select CPU_LLSERIAL_S3C2440
+	select S3C_GPIO_PULL_UPDOWN
 	select SAMSUNG_CLKSRC
 	select S3C2443_CLOCK
 	help
diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-s3c2416/s3c2416.c
index ad5a63a..3bff057 100644
--- a/arch/arm/mach-s3c2416/s3c2416.c
+++ b/arch/arm/mach-s3c2416/s3c2416.c
@@ -28,6 +28,7 @@
 #include <linux/list.h>
 #include <linux/timer.h>
 #include <linux/init.h>
+#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/sysdev.h>
@@ -46,6 +47,9 @@
 #include <mach/idle.h>
 #include <mach/regs-s3c2443-clock.h>
 
+#include <plat/gpio-core.h>
+#include <plat/gpio-cfg.h>
+#include <plat/gpio-cfg-helpers.h>
 #include <plat/s3c2416.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -104,6 +108,9 @@ void __init s3c2416_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 
 void __init s3c2416_map_io(void)
 {
+	s3c24xx_gpiocfg_default.set_pull = s3c_gpio_setpull_updown;
+	s3c24xx_gpiocfg_default.get_pull = s3c_gpio_getpull_updown;
+
 	iotable_init(s3c2416_iodesc, ARRAY_SIZE(s3c2416_iodesc));
 }
 
-- 
1.6.3.3
