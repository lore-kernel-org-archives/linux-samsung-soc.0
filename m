From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: CPUIdle for Exynos5422 Odroid-XU3/XU4 boards.
Date: Thu, 20 Aug 2015 23:45:14 +0530
Message-ID: <CANAwSgRHEXuNt1PJY89ujificXj70BhbGhSOpL16yKsKr6hWcQ@mail.gmail.com>
References: <CANAwSgTWZ1a+j8RTiamsKaALKf+ekLVqtO6RFTLXkG=bJN4BPQ@mail.gmail.com>
 <55D5FBDB.4040904@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:34554 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986AbbHTSPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 14:15:35 -0400
Received: by wicne3 with SMTP id ne3so343377wic.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2015 11:15:34 -0700 (PDT)
In-Reply-To: <55D5FBDB.4040904@free.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@free.fr>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Daniel,

On 20 August 2015 at 21:40, Daniel Lezcano <daniel.lezcano@free.fr> wrote:
> On 08/20/2015 12:54 PM, Anand Moon wrote:
>>
>> Hello Krzysztof/Kukjim,
>>
>> CPUIdle seen to be not working for Exynos5422 Odroid boards.
>>
>> Is their any way this feature will be implemented in the future.
>
>
> Yeah a good willing to fix the bl1. More than one year asking for that !
> nooo way !!
>
> Your answer is at the end of
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/350632.html
>
>

Thanks for the explanation.

I was just referring following the source code.

https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/mach-exynos/cpuidle-exynos5422.c

It seem that cpufreq and cpuidle go hand in hand.

-Anand Moon
