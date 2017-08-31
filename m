From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 2/4] arm: dts: exynos: add exynos5420 cpu
 capacity-dmips-mhz information
Date: Thu, 31 Aug 2017 11:36:07 +0100
Message-ID: <94c1d6c6-655a-2a63-1f01-06ac45990388@arm.com>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
 <20170830144120.9312-3-dietmar.eggemann@arm.com>
 <20170830202650.mdlxy2c3uwuq5vde@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54034 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750790AbdHaKgL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 06:36:11 -0400
In-Reply-To: <20170830202650.mdlxy2c3uwuq5vde@kozik-lap>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@arm.com>

On 30/08/17 21:26, Krzysztof Kozlowski wrote:
> On Wed, Aug 30, 2017 at 03:41:18PM +0100, Dietmar Eggemann wrote:
>> The following 'capacity-dmips-mhz' dt property values are used:
>>
>> Cortex-A15: 1024, Cortex-A7: 539
>>
>> They have been derived from the cpu_efficiency values:
>>
>> Cortex-A15: 3891, Cortex-A7: 2048
>>
>> by scaling them so that the Cortex-A15s (big cores) use 1024.
>>
>> The cpu_efficiency values were originally derived from the "Big.LITTLE
>> Processing with ARM Cortex™-A15 & Cortex-A7" white paper
>> (http://www.cl.cam.ac.uk/~rdm34/big.LITTLE.pdf). Table 1 lists 1.9x
>> (3891/2048) as the Cortex-A15 vs Cortex-A7 performance ratio for the
>> Dhrystone benchmark.
>>
>> The following platforms are affected once cpu-invariant accounting
>> support is re-connected to the task scheduler:
>>
>> arndale-octa, peach-pi, peach-pit, smdk5420
>>
>> The patch has been tested on Samsung Chromebook 2 13" (peach-pi, Exynos
>> 5800).
>>
>> $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
>> 1024
>> 1024
>> 1024
>> 1024
>> 389
>> 389
>> 389
>> 389
> 
> I am missing something... shouldn't this be 539? Or is it scaled with
> the clock-frequency (1 GHz) value?

Yeah, the capacity-dmips-mhz dt value of 539 for the little cpus is
scaled by 1.3/1.8 (max cpu capacity/ system wide max cpu capacity):

539 * 1.3/1.8 = 389

This max cpu capacity scaling is part of both solutions, the 'cpu
capacity-dmips-mhz' and the 'cpu_efficiency/clock-frequency dt property'
one.

The (original*) cpu capacity on a heterogeneous platform expresses uArch
and max cpu frequency differences between the (logical) cpus of the
system.

* not further reduced by rt and/or irq pressure.

[...]
