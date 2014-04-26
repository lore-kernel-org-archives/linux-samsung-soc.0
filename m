From: Pankaj Dubey <dubepankaj1980@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Sat, 26 Apr 2014 11:33:34 +0900
Message-ID: <CAGcde9G1ynoOM9MqLbU05wzMGD=zC6NxqTY9EAOOFEa1Pr4fUg@mail.gmail.com>
References: <1397479700-15864-1-git-send-email-chanho61.park@samsung.com>
 <1397479700-15864-2-git-send-email-chanho61.park@samsung.com>
 <535936A7.9050003@samsung.com> <CAGm_ybjhcAqX7biOvqLMgzHPQK=-EtaHtXpCtcJ1rcdRsxN_Og@mail.gmail.com>
 <535AF52F.4090906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:44800 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDZCd4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 22:33:56 -0400
In-Reply-To: <535AF52F.4090906@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Vikas Sajjan <sajjan.linux@gmail.com>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, k.debski@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanho Park <chanho61.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Tomasz,

On Sat, Apr 26, 2014 at 8:52 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Vikas,
>
>
> On 25.04.2014 10:05, Vikas Sajjan wrote:
>>
>> Hi,
>>
>>
>> On Thu, Apr 24, 2014 at 9:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>>>
>>> Hi Chanho,
>>>
>>>
>>> On 14.04.2014 14:48, Chanho Park wrote:
>>>>
>>>>
>>>> This patch adds a PMU(Power Management Unit) syscon node. This
>>>> should be required for USB Phy syscon regmap I/F.
>>>>
>>>> Cc: Tomasz Figa <t.figa@samsung.com>
>>>> Cc: Kamil Debski <k.debski@samsung.com>
>>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>>> ---
>>>>    arch/arm/boot/dts/exynos4.dtsi | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>>>> b/arch/arm/boot/dts/exynos4.dtsi
>>>> index 2f8bcd0..e565b86 100644
>>>> --- a/arch/arm/boot/dts/exynos4.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>>>> @@ -110,6 +110,11 @@
>>>>                  reg = <0x10010000 0x400>;
>>>>          };
>>>>
>>>> +       pmu_reg: syscon@10020000 {
>>>> +               compatible = "samsung,exynos4-pmureg", "syscon";
>>>
>>>
>>
>>   Assume a case where exynos PMU is made as platform driver [1] and we
>> need use the compatible  "samsung,exynos4-pmureg" in the driver.
>> But since syscon driver uses compatible "syscon" and once the syscon
>> driver is probed, the  exynos PMU platform driver [1] will NEVER be
>> probed.
>> So my question is, can we have 2 compatible strings for a DT node, and
>> both the compatible strings are used for probing purpose?
>> Recently I faced this issue on exynos5250, where i was testing PMU
>> driver [1] and I noticed that  PMU driver [1] was NEVER probed, if I
>> enable syscon driver in menuconfig.
>
>
> No, it is not possible to bind two drivers with different compatible strings
> to the same node. Basically this is because only one platform driver can be
> bound to particular platform device.
>

Yes, correct.

> The rule is that the most specific compatible string (e.g. the first from
> the left) that matches should be used, but I'm not sure if this is
> implemented this way in Linux kernel, especially considering that a platform
> driver usually probes when it is being registered. So we might have a race
> here, which you can work around by making sure that your PMU driver is
> always registered first (e.g. by lowering its initcall level).
>

I don't see it's using first compatible string from the left. I can
see whichever driver registers platform driver first, it's probe is
getting called. As in this particular case, PMU has two compatibility
string as "samsung, exynosxxx-pmu", "syscon". But since "syscon"
driver registers it's platform driver in postcore_initcall where as
PMU platform driver [1], was registering as arch_initcall, only
"syscon" probe got called.

In my V2 patch for converting PMU as driver form, I dropped idea of
converting into platform driver, because we can't remove "syscon" from
binding as many other driver wants to access PMU register via regmap
handle. By lowering it's initcall level may be I can make PMU probe
gets called but then how other drivers will be able to access PMU
regmap handles?

> Best regards,
> Tomasz
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
