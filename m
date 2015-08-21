From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: CPUIdle for Exynos5422 Odroid-XU3/XU4 boards.
Date: Fri, 21 Aug 2015 12:59:56 +0900
Message-ID: <55D6A23C.5020403@samsung.com>
References: <CANAwSgTWZ1a+j8RTiamsKaALKf+ekLVqtO6RFTLXkG=bJN4BPQ@mail.gmail.com>
 <55D5FBDB.4040904@free.fr>
 <CANAwSgRHEXuNt1PJY89ujificXj70BhbGhSOpL16yKsKr6hWcQ@mail.gmail.com>
 <55D676E8.8020802@samsung.com>
 <CANAwSgR-d-mPnvmi19fiyt89g_B1UkuCya9=4e_19muv-UZrCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48417 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772AbbHUD77 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 23:59:59 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTE0028UZ3UZ530@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Aug 2015 04:59:54 +0100 (BST)
In-reply-to: <CANAwSgR-d-mPnvmi19fiyt89g_B1UkuCya9=4e_19muv-UZrCQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@free.fr>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 21.08.2015 12:41, Anand Moon wrote:
> Hi Krzysztof,
> 
> On 21 August 2015 at 06:25, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>> On 21.08.2015 03:15, Anand Moon wrote:
>>> Hi Daniel,
>>>
>>> On 20 August 2015 at 21:40, Daniel Lezcano <daniel.lezcano@free.fr> wrote:
>>>> On 08/20/2015 12:54 PM, Anand Moon wrote:
>>>>>
>>>>> Hello Krzysztof/Kukjim,
>>>>>
>>>>> CPUIdle seen to be not working for Exynos5422 Odroid boards.
>>>>>
>>>>> Is their any way this feature will be implemented in the future.
>>>>
>>>>
>>>> Yeah a good willing to fix the bl1. More than one year asking for that !
>>>> nooo way !!
>>>>
>>>> Your answer is at the end of
>>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/350632.html
>>>>
>>>>
>>>
>>> Thanks for the explanation.
>>>
>>> I was just referring following the source code.
>>>
>>> https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/mach-exynos/cpuidle-exynos5422.c
>>>
>>> It seem that cpufreq and cpuidle go hand in hand.
>>
>> Bartlomiej was working on cpufreq for Exynos542x:
>> http://lkml.iu.edu/hypermail/linux/kernel/1504.2/03139.html
>>
>> It would be nice to have also cpuidle and suspend features working on
>> Exynos542x family but this depends on firmware. Some time ago I
>> struggled with suspend on Arndale Octa (Exynos5420) and I failed. I
>> think the firmware is the issue here.
>>
>> Actually I am not sure what is your question Anand. You are asking if
>> someone plans to do this?
> 
> Yes I am asking are their plans to implement cpufreq and cpuidle simultaneously.

There are no obstacles for implementing them simultaneously so the
question is rather who plans to do the cpuidle driver for Exynos542x? I
don't... at least in nearby future. If I had some spare time then
probably I would try to make suspend working.

Best regards,
Krzysztof
