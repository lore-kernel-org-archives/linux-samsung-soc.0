From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S5PV210: Add HSOTG support to SMDKV210
Date: Wed, 20 Jun 2012 14:23:28 +0900
Message-ID: <02a901cd4ea4$d2d52700$787f7500$%kim@samsung.com>
References: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
 <1337255655-10633-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62635 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029Ab2FTFXa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 01:23:30 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5W00JOMHJWN9K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 14:23:29 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5W005ASHN34I60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 14:23:29 +0900 (KST)
In-reply-to: <1337255655-10633-4-git-send-email-sachin.kamat@linaro.org>
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
>  arch/arm/mach-s5pv210/Kconfig         |    2 ++
>  arch/arm/mach-s5pv210/mach-smdkv210.c |    8 ++++++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
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
> index 91d4ad8..0041045 100644
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
> @@ -210,6 +211,9 @@ static struct s3c_fb_platdata smdkv210_lcd0_pdata
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
> @@ -223,6 +227,7 @@ static struct platform_device *smdkv210_devices[]
> __initdata = {
>  	&s3c_device_i2c2,
>  	&s3c_device_rtc,
>  	&s3c_device_ts,
> +	&s3c_device_usb_hsotg,
>  	&s3c_device_wdt,
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
> @@ -321,6 +326,9 @@ static void __init smdkv210_machine_init(void)
> 
>  	samsung_bl_set(&smdkv210_bl_gpio_info, &smdkv210_bl_data);
> 
> +	s3c_hsotg_set_platdata(&smdkv210_hsotg_pdata);
> +	clk_xusbxti.rate = 24000000;

Well, you need to fix following with this patch.

arch/arm/mach-s5pv210/mach-smdkv210.c: In function 'smdkv210_machine_init':
arch/arm/mach-s5pv210/mach-smdkv210.c:323: error: 'clk_xusbxti' undeclared
(first use in this function)
arch/arm/mach-s5pv210/mach-smdkv210.c:323: error: (Each undeclared
identifier is reported only once
arch/arm/mach-s5pv210/mach-smdkv210.c:323: error: for each function it
appears in.)
  AS      arch/arm/lib/backtrace.o
make[2]: *** [arch/arm/mach-s5pv210/mach-smdkv210.o] Error 1
make[1]: *** [arch/arm/mach-s5pv210] Error 2
make[1]: *** Waiting for unfinished jobs....

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
