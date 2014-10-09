From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v9 0/2] Adds PMU and S2R support for exynos5420
Date: Thu, 09 Oct 2014 14:50:43 -0700
Message-ID: <7hbnpknc98.fsf@deeprootsystems.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<7hiojuno9e.fsf@deeprootsystems.com>
	<CAM4voanoOV44EQveAeikp1P0bXCU8HHdX2XDi3jwLkfQOP0CNQ@mail.gmail.com>
	<CABxcv==V0vR2XXq5cKzbaqkCbtkqKgrhJotdPSM5K0uyNW968w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:49909 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757522AbaJIVus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Oct 2014 17:50:48 -0400
Received: by mail-pd0-f177.google.com with SMTP id v10so442667pde.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2014 14:50:47 -0700 (PDT)
In-Reply-To: <CABxcv==V0vR2XXq5cKzbaqkCbtkqKgrhJotdPSM5K0uyNW968w@mail.gmail.com>
	(Javier Martinez Canillas's message of "Thu, 9 Oct 2014 11:48:28
	+0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Vikas Sajjan <vikas.sajjan@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Javier Martinez Canillas <javier@dowhile0.org> writes:

> Hello Abhilash,
>
> On Thu, Oct 9, 2014 at 4:37 AM, Abhilash Kesavan
> <kesavan.abhilash@gmail.com> wrote:
>> Hi Kevin,
>>
>> On Thu, Oct 9, 2014 at 4:49 AM, Kevin Hilman <khilman@kernel.org> wrote:
>>> Vikas Sajjan <vikas.sajjan@samsung.com> writes:
>>>
>>> [...]
>>>
>>>> Tested on Kukjin Kim's tree, for-next branch +
>>>> 1] http://www.spinics.net/lists/linux-samsung-soc/msg33750.html
>>>> 2] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg37260.html
>>>> 3] with the CLK_IGNORE_UNUSED flag for aclk200_disp1 CLK
>>>>
>>>> on Exynos5420 based chromebook (peach-pit board)
>>>>
>>>> Below procedures were followed to test S2R:
>>>> Procedure A:
>>>>       1. make multi_v7_defconfig
>>>>       2  enable MCPM for 5420
>>>>       3. enable S3C RTC
>>>>       5. echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state
>>>> Procedure B:
>>>>       1. make exynos_defconfig
>>>>       4. echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state
>>>
>>> I went tried to this on exynos5800-peach-pi and found first that
>>> exynos_defonfig is missing the MAX77802 kconfig options for the RTC
>>> source clock:
>>>
>>> CONFIG_REGULATOR_MAX77802=y
>>> CONFIG_COMMON_CLK_MAX77802=y
>>
>> I am using exynos_defconfig (no changes) with the internal SoC RTC
>> which is enabled by default. I did not enable the MAX77802 RTC.
>
> That is because you probably are using kukjin's for-next branch as a
> base but I had the same issue when testing s2r on linux-next.
>
> The problem is that linux-next contains commit 546b117fdf17 ("rtc:
> s3c: add support for RTC of Exynos3250 SoC") that added a required
> "rtc_src" DT property for the Samsung's S3C RTC that is used to
> specify the source clock XrtcXTI.
>
> On Peach boards, the S3C source clock is the max77802 32kHZ AP clock
> so I fixed that with commit 8bd43b6 ("ARM: dts: Add rtc_src clk for
> s3c-rtc on exynos Peach boards") but didn't send a patch to enable the
> max77802 subdevices on exynos_defconfig.
>
> I'll post a patch to enable those config options today and maybe they
> can be considered as -rc material.

Great, thanks.

>>>
>>> With those, rtc0 then comes up, but isn't waking from suspend.  However,
>>> writing something to rtc0/wakealarm does result in /proc/interrupts
>>> having an interrupt for the RTC, it's just not waking the system.
>>>
>>> Anyone else tried this on 5800/peach-pi?
>>
>> I have tested this on a Peach-Pi and the system is resuming fine. The
>> patches applied on kgene's for-next branch along with the
>> aclk200_disp1 fix are:
>> http://lkml.org/lkml/2014/9/30/156
>> https://lkml.org/lkml/2014/10/6/89
>> http://www.spinics.net/lists/arm-kernel/msg368207.html
>> http://www.spinics.net/lists/linux-samsung-soc/msg37647.html
>>
>
> Kevin, I didn't test it on 5800 peach pi but I did test it on 5420
> peach pit and as Abhilash said, I also needed Vikas patch [0] to flag
> the aclk200_disp1 and aclk300_disp1 clocks as CLK_IGNORE_UNUSED to
> prevent the ccf to disable them. With that patch Suspend-to-Ram worked
> for me and resuming using both the internal S3C RTC and the max77802
> RTC.
>
> Also I tested the pm_tests and all of them passed on my peach pit.
>
> On peach pi you shouldn't need the clock patch AFAIU if you enable the
> needed kconfig options to have display working since those clocks are
> used by the display controller so they won't be disabled due unused.

Thanks for the explanation. 

Trying $SUBJECT series on top of kukjin's for-next is working fine, but
I'm still not able to make it work on linux-next, with or without the
CLK_IGNORE_UNUSED patch.

Abhilash, can you try this on exynos5800/peach-pi with linux-next and
see what else is missing from linux-next?  It would be really nice to
get this fully working upstream.

Note also the enabling CPUidle depends on $SUBJECT series as well.

Kevin
