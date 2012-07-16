From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Add touchscreen support to SMDK4X12
Date: Mon, 16 Jul 2012 11:54:58 +0530
Message-ID: <CAK9yfHy2+e3rQwm_BC1a4VA1-kSoSPt9LcsugzaiAaXvKUB0Kw@mail.gmail.com>
References: <1337936288-25246-1-git-send-email-sachin.kamat@linaro.org>
	<118a01cd60fe$a8af41b0$fa0dc510$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:47923 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966Ab2GPGY7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 02:24:59 -0400
Received: by vbbff1 with SMTP id ff1so3280807vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jul 2012 23:24:59 -0700 (PDT)
In-Reply-To: <118a01cd60fe$a8af41b0$fa0dc510$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 13/07/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Pixcir touchscreen device support is added to SMDK4X12 boards.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/mach-exynos/mach-smdk4x12.c |   32
>> +++++++++++++++++++++++++++++++-
>>  1 files changed, 31 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
>> exynos/mach-smdk4x12.c
>> index fe772d8..0af6088 100644
>> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
>> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
>> @@ -9,10 +9,12 @@
>>   * published by the Free Software Foundation.
>>  */
>>
>> +#include <linux/delay.h>
>>  #include <linux/gpio.h>
>>  #include <linux/i2c.h>
>>  #include <linux/input.h>
>>  #include <linux/io.h>
>> +#include <linux/input/pixcir_ts.h>
>>  #include <linux/mfd/max8997.h>
>>  #include <linux/mmc/host.h>
>>  #include <linux/platform_device.h>
>> @@ -203,8 +205,34 @@ static struct i2c_board_info smdk4x12_i2c_devs3[]
>> __initdata = {
>>  	/* nothing here yet */
>>  };
>>
>> +static void smdk4x12_ts_gpio_setup(void)
>> +{
>> +	int gpio_reset = EXYNOS4_GPM3(4);
>> +
>> +	gpio_request_one(gpio_reset, GPIOF_OUT_INIT_LOW, "TOUCH RESET");
>> +	mdelay(20);
>> +	gpio_direction_output(gpio_reset, 1);
>
> Do you want to set the gpio_reset value from 0 to 1 with 20m delays? Why?
Yes right. I found lower value (2m) should be fine.

>
>> +	mdelay(30);
>> +	s3c_gpio_setpull(EXYNOS4_GPX2(6), S3C_GPIO_PULL_NONE);
>
> Hmm...don't we need gpio_reqeust()? and what's the gpx2(6)?

This gpio is not needed. I will remove this and send the updated patch.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>


-- 
With warm regards,
Sachin
