From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: CPUIdle for Exynos5422 Odroid-XU3/XU4 boards.
Date: Thu, 20 Aug 2015 20:50:46 +0200
Message-ID: <55D62186.1080002@linaro.org>
References: <CANAwSgTWZ1a+j8RTiamsKaALKf+ekLVqtO6RFTLXkG=bJN4BPQ@mail.gmail.com> <55D5FBDB.4040904@free.fr> <CANAwSgRHEXuNt1PJY89ujificXj70BhbGhSOpL16yKsKr6hWcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:35675 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986AbbHTSus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 14:50:48 -0400
Received: by pdob1 with SMTP id b1so17163275pdo.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2015 11:50:48 -0700 (PDT)
In-Reply-To: <CANAwSgRHEXuNt1PJY89ujificXj70BhbGhSOpL16yKsKr6hWcQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Daniel Lezcano <daniel.lezcano@free.fr>
Cc: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 08/20/2015 08:15 PM, Anand Moon wrote:
> Hi Daniel,
>
> On 20 August 2015 at 21:40, Daniel Lezcano <daniel.lezcano@free.fr> w=
rote:
>> On 08/20/2015 12:54 PM, Anand Moon wrote:
>>>
>>> Hello Krzysztof/Kukjim,
>>>
>>> CPUIdle seen to be not working for Exynos5422 Odroid boards.
>>>
>>> Is their any way this feature will be implemented in the future.
>>
>>
>> Yeah a good willing to fix the bl1. More than one year asking for th=
at !
>> nooo way !!
>>
>> Your answer is at the end of
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/3506=
32.html
>>
>>
>
> Thanks for the explanation.
>
> I was just referring following the source code.
>
> https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/ma=
ch-exynos/cpuidle-exynos5422.c

Ah, thanks for the pointer. So for my information, is that driver not=20
working with the exynos5422 ?

> It seem that cpufreq and cpuidle go hand in hand.

At the first glance, there is a dependency with the cluster power state=
=2E=20
It is not allowed to enter the cluster power down if another subsystem=20
deny it. The driver itself is a pack of hacks based on cpuidle legacy=20
code and wildly backported from older kernels with arbitrary latency an=
d=20
residency values.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
