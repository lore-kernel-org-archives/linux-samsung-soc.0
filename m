From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add framebuffer support for SMDK4X12
Date: Fri, 13 Jul 2012 20:28:40 +0900
Message-ID: <118001cd60ea$a73a9320$f5afb960$%kim@samsung.com>
References: <1339493030-1354-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33098 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab2GML2n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 07:28:43 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M730044QJVSIUQ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:42 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M73002D3JVTEH80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:41 +0900 (KST)
In-reply-to: <1339493030-1354-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> This patch adds framebuffer support to SMDK4212 and SMDK4412 boards.
> A framebuffer window of 480x800x24bpp is defined.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/Kconfig         |    2 ++
>  arch/arm/mach-exynos/mach-smdk4x12.c |   34
> ++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 573be57..96f898a 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -365,12 +365,14 @@ config MACH_SMDK4212
>  	select S5P_DEV_FIMC1
>  	select S5P_DEV_FIMC2
>  	select S5P_DEV_FIMC3
> +	select S5P_DEV_FIMD0
>  	select S5P_DEV_MFC
>  	select SAMSUNG_DEV_BACKLIGHT
>  	select SAMSUNG_DEV_KEYPAD
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS_DEV_SYSMMU
>  	select EXYNOS_DEV_DMA
> +	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_I2C3
>  	select EXYNOS4_SETUP_I2C7
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
> exynos/mach-smdk4x12.c
> index fb09c70..c4f4060 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -13,6 +13,7 @@
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/io.h>
> +#include <linux/lcd.h>
>  #include <linux/mfd/max8997.h>
>  #include <linux/mmc/host.h>
>  #include <linux/platform_device.h>
> @@ -28,10 +29,12 @@
>  #include <plat/clock.h>
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
> +#include <plat/fb.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/iic.h>
>  #include <plat/keypad.h>
>  #include <plat/mfc.h>
> +#include <plat/regs-fb.h>
>  #include <plat/regs-serial.h>
>  #include <plat/sdhci.h>
> 
> @@ -234,6 +237,34 @@ static struct samsung_keypad_platdata
> smdk4x12_keypad_data __initdata = {
>  	.cols		= 5,
>  };
> 
> +static struct s3c_fb_pd_win smdk4x12_fb_win0 = {
> +	.xres		= 480,
> +	.yres		= 800,
> +	.virtual_x	= 480,
> +	.virtual_y	= 800 * 2,
> +	.max_bpp	= 32,
> +	.default_bpp	= 24,
> +};
> +
> +static struct fb_videomode smdk4x12_lcd_timing = {
> +	.left_margin	= 8,
> +	.right_margin	= 8,
> +	.upper_margin	= 6,
> +	.lower_margin	= 6,
> +	.hsync_len	= 6,
> +	.vsync_len	= 4,
> +	.xres		= 480,
> +	.yres		= 800,
> +};
> +
> +static struct s3c_fb_platdata smdk4x12_lcd_pdata __initdata = {
> +	.win[0]		= &smdk4x12_fb_win0,
> +	.vtiming	= &smdk4x12_lcd_timing,
> +	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
> +	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
> +	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
> +};
> +
>  static struct platform_device *smdk4x12_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc3,
> @@ -248,6 +279,7 @@ static struct platform_device *smdk4x12_devices[]
> __initdata = {
>  	&s5p_device_fimc2,
>  	&s5p_device_fimc3,
>  	&s5p_device_fimc_md,
> +	&s5p_device_fimd0,
>  	&s5p_device_mfc,
>  	&s5p_device_mfc_l,
>  	&s5p_device_mfc_r,
> @@ -293,6 +325,8 @@ static void __init smdk4x12_machine_init(void)
>  	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
>  	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
> 
> +	s5p_fimd0_set_platdata(&smdk4x12_lcd_pdata);
> +
>  	platform_add_devices(smdk4x12_devices,
> ARRAY_SIZE(smdk4x12_devices));
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
