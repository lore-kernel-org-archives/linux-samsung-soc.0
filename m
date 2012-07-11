From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/7] ARM: EXYNOS5: add machine specific support for backlight
Date: Wed, 11 Jul 2012 15:03:42 +0530
Message-ID: <CAK9yfHyJgZzqBcQrQ251_LSSj+iqPXZP4Nea5AvqkqB9SL0rWA@mail.gmail.com>
References: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
	<1341998681-1888-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:52682 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069Ab2GKJdm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 05:33:42 -0400
Received: by vcbf11 with SMTP id f11so610026vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jul 2012 02:33:42 -0700 (PDT)
In-Reply-To: <1341998681-1888-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, prashanth.g@samsung.com

On 11/07/2012, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> Adds machine specific support for LCD backlight for SMDK board based
> on Exynos5
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig           |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c |   28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 498596b..a2a2940 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -412,6 +412,7 @@ config MACH_EXYNOS5_DT
>  	select SOC_EXYNOS5250
>  	select USE_OF
>  	select ARM_AMBA
> +	select SAMSUNG_DEV_BACKLIGHT
>  	help
>  	  Machine support for Samsung Exynos4 machine with device tree enabled.
>  	  Select this if a fdt blob is available for the EXYNOS4 SoC based board.
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c
> b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 7b1e11a..0a200fd 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -11,6 +11,8 @@
>
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/pwm_backlight.h>
> +#include <linux/gpio.h>
>
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -18,9 +20,34 @@
>
>  #include <plat/cpu.h>
>  #include <plat/regs-serial.h>
> +#include <plat/backlight.h>
> +#include <plat/gpio-cfg.h>
>
>  #include "common.h"
>
> +
> +static int smdk5250_bl_notify(struct device *unused, int brightness)
> +{
> +	/* manage lcd_bl_en signal */
> +	if (brightness)
> +		gpio_set_value(EXYNOS5_GPX3(0), 1);
> +	else
> +		gpio_set_value(EXYNOS5_GPX3(0), 0);
> +
> +	return brightness;

Why do you need to return the brightness?


> +}
> +
> +/* LCD Backlight data */
> +static struct samsung_bl_gpio_info smdk5250_bl_gpio_info = {
> +	.no	= EXYNOS5_GPB2(0),
> +	.func	= S3C_GPIO_SFN(2),
> +};
> +
> +static struct platform_pwm_backlight_data smdk5250_bl_data = {
> +	.pwm_period_ns	= 1000000,
> +	.notify		= smdk5250_bl_notify,
> +};
> +
>  /*
>   * The following lookup table is used to override device names when
> devices
>   * are registered from device tree. This is temporarily added to enable
> @@ -61,6 +88,7 @@ static void __init exynos5250_dt_map_io(void)
>
>  static void __init exynos5250_dt_machine_init(void)
>  {
> +	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
>  	of_platform_populate(NULL, of_default_bus_match_table,
>  				exynos5250_auxdata_lookup, NULL);
>  }
> --
> 1.7.0.4
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
