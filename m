From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/3] ARM: Exynos: Add DRM core support for NURI board
Date: Tue, 13 Mar 2012 10:05:46 +0530
Message-ID: <CAK9yfHznrJeBWmA167tfBbxawEmPypsjhQ56c9=ppiCXLC9ZNQ@mail.gmail.com>
References: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
	<1331291105-18152-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:63962 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930Ab2CMEfq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 00:35:46 -0400
Received: by ghrr11 with SMTP id r11so137661ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 21:35:46 -0700 (PDT)
In-Reply-To: <1331291105-18152-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Marek,

On 09/03/2012, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Add core DRM device and alternative platform device data for FIMD DRM
> subdriver. Based on the initial patch by Joonyoung Shim
> <jy0922.shim@samsung.com>
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig     |    1 +
>  arch/arm/mach-exynos/mach-nuri.c |   31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index c73eeba..e996b5d 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -293,6 +293,7 @@ config MACH_NURI
>  	select S5P_DEV_USB_EHCI
>  	select S5P_SETUP_MIPIPHY
>  	select EXYNOS4_DEV_DMA
> +	select EXYNOS_DEV_DRM
>  	select EXYNOS4_SETUP_FIMC
>  	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_I2C1
> diff --git a/arch/arm/mach-exynos/mach-nuri.c
> b/arch/arm/mach-exynos/mach-nuri.c
> index a6b9162..682203a 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -25,6 +25,7 @@
>  #include <linux/mmc/host.h>
>  #include <linux/fb.h>
>  #include <linux/pwm_backlight.h>
> +#include <drm/exynos_drm.h>
>
>  #include <video/platform_lcd.h>
>  #include <media/m5mols.h>
> @@ -210,6 +211,27 @@ static struct platform_device nuri_gpio_keys = {
>  	},
>  };
>
> +#ifdef CONFIG_DRM_EXYNOS
> +static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
> +	.timing	= {
> +		.xres		= 1024,
> +		.yres		= 600,
> +		.hsync_len	= 40,
> +		.left_margin	= 79,
> +		.right_margin	= 200,
> +		.vsync_len	= 10,
> +		.upper_margin	= 10,
> +		.lower_margin	= 11,
> +		.refresh	= 60,
> +	},

Same comment as given for the previous patch [2/3] in this series.

> +	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB |
> +			  VIDCON0_CLKSEL_LCD,
> +	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
> +	.default_win	= 3,
> +	.bpp		= 32,
> +};
> +
> +#else
>  /* Frame Buffer */
>  static struct s3c_fb_pd_win nuri_fb_win0 = {
>  	.win_mode = {
> @@ -236,6 +258,7 @@ static struct s3c_fb_platdata nuri_fb_pdata __initdata =
> {
>  	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
>  	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
>  };
> +#endif
>
>  static void nuri_lcd_power_on(struct plat_lcd_data *pd, unsigned int power)
>  {
> @@ -1335,6 +1358,9 @@ static struct platform_device *nuri_devices[]
> __initdata = {
>  	&cam_vt_cam15_fixed_rdev,
>  	&cam_vdda_fixed_rdev,
>  	&cam_8m_12v_fixed_rdev,
> +#ifdef CONFIG_DRM_EXYNOS
> +	&exynos_device_drm,
> +#endif
>  };
>
>  static void __init nuri_map_io(void)
> @@ -1366,7 +1392,12 @@ static void __init nuri_machine_init(void)
>  	i2c_register_board_info(9, i2c9_devs, ARRAY_SIZE(i2c9_devs));
>  	s3c_i2c6_set_platdata(&nuri_i2c6_platdata);
>
> +#ifdef CONFIG_DRM_EXYNOS
> +	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
> +	exynos4_fimd0_gpio_setup_24bpp();
> +#else
>  	s5p_fimd0_set_platdata(&nuri_fb_pdata);
> +#endif
>
>  	nuri_camera_init();
>
> --
> 1.7.1.569.g6f426
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
With warm regards,
Sachin
