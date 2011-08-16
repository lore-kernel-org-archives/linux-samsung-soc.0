From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH] ARM: S3C64XX: Remove un-used code
Date: Tue, 16 Aug 2011 18:11:28 +0530
Message-ID: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65320 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550Ab1HPMlA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Aug 2011 08:41:00 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ0002KSTVZEI70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Aug 2011 21:40:58 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ000BTOTW754@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Aug 2011 21:40:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Banajit Goswami <banajit.g@samsung.com>

Remove un-used backlight code for SMDK6410 board

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/mach-s3c64xx/mach-smdk6410.c |   39 ---------------------------------
 1 files changed, 0 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index ecbea92..a9f3183 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -262,45 +262,6 @@ static struct samsung_keypad_platdata smdk6410_keypad_data __initdata = {
 	.cols		= 8,
 };
 
-static int smdk6410_backlight_init(struct device *dev)
-{
-	int ret;
-
-	ret = gpio_request(S3C64XX_GPF(15), "Backlight");
-	if (ret) {
-		printk(KERN_ERR "failed to request GPF for PWM-OUT1\n");
-		return ret;
-	}
-
-	/* Configure GPIO pin with S3C64XX_GPF15_PWM_TOUT1 */
-	s3c_gpio_cfgpin(S3C64XX_GPF(15), S3C_GPIO_SFN(2));
-
-	return 0;
-}
-
-static void smdk6410_backlight_exit(struct device *dev)
-{
-	s3c_gpio_cfgpin(S3C64XX_GPF(15), S3C_GPIO_OUTPUT);
-	gpio_free(S3C64XX_GPF(15));
-}
-
-static struct platform_pwm_backlight_data smdk6410_backlight_data = {
-	.pwm_id		= 1,
-	.max_brightness	= 255,
-	.dft_brightness	= 255,
-	.pwm_period_ns	= 78770,
-	.init		= smdk6410_backlight_init,
-	.exit		= smdk6410_backlight_exit,
-};
-
-static struct platform_device smdk6410_backlight_device = {
-	.name		= "pwm-backlight",
-	.dev		= {
-		.parent		= &s3c_device_timer[1].dev,
-		.platform_data	= &smdk6410_backlight_data,
-	},
-};
-
 static struct map_desc smdk6410_iodesc[] = {};
 
 static struct platform_device *smdk6410_devices[] __initdata = {
-- 
1.7.2.3
