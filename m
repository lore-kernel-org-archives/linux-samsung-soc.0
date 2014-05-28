From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm: dts: exynos5: Remove multi core timer
Date: Wed, 28 May 2014 10:37:55 -0700
Message-ID: <CAD=FV=WfE8hubR8uaY5-1a=0cFQz-OLsLT0dWGyJhS60YNqPVg@mail.gmail.com>
References: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
	<53752E25.9060604@gmail.com>
	<CAD=FV=WKOtZaUyzTWNqR=vi_L=U-Q1dct2U_oCYi3ZJv6401Hg@mail.gmail.com>
	<53753443.8010303@gmail.com>
	<CAD=FV=V8UZoeOqEwfx_E015pLM+amTt51LrUa+dk7mTdn=vKgA@mail.gmail.com>
	<53753C17.1090002@gmail.com>
	<CAD=FV=WGa7j_As_NpySxU7OEd_SzuGWK6oxU6UeiJ-4HsoWvvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:35068 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550AbaE1Rh4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 13:37:56 -0400
Received: by mail-vc0-f180.google.com with SMTP id hy4so12697772vcb.39
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2014 10:37:56 -0700 (PDT)
In-Reply-To: <CAD=FV=WGa7j_As_NpySxU7OEd_SzuGWK6oxU6UeiJ-4HsoWvvg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Chirantan Ekbote <chirantan@chromium.org>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, David Riley <davidriley@chromium.org>, vincent.guittot@linaro.org

Tomasz,

On Thu, May 15, 2014 at 3:44 PM, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> On Thu, May 15, 2014 at 3:13 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>> NOTE: if for some reason we need to keep the MCT around, we're
>>> definitely going to need to account for the fact that tweaking it
>>> affects the arch timer.  ...and having the arch timer is really nice
>>> since:
>>
>> [Let me reorder the points below to make it easier to comment:]
>>
>>> * it's faster to access.
>>> * it is accessible from userspace for really fast access.
>>
>> Do you have some data on whether it is a significant difference,
>> especially considering real use cases?
>
> I know that Chrome makes _a lot_ of calls to gettimeofday() for
> profiling purposes, enough that it showed up on benchmarks.  In fact,
> we made a change to the MCT to make accesses faster and there's a
> small mention of the benchmarking that was done at:
>
> https://chromium-review.googlesource.com/#/c/32190/
>
> ...that change probably should be sent upstream, actually.
>
> I'll let Chirantan comment on how much faster arch timers were.
> ...and I think David Riley (also CCed now) may be able to comment on
> the benefits of userspace timers.
>
>
>>> * it implements the bits needed for udelay() to use it.
>>
>> Hmm, do you know what bits are those? On Exynos4 MCT is the only option
>> and it would be nice to let udelay() use it.
>
> Look for register_current_timer_delay().  It seems like we could do
> this for MCT, but I've never done the investigation because we were
> always planning to move to arch timers.  ;)

If you're planning to add support for MCT as a source for udelay, let
me know.  It sounds like there's a chance that we won't be able to use
the ARCH timers on 5420 so we may be interested in these patches as
well.

Also note that it appears that MCT upstream is also not used as a
scheduler clock.  Perhaps you would want those patches, too?  I think
Chirantan said that it will cause problems on systems that have both
MCT and arch timers though, since the system didn't like two scheduler
clocks to be registered (?).


In summary, we've got the following MCT patches proposed to go upstream:

1. MCT scheduler clock: <http://crosreview.com/56363> and
<http://crosreview.com/56364>
2. Speed MCT access: <http://crosreview.com/56365>.  I wonder if we
could also speed it up further with a 64-bit read.
3. Use MCT for udelay: yet to be written.

...does someone want to claim the task of sending those things up?


Oh, actually it looks like (93bfb76 clocksource: exynos_mct: register
sched_clock callback) in linuxnext adds a partial version of the first
patch but isn't as complete as what's in our tree (it's missing the
KConfig change we have locally as well as the notrace so it probably
breaks ftrace?).  Adding Vincent.


-Doug
