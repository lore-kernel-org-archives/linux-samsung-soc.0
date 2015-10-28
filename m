From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 4/5] clk: s2mps15: Add support for S2MPS15 clocks
Date: Wed, 28 Oct 2015 14:36:53 +0900
Message-ID: <56305EF5.1080709@samsung.com>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-5-git-send-email-alim.akhtar@samsung.com>
 <5630243E.1080608@samsung.com> <5630503A.3070404@samsung.com>
 <5630554E.8070301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <5630554E.8070301@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 28.10.2015 13:55, Alim Akhtar wrote:
> 
> 
> On 10/28/2015 10:04 AM, Krzysztof Kozlowski wrote:
>> On 28.10.2015 10:26, Krzysztof Kozlowski wrote:
>>> On 26.10.2015 21:51, Alim Akhtar wrote:
>>>> S2MPS15 PMIC has three 32k buffered clocks outputs. This patch
>>>> adds supports for the same to the s2mps11 clock driver.
>>>>
>>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>>> ---
>>>>   drivers/clk/Kconfig       |    5 +++--
>>>>   drivers/clk/clk-s2mps11.c |   24 ++++++++++++++++++++++++
>>>>   2 files changed, 27 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>>> index a1fa61159179..037a314b5d76 100644
>>>> --- a/drivers/clk/Kconfig
>>>> +++ b/drivers/clk/Kconfig
>>>> @@ -120,9 +120,10 @@ config COMMON_CLK_S2MPS11
>>>>       tristate "Clock driver for S2MPS1X/S5M8767 MFD"
>>>>       depends on MFD_SEC_CORE
>>>>       ---help---
>>>> -      This driver supports S2MPS11/S2MPS14/S5M8767 crystal oscillator
>>>> +      This driver supports S2MPS1X/S5M8767 crystal oscillator
>>>>         clock. These multi-function devices have two (S2MPS14) or three
>>>> -      (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz
>>>> each.
>>>> +      (S2MPS11/S2MPS13/S2MPS15/S5M8767) fixed-rate oscillators,
>>>> +      clocked at 32KHz each.
>>>>
>>>>   config CLK_TWL6040
>>>>       tristate "External McPDM functional clock from twl6040"
>>>> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
>>>> index d266299dfdb1..455500dca653 100644
>>>> --- a/drivers/clk/clk-s2mps11.c
>>>> +++ b/drivers/clk/clk-s2mps11.c
>>>> @@ -25,6 +25,7 @@
>>>>   #include <linux/mfd/samsung/s2mps11.h>
>>>>   #include <linux/mfd/samsung/s2mps13.h>
>>>>   #include <linux/mfd/samsung/s2mps14.h>
>>>> +#include <linux/mfd/samsung/s2mps15.h>
>>>>   #include <linux/mfd/samsung/s5m8767.h>
>>>>   #include <linux/mfd/samsung/core.h>
>>>>
>>>> @@ -148,6 +149,24 @@ static struct clk_init_data
>>>> s2mps14_clks_init[S2MPS11_CLKS_NUM] = {
>>>>       },
>>>>   };
>>>>
>>>> +static struct clk_init_data s2mps15_clks_init[S2MPS11_CLKS_NUM] = {
>>>> +    [S2MPS11_CLK_AP] = {
>>>> +        .name = "s2mps15_ap",
>>>> +        .ops = &s2mps11_clk_ops,
>>>> +        .flags = CLK_IS_ROOT,
>>>> +    },
>>>> +    [S2MPS11_CLK_CP] = {
>>>> +        .name = "s2mps15_cp",
>>>> +        .ops = &s2mps11_clk_ops,
>>>> +        .flags = CLK_IS_ROOT,
>>>> +    },
>>>> +    [S2MPS11_CLK_BT] = {
>>>> +        .name = "s2mps15_bt",
>>>> +        .ops = &s2mps11_clk_ops,
>>>> +        .flags = CLK_IS_ROOT,
>>>> +    },
>>>> +};
>>>> +
>>>>   static struct device_node *s2mps11_clk_parse_dt(struct
>>>> platform_device *pdev,
>>>>           struct clk_init_data *clks_init)
>>>>   {
>>>> @@ -207,6 +226,10 @@ static int s2mps11_clk_probe(struct
>>>> platform_device *pdev)
>>>>           s2mps11_reg = S2MPS14_REG_RTCCTRL;
>>>>           clks_init = s2mps14_clks_init;
>>>>           break;
>>>> +    case S2MPS15X:
>>>> +        s2mps11_reg = S2MPS15_REG_RTC_BUF;
>>>> +        clks_init = s2mps15_clks_init;
>>>
>>> Another question (after looking at RTC driver):
>>> Is this the same register address as S2MPS14?
>>
>> I found the answer - this is the same address as in S2MPS13 and S2MPS14:
>> 0xc. The S2MPS14 has only two clocks though but S2MPS13 has three.
>> Again, as in RTC, you should re-use existing support.
>>
>> It looks there is no need for this patch at all.
>>
> Yes, checked that, rtc looks same to s2mps14 and clk looks same as
> s2mps13{ not s2mps11}, because of the RTC_BUF address changes.
> Will drop patch 4 and 5 and use the existing names where applicable.

Thanks!

> I think I don't have to change the binding or Kconfig changes?

I think you don't have to. Only the main MFD driver will be updated with
respective child driver names and compatible.

Best regards,
Krzysztof
