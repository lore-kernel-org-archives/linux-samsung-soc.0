From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] clk: samsung: exynos542x: Add EPLL rate table
Date: Fri, 09 Jun 2017 12:32:44 +0200
Message-ID: <20b8c07c-f191-19ee-38bd-8c8810576f1c@samsung.com>
References: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170608141730epcas1p19ca02cb0fd55506f88fcd68414fde70d@epcas1p1.samsung.com>
        <1496931433-5712-3-git-send-email-s.nawrocki@samsung.com>
        <593A1D1B.6000808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11011 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751519AbdFIKcw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 06:32:52 -0400
In-reply-to: <593A1D1B.6000808@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com

On 06/09/2017 05:59 AM, Chanwoo Choi wrote:
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -1280,2 +1280,2 @@ static void __init exynos5420_clk_sleep_init(void) {}
>>   	PLL_35XX_RATE(200000000,  200, 3, 3),
>>   };
>>
> I got a following frequency(Recalc rate) value.
> I think there are two much different value for 400000000U and 45158400U.
> 
> fin_pll	        Recalc rate	mdiv	pdiv	sdiv	kdiv
> 24000000	600000000	100	2	1	0
> 24000000	400000000	200	3	2	0
> 24000000	394784008.5	197	3	2	25690
> 24000000	361267219	301	5	2	3671
> 24000000	200000000	200	3	3	0
> 24000000	196607995.7	197	3	3	-25690
> 24000000	180633609.5	301	5	3	3671
> 24000000	131072007.3	131	3	3	4719
> 24000000	100000000	200	3	4	0
> 24000000	65536003.66	131	3	4	4719
> 24000000	49348001.07	197	3	5	25690
> 24000000	180633609.5	301	5	3	3671
> 24000000	32768001.83	131	3	5	4719
> 
> 
>> +static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>> +	PLL_36XX_RATE(600000000U, 100, 2, 1, 0),
>> +	PLL_36XX_RATE(400000000U, 200, 2, 2, 0),

> For 400MHz, pdiv is 3 instead of 2 as following:
> 	PLL_36XX_RATE(400000000U, 200, 3, 2, 0),

Thanks a lot for testing this, I originally just verified 131072000U, 
180633600U, 196608000U values. I'll amend this entry and will post
v2 of the patch series shortly.

>> +	PLL_36XX_RATE(393216000U, 197, 3, 2, 25690),
>> +	PLL_36XX_RATE(361267200U, 301, 5, 2, 3671),
>> +	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
>> +	PLL_36XX_RATE(196608000U, 197, 3, 3, -25690),
>> +	PLL_36XX_RATE(180633600U, 301, 5, 3, 3671),
>> +	PLL_36XX_RATE(131072000U, 131, 3, 3, 4719),
>> +	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
>> +	PLL_36XX_RATE(65536000U, 131, 3, 4, 4719),
>> +	PLL_36XX_RATE(49152000U, 197, 3, 5, 25690),
>> +	PLL_36XX_RATE(45158400U, 301, 5, 3, 3671),
 >
> I got the fout value (180633609) instead of 45158400U
> when I used the M(301) P(5) S(3) K(3671).
 >
> fin_pll	        Recalc rate	mdiv	pdiv	sdiv	kdiv
> 24000000	180633609	301	5	3	3671

I'm going to drop this entry as it is not really needed now.

>> +	PLL_36XX_RATE(32768000U, 131, 3, 5, 4719),
>> +};

-- 
Regards,
Sylwester
