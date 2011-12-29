From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Fix the memory mapped GPIOs on
 Cragganmore
Date: Thu, 29 Dec 2011 13:00:04 +0900
Message-ID: <029301ccc5de$58557970$09006c50$%kim@samsung.com>
References: <1325121813-2066-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55698 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149Ab1L2EAH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 23:00:07 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY007UN5S0IN50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 13:00:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00DIP5S4Y230@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 13:00:05 +0900 (KST)
In-reply-to: <1325121813-2066-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Rather than letting them get allocated dynamically where we don't know
> where they are, and also name the data line resource as gpio-generic
> requires that.  Without these changes the GPIOs are useless.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/include/mach/crag6410.h |    1 +
>  arch/arm/mach-s3c64xx/mach-crag6410.c         |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> index 5d55ab0..4cb2f951 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> @@ -21,5 +21,6 @@
>  #define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
>  #define GLENFARCLAS_PMIC_GPIO_BASE	(GPIO_BOARD_START + 32)
>  #define BANFF_PMIC_GPIO_BASE		(GPIO_BOARD_START + 64)
> +#define MMGPIO_GPIO_BASE		(GPIO_BOARD_START + 96)
> 
>  #endif
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-
> s3c64xx/mach-crag6410.c
> index 2e699b9..d0308f0 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> @@ -261,6 +261,7 @@ static struct platform_device crag6410_dm9k_device = {
> 
>  static struct resource crag6410_mmgpio_resource[] = {
>  	[0] = {
> +		.name	= "dat",
>  		.start	= S3C64XX_PA_XM0CSN4 + 1,
>  		.end	= S3C64XX_PA_XM0CSN4 + 1,
>  		.flags	= IORESOURCE_MEM,
> @@ -273,7 +274,7 @@ static struct platform_device crag6410_mmgpio = {
>  	.resource	= crag6410_mmgpio_resource,
>  	.num_resources	= ARRAY_SIZE(crag6410_mmgpio_resource),
>  	.dev.platform_data = &(struct bgpio_pdata) {
> -		.base	= -1,
> +		.base	= MMGPIO_GPIO_BASE,
>  	},
>  };
> 
> --
> 1.7.7.3

Looks ok to me, will apply.

And Mark, how about using DEFINE_RES_XXX() like following?

---
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c
b/arch/arm/mach-s3c64xx/mach-crag6410.c
index d04b654..2dadf92 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -17,6 +17,8 @@
 #include <linux/platform_device.h>
 #include <linux/fb.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
+
 #include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/delay.h>
@@ -225,21 +227,9 @@ static struct platform_device crag6410_gpio_keydev = {
 };
 
 static struct resource crag6410_dm9k_resource[] = {
-	[0] = {
-		.start	= S3C64XX_PA_XM0CSN5,
-		.end	= S3C64XX_PA_XM0CSN5 + 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= S3C64XX_PA_XM0CSN5 + (1 << 8),
-		.end	= S3C64XX_PA_XM0CSN5 + (1 << 8) + 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[2] = {
-		.start	= S3C_EINT(17),
-		.end	= S3C_EINT(17),
-		.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHLEVEL,
-	},
+	[0] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5, 2),
+	[1] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5 + (1 << 8), 2),
+	[2] = DEFINE_RES_NAMED(S3C_EINT(17), 1, NULL, IORESOURCE_IRQ |
IRQRESOURCE_IRQ_HIGHLEVEL),
 };
 
 static struct dm9000_plat_data mini6410_dm9k_pdata = {
@@ -255,11 +245,7 @@ static struct platform_device crag6410_dm9k_device = {
 };
 
 static struct resource crag6410_mmgpio_resource[] = {
-	[0] = {
-		.start	= S3C64XX_PA_XM0CSN4 + 1,
-		.end	= S3C64XX_PA_XM0CSN4 + 1,
-		.flags	= IORESOURCE_MEM,
-	},
+	[0] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN4, 2),
 };
 
 static struct platform_device crag6410_mmgpio = {
---

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
