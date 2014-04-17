From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/5] mfd: tps65090: Stop caching most registers
Date: Thu, 17 Apr 2014 08:51:09 -0700
Message-ID: <CAD=FV=XvqfYxSXb8VWMKus9gxcCMO30LHxLtt3Mz2qi3J09j7w@mail.gmail.com>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
	<1397689950-1568-4-git-send-email-dianders@chromium.org>
	<20140417110028.GO28725@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f171.google.com ([209.85.128.171]:33842 "EHLO
	mail-ve0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752498AbaDQPvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 11:51:10 -0400
Received: by mail-ve0-f171.google.com with SMTP id jy13so691876veb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Apr 2014 08:51:09 -0700 (PDT)
In-Reply-To: <20140417110028.GO28725@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Lee,

On Thu, Apr 17, 2014 at 4:00 AM, Lee Jones <lee.jones@linaro.org> wrote:
>> Nearly all of the registers in tps65090 combine control bits and
>> status bits.  Turn off caching of all registers except the select few
>> that can be cached.
>>
>> In order to avoid adding more duplicate #defines, we also move some
>> register offset definitions to the mfd driver (and resolve
>> inconsistent names).
>>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>> Changes in v3: None
>> Changes in v2:
>> - Leave cache on for the registers that can be cached.
>> - Move register offsets to mfd header file.
>>
>>  drivers/mfd/tps65090.c           | 27 ++++++++++++++-------------
>>  drivers/power/tps65090-charger.c | 11 -----------
>>  include/linux/mfd/tps65090.h     | 14 ++++++++++++++
>>  3 files changed, 28 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
>> index c3cddb4..1c3e6e2 100644
>> --- a/drivers/mfd/tps65090.c
>> +++ b/drivers/mfd/tps65090.c
>> @@ -32,14 +32,6 @@
>>  #define NUM_INT_REG 2
>>  #define TOTAL_NUM_REG 0x18
>>
>> -/* interrupt status registers */
>> -#define TPS65090_INT_STS     0x0
>> -#define TPS65090_INT_STS2    0x1
>> -
>> -/* interrupt mask registers */
>> -#define TPS65090_INT_MSK     0x2
>> -#define TPS65090_INT_MSK2    0x3
>> -
>>  #define TPS65090_INT1_MASK_VAC_STATUS_CHANGE         1
>>  #define TPS65090_INT1_MASK_VSYS_STATUS_CHANGE                2
>>  #define TPS65090_INT1_MASK_BAT_STATUS_CHANGE         3
>> @@ -144,17 +136,26 @@ static struct regmap_irq_chip tps65090_irq_chip = {
>>       .irqs = tps65090_irqs,
>>       .num_irqs = ARRAY_SIZE(tps65090_irqs),
>>       .num_regs = NUM_INT_REG,
>> -     .status_base = TPS65090_INT_STS,
>> -     .mask_base = TPS65090_INT_MSK,
>> +     .status_base = TPS65090_REG_INTR_STS,
>> +     .mask_base = TPS65090_REG_INTR_MASK,
>>       .mask_invert = true,
>>  };
>>
>>  static bool is_volatile_reg(struct device *dev, unsigned int reg)
>>  {
>> -     if ((reg == TPS65090_INT_STS) || (reg == TPS65090_INT_STS2))
>> -             return true;
>> -     else
>> +     /* Nearly all registers have status bits mixed in, except a few */
>> +     switch (reg) {
>> +     case TPS65090_REG_INTR_MASK:
>> +     case TPS65090_REG_INTR_MASK2:
>> +     case TPS65090_REG_CG_CTRL0:
>> +     case TPS65090_REG_CG_CTRL1:
>> +     case TPS65090_REG_CG_CTRL2:
>> +     case TPS65090_REG_CG_CTRL3:
>> +     case TPS65090_REG_CG_CTRL4:
>> +     case TPS65090_REG_CG_CTRL5:
>>               return false;
>> +     }
>> +     return true;
>>  }
>
> I'll not force the issue, but if you wanted to do this more succinctly
> you could also do:
>
>   case TPS65090_REG_INTR_MASK ... TPS65090_REG_INTR_MASK:
>   case TPS65090_REG_CG_CTRL0  ... TPS65090_REG_CG_CTRL5:
>
> or
>
>   if (reg >= TPS65090_REG_INTR_MASK && reg <= TPS65090_REG_CG_CTRL5)
>
> Ect.
>
> Otherwise patch looks fine:
>   Acked-by: Lee Jones <lee.jones@linaro.org>

If I need to spin the series for another reason I'll make that change.
 Otherwise I won't plan to spin.  Thanks for the review!

-Doug
