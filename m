From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add keypad support for Origen
Date: Fri, 16 Sep 2011 21:12:10 +0900
Message-ID: <00d201cc7469$dc599bf0$950cd3d0$%kim@samsung.com>
References: <1316057572-13719-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58748 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968Ab1IPMMM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Sep 2011 08:12:12 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRM00HRT786QX60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 21:12:10 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRM002Z478A6C70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 21:12:10 +0900 (KST)
In-reply-to: <1316057572-13719-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> This patch adds keypad support for Origen board as GPIO keys.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/mach-origen.c |   58
> +++++++++++++++++++++++++++++++++++
>  1 files changed, 58 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..61da36b 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/input.h>
> +#include <linux/gpio_keys.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/mach-types.h>
> @@ -79,10 +80,67 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata
> __initdata = {
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>  };
> 
> +static struct gpio_keys_button origen_gpio_keys_table[] = {
> +	{
> +		.code = KEY_MENU,

If you're ok, will change tab between '.code' and '=', I think it would be
better to read code.

> +		.gpio = EXYNOS4_GPX1(5),
> +		.desc = "gpio-keys: KEY_MENU",
> +		.type = EV_KEY,
> +		.active_low = 1,
> +		.wakeup = 1,
> +		.debounce_interval = 1,
> +	}, {
> +		.code = KEY_HOME,
> +		.gpio = EXYNOS4_GPX1(6),
> +		.desc = "gpio-keys: KEY_HOME",
> +		.type = EV_KEY,
> +		.active_low = 1,
> +		.wakeup = 1,
> +		.debounce_interval = 1,
> +	}, {
> +		.code = KEY_BACK,
> +		.gpio = EXYNOS4_GPX1(7),
> +		.desc = "gpio-keys: KEY_BACK",
> +		.type = EV_KEY,
> +		.active_low = 1,
> +		.wakeup = 1,
> +		.debounce_interval = 1,
> +	}, {
> +		.code = KEY_UP,
> +		.gpio = EXYNOS4_GPX2(0),
> +		.desc = "gpio-keys: KEY_UP",
> +		.type = EV_KEY,
> +		.active_low = 1,
> +		.wakeup = 1,
> +		.debounce_interval = 1,
> +	}, {
> +		.code = KEY_DOWN,
> +		.gpio = EXYNOS4_GPX2(1),
> +		.desc = "gpio-keys: KEY_DOWN",
> +		.type = EV_KEY,
> +		.active_low = 1,
> +		.wakeup = 1,
> +		.debounce_interval = 1,
> +	},
> +};
> +
> +static struct gpio_keys_platform_data origen_gpio_keys_data = {
> +	.buttons = origen_gpio_keys_table,
> +	.nbuttons = ARRAY_SIZE(origen_gpio_keys_table),
> +};
> +
> +static struct platform_device origen_device_gpiokeys = {
> +	.name = "gpio-keys",
> +	.dev = {
> +		.platform_data = &origen_gpio_keys_data,
> +	},
> +};
> +
>  static struct platform_device *origen_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> +	&origen_device_gpiokeys,
>  };
> 
>  static void __init origen_map_io(void)
> --
> 1.7.4.1

Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
