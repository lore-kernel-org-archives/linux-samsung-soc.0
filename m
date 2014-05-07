From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH v4 14/15] clk: exynos5420: add misc clocks
Date: Wed, 7 May 2014 17:30:17 +0530
Message-ID: <CAOD6ATo2AL8AFDbhRK8FSNVE+XYGai2Z7D-S-bxtA70h7RLvzQ@mail.gmail.com>
References: <1399393610-23394-1-git-send-email-shaik.ameer@samsung.com>
 <1399393610-23394-15-git-send-email-shaik.ameer@samsung.com> <536920A5.1090502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f44.google.com ([209.85.213.44]:65006 "EHLO
	mail-yh0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755703AbaEGMAi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 08:00:38 -0400
In-Reply-To: <536920A5.1090502@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Shaik Ameer Basha <shaik.ameer@samsung.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, Linux DeviceTree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, alim.akhtar@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Hi Tomasz,

On Tue, May 6, 2014 at 11:19 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Shaik,
>
>
> On 06.05.2014 18:26, Shaik Ameer Basha wrote:
>>
>> This patch adds some missing miscellaneous clocks specific
>> to exynos5420.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos5420.c   |   14 +++++++++++---
>>   include/dt-bindings/clock/exynos5420.h |    2 ++
>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c
>> b/drivers/clk/samsung/clk-exynos5420.c
>> index e0e749d..e69e820 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -273,7 +273,8 @@ PNAME(mout_group5_p) = {"mout_sclk_vpll",
>> "mout_sclk_dpll"};
>>
>>   PNAME(mout_fimd1_final_p) = {"mout_fimd1", "mout_fimd1_opt"};
>>   PNAME(mout_sw_aclk66_p)       = {"dout_aclk66", "mout_sclk_spll"};
>> -PNAME(mout_user_aclk66_peric_p)        = { "fin_pll", "mout_sw_aclk66" };
>> +PNAME(mout_user_aclk66_peric_p)        = { "fin_pll", "mout_sw_aclk66"};
>> +PNAME(mout_user_pclk66_gpio_p) = {"mout_sw_aclk66", "ffactor_sw_aclk66"};
>>
>>   PNAME(mout_sw_aclk200_fsys_p) = {"dout_aclk200_fsys", "mout_sclk_spll"};
>>   PNAME(mout_sw_pclk200_fsys_p) = {"dout_pclk200_fsys", "mout_sclk_spll"};
>> @@ -372,10 +373,13 @@ static struct samsung_fixed_rate_clock
>> exynos5420_fixed_rate_clks[] __initdata =
>>   };
>>
>>   static struct samsung_fixed_factor_clock exynos5420_fixed_factor_clks[]
>> __initdata = {
>> -       FFACTOR(0, "sclk_hsic_12m", "fin_pll", 1, 2, 0),
>> +       FFACTOR(0, "ffactor_hsic_12m", "fin_pll", 1, 2, 0),
>> +       FFACTOR(0, "ffactor_sw_aclk66", "mout_sw_aclk66", 1, 2, 0),
>
>
> Is the "ffactor_" prefix also present in the datasheet? If not, it should be
> removed from clock names as well.

Its not there in manual.
As we are differentiating muxes and dividers with "mout" and "dout"
this prefix is added
to differentiate fixed factor clocks.

shall I keep it or not?

Regards,
Shaik Ameer Basha

>
> Best regards,
> Tomasz
