From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] devfreq: exynos-bus: workaround dev_pm_opp_set_rate()
 errors on Exynos5422/5800 SoCs
Date: Fri, 11 Oct 2019 13:33:53 +0200
Message-ID: <0ce56e65-d989-18f8-af84-2fbd74ba20aa@samsung.com>
References: <CGME20191008134950eucas1p15cfef5800efc10d5b18ec5eb37dde60b@eucas1p1.samsung.com>
        <20191008134923.30123-1-k.konieczny@partner.samsung.com>
        <4f14d3af-e455-d05b-fc03-cba58e001f41@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4f14d3af-e455-d05b-fc03-cba58e001f41@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 10.10.2019 04:50, Chanwoo Choi wrote:
> On 2019년 10월 08일 22:49, k.konieczny@partner.samsung.com wrote:
>> Commit 4294a779bd8d ("PM / devfreq: exynos-bus: Convert to use
>> dev_pm_opp_set_rate()") introduced errors:
>> exynos-bus: new bus device registered: soc:bus_wcore ( 84000 KHz ~ 400000 KHz)
>> exynos-bus: new bus device registered: soc:bus_noc ( 67000 KHz ~ 100000 KHz)
>> exynos-bus: new bus device registered: soc:bus_fsys_apb (100000 KHz ~ 200000 KHz)
>> ...
>> exynos-bus soc:bus_wcore: dev_pm_opp_set_rate: failed to find current OPP for freq 532000000 (-34)
>> exynos-bus soc:bus_noc: dev_pm_opp_set_rate: failed to find current OPP for freq 111000000 (-34)
>> exynos-bus soc:bus_fsys_apb: dev_pm_opp_set_rate: failed to find current OPP for freq 222000000 (-34)
>>
>> They are caused by incorrect PLL assigned to clock source, which results
>> in clock rate outside of OPP range. Add workaround for this in
>> exynos_bus_parse_of() by adjusting clock rate to those present in OPP.
> If the clock caused this issue, you can set the initial clock on DeviceTree
> with assigned-clock-* properties. Because the probe time of clock driver
> is early than the any device drivers.
>
> It is not proper to fix the clock issue on other device driver.
> I think you can fix it by using the supported clock properties.

This issue is about something completely different. The OPPs defined in 
DT cannot be applied, because it is not possible to derive the needed 
clock rate from the bootloader-configured clock topology (mainly due to 
lack of common divisor values for some of the parent clocks). Some time 
ago Lukasz tried initially to redefine this clock topology using 
assigned-clock-rates/parents properties (see 
https://lkml.org/lkml/2019/7/15/276), but it has limitations and some 
such changes has to be done in bootloader. Until this is resolved, 
devfreq simply cannot set some of the defined OPPs.

This issue was there from the beginning, recent Kamil's patch only 
revealed it. In fact it was even worse - devfreq and common clock 
framework silently set lower clock than the given OPP defined.

>> Fixes: 4294a779bd8d ("PM / devfreq: exynos-bus: Convert to use dev_pm_opp_set_rate()")
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>   drivers/devfreq/exynos-bus.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
>> index c832673273a2..37bd34d5625b 100644
>> --- a/drivers/devfreq/exynos-bus.c
>> +++ b/drivers/devfreq/exynos-bus.c
>> @@ -243,7 +243,7 @@ static int exynos_bus_parse_of(struct device_node *np,
>>   {
>>   	struct device *dev = bus->dev;
>>   	struct dev_pm_opp *opp;
>> -	unsigned long rate;
>> +	unsigned long rate, opp_rate;
>>   	int ret;
>>   
>>   	/* Get the clock to provide each bus with source clock */
>> @@ -267,13 +267,21 @@ static int exynos_bus_parse_of(struct device_node *np,
>>   	}
>>   
>>   	rate = clk_get_rate(bus->clk);
>> -
>> -	opp = devfreq_recommended_opp(dev, &rate, 0);
>> +	opp_rate = rate;
>> +	opp = devfreq_recommended_opp(dev, &opp_rate, 0);
>>   	if (IS_ERR(opp)) {
>>   		dev_err(dev, "failed to find dev_pm_opp\n");
>>   		ret = PTR_ERR(opp);
>>   		goto err_opp;
>>   	}
>> +	/*
>> +	 * FIXME: U-boot leaves clock source at incorrect PLL, this results
>> +	 * in clock rate outside defined OPP rate. Work around this bug by
>> +	 * setting clock rate to recommended one.
>> +	 */
>> +	if (rate > opp_rate)
>> +		clk_set_rate(bus->clk, opp_rate);
>> +
>>   	bus->curr_freq = dev_pm_opp_get_freq(opp);
>>   	dev_pm_opp_put(opp);
>>   
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
