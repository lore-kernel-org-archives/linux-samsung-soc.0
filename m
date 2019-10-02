From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v13 0/8] Exynos5 Dynamic Memory Controller driver
Date: Wed, 2 Oct 2019 08:01:05 +0200
Message-ID: <7c8cd09c-aa6b-29e4-1208-2476027d9c85@partner.samsung.com>
References: <CGME20190821104316eucas1p2ecd715f3105921ec83e0acf1291201f8@eucas1p2.samsung.com>
        <20190821104303.32079-1-l.luba@partner.samsung.com>
        <20191001192947.GA1815@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001192947.GA1815@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org


On 10/1/19 9:29 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 21, 2019 at 12:42:55PM +0200, Lukasz Luba wrote:
>> Hi all,
>>
>> This is v13 which makes cosmetic changes. It is based on current mainline
>> (v5.3-rc5) with with devfreq/for-next where there is a PPMU patch [1].
>>
>> The patch set adds support of Dynamic Memory Controller for Exynos5422 SoC.
>> The driver supports Dynamic Voltage and Frequency Scaling
>> for the DMC and DRAM. It also provides needed timings for different
>> speed operations of the DRAM memory.
>> There is also new generic code in of_memory and headers which allows to parse
>> LPDDR3 memories defined in device-tree.
>>
>> Here are the last changes suggested by Krzysztof during his review.
>> For the previous changes in older revisions please refer to [2], there is
>> more detailed change log.
>>
>> changes:
>> v13:
>> - skipped patch with chipID changes in DT, since it is not used anymore,
>> - removed license comment in of_memory.c since SPDX has been merged,
>> - aligned comment to the current fields in the structure,
>> - changed printed warning when timings are not found,
>>
>> Regards,
>> Lukasz Luba
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git/commit/?h=for-next&id=b617376df8f01c975dee66802f4da16291f92079
>> [2] https://protect2.fireeye.com/url?k=76a66a31f783ea89.76a7e17e-142fcaf2360aff73&u=https://lkml.org/lkml/2019/7/22/251
>>
>>
>> Lukasz Luba (8):
>>    dt-bindings: ddr: rename lpddr2 directory
>>    dt-bindings: ddr: add LPDDR3 memories
>>    drivers: memory: extend of_memory by LPDDR3 support
>>    dt-bindings: memory-controllers: add Exynos5422 DMC device description
>>    drivers: memory: add DMC driver for Exynos5422
>>    ARM: dts: exynos: add syscon to clock compatible
>>    ARM: dts: exynos: add DMC device for exynos5422
>>    ARM: exynos_defconfig: enable DMC driver
>>
> 
> Just to let you know:
> 
> I applied the set some days ago but this did not make to merge window.
> Now, I put it on for-next branch so will appear on linux-next soon. I
> also applied the fixes sent later.

Thank you Krzysztof!

> 
> I'll take also the latest work with interrupt mode for DMC (after minor
> fix in bindings).
> 

I will send the latest IRQ mode version with this binding IRQ names
description in a minute.

Regards,
Lukasz
