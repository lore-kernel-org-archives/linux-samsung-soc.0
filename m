From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 4/8] soc: samsung: Add Exynos Adaptive Supply
 Voltage driver
Date: Tue, 9 Apr 2019 19:40:24 +0200
Message-ID: <b64a8475-a31c-ea25-2d8e-4840daa8a54c@samsung.com>
References: <CGME20190404172238epcas2p21ef28f46b728127dcd6e8ee72752a1b8@epcas2p2.samsung.com>
        <20190404171735.12815-1-s.nawrocki@samsung.com>
        <20190404171735.12815-5-s.nawrocki@samsung.com>
        <CAJKOXPevELAn6ZQGKwpTOVdvyevzMmPnsO52VvF-MCk=X3Myhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPevELAn6ZQGKwpTOVdvyevzMmPnsO52VvF-MCk=X3Myhg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 4/5/19 12:24, Krzysztof Kozlowski wrote:
> I have a lot of minor nits all around and few more architecture-like comments.
> 
> I think this should be a driver. You initialize it quite late and it
> is required by other drivers (cpufreq, devfreq), not by core.

Thanks for your comments, it helped me to finally get around and convert
this code to proper driver.  The advantage is that it can be more 
reliably ensured that the ASV driver updates OPPs properly after they
have been parsed from DT by cpufreq-dt or other drivers.  And if we 
add support for the Body Bias through regulator API it would be easier
to acquire the regulator resource, i.e. deferred probing could ensure 
proper driver probe ordering.
 
> I would also prefer it to be slightly more generic. I mean, now you
> get the tables from "samsung,exynos-asv-v1" node and then, depending
> on many different compatibles, you do this or that. If it is
> samsung,exynos5800, you call 542x code. If it is hardkernel, you
> assume it is bin2. This will be not easily portable to other Exynos
> chips and other boards (e.g. you need to update the driver for new
> board which is forced to be in bin2).

The bin2 part for Odroid XU3 Lite is really a hack and I wish it was 
not there. It seems there is not enough data fused in the SoC to 
properly detect chips used on XU3 Lite. 

> Instead all this information should come from chipid and/or DT. I

Perhaps we could try to be more generic but I'm afraid in practice 
we will need to have some logic coded in the driver per each SoC type 
anyway. We could probably add DT property in chipid node to provide 
missing data that is normally read from CHIPID registers. The BIN2
flag is really about forcing specific ASV table. The "special group"
quirk means different thing for each SoC type, in case of exynos5422
it's selecting different method of the ASV group decoding.
It's a bit hard to try to put anything in DT with sparse or missing
documentation of such quirks.

> could imagine that the device binds to ASV node and parses its
> properties. Optionally it could bind to chipid... but then you would

The ASV node on older SoCs doesn't correspond to real hardware so
we shouldn't try to bind drivers to it I'd say. The chipid node 
seems a better alternative to me.
I'm thinking about dropping 'asv' node completely. But then the 
table sub-nodes would need to be put into chipid node.

> have two devices on same node. Then depending on the of_device_id
> match, you have all necessary static configuration data (the same as
> PMU driver or all other typical drivers). Dynamic data you read from
> chip id.

I will post next version of the patch series and we could continue
discussion from there, I have switched to of_device_id matching but
left per SoC init function.

> On Thu, 4 Apr 2019 at 19:22, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>>
>> The Adaptive Supply Voltage (ASV) on Exynos SoCs is a technique of adjusting
>> operating points of devices in order to better match actual capabilities
>> of the hardware and optimize power consumption.
>>
>> This patch adds common code for parsing the ASV tables from devicetree
>> and updating CPU OPPs.
>>
>> Also support for Exynos5422/5800 SoC is added, the Exynos5422 specific part
>> of the patch is partially based on code from
>> https://github.com/hardkernel/linux repository, branch odroidxu4-4.14.y,
>> files: arch/arm/mach-exynos/exynos5422-asv.[ch].
>>
>> Tested on Odroid XU3, XU4, XU3 Lite.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---

>> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
>> index 2905f5262197..4d121984f71a 100644
>> --- a/drivers/soc/samsung/Kconfig
>> +++ b/drivers/soc/samsung/Kconfig
>> @@ -7,6 +7,17 @@ menuconfig SOC_SAMSUNG
>>
>>  if SOC_SAMSUNG
>>
>> +config EXYNOS_ASV
>> +       bool "Exynos Adaptive Supply Voltage support" if COMPILE_TEST
>> +       depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
> 
> Why it cannot be compile tested outside of ARM? The PMU driver has
> this constraint because of asm/cputype.h but you probably do not need
> it.

Yes, it's not needed, I will drop the (ARM || ARM64) part in next iteration. 

>> diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
>> new file mode 100644
>> index 000000000000..60532c7eb3aa
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-asv.c
>> @@ -0,0 +1,279 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018 - 2019 Samsung Electronics Co., Ltd.
> 
> Since it is first publish date, copyright should be only 2019....
> unless this was copied from hardkernel repo but then original
> copyright should be included as well.

I will change it to 2019. I have written code in this file from 
scratch by myself. Some reused code is in exynos5422-asv.c, I will 
copy the original copyright notice there, however it is same 
Samsung's copyright notice, only with 2012 date.

-- 
Regards,
Sylwester
