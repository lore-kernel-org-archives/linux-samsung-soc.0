From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2 4/7] ARM: EXYNOS: Adding DRM platform device
Date: Fri, 20 Jul 2012 16:33:52 +0900
Message-ID: <500909E0.5070608@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-5-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32063 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752479Ab2GTHdz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jul 2012 03:33:55 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7G00J5H7NRH8T0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 16:33:43 +0900 (KST)
Received: from [10.90.51.60] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7G00I2Q7O6XCP0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 16:33:43 +0900 (KST)
In-reply-to: <1342591053-7092-5-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com, joshi@samsung.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, olofj@google.com

On 07/18/2012 02:57 PM, Leela Krishna Amudala wrote:
> Add DRM platform device to machine file for exynos5.
>
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>   arch/arm/mach-exynos/mach-exynos5-dt.c |   27 +++++++++++++++++++++++++++
>   1 files changed, 27 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 02a0e68..99f2b24 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -17,6 +17,7 @@
>   
>   #include <asm/mach/arch.h>
>   #include <asm/hardware/gic.h>
> +#include <asm/io.h>
>   #include <mach/map.h>
>   
>   #include <plat/cpu.h>
> @@ -27,6 +28,22 @@
>   #include "common.h"
>   #include <video/platform_lcd.h>
>   
> +static void exynos_fimd_gpio_setup_24bpp(void)

The function name is wrong, this function doesn't control gpios.

> +{
> +	unsigned int reg = 0;
> +	/*
> +	 * Set DISP1BLK_CFG register for Display path selection
> +	 * FIMD of DISP1_BLK Bypass selection : DISP1BLK_CFG[15]
> +	 * ---------------------
> +	 * 0 | MIE/MDNIE
> +	 * 1 | FIMD : selected
> +	 */
> +	reg = __raw_readl(S3C_VA_SYS + 0x0214);
> +	reg &= ~(1 << 15);      /* To save other reset values */
> +	reg |= (1 << 15);
> +	__raw_writel(reg, S3C_VA_SYS + 0x0214);
> +}

If needs this, move to arch/arm/mach-exynos/setup-fimd0.c

> +
>   static int smdk5250_bl_notify(struct device *unused, int brightness)
>   {
>   	/* manage lcd_bl_en signal */
> @@ -49,6 +66,14 @@ static struct platform_pwm_backlight_data smdk5250_bl_data = {
>   	.notify		= smdk5250_bl_notify,
>   };
>   
> +static struct platform_device exynos_drm_device = {
> +	.name		= "exynos-drm",
> +	.dev = {
> +		.dma_mask = &exynos_drm_device.dev.coherent_dma_mask,
> +		.coherent_dma_mask = 0xffffffffUL,
> +	}
> +};
> +

There is already exynos-drm device at the arch/arm/mach-exynos/dev-drm.c

>   static void lcd_set_power(struct plat_lcd_data *pd,
>   			unsigned int power)
>   {
> @@ -138,6 +163,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>   
>   static struct platform_device *smdk5250_devices[] __initdata = {
>   	&smdk5250_lcd, /* for platform_lcd device */
> +	&exynos_drm_device,
>   };
>   
>   static void __init exynos5250_dt_map_io(void)
> @@ -151,6 +177,7 @@ static void __init exynos5250_dt_machine_init(void)
>   	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
>   	of_platform_populate(NULL, of_default_bus_match_table,
>   				exynos5250_auxdata_lookup, NULL);
> +	exynos_fimd_gpio_setup_24bpp();
>   	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
>   }
>   

Thanks.
