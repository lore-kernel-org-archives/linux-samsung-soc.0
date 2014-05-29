From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm: dts: exynos5: Remove multi core timer
Date: Thu, 29 May 2014 14:41:14 -0700
Message-ID: <CAD=FV=XavuOEHhnhL_wOfj3J=vef9Kbwd+eSriYzJ_OxtLsJFg@mail.gmail.com>
References: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
	<53752E25.9060604@gmail.com>
	<CAD=FV=WKOtZaUyzTWNqR=vi_L=U-Q1dct2U_oCYi3ZJv6401Hg@mail.gmail.com>
	<53753443.8010303@gmail.com>
	<CAD=FV=V8UZoeOqEwfx_E015pLM+amTt51LrUa+dk7mTdn=vKgA@mail.gmail.com>
	<53753C17.1090002@gmail.com>
	<CAD=FV=WGa7j_As_NpySxU7OEd_SzuGWK6oxU6UeiJ-4HsoWvvg@mail.gmail.com>
	<CAD=FV=WfE8hubR8uaY5-1a=0cFQz-OLsLT0dWGyJhS60YNqPVg@mail.gmail.com>
	<CAKfTPtA_PfdXi6h=fSOYNZrFjtc_sA+xwwMPT+6TiWTPsOVTmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:41842 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755284AbaE2VlP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 17:41:15 -0400
Received: by mail-vc0-f177.google.com with SMTP id il7so907026vcb.36
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 May 2014 14:41:14 -0700 (PDT)
In-Reply-To: <CAKfTPtA_PfdXi6h=fSOYNZrFjtc_sA+xwwMPT+6TiWTPsOVTmw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chirantan Ekbote <chirantan@chromium.org>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, David Riley <davidriley@chromium.org>

Vincent,

On Thu, May 29, 2014 at 1:42 PM, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>> In summary, we've got the following MCT patches proposed to go upstream:
>>
>> 1. MCT scheduler clock: <http://crosreview.com/56363> and
>> <http://crosreview.com/56364>
>> 2. Speed MCT access: <http://crosreview.com/56365>.  I wonder if we
>> could also speed it up further with a 64-bit read.
>> 3. Use MCT for udelay: yet to be written.
>>
>> ...does someone want to claim the task of sending those things up?
>>
>>
>> Oh, actually it looks like (93bfb76 clocksource: exynos_mct: register
>> sched_clock callback) in linuxnext adds a partial version of the first
>> patch but isn't as complete as what's in our tree (it's missing the
>> KConfig change we have locally as well as the notrace so it probably
>> breaks ftrace?).  Adding Vincent.
>
> Hi Doug,
>
> Thanks for adding me in the loop.
>
> The only difference i see are:
>  -HAVE_SCHED_CLOCK which is no more needed
>  -and the use of 32bit vs 64bit in the for-next
>  -notrace is present in the for-next  AFAICT

Ah, my bad!  Yes, you're right that things look OK.  I looked too
quickly and didn't see the notrace.  ...and I wasn't aware that
HAVE_SCHED_CLOCK was no longer needed.

One thing that might be interesting is to consider using 32-bit
instead of 64-bit.  We know that this clock is slow to access, so
reducing 3 reads down to 1 would be worth it.  A 32-bit clock should
be sufficient for the scheduler anyway.

-Doug
