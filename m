From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add DRM device to SMDK4X12 board
Date: Thu, 19 Jul 2012 15:39:45 +0900
Message-ID: <184101cd6579$48f7a5d0$dae6f170$%kim@samsung.com>
References: <1342501135-10341-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62853 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751717Ab2GSGjr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 02:39:47 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7E008LAAHOG1Q0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:39:46 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7E00KPUAI96IY0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:39:45 +0900 (KST)
In-reply-to: <1342501135-10341-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> DRM core device and FIMD DRM platform device support is added to
> SMDK4212 & SMDK4412 boards.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> This patch is based on for-next branch of Kukjin's tree.
> ---
>  arch/arm/mach-exynos/Kconfig         |    1 +
>  arch/arm/mach-exynos/mach-smdk4x12.c |   30
++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index e698ca0..b5b4c8c 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -375,6 +375,7 @@ config MACH_SMDK4212
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS_DEV_SYSMMU
>  	select EXYNOS_DEV_DMA
> +	select EXYNOS_DEV_DRM
>  	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_I2C3
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
> exynos/mach-smdk4x12.c
> index 2623f3b..30ed609 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -41,6 +41,7 @@
> 
>  #include <mach/map.h>
> 
> +#include <drm/exynos_drm.h>
>  #include "common.h"
> 
>  /* Following are default values for UCON, ULCON and UFCON UART registers
> */
> @@ -240,6 +241,26 @@ static struct samsung_keypad_platdata
> smdk4x12_keypad_data __initdata = {
>  	.cols		= 8,
>  };
> 
> +#ifdef CONFIG_DRM_EXYNOS
> +static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
> +	.panel	= {
> +		.timing	= {
> +			.left_margin	= 8,
> +			.right_margin	= 8,
> +			.upper_margin	= 6,
> +			.lower_margin	= 6,
> +			.hsync_len	= 6,
> +			.vsync_len	= 4,
> +			.xres		= 480,
> +			.yres		= 800,
> +		},
> +	},
> +	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
> +	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
> +	.default_win	= 0,
> +	.bpp		= 32,
> +};
> +#else
>  static struct s3c_fb_pd_win smdk4x12_fb_win0 = {
>  	.xres		= 480,
>  	.yres		= 800,
> @@ -267,6 +288,7 @@ static struct s3c_fb_platdata smdk4x12_lcd_pdata
> __initdata = {
>  	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
>  	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
>  };
> +#endif
> 
>  /* USB OTG */
>  static struct s3c_hsotg_plat smdk4x12_hsotg_pdata;
> @@ -290,6 +312,9 @@ static struct platform_device *smdk4x12_devices[]
> __initdata = {
>  	&s5p_device_mfc,
>  	&s5p_device_mfc_l,
>  	&s5p_device_mfc_r,
> +#ifdef CONFIG_DRM_EXYNOS
> +	&exynos_device_drm,
> +#endif
>  	&samsung_device_keypad,
>  };
> 
> @@ -334,7 +359,12 @@ static void __init smdk4x12_machine_init(void)
> 
>  	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
> 
> +#ifdef CONFIG_DRM_EXYNOS
> +	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
> +	exynos4_fimd0_gpio_setup_24bpp();
> +#else
>  	s5p_fimd0_set_platdata(&smdk4x12_lcd_pdata);
> +#endif
> 
>  	platform_add_devices(smdk4x12_devices,
> ARRAY_SIZE(smdk4x12_devices));
>  }
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
