From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 12/15] ARM: S3C2416: Add support for OHCI on SMDK2416
Date: Wed, 12 May 2010 03:36:03 +0100
Message-ID: <1273631766-15693-12-git-send-email-ben-linux@fluff.org>
References: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60954 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752200Ab0ELCgI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 May 2010 22:36:08 -0400
In-Reply-To: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add device definition and ensure that the host port is powered up
at start time. Full power control can be added at a later date.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2416/mach-smdk2416.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/mach-smdk2416.c b/arch/arm/mach-s3c2416/mach-smdk2416.c
index a51973c..99d24c4 100644
--- a/arch/arm/mach-s3c2416/mach-smdk2416.c
+++ b/arch/arm/mach-s3c2416/mach-smdk2416.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
+#include <linux/gpio.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -110,6 +111,7 @@ static struct s3c2410_uartcfg smdk2416_uartcfgs[] __initdata = {
 
 static struct platform_device *smdk2416_devices[] __initdata = {
 	&s3c_device_wdt,
+	&s3c_device_ohci,
 	&s3c_device_i2c0,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
@@ -128,6 +130,9 @@ static void __init smdk2416_machine_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
 
+	gpio_request(S3C2410_GPB(4), "USBHost Power");
+	gpio_direction_output(S3C2410_GPB(4), 1);
+
 	platform_add_devices(smdk2416_devices, ARRAY_SIZE(smdk2416_devices));
 	smdk_machine_init();
 }
-- 
1.6.3.3
