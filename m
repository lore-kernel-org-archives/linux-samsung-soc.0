From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: CPUIdle for Exynos5422 Odroid-XU3/XU4 boards.
Date: Sun, 23 Aug 2015 10:26:28 +0900
Message-ID: <CAJKOXPeFVwmRzP3YPSaJ_PtNf3L3pzXSXVqHwyYfWDYwhTmsBQ@mail.gmail.com>
References: <CANAwSgTWZ1a+j8RTiamsKaALKf+ekLVqtO6RFTLXkG=bJN4BPQ@mail.gmail.com>
	<55D5FBDB.4040904@free.fr>
	<CANAwSgRHEXuNt1PJY89ujificXj70BhbGhSOpL16yKsKr6hWcQ@mail.gmail.com>
	<55D676E8.8020802@samsung.com>
	<CANAwSgR-d-mPnvmi19fiyt89g_B1UkuCya9=4e_19muv-UZrCQ@mail.gmail.com>
	<55D6A23C.5020403@samsung.com>
	<55D6D185.5070909@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:35833 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909AbbHWB03 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Aug 2015 21:26:29 -0400
Received: by qgj62 with SMTP id 62so67487244qgj.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2015 18:26:28 -0700 (PDT)
In-Reply-To: <55D6D185.5070909@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Daniel Lezcano <daniel.lezcano@free.fr>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Przemyslaw Marczak <p.marczak@samsung.com>

2015-08-21 16:21 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
> [Adding Przemyslaw Marczak who was working on porting Odroid BL1/BL2/SPL]
>
> Hello,
>
> On 08/21/2015 05:59 AM, Krzysztof Kozlowski wrote:
>> On 21.08.2015 12:41, Anand Moon wrote:
>>> Hi Krzysztof,
>>>
>>> On 21 August 2015 at 06:25, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>>>> On 21.08.2015 03:15, Anand Moon wrote:
>>>>> Hi Daniel,
>>>>>
>>>>> On 20 August 2015 at 21:40, Daniel Lezcano <daniel.lezcano@free.fr> wrote:
>>>>>> On 08/20/2015 12:54 PM, Anand Moon wrote:
>>>>>>>
>>>>>>> Hello Krzysztof/Kukjim,
>>>>>>>
>>>>>>> CPUIdle seen to be not working for Exynos5422 Odroid boards.
>>>>>>>
>>>>>>> Is their any way this feature will be implemented in the future.
>>>>>>
>>>>>>
>>>>>> Yeah a good willing to fix the bl1. More than one year asking for that !
>>>>>> nooo way !!
>>>>>>
>>>>>> Your answer is at the end of
>>>>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/350632.html
>>>>>>
>>>>>>
>>>>>
>>>>> Thanks for the explanation.
>>>>>
>>>>> I was just referring following the source code.
>>>>>
>>>>> https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/mach-exynos/cpuidle-exynos5422.c
>>>>>
>>>>> It seem that cpufreq and cpuidle go hand in hand.
>>>>
>>>> Bartlomiej was working on cpufreq for Exynos542x:
>>>> http://lkml.iu.edu/hypermail/linux/kernel/1504.2/03139.html
>>>>
>>>> It would be nice to have also cpuidle and suspend features working on
>>>> Exynos542x family but this depends on firmware. Some time ago I
>>>> struggled with suspend on Arndale Octa (Exynos5420) and I failed. I
>>>> think the firmware is the issue here.
>
> There were a lot of Suspend-to-RAM bug fixes lately mostly related to
> critical clocks being gated. It would be nice to give a try on recent
> kernels and see if is still not working.
>
>>>>
>>>> Actually I am not sure what is your question Anand. You are asking if
>>>> someone plans to do this?
>>>
>>> Yes I am asking are their plans to implement cpufreq and cpuidle simultaneously.
>>
>> There are no obstacles for implementing them simultaneously so the
>> question is rather who plans to do the cpuidle driver for Exynos542x? I
>
> If the firmware is in a good shape (unfortunately as mentioned by Daniel,
> the one in the Odroids are not) then the generic ARM big.LITTLE CPUidle
> driver (CONFIG_ARM_BIG_LITTLE_CPUIDLE) should work.
>
> It is at least working for me on the Exynos5800 based Peach Pi Chromebook:
>
> $ cat /sys/devices/system/cpu/cpuidle/current_driver
> big_idle
>
> $ cat /sys/devices/system/cpu/cpu0/cpuidle/state*/name
> WFI
> C1
>
> $ cat /sys/devices/system/cpu/cpu0/cpuidle/state*/usage
> 7745
> 10578
>
>> don't... at least in nearby future. If I had some spare time then
>> probably I would try to make suspend working.
>>
>
> Suspend-to-RAM is at least working on the Exynos5420 and Exynos5800
> Chromebooks.

The big.LITTLE cpuidle driver is not a typical Exynos cpuidle driver.
It only executes CPU suspend on a cluster which essentially is a power
down operation.

When we talk about cpuidle on Exynos, we have in mind one of sleep
modes: AFTR or LPA (sometimes instead of LPA there is LPD or W-AFTR).
Actually this is more like a system idle mode, not CPU idle. The power
savings are much bigger than disabling only one cluster.

So the question is still valid - whether someone wants or plans to
implement cpuidle for Exynos 542x family. Odroid XU3 is not a priority
here because energy consumption is not an issue there. This is not a
mobile device.

Best regards,
Krzysztof

>
> As you mentioned it may depend on the firmware so that does not hold
> true for all the Exynos5420/5422/5800 boards but it would be good to
> know what is the causing S2R to fail.
