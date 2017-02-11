From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] Exynos5422-odroidxu3: Incomplete thermal-zones definition
Date: Sat, 11 Feb 2017 21:02:21 +0200
Message-ID: <20170211190221.3hweizsze467mu5o@kozik-lap>
References: <9e32c530-0d15-223f-c280-617f8ae2540d@gmail.com>
 <20170207212830.23mzswabqplece2s@kozik-lap>
 <20170210154634.57z4kvmo7giz4zej@kozik-lap>
 <e64b5db4-fd77-afdf-f6a5-ae398570e5e6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35226 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdBKTC1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2017 14:02:27 -0500
Received: by mail-wr0-f195.google.com with SMTP id o16so18588179wra.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2017 11:02:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <e64b5db4-fd77-afdf-f6a5-ae398570e5e6@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Willy WOLFF <willy.mh.wolff@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Sat, Feb 11, 2017 at 06:29:55PM +0000, Willy WOLFF wrote:
> > I confirmed your findings (taskset -c 5 dd if=/dev/zero of=/dev/null)
> > however thermal zones indices do not match CPU.
> > 
> > busy CPU              | the most rising temp | TMU zone for this diff
> > =====================================================================
> > CPU4 (first A15)      | 52                   | thermal_zone0
> > CPU5                  | 70                   | thermal_zone3
> > CPU6                  | 74                   | thermal_zone2
> > CPU7                  | 66                   | thermal_zone1
> > CPU5-CPU7             | 97                   | thermal_zone3 (but 2 similar)
> > 
> > The sensors are not showing the same temperature - neither in idle nor
> > in busy cycle. Maybe they are not properly calibrated or located in
> > symmetric location?
> I think it's both. I have four xu3, two of them give wrong values,
> like around 20degC when busy, where the idle cores are around 55decC.
> But my two other boards give sound values. So, maybe the industrial
> process behind it's not the best, or something wrong happen on the initialisation ...

I am debugging this now (and getting angry because my XU3 board is 2500
km away...) but it looks like issue in the current mainline thermal
driver. The Hardkernel's 3.10 kernel shows different values.

> 
> Also, even if all cores are idling, it's not surprising that they don't
> have same thermal values. Depending on the floorplan, you will never have
> exact same homogeneous behaviour.

Yes, okay, but thermal zone0 should not have ~28 degrees which is just
few above room temperature. :)

> > However the difference between idle and busy states is more or less
> > similar between thermal zones - making one A15 busy heats:
> > 1. associated thermal zone by 21-26 degrees of C,
> > 2. other thermal zones by 13-18 degrees (zone 3 is weird here).
> > 
> > Thermal zone 4 is probably GPU.
> Yes it is, the actual definition for the gpu is made by 
> includes chain exynos5800.dtsi -> exynos5420.dtsi
> And no cooling maps action are defined. I don't use the gpu at all for now, 
> so I don't check its thermal behaviour.
> 
> > Anyway the bindings for thermal zones are not nice in this case and they
> > require huge duplication of data... Maybe this could be done smarter
> > way...
> Indeed! I check the thermal framework source code, and it's a known problem:
> https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/tree/drivers/thermal/of-thermal.c?h=for-next#n461
> So, if we modify the thermal framework for handling multiple sensors by one
> thermal zone, what we can actually do in the dts is something like:
> [...]
> cpu_thermal: cpu-thermal {
> 			thermal-sensors = <&tmu_cpu0 0 &tmu_cpu1 0 &tmu_cpu2 0 &tmu_cpu3 0>;
> 			polling-delay-passive = <250>;
> 			polling-delay = <0>;

This would make sense. It needs however fixing thermal zone0 weird
levels.

> [...]
> gpu_thermal: ...
> [...]
> 
> I plan to change that, but I will need some advice.
> I will start working on it next month. But feel free to do it correctly,
> I'm still young on kernel hacking.
> 
> 
> By the way, what is the purpose of the parameter
>  thermal-sensors = <&tmu_cpu0 0>; in it's current definition?
> I try to understand, but found no clue. 
> By https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/tree/Documentation/devicetree/bindings/thermal/thermal.txt?h=for-next#n318
> the parameters are used to identify the accounting sensor from the sensors rail definition.
> But in the current definition, #thermal-sensor-cells is set to 0,
> by includes chain: exynos5800.dtsi -> exynos5420.dtsi -> exynos4412-tmu-sensor-conf.dtsi
> 
> So something is wrong here, or I don't understand exactly.
> I see no difference by removing this paramter.
>

It is the index of sensor within device providing it - tmu_cpu0. Some
device might provide many sensors so it would be <&tmu_cpu0 0>,
<&tmu_cpu0 1> etc. In our case we have only one sensor per thermal
device (TMU).

This is documented in the bindings you linked
(Documentation/devicetree/bindings/thermal/thermal.txt) in chapter "(b)
- IC with several internal sensors".

Solution interesting in Exynos case might be "(c) - Several sensors within one
single thermal zone".

> I have only a xu3 board. I don't have any other derivate machine with exynos chip.
> Does all exynos big.LITTLE based has a thermal sensor per big core?

Exynos4 has only one TMU. Exynos5410 has the same as Exynos5422. It all
depends on the chipset.

Best regards,
Krzysztof
