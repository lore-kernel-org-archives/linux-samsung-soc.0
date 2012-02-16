From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add WLAN init on ORIGEN
Date: Thu, 16 Feb 2012 21:13:23 +0100
Message-ID: <4F3D6363.9010703@gmail.com>
References: <1329404118-19198-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:48263 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753030Ab2BPUN2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 15:13:28 -0500
Received: by lagu2 with SMTP id u2so2872269lag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 12:13:27 -0800 (PST)
In-Reply-To: <1329404118-19198-1-git-send-email-sangwook.lee@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sangwook,

On 02/16/2012 03:55 PM, Sangwook Lee wrote:
> Add WLAN init code on Origen for both hw2.1.1 and hw2.0 in AR6003
>
> Signed-off-by: Sangwook Lee<sangwook.lee@linaro.org>
> ---
>   arch/arm/mach-exynos/mach-origen.c |   21 +++++++++++++++++++++
>   1 files changed, 21 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
> index e1d87b9..d570667 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -21,6 +21,7 @@
>   #include<linux/mfd/max8997.h>
>   #include<linux/lcd.h>
>   #include<linux/rfkill-gpio.h>
> +#include<linux/delay.h>
>
>   #include<asm/mach/arch.h>
>   #include<asm/hardware/gic.h>
> @@ -676,6 +677,25 @@ static void __init origen_bt_setup(void)
>   	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
>   }
>
> +static void __init origen_wlan_setup(void)
> +{
> +	int err;
> +
> +	err = gpio_request_one(EXYNOS4_GPX2(4),
> +			GPIOF_OUT_INIT_LOW, "GPX2_4");
> +	if (err) {
> +		pr_warning("ORIGEN: Failed to obtain WIFI GPIOs\n");
> +		return;
> +	}
> +	s3c_gpio_cfgpin(EXYNOS4_GPX2(4), S3C_GPIO_OUTPUT);

The pin is already configured as output in gpio_request_one(), doesn't
it work without this line ?

> +	s3c_gpio_setpull(EXYNOS4_GPX2(4),
> +			S3C_GPIO_PULL_NONE);

No need to break the line.

> +	/* VDD33,I/O Supply must be done */

Is it to reset the module by cycling its power supply ?

> +	gpio_set_value(EXYNOS4_GPX2(4), 0);

Isn't EXYNOS4_GPX2(4) set to low state (0) already at this point,
since you used GPIOF_OUT_INIT_LOW flags ?

> +	udelay(30);     /*AR6003 speicic value Tb */

s/speicic/specific ?

> +	gpio_direction_output(EXYNOS4_GPX2(4), 1);

Isn't gpio_set_value() enough here ?

> +}

I couldn't identify EXYNOS4_GPX2(4) GPIO on the board's schematics
(I didn't try too hard though), AFAIU it controls a voltage regulator.
I guess, it doesn't make sense to define a fixed voltage regulator
for "VDD3,I/O" supply, since it is not controlled from anywhere else
than the board code ?

--
Regards,
Sylwester
