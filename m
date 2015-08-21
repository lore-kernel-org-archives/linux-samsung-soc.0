From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: CPUIdle for Exynos5422 Odroid-XU3/XU4 boards.
Date: Fri, 21 Aug 2015 09:11:23 +0530
Message-ID: <CANAwSgR-d-mPnvmi19fiyt89g_B1UkuCya9=4e_19muv-UZrCQ@mail.gmail.com>
References: <CANAwSgTWZ1a+j8RTiamsKaALKf+ekLVqtO6RFTLXkG=bJN4BPQ@mail.gmail.com>
 <55D5FBDB.4040904@free.fr> <CANAwSgRHEXuNt1PJY89ujificXj70BhbGhSOpL16yKsKr6hWcQ@mail.gmail.com>
 <55D676E8.8020802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37309 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163AbbHUDlo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 23:41:44 -0400
Received: by widdq5 with SMTP id dq5so5350111wid.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2015 20:41:42 -0700 (PDT)
In-Reply-To: <55D676E8.8020802@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@free.fr>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Krzysztof,

On 21 August 2015 at 06:25, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On 21.08.2015 03:15, Anand Moon wrote:
>> Hi Daniel,
>>
>> On 20 August 2015 at 21:40, Daniel Lezcano <daniel.lezcano@free.fr> wrote:
>>> On 08/20/2015 12:54 PM, Anand Moon wrote:
>>>>
>>>> Hello Krzysztof/Kukjim,
>>>>
>>>> CPUIdle seen to be not working for Exynos5422 Odroid boards.
>>>>
>>>> Is their any way this feature will be implemented in the future.
>>>
>>>
>>> Yeah a good willing to fix the bl1. More than one year asking for that !
>>> nooo way !!
>>>
>>> Your answer is at the end of
>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/350632.html
>>>
>>>
>>
>> Thanks for the explanation.
>>
>> I was just referring following the source code.
>>
>> https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/mach-exynos/cpuidle-exynos5422.c
>>
>> It seem that cpufreq and cpuidle go hand in hand.
>
> Bartlomiej was working on cpufreq for Exynos542x:
> http://lkml.iu.edu/hypermail/linux/kernel/1504.2/03139.html
>
> It would be nice to have also cpuidle and suspend features working on
> Exynos542x family but this depends on firmware. Some time ago I
> struggled with suspend on Arndale Octa (Exynos5420) and I failed. I
> think the firmware is the issue here.
>
> Actually I am not sure what is your question Anand. You are asking if
> someone plans to do this?

Yes I am asking are their plans to implement cpufreq and cpuidle simultaneously.

-Anand Moon
>
> Best regards,
> Krzysztof
>
