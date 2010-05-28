From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 4/9] ARM: SAMSUNG: Default s3c_device_i2c0 to s3c2440-i2c
Date: Fri, 28 May 2010 07:19:14 +0100
Message-ID: <1275027559-29278-5-git-send-email-ben-linux@fluff.org>
References: <1275027559-29278-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:42359 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752645Ab0E1GTW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 May 2010 02:19:22 -0400
In-Reply-To: <1275027559-29278-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The bulk of the SoCs implement the s3c2440-i2c variant of this
block, so change the default name to s3c2440-i2c and rename the
cases where it is s3c2410.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/s3c2410.c  |    3 +++
 arch/arm/mach-s3c2412/s3c2412.c  |    3 +++
 arch/arm/plat-samsung/dev-i2c0.c |    3 ++-
 3 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c2410/s3c2410.c b/arch/arm/mach-s3c2410/s3c2410.c
index adc90a3..a4f23e7 100644
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -40,6 +40,7 @@
 #include <plat/devs.h>
 #include <plat/clock.h>
 #include <plat/pll.h>
+#include <plat/iic-core.h>
 
 #include <plat/gpio-core.h>
 #include <plat/gpio-cfg.h>
@@ -70,6 +71,8 @@ void __init s3c2410_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 
 void __init s3c2410_map_io(void)
 {
+	s3c_i2c0_setname("s3c2410-i2c");
+
 	s3c24xx_gpiocfg_default.set_pull = s3c_gpio_setpull_1up;
 	s3c24xx_gpiocfg_default.get_pull = s3c_gpio_getpull_1up;
 
diff --git a/arch/arm/mach-s3c2412/s3c2412.c b/arch/arm/mach-s3c2412/s3c2412.c
index bef39f7..d16d72b 100644
--- a/arch/arm/mach-s3c2412/s3c2412.c
+++ b/arch/arm/mach-s3c2412/s3c2412.c
@@ -46,6 +46,7 @@
 #include <mach/regs-s3c2412.h>
 
 #include <plat/s3c2412.h>
+#include <plat/iic-core.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/clock.h>
@@ -94,6 +95,8 @@ void __init s3c2412_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 	s3c_device_lcd.name  = "s3c2412-lcd";
 	s3c_device_nand.name = "s3c2412-nand";
 
+	s3c_i2c0_setname("s3c2410-i2c");
+
 	/* alter IRQ of SDI controller */
 
 	s3c_device_sdi.resource[1].start = IRQ_S3C2412_SDI;
diff --git a/arch/arm/plat-samsung/dev-i2c0.c b/arch/arm/plat-samsung/dev-i2c0.c
index 3a601c1..1ec1ef9 100644
--- a/arch/arm/plat-samsung/dev-i2c0.c
+++ b/arch/arm/plat-samsung/dev-i2c0.c
@@ -38,7 +38,8 @@ static struct resource s3c_i2c_resource[] = {
 };
 
 struct platform_device s3c_device_i2c0 = {
-	.name		  = "s3c2410-i2c",
+	/* default to s3c2440-i2c, most common implementation */
+	.name		  = "s3c2440-i2c",
 #ifdef CONFIG_S3C_DEV_I2C1
 	.id		  = 0,
 #else
-- 
1.6.3.3
