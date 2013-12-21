From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Support Suspend-to-RAM on EXYNOS5420
Date: Fri, 20 Dec 2013 17:15:48 -0800
Message-ID: <CAD=FV=UBz0ShCOj2ztBmf1Tge+BoQ_QUByAKj=W=mEgE4dE94Q@mail.gmail.com>
References: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voamU5hc7uC5MTOA7OtYuqpsis7cTX3sx0UrmpdZx7_TpzA@mail.gmail.com>
	<CANruHrS1D8d_y43xa-2OGduTvAGWfdeY1REVzZ6YJHjhzLg+hw@mail.gmail.com>
	<346894265.CPBN0v9Elj@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f47.google.com ([209.85.212.47]:62742 "EHLO
	mail-vb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751832Ab3LUBPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 20:15:49 -0500
Received: by mail-vb0-f47.google.com with SMTP id q12so1765422vbe.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 17:15:48 -0800 (PST)
In-Reply-To: <346894265.CPBN0v9Elj@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: sunil joshi <sjoshi.open@gmail.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Jonathan Kliegman <kliegs@chromium.org>

Tomasz,

On Fri, Dec 20, 2013 at 1:19 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi,
>
> On Friday 20 of December 2013 15:56:38 sunil joshi wrote:
>> Hi Abhilash,
>> I saw another patch in chrome tree ..by Andrew Bresticker
>> which may be relevant here ..
>>
>> Just wondering if you missed adding this ? or this is not needed ?
>> You did not face any issue in getting core to suspend ?
>>
>> ------------------------------------------------------------------------------------------
>> commit 95402d816b9f1a05ce633f7ff64b4c939c142482
>> Author: Andrew Bresticker <abrestic@chromium.org>
>> Date:   Mon Jul 15 13:14:36 2013 -0700
>>
>>     arm: exynos: disable all interrupts on Exynos5420 before suspend
>>
>>     Disable all interrupts from the GIC before entering suspend on
>>     Exynos5420 as is done on Exynos5250.  If interrupts are enabled, we
>>     may receive an interrupt after entering WFI but before the PMU has
>>     suspended the system, causing suspend to fail.
>>
>>     BUG=chrome-os-partner:20523
>>     TEST=Run suspend_stress_test on Pit and observe that entering suspend
>>     no longer occasionally fails with the "Failed to suspend the system"
>>     error in exynos_cpu_suspend().
>
> A question about this for Chromium and LSI guys:
>
> If you find out that there is already a pending interrupt before you enter
> the sleep mode, isn't it more reasonable to cancel the process ASAP and
> handle the event instead of entering the sleep just to leave it?
>
> I believe this should be both more efficient with respect to power usage
> and latency, because sleep-wakeup transition takes time and power.
>
> Do you have any reason to think the opposite?

I'm not actually sure I know every last detail, but...

>From what I remember on 5250 there was some type of mystery interrupt
that was hitting in the system but that wasn't identifiable as any
particular interrupt source.  I think that this was an attempt to deal
with that with a heavy hammer.  I don't think it was a very elegant
solution and it would be nice to do better.

Ah, here's the original CL:
<https://chromium-review.googlesource.com/#/c/34541/>.  ...as you can
see I wasn't super happy about it at the time but was OK with it going
in since it was very late in the Chromebook release cycle and we
needed suspend/resume to be reliable.

Another fairly questionable CL:
<https://chromium-review.googlesource.com/#/c/37991/>

It would be super great if we could get suspend/resume reliable
upstream without those hacks.

-Doug
