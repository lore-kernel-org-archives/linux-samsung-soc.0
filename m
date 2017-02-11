From: Willy WOLFF <willy.mh.wolff@gmail.com>
Subject: Re: [PATCH] Exynos5422-odroidxu3: Incomplete thermal-zones definition
Date: Sat, 11 Feb 2017 18:29:55 +0000
Message-ID: <e64b5db4-fd77-afdf-f6a5-ae398570e5e6@gmail.com>
References: <9e32c530-0d15-223f-c280-617f8ae2540d@gmail.com>
 <20170207212830.23mzswabqplece2s@kozik-lap>
 <20170210154634.57z4kvmo7giz4zej@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36406 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbdBKSaA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2017 13:30:00 -0500
Received: by mail-wm0-f67.google.com with SMTP id r18so11738686wmd.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2017 10:29:59 -0800 (PST)
In-Reply-To: <20170210154634.57z4kvmo7giz4zej@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Thanks for your interest.

On 10/02/2017 15:46, Krzysztof Kozlowski wrote:
> On Tue, Feb 07, 2017 at 11:28:30PM +0200, Krzysztof Kozlowski wrote:
> 
> (...)
> 
>>> +				/*
>>> +				 * When reaching cpu0_alert4, reduce CPU
>>> +				 * further, down to 600 MHz (12 steps for big,
>>> +				 * 7 steps for LITTLE).
>>> +				 */
>>> +				map5 {
>>> +					trip = <&cpu0_alert4>;
>>> +					cooling-device = <&cpu0 3 7>;
>>> +				};
>>> +				map6 {
>>> +					trip = <&cpu0_alert4>;
>>> +					cooling-device = <&cpu4 3 12>;
>>> +				};
>>
>> That is a quite big code duplication with a lot of possible errors to do
>> (differs only by cpu number). We should do this in a smarter way.
>>
>> How about extending the thermal driver for setting the trips also for
>> other thermal zones?
>>
>>> +			};
>>> +		};
>>> +		cpu1_thermal: cpu1-thermal {
>>> +			thermal-sensors = <&tmu_cpu1 0>;
> 
> I confirmed your findings (taskset -c 5 dd if=/dev/zero of=/dev/null)
> however thermal zones indices do not match CPU.
> 
> busy CPU              | the most rising temp | TMU zone for this diff
> =====================================================================
> CPU4 (first A15)      | 52                   | thermal_zone0
> CPU5                  | 70                   | thermal_zone3
> CPU6                  | 74                   | thermal_zone2
> CPU7                  | 66                   | thermal_zone1
> CPU5-CPU7             | 97                   | thermal_zone3 (but 2 similar)
> 
> The sensors are not showing the same temperature - neither in idle nor
> in busy cycle. Maybe they are not properly calibrated or located in
> symmetric location?
I think it's both. I have four xu3, two of them give wrong values,
like around 20degC when busy, where the idle cores are around 55decC.
But my two other boards give sound values. So, maybe the industrial
process behind it's not the best, or something wrong happen on the initialisation ...

Also, even if all cores are idling, it's not surprising that they don't
have same thermal values. Depending on the floorplan, you will never have
exact same homogeneous behaviour.


> 
> However the difference between idle and busy states is more or less
> similar between thermal zones - making one A15 busy heats:
> 1. associated thermal zone by 21-26 degrees of C,
> 2. other thermal zones by 13-18 degrees (zone 3 is weird here).
> 
> Thermal zone 4 is probably GPU.
Yes it is, the actual definition for the gpu is made by 
includes chain exynos5800.dtsi -> exynos5420.dtsi
And no cooling maps action are defined. I don't use the gpu at all for now, 
so I don't check its thermal behaviour.

> Anyway the bindings for thermal zones are not nice in this case and they
> require huge duplication of data... Maybe this could be done smarter
> way...
Indeed! I check the thermal framework source code, and it's a known problem:
https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/tree/drivers/thermal/of-thermal.c?h=for-next#n461
So, if we modify the thermal framework for handling multiple sensors by one
thermal zone, what we can actually do in the dts is something like:
[...]
cpu_thermal: cpu-thermal {
			thermal-sensors = <&tmu_cpu0 0 &tmu_cpu1 0 &tmu_cpu2 0 &tmu_cpu3 0>;
			polling-delay-passive = <250>;
			polling-delay = <0>;
[...]
gpu_thermal: ...
[...]

I plan to change that, but I will need some advice.
I will start working on it next month. But feel free to do it correctly,
I'm still young on kernel hacking.


By the way, what is the purpose of the parameter
 thermal-sensors = <&tmu_cpu0 0>; in it's current definition?
I try to understand, but found no clue. 
By https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/tree/Documentation/devicetree/bindings/thermal/thermal.txt?h=for-next#n318
the parameters are used to identify the accounting sensor from the sensors rail definition.
But in the current definition, #thermal-sensor-cells is set to 0,
by includes chain: exynos5800.dtsi -> exynos5420.dtsi -> exynos4412-tmu-sensor-conf.dtsi

So something is wrong here, or I don't understand exactly.
I see no difference by removing this paramter.


I have only a xu3 board. I don't have any other derivate machine with exynos chip.
Does all exynos big.LITTLE based has a thermal sensor per big core?

> 
> Full data:
> https://docs.google.com/spreadsheets/d/1XOpRCK0YjnxaZgjLcasRdKXaFFVh3EqyvrDi_YcmBGE/edit?usp=sharing
On your test, it's two different kernel, but executed on the same board?
Stupid question but want to be sure.

> 
> 
> Best regards,
> Krzysztof
> 

Best Regards,
Willy
