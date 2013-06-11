From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos4: Staticize local symbols
Date: Tue, 11 Jun 2013 09:46:56 +0530
Message-ID: <CAK9yfHzMFfpLbHj0HwayPGSHWYfa5QSG-SADCvhoXJoiUE=JYQ@mail.gmail.com>
References: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
	<08f401ce61e6$2ecc33f0$8c649bd0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:40441 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950Ab3FKEQ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 00:16:58 -0400
Received: by mail-oa0-f42.google.com with SMTP id n12so1761238oag.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2013 21:16:57 -0700 (PDT)
In-Reply-To: <08f401ce61e6$2ecc33f0$8c649bd0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

On 5 June 2013 17:44, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> These symbols are used only in this file and hence should be
>> static.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-exynos4.c |   26 ++++++++++++++------------
>>  1 file changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-
>> exynos4.c
>> index 7104669..26f2a85 100644
>> --- a/drivers/clk/samsung/clk-exynos4.c
>> +++ b/drivers/clk/samsung/clk-exynos4.c
>> @@ -339,24 +339,26 @@ PNAME(mout_user_aclk200_p4x12) = {"fin_pll",
>> "div_aclk200", };
>>  PNAME(mout_user_aclk266_gps_p4x12) = {"fin_pll", "div_aclk266_gps", };
>>
>>  /* fixed rate clocks generated outside the soc */
>> -struct samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata
>> = {
>> +static struct
>> +samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata = {
>
> Any reason to use double lines?

This is one of the ways to avoid exceeding 80 column limit.

>
>>       FRATE(xxti, "xxti", NULL, CLK_IS_ROOT, 0),
>>       FRATE(xusbxti, "xusbxti", NULL, CLK_IS_ROOT, 0),
>>  };
>
> [...]
>
>> -struct samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata =
>> {
>> +static struct
>> +samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata = {
>
> Same as above.
>
>>       FRATE(none, "sclk_usbphy1", NULL, CLK_IS_ROOT, 48000000),
>>  };
>>
> [...]
>
> Others look good to me,
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Mike, please pick this into the clk tree if you're ok.
>

Mike,
If you are taking this through your tree, please also take the below
patch [1] as it is dependent on this series.
[1] https://patchwork.kernel.org/patch/2469891/


-- 
With warm regards,
Sachin
