From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 3/7] ARM: EXYNOS5: add machine specific support for LCD
Date: Wed, 11 Jul 2012 19:13:03 +0900
Message-ID: <001c01cd5f4d$c1e456a0$45ad03e0$%han@samsung.com>
References: <1341999741-15578-1-git-send-email-l.krishna@samsung.com>
 <1341999741-15578-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11414 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752603Ab2GKKNF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 06:13:05 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z00M4GR1NVN70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 19:13:04 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z00BUZR1RHA10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 19:13:03 +0900 (KST)
In-reply-to: <1341999741-15578-4-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, olofj@google.com, thomas.ab@samsung.com, kgene.kim@samsung.com, joshi@samsung.com

On July 11, 2012 6:42 PM, Leela Krishna Amudala <l.krishna@samsung.com> wrote:

> -----Original Message-----
> From: Leela Krishna Amudala [mailto:l.krishna@samsung.com]
> Sent: Wednesday, July 11, 2012 6:42 PM
> To: linux-arm-kernel@lists.infradead.org
> Cc: grant.likely@secretlab.ca; olofj@google.com; thomas.ab@samsung.com; kgene.kim@samsung.com;
> joshi@samsung.com; jg1.han@samsung.com
> Subject: [PATCH 3/7] ARM: EXYNOS5: add machine specific support for LCD
> 
> This patch adds machine specific support for LCD controller like setting power to LCD
> and adding LCD platform device.
> 
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos5-dt.c |   57 ++++++++++++++++++++++++++++++++
>  1 files changed, 57 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 0a200fd..652a537 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -13,6 +13,7 @@
>  #include <linux/serial_core.h>
>  #include <linux/pwm_backlight.h>
>  #include <linux/gpio.h>
> +#include <linux/delay.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -25,6 +26,8 @@
> 
>  #include "common.h"
> 
> +#include <video/platform_lcd.h>
> +

Delete this useless line.

> 
>  static int smdk5250_bl_notify(struct device *unused, int brightness)
>  {
> @@ -48,6 +51,55 @@ static struct platform_pwm_backlight_data smdk5250_bl_data = {
>  	.notify		= smdk5250_bl_notify,
>  };
> 
> +static void lcd_set_power(struct plat_lcd_data *pd,
> +			unsigned int power)
> +{
> +
> +	/* reset */
> +	gpio_request_one(EXYNOS5_GPX1(5), GPIOF_OUT_INIT_HIGH, "GPX1");
> +
> +	mdelay(20);
> +	if (power) {
> +		/* fire nRESET on power up */
> +		gpio_set_value(EXYNOS5_GPX1(5), 0);
> +		mdelay(20);
> +		gpio_set_value(EXYNOS5_GPX1(5), 1);
> +		mdelay(20);
> +		gpio_free(EXYNOS5_GPX1(5));
> +	} else {
> +		/* fire nRESET on power off */
> +		gpio_set_value(EXYNOS5_GPX1(5), 0);
> +		mdelay(20);
> +		gpio_set_value(EXYNOS5_GPX1(5), 1);
> +		mdelay(20);
> +		gpio_free(EXYNOS5_GPX1(5));
> +	}
> +	mdelay(20);
> +
> +	/*
> +	 * Request lcd_bl_en GPIO for smdk5250_bl_notify().
> +	 * TODO: Fix this so we are not at risk of requesting the GPIO
> +	 * multiple times, this should be done with device tree, and
> +	 * likely integrated into the plat-samsung/dev-backlight.c init.
> +	 */
> +	gpio_request_one(EXYNOS5_GPX3(0), GPIOF_OUT_INIT_LOW, "GPX3");
> +}
> +
> +static int smdk5250_match_fb(struct plat_lcd_data *pd, struct fb_info *info)
> +{
> +	/* Don't call .set_power callback while unblanking */
> +	return 0;
> +}
> +
> +static struct plat_lcd_data smdk5250_lcd_data = {
> +	.set_power	= lcd_set_power,
> +	.match_fb	= smdk5250_match_fb,
> +};
> +
> +static struct platform_device smdk5250_lcd = {
> +	.name			= "platform-lcd",
> +	.dev.platform_data	= &smdk5250_lcd_data,
> +};
>  /*
>   * The following lookup table is used to override device names when devices
>   * are registered from device tree. This is temporarily added to enable
> @@ -80,6 +132,10 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>  	{},
>  };
> 
> +static struct platform_device *smdk5250_devices[] __initdata = {
> +	&smdk5250_lcd, /* for platform_lcd device */
> +};
> +
>  static void __init exynos5250_dt_map_io(void)
>  {
>  	exynos_init_io(NULL, 0);
> @@ -91,6 +147,7 @@ static void __init exynos5250_dt_machine_init(void)
>  	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
>  	of_platform_populate(NULL, of_default_bus_match_table,
>  				exynos5250_auxdata_lookup, NULL);
> +	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
>  }
> 
>  static char const *exynos5250_dt_compat[] __initdata = {
> --
> 1.7.0.4
