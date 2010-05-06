From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 10/23] ARM: VR1000: Update mach-vr1000.c to use gpiolib API
Date: Fri,  7 May 2010 08:15:32 +0900
Message-ID: <1273187745-6566-11-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60627 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752746Ab0EFXQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:05 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change mach-vr1000.c to use gpiolib for gpio control.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-vr1000.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-vr1000.c b/arch/arm/mach-s3c2410/mach-vr1000.c
index 9051f0d..d540d79 100644
--- a/arch/arm/mach-s3c2410/mach-vr1000.c
+++ b/arch/arm/mach-s3c2410/mach-vr1000.c
@@ -357,8 +357,7 @@ static struct clk *vr1000_clocks[] __initdata = {
 
 static void vr1000_power_off(void)
 {
-	s3c2410_gpio_cfgpin(S3C2410_GPB(9), S3C2410_GPIO_OUTPUT);
-	s3c2410_gpio_setpin(S3C2410_GPB(9), 1);
+	gpio_direction_output(S3C2410_GPB(9), 1);
 }
 
 static void __init vr1000_map_io(void)
@@ -395,6 +394,8 @@ static void __init vr1000_init(void)
 
 	nor_simtec_init();
 	simtec_audio_add(NULL, true, NULL);
+
+	WARN_ON(gpio_request(S3C2410_GPB(9), "power off"));
 }
 
 MACHINE_START(VR1000, "Thorcom-VR1000")
-- 
1.7.0.4
