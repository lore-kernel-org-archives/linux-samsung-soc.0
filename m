From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2] ARM: EXYNOS: Add touchscreen support to SMDK4X12
Date: Mon, 16 Jul 2012 14:01:15 +0530
Message-ID: <CAK9yfHyAKr=8Mn9wzhFS+Aa8TP1-H6zeMKw8J74aS8_FPRKNhA@mail.gmail.com>
References: <1342420976-25068-1-git-send-email-sachin.kamat@linaro.org>
	<5003CEC4.8070901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:46073 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752639Ab2GPIbQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 04:31:16 -0400
Received: by vcbfk26 with SMTP id fk26so675613vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jul 2012 01:31:15 -0700 (PDT)
In-Reply-To: <5003CEC4.8070901@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sylwester,

Thank you for the review.

On 16/07/2012, Sylwester Nawrocki <sylvester.nawrocki@gmail.com> wrote:
> Hi Sachin,
>
> On 07/16/2012 08:42 AM, Sachin Kamat wrote:
>> Pixcir touchscreen device support is added to SMDK4X12 boards.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>> This patch is based on Kukjin Kim's latest for-next branch.
>>
>> Changes since v1:
>> Incorporated Kukjin's review comments
>> -reduced mdelay
>> -removed a unnecessary gpio
>> ---
>>   arch/arm/mach-exynos/mach-smdk4x12.c |   31
>> ++++++++++++++++++++++++++++++-
>>   1 files changed, 30 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c
>> b/arch/arm/mach-exynos/mach-smdk4x12.c
>> index 2623f3b..b3207ea 100644
>> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
>> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
>> @@ -9,9 +9,11 @@
>>    * published by the Free Software Foundation.
>>   */
>>
>> +#include<linux/delay.h>
>>   #include<linux/gpio.h>
>>   #include<linux/i2c.h>
>>   #include<linux/input.h>
>> +#include<linux/input/pixcir_ts.h>
>>   #include<linux/io.h>
>>   #include<linux/lcd.h>
>>   #include<linux/mfd/max8997.h>
>> @@ -207,8 +209,33 @@ static struct i2c_board_info smdk4x12_i2c_devs3[]
>> __initdata = {
>>   	/* nothing here yet */
>>   };
>>
>> +static void smdk4x12_ts_gpio_setup(void)
>> +{
>> +	int gpio_reset = EXYNOS4_GPM3(4);
>
> I don't seem to find this GPIO defined in Kgene's for-next tree.
> Is there already GPIO support for Exynos4x12 SoC's merged in someone's
> tree ? I thought it's not completed yet.

Yes, you are right. GPIO support for 4X12 is not yet merged. I had
that patch locally on my branch, so did not realise it. This patch
should then go after the GPIO support gets merged.


>
>> +
>> +	gpio_request_one(gpio_reset, GPIOF_OUT_INIT_LOW, "TOUCH RESET");
>> +	mdelay(2);
>
> Any reason to use mdelay, rather than msleep/usleep_range ?
No.

>
>> +	gpio_direction_output(gpio_reset, 1);
>
> Probably better to make it:
>
> 	gpio_set_value(gpio_reset, 1);

Ok.


>
> since the GPIO's direction is already set in gpio_request_one().
>
>> +	mdelay(30);
>
> msleep(30);
Ok.

I will update and re-send the patch once GPIO support gets merged.


>
> --
>
> Regards,
> Sylwester
>


-- 
With warm regards,
Sachin
