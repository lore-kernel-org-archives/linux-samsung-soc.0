From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 4/5] clk: s2mps15: Add support for S2MPS15 clocks
Date: Wed, 28 Oct 2015 09:06:55 +0530
Message-ID: <563042D7.7020907@samsung.com>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-5-git-send-email-alim.akhtar@samsung.com>
 <5630234A.8080905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <5630234A.8080905@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello

On 10/28/2015 06:52 AM, Krzysztof Kozlowski wrote:
> On 26.10.2015 21:51, Alim Akhtar wrote:
>> S2MPS15 PMIC has three 32k buffered clocks outputs. This patch
>> adds supports for the same to the s2mps11 clock driver.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   drivers/clk/Kconfig       |    5 +++--
>>   drivers/clk/clk-s2mps11.c |   24 ++++++++++++++++++++++++
>>   2 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index a1fa61159179..037a314b5d76 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -120,9 +120,10 @@ config COMMON_CLK_S2MPS11
>>   	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
>>   	depends on MFD_SEC_CORE
>>   	---help---
>> -	  This driver supports S2MPS11/S2MPS14/S5M8767 crystal oscillator
>> +	  This driver supports S2MPS1X/S5M8767 crystal oscillator
>>   	  clock. These multi-function devices have two (S2MPS14) or three
>> -	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
>> +	  (S2MPS11/S2MPS13/S2MPS15/S5M8767) fixed-rate oscillators,
>> +	  clocked at 32KHz each.
>>
>>   config CLK_TWL6040
>>   	tristate "External McPDM functional clock from twl6040"
>> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
>> index d266299dfdb1..455500dca653 100644
>> --- a/drivers/clk/clk-s2mps11.c
>> +++ b/drivers/clk/clk-s2mps11.c
>> @@ -25,6 +25,7 @@
>>   #include <linux/mfd/samsung/s2mps11.h>
>>   #include <linux/mfd/samsung/s2mps13.h>
>>   #include <linux/mfd/samsung/s2mps14.h>
>> +#include <linux/mfd/samsung/s2mps15.h>
>>   #include <linux/mfd/samsung/s5m8767.h>
>>   #include <linux/mfd/samsung/core.h>
>>
>> @@ -148,6 +149,24 @@ static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] = {
>>   	},
>>   };
>>
>> +static struct clk_init_data s2mps15_clks_init[S2MPS11_CLKS_NUM] = {
>> +	[S2MPS11_CLK_AP] = {
>> +		.name = "s2mps15_ap",
>> +		.ops = &s2mps11_clk_ops,
>> +		.flags = CLK_IS_ROOT,
>> +	},
>> +	[S2MPS11_CLK_CP] = {
>> +		.name = "s2mps15_cp",
>> +		.ops = &s2mps11_clk_ops,
>> +		.flags = CLK_IS_ROOT,
>> +	},
>> +	[S2MPS11_CLK_BT] = {
>> +		.name = "s2mps15_bt",
>> +		.ops = &s2mps11_clk_ops,
>> +		.flags = CLK_IS_ROOT,
>> +	},
>> +};
>
> I see that for S2MPS13 we already added similar array which duplicates
> the S2MPS11. This actually looks wrong. Just re-use existing
> s2mps11_clks_init.
>
hmm..ok will do.
> Best regards,
> Krzysztof
>
>
