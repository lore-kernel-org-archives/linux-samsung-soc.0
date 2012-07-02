From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Add touchscreen support to SMDK4X12
Date: Mon, 2 Jul 2012 11:04:48 +0530
Message-ID: <CAK9yfHwFOOV2ETFw5Us3fuFrSmCXoSxgAwYsZioGaVkzw=WhcQ@mail.gmail.com>
References: <1337936288-25246-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:39352 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066Ab2GBFet (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 01:34:49 -0400
Received: by mail-vc0-f174.google.com with SMTP id f11so3297453vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Jul 2012 22:34:48 -0700 (PDT)
In-Reply-To: <1337936288-25246-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

ping...

On 25/05/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Pixcir touchscreen device support is added to SMDK4X12 boards.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-smdk4x12.c |   32
> +++++++++++++++++++++++++++++++-
>  1 files changed, 31 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c
> b/arch/arm/mach-exynos/mach-smdk4x12.c
> index fe772d8..0af6088 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -9,10 +9,12 @@
>   * published by the Free Software Foundation.
>  */
>
> +#include <linux/delay.h>
>  #include <linux/gpio.h>
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/io.h>
> +#include <linux/input/pixcir_ts.h>
>  #include <linux/mfd/max8997.h>
>  #include <linux/mmc/host.h>
>  #include <linux/platform_device.h>
> @@ -203,8 +205,34 @@ static struct i2c_board_info smdk4x12_i2c_devs3[]
> __initdata = {
>  	/* nothing here yet */
>  };
>
> +static void smdk4x12_ts_gpio_setup(void)
> +{
> +	int gpio_reset = EXYNOS4_GPM3(4);
> +
> +	gpio_request_one(gpio_reset, GPIOF_OUT_INIT_LOW, "TOUCH RESET");
> +	mdelay(20);
> +	gpio_direction_output(gpio_reset, 1);
> +	mdelay(30);
> +	s3c_gpio_setpull(EXYNOS4_GPX2(6), S3C_GPIO_PULL_NONE);
> +}
> +
> +static int smdk4x12_ts_get_value(void)
> +{
> +	return gpio_get_value(EXYNOS4_GPX2(6));
> +}
> +
> +static struct pixcir_ts_platform_data smdk4x12_ts_data = {
> +	.attb_read_val = smdk4x12_ts_get_value,
> +	.x_max = 480,
> +	.y_max = 800,
> +};
> +
>  static struct i2c_board_info smdk4x12_i2c_devs7[] __initdata = {
> -	/* nothing here yet */
> +	{
> +		I2C_BOARD_INFO("pixcir_ts", 0x5C),
> +		.irq		= IRQ_EINT(22),
> +		.platform_data	= &smdk4x12_ts_data,
> +	}
>  };
>
>  static struct samsung_bl_gpio_info smdk4x12_bl_gpio_info = {
> @@ -293,6 +321,8 @@ static void __init smdk4x12_machine_init(void)
>  	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
>  	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
>
> +	smdk4x12_ts_gpio_setup();
> +
>  	platform_add_devices(smdk4x12_devices, ARRAY_SIZE(smdk4x12_devices));
>  }
>
> --
> 1.7.4.1
>
>


-- 
With warm regards,
Sachin
