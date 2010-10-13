From: Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/4] ARM: S3C2416: Add support for USB 2.0 High-Speed gadget controller
Date: Wed, 13 Oct 2010 09:10:27 +0900
Message-ID: <1286928627-22824-5-git-send-email-sbkim73@samsung.com>
References: <1286928627-22824-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1286928627-22824-1-git-send-email-sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Add support for USB 2.0 High-Speed gadget controller driver for Samsung's
S3C2416 processor.

Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-s3c2416/mach-smdk2416.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/mach-smdk2416.c b/arch/arm/mach-s3c2416/mach-smdk2416.c
index 5fc3f67..429e720 100644
--- a/arch/arm/mach-s3c2416/mach-smdk2416.c
+++ b/arch/arm/mach-s3c2416/mach-smdk2416.c
@@ -23,6 +23,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/gpio.h>
 #include <linux/fb.h>
+#include <linux/delay.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -35,6 +36,7 @@
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
+#include <mach/regs-s3c2443-clock.h>
 
 #include <mach/idle.h>
 #include <mach/leds-gpio.h>
@@ -46,6 +48,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/nand.h>
+#include <plat/udc.h>

 #include <plat/regs-fb-v4.h>
 #include <plat/fb.h>
@@ -113,6 +116,27 @@ static struct s3c2410_uartcfg smdk2416_uartcfgs[] __initdata = {
 	}
 };
 
+void smdk2416_hsudc_gpio_init(void)
+{
+	s3c_gpio_setpull(S3C2410_GPH(14), S3C_GPIO_PULL_UP);
+	s3c_gpio_setpull(S3C2410_GPF(2), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgpin(S3C2410_GPH(14), S3C_GPIO_SFN(1));
+	s3c2410_modify_misccr(S3C2416_MISCCR_SEL_SUSPND, 0);
+}
+
+void smdk2416_hsudc_gpio_uninit(void)
+{
+	s3c2410_modify_misccr(S3C2416_MISCCR_SEL_SUSPND, 1);
+	s3c_gpio_setpull(S3C2410_GPH(14), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgpin(S3C2410_GPH(14), S3C_GPIO_SFN(0));
+}
+
+struct s3c24xx_hsudc_platdata smdk2416_hsudc_platdata = {
+	.epnum = 9,
+	.gpio_init = smdk2416_hsudc_gpio_init,
+	.gpio_uninit = smdk2416_hsudc_gpio_uninit,
+};
+
 struct s3c_fb_pd_win smdk2416_fb_win[] = {
 	[0] = {
 		/* think this is the same as the smdk6410 */
@@ -166,6 +190,7 @@ static struct platform_device *smdk2416_devices[] __initdata = {
 	&s3c_device_i2c0,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
+	&s3c_device_usb_hsudc,
 };
 
 static void __init smdk2416_map_io(void)
@@ -180,6 +205,8 @@ static void __init smdk2416_machine_init(void)
 	s3c_i2c0_set_platdata(NULL);
 	s3c_fb_set_platdata(&smdk2416_fb_platdata);
 
+	s3c24xx_hsudc_set_platdata(&smdk2416_hsudc_platdata);
+
 	gpio_request(S3C2410_GPB(4), "USBHost Power");
 	gpio_direction_output(S3C2410_GPB(4), 1);
 
-- 
1.6.6.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
