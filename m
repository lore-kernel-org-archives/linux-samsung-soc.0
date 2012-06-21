From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH][Resend] ARM: S5PV210: Add HSOTG support to SMDKV210
Date: Thu, 21 Jun 2012 09:16:57 +0900
Message-ID: <037b01cd4f43$2b5200d0$81f60270$%kim@samsung.com>
References: <1340170132-30136-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29430 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932417Ab2FUARD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 20:17:03 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5X008VKY42HR50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:17:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5X009LXY49IX00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 09:17:00 +0900 (KST)
In-reply-to: <1340170132-30136-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Adds S3C-HSOTG support to SMDKV210 board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Based on Kukjin's tree - v3.5-for-usb-2 branch
> ---
>  arch/arm/mach-s5pv210/Kconfig         |    2 ++
>  arch/arm/mach-s5pv210/mach-smdkv210.c |    9 +++++++++
>  2 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 88e983b..77185c3 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -152,6 +152,7 @@ config MACH_SMDKV210
>  	select S3C_DEV_I2C1
>  	select S3C_DEV_I2C2
>  	select S3C_DEV_RTC
> +	select S3C_DEV_USB_HSOTG
>  	select S3C_DEV_WDT
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> @@ -170,6 +171,7 @@ config MACH_SMDKV210
>  	select S5PV210_SETUP_IDE
>  	select S5PV210_SETUP_KEYPAD
>  	select S5PV210_SETUP_SDHCI
> +	select S5PV210_SETUP_USB_PHY
>  	help
>  	  Machine support for Samsung SMDKV210
> 
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-
> s5pv210/mach-smdkv210.c
> index 91d4ad8..c7a6e49 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -19,6 +19,7 @@
>  #include <linux/gpio.h>
>  #include <linux/delay.h>
>  #include <linux/pwm_backlight.h>
> +#include <linux/platform_data/s3c-hsotg.h>
> 
>  #include <asm/hardware/vic.h>
>  #include <asm/mach/arch.h>
> @@ -47,6 +48,7 @@
>  #include <plat/backlight.h>
>  #include <plat/regs-fb-v4.h>
>  #include <plat/mfc.h>
> +#include <plat/clock.h>
> 
>  #include "common.h"
> 
> @@ -210,6 +212,9 @@ static struct s3c_fb_platdata smdkv210_lcd0_pdata
> __initdata = {
>  	.setup_gpio	= s5pv210_fb_gpio_setup_24bpp,
>  };
> 
> +/* USB OTG */
> +static struct s3c_hsotg_plat smdkv210_hsotg_pdata;
> +
>  static struct platform_device *smdkv210_devices[] __initdata = {
>  	&s3c_device_adc,
>  	&s3c_device_cfcon,
> @@ -223,6 +228,7 @@ static struct platform_device *smdkv210_devices[]
> __initdata = {
>  	&s3c_device_i2c2,
>  	&s3c_device_rtc,
>  	&s3c_device_ts,
> +	&s3c_device_usb_hsotg,
>  	&s3c_device_wdt,
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
> @@ -321,6 +327,9 @@ static void __init smdkv210_machine_init(void)
> 
>  	samsung_bl_set(&smdkv210_bl_gpio_info, &smdkv210_bl_data);
> 
> +	s3c_hsotg_set_platdata(&smdkv210_hsotg_pdata);
> +	clk_xusbxti.rate = 24000000;
> +
>  	platform_add_devices(smdkv210_devices,
> ARRAY_SIZE(smdkv210_devices));
>  }
> 
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
