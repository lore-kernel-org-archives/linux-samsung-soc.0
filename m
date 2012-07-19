From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add leds status1 and status2 on Origen board
Date: Thu, 19 Jul 2012 15:44:00 +0900
Message-ID: <184301cd6579$e102d5c0$a3088140$%kim@samsung.com>
References: <1341289805-26091-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36494 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751717Ab2GSGoC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 02:44:02 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7E00B3XAOXGQQ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:44:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7E00NS1APC0T00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:44:00 +0900 (KST)
In-reply-to: <1341289805-26091-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: tushar.behera@linaro.org, ricardo.salveti@linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> From: Ricardo Salveti de Araujo <ricardo.salveti@linaro.org>
> 
> On Origen board, we have 2 status leds, so adding them as heartbeat and
> mmc0 by
> default. The patch basically adds the platform data required by
> leds-gpio driver.
> 
> Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-origen.c |   30 ++++++++++++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index 580cc77..8e9a884 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -9,6 +9,7 @@
>  */
> 
>  #include <linux/serial_core.h>
> +#include <linux/leds.h>
>  #include <linux/gpio.h>
>  #include <linux/mmc/host.h>
>  #include <linux/platform_device.h>
> @@ -502,6 +503,34 @@ static void __init origen_ohci_init(void)
>  /* USB OTG */
>  static struct s3c_hsotg_plat origen_hsotg_pdata;
> 
> +static struct gpio_led origen_gpio_leds[] = {
> +	{
> +		.name			= "origen::status1",
> +		.default_trigger	= "heartbeat",
> +		.gpio			= EXYNOS4_GPX1(3),
> +		.active_low		= 1,
> +	},
> +	{
> +		.name			= "origen::status2",
> +		.default_trigger	= "mmc0",
> +		.gpio			= EXYNOS4_GPX1(4),
> +		.active_low		= 1,
> +	},
> +};
> +
> +static struct gpio_led_platform_data origen_gpio_led_info = {
> +	.leds		= origen_gpio_leds,
> +	.num_leds	= ARRAY_SIZE(origen_gpio_leds),
> +};
> +
> +static struct platform_device origen_leds_gpio = {
> +	.name	= "leds-gpio",
> +	.id	= -1,
> +	.dev	= {
> +		.platform_data	= &origen_gpio_led_info,
> +	},
> +};
> +
>  static struct gpio_keys_button origen_gpio_keys_table[] = {
>  	{
>  		.code			= KEY_MENU,
> @@ -681,6 +710,7 @@ static struct platform_device *origen_devices[]
> __initdata = {
>  	&exynos4_device_ohci,
>  	&origen_device_gpiokeys,
>  	&origen_lcd_hv070wsa,
> +	&origen_leds_gpio,
>  	&origen_device_bluetooth,
>  };
> 
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
