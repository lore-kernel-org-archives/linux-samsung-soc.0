From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: XCLKOUT in exynos5250 clock driver
Date: Fri, 26 Jul 2013 14:19:39 +0200
Message-ID: <51F2695B.8020109@gmail.com>
References: <20130725145158.GI9858@sirena.org.uk> <51F247B6.9010902@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:38182 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757080Ab3GZMTo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 08:19:44 -0400
Received: by mail-bk0-f45.google.com with SMTP id je9so1105520bkc.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2013 05:19:43 -0700 (PDT)
In-Reply-To: <51F247B6.9010902@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomasz Figa <t.figa@samsung.com>, Padmavathi Venna <padma.v@samsung.com>

On 07/26/2013 11:56 AM, Tushar Behera wrote:
> On 07/25/2013 08:21 PM, Mark Brown wrote:
>> I appear to be missing something in the clock driver for the exynos5250.
>> I'm looking at the Arndale schematic and I see that the audio master
>> clock is connected to XCLKOUT on the SoC.  However I can't see any
>> reference to XCLKOUT or anything similar in the clock driver or any of
>> the DTS files - where is this clock exposed by the clock driver?

This is something that's not yet supported in the mainline kernels I'm
afraid.

>> Unfortunately I haven't been able to get access to the datasheet for the
>> part so I can't check this myself.
>>
>
> Information as per Exynos5250 user manual:
> "XCLKOUT is an output pin for debugging clocks. Exynos5250 has a CLKOUT
> logic which can select one of the clocks (within its clock domains) and
> output that through XCLKOUT pin."
>
> Not sure if XCLKOUT on Arndale schematics means the same.

I suspect that the same, you can easily verify that by checking what ball
identifier corresponds to XCLKOUT pin and how the routing looks like on
the schematics.

We have a bit hackish patch that adds support for the CLKOUT at the
Exynos4 clocks driver to enable the audio codec. An issue here is that the
CLKOUT mux and divider control bitfield is in the PMU registers (as opposed
to CMU where the clock  control registers normally are) and additionally
single register contains the clock mux/divider bitfield as well as couple
other unrelated control bits. Depending if those other bits are considered
really important or not it it might another reason to expose (part of ?)
PMU registers through syscon-like interface. There are registers in PMU
that multiple drivers would be interested in, so instead of all of them to
independently memory map and mess with single registers, probably a regmap
interface could be used. Not sure if this solves the problem well, since
each driver would need to have coded SoC specific register offsets.

It can be seen in the Galaxy S3 kernel code how the Exynos5 CLKOUT handling
might look like. See enum xclkout_select [1], exynos5_pmu_xclkout_set [2].
It would be good someone who has access to the datasheet come up with at
with some patch so the audio works are not blocked. I'm not working right
now on Exynos5 :P.

[1] 
thttps://github.com/sgs3/GT-I9300_Kernel/blob/master/arch/arm/mach-exynos/include/mach/pmu.h
[2] 
https://github.com/sgs3/GT-I9300_Kernel/blob/master/arch/arm/mach-exynos/pmu-exynos5.c

--
Thanks,
Sylwester
