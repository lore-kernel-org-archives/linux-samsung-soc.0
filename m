From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Support Suspend-to-RAM on EXYNOS5420
Date: Fri, 20 Dec 2013 13:37:36 -0800
Message-ID: <CAOesGMi7cGZyHLBMpc7UTBbQkiRBij6rDyuA+E+9tUmsb131zw@mail.gmail.com>
References: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voamU5hc7uC5MTOA7OtYuqpsis7cTX3sx0UrmpdZx7_TpzA@mail.gmail.com>
	<CANruHrS1D8d_y43xa-2OGduTvAGWfdeY1REVzZ6YJHjhzLg+hw@mail.gmail.com>
	<346894265.CPBN0v9Elj@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:44339 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753820Ab3LTVhh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:37:37 -0500
Received: by mail-qc0-f169.google.com with SMTP id r5so2802488qcx.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:37:36 -0800 (PST)
In-Reply-To: <346894265.CPBN0v9Elj@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: sunil joshi <sjoshi.open@gmail.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>

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

If it's expected to be a rare or very rare event, it's not a given
that the added complexity of dealing with the aborted suspend that
late is worth it.


-Olof
