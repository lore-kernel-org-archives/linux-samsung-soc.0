From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 4/4] N30: Use s3c_i2c0_set_platdata() to set I2C platform data
Date: Tue, 10 Nov 2009 23:21:56 +0000
Message-ID: <1257895316-9156-5-git-send-email-ben-linux@fluff.org>
References: <1257895316-9156-1-git-send-email-ben-linux@fluff.org>
 <1257895316-9156-2-git-send-email-ben-linux@fluff.org>
 <1257895316-9156-3-git-send-email-ben-linux@fluff.org>
 <1257895316-9156-4-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:51199 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758656AbZKJXVz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2009 18:21:55 -0500
In-Reply-To: <1257895316-9156-4-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

Fix mach-n30.c to use the s3c_i2c0_set_platdata() call to register the
platform data with the system to get rid of any reliance on having a real
device structure available in memory.

Since s3c_i2c0_set_platdata() copies the data, mark the original as
__initdata so it is thrown away.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-n30.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-n30.c b/arch/arm/mach-s3c2410/mach-n30.c
index 0f6ed61..0405712 100644
--- a/arch/arm/mach-s3c2410/mach-n30.c
+++ b/arch/arm/mach-s3c2410/mach-n30.c
@@ -338,7 +338,7 @@ static struct platform_device *n35_devices[] __initdata = {
 	&n35_button_device,
 };
 
-static struct s3c2410_platform_i2c n30_i2ccfg = {
+static struct s3c2410_platform_i2c __initdata n30_i2ccfg = {
 	.flags		= 0,
 	.slave_addr	= 0x10,
 	.frequency	= 10*1000,
@@ -500,8 +500,8 @@ static void __init n30_init_irq(void)
 static void __init n30_init(void)
 {
 	s3c24xx_fb_set_platdata(&n30_fb_info);
-	s3c_device_i2c0.dev.platform_data = &n30_i2ccfg;
 	s3c24xx_udc_set_platdata(&n30_udc_cfg);
+	s3c_i2c0_set_platdata(&n30_i2ccfg);
 
 	/* Turn off suspend on both USB ports, and switch the
 	 * selectable USB port to USB device mode. */
-- 
1.6.5
