From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add soc node to exynos4
Date: Tue, 6 Feb 2018 14:22:11 +0100
Message-ID: <CAJKOXPeeG2SN-ePmPQ3SOS=6_G2iBitCwU9CY0ArGf-Y6tdkcQ@mail.gmail.com>
References: <CGME20180205112603eucas1p17d1b5ef274e9541b785320a59f855c2a@eucas1p1.samsung.com>
 <1517829936-26311-1-git-send-email-m.purski@samsung.com> <1517829936-26311-2-git-send-email-m.purski@samsung.com>
 <CAJKOXPec6=SiwgcRBixwt+DjhyKvoK+nPYOSpHuUGgWL8vDHbQ@mail.gmail.com> <17e8871f-71c9-7cd5-e57d-efb8fbc21f1f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751913AbeBFNWO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:22:14 -0500
In-Reply-To: <17e8871f-71c9-7cd5-e57d-efb8fbc21f1f@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Tue, Feb 6, 2018 at 12:24 PM, Maciej Purski <m.purski@samsung.com> wrote:
>
>
> On 02/05/2018 04:02 PM, Krzysztof Kozlowski wrote:
>>
>> On Mon, Feb 5, 2018 at 12:25 PM, Maciej Purski <m.purski@samsung.com>
>> wrote:
>>>
>>> Soc nodes are used in other exynos DTS. Exynos4 boards should use them
>>> as well.
>>>
>>> Signed-off-by: Maciej Purski <m.purski@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos4.dtsi | 1727
>>> ++++++++++++++++++++--------------------
>>>   1 file changed, 872 insertions(+), 855 deletions(-)
>>>
>>
>> This brings some new DTC warnings:
>> arch/arm/boot/dts/exynos4210-origen.dtb: Warning (simple_bus_reg):
>> Node /soc/video-phy missing or empty reg/ranges property
>> arch/arm/boot/dts/exynos4210-origen.dtb: Warning (simple_bus_reg):
>> Node /soc/pmu missing or empty reg/ranges property
>>
>
> The above warnings seem to be old. We just don't have "reg" property in
> video-phy.
>
>> arch/arm/boot/dts/exynos4412-itop-elite.dtb: Warning
>> (interrupts_property): interrupts size is (32), expected multiple of
>> 12 in /pmu
>>
>
> These warnings occured, because "pmu" node was redefined in exynos4412.dtsi.
> I have missed it in the previous patchset. I'll fix this in a new patch.

Missed in previous patchset? You mean the label of camera nodes? How
did you touched it there?

Best regards,
Krzysztof
