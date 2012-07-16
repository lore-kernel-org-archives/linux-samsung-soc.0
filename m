From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Add touchscreen support to SMDK4X12
Date: Mon, 16 Jul 2012 10:20:20 +0200
Message-ID: <5003CEC4.8070901@gmail.com>
References: <1342420976-25068-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:49167 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab2GPIUZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 04:20:25 -0400
Received: by eaak11 with SMTP id k11so1550373eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jul 2012 01:20:23 -0700 (PDT)
In-Reply-To: <1342420976-25068-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

On 07/16/2012 08:42 AM, Sachin Kamat wrote:
> Pixcir touchscreen device support is added to SMDK4X12 boards.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
> This patch is based on Kukjin Kim's latest for-next branch.
>
> Changes since v1:
> Incorporated Kukjin's review comments
> -reduced mdelay
> -removed a unnecessary gpio
> ---
>   arch/arm/mach-exynos/mach-smdk4x12.c |   31 ++++++++++++++++++++++++++++++-
>   1 files changed, 30 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
> index 2623f3b..b3207ea 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -9,9 +9,11 @@
>    * published by the Free Software Foundation.
>   */
>
> +#include<linux/delay.h>
>   #include<linux/gpio.h>
>   #include<linux/i2c.h>
>   #include<linux/input.h>
> +#include<linux/input/pixcir_ts.h>
>   #include<linux/io.h>
>   #include<linux/lcd.h>
>   #include<linux/mfd/max8997.h>
> @@ -207,8 +209,33 @@ static struct i2c_board_info smdk4x12_i2c_devs3[] __initdata = {
>   	/* nothing here yet */
>   };
>
> +static void smdk4x12_ts_gpio_setup(void)
> +{
> +	int gpio_reset = EXYNOS4_GPM3(4);

I don't seem to find this GPIO defined in Kgene's for-next tree.
Is there already GPIO support for Exynos4x12 SoC's merged in someone's
tree ? I thought it's not completed yet.

> +
> +	gpio_request_one(gpio_reset, GPIOF_OUT_INIT_LOW, "TOUCH RESET");
> +	mdelay(2);

Any reason to use mdelay, rather than msleep/usleep_range ?

> +	gpio_direction_output(gpio_reset, 1);

Probably better to make it:

	gpio_set_value(gpio_reset, 1);

since the GPIO's direction is already set in gpio_request_one().

> +	mdelay(30);

msleep(30);

--

Regards,
Sylwester
