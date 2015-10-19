From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 7/7] ARM: EXYNOS: Remove code for restart and poweroff for
 exynos SoCs
Date: Mon, 19 Oct 2015 21:36:09 +0530
Message-ID: <CAGOxZ50nH1UtRrA4nJTvYdsiydNWUvY413gY0q7tRaDFaX_T1Q@mail.gmail.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-8-git-send-email-alim.akhtar@samsung.com>
 <562494F8.6070003@samsung.com> <5624BE39.7020605@osg.samsung.com> <CAJKOXPcvKeDNwof5eyD5XjzUiZrHoyShD8gOPGo7uUxEyypQbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:33020 "EHLO
	mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbbJSQGu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 12:06:50 -0400
In-Reply-To: <CAJKOXPcvKeDNwof5eyD5XjzUiZrHoyShD8gOPGo7uUxEyypQbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi krzysztof,

On Mon, Oct 19, 2015 at 6:58 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-10-19 18:56 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
>> Hello,
>>
>> On 10/19/2015 09:00 AM, Krzysztof Kozlowski wrote:
>>> On 19.10.2015 15:03, Alim Akhtar wrote:
>>>> Now we can use the generic syscon-{reboot/poweroff} drivers,
>>>> so we don't need special handling for reboot/poweroff in
>>>> exynos pmu driver. This patch remove the same.
>>>>
>>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>>> ---
>>>>  arch/arm/mach-exynos/pmu.c |   43 -------------------------------------------
>>>>  1 file changed, 43 deletions(-)
>>>
>>> I think that removal of this stuff will effectively remove the
>>> restart/poweroff handlers from:
>>> 1. Other defconfigs, like multi_v7
>>> 2. Custom configs.
>>>
>>
>> This will also break old DTBs that don't have a "syscon-poweroff" device
>> node that contains the necessary PMU regmap, offset and mask information.
>
> I am not sure whether this is ABI break issue. There was no compatible
> mentioning that "reset works" which now would be replaced. The
> existing PMU compatible (like samsung,exynos4412-pmu) does not mention
> "reset" as a feature coming with this compatible.
>
> So no ABI break.
>
You are right, there is no DT ABI break here.

>
>>
>>> Previously this code was always compiled in for ARCH_EXYNOS. Now it is
>>> not so I am thinking about selecting necessary drivers from main exynos
>>> Kconfig symbol. That could be tricky though, because "select" should be
>>> used only for non-visible symbols.
>>>
>>> Any ideas how to solve that?
>>>
>>
>> Is true that select should only be used for non-visible symbols but there
>> are others user visible symbols that are selected by ARCH_EXYNOS such as
>> EXYNOS_THERMAL. So I think selecting the regmap syscon reset stuff there
>> is a sensible option.
>
> Selecting from defconfig is not sufficient... since I do not have
> other idea than selecting then ovak, but Alim please check it whether
> it does not create circular dependencies on various configs.
>
I checked in multi_v7_defconfig SYSCON_RESET is already enabled by
default. so I doubt we are going to run into any circular
dependencies, will check again..thanks.

> Best regards,
> Krzysztof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
