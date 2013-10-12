From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Sat, 12 Oct 2013 04:06:21 +0200
Message-ID: <2464757.WeV77WxV9T@amdn883>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
 <2947491.pJZ8F0UW5m@amdn883>
 <CAD=FV=V-RqREqsR-g-2=Rv5UMzwbJFbn7t5xhDp6qBkuGrJVvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22405 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256Ab3JLCGZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 22:06:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUJ009T89UN2LC0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Oct 2013 03:06:23 +0100 (BST)
In-reply-to: <CAD=FV=V-RqREqsR-g-2=Rv5UMzwbJFbn7t5xhDp6qBkuGrJVvg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Arun Kumar K <arunkk.samsung@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Andrew Bresticker <abrestic@chromium.org>

On Friday 11 of October 2013 08:14:03 Doug Anderson wrote:
> Tomasz,
> 
> On Wed, Oct 9, 2013 at 10:20 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> >> > I don't think this is right.  I believe that it needs to be passed in
> >> > by the SoC.  On exynos5250 I see 250 in both the manual and in our
> >> > code.  On exynos5420 manual I actually see 200 now.  I'm not actually
> >> > sure where the 270 came from, now that I search for it.
> >>
> >> The manual I referred gives 250 for both 5250 and 5420 and thats why I
> >> concluded on this fix. I will check other versions of the manual to see if
> >> the value is changing.
> >
> > 270 is the value taken from Exynos 4412 User's Manual rev. 1.1.
> >
> > I believe we don't have to extend this to support per SoC value, because it
> > should be always safe to take the value of SoC that requires the longest
> > locking period. The differences are small enough to be insignificant, so there
> > should be no practical performance penalty.
> 
> It's not _that_ small for something like APLL which can be changing
> constantly in DVFS.
> 
> 24MHz input clock, right?  ...and I see some P values of up to 6.
> 
> That means with 270 lock time is 67.5 us, right?
> ...and with 200 lock time is 50 us, right?
> 
> ...so that's a 17.5 us difference by using the correct multiplier.
> Overall DVFS switch time was measured recently at ~350us, so that
> would give us a 5% speedup on DVFS switching.
>
> We've had debates in-house in the past about how critical DVFS
> switching time is.  In the past there have been some who have
> advocated that it's very important, since it affects responsiveness
> (how fast can you spin up when you suddenly have something to do).

Well, it's some kind of difference indeed. However, how often can
a frequency transition happen?

I believe that ondemand allows minimum sampling period of
100 * transition latency, so even without considering the PLL lock time,
we would have at most a single delay of ~400 us every ~40 ms, during
which remaining CPUs are operating normally, because of switching to
MPLL temporarily.

A bit more interesting case would be the Android interactive governor,
which scales up the CPU on any wake-up event, but I don't believe any
user would notice the extra 17,5 us from touching the screen to seeing
a menu animation, for example.

Please correct me if I'm missing something here.

> Anyway, when it's something as simple as passing in a parameter to get
> it right, it seems worth doing.

Sure, any patches improving things are welcome, I was just wondering
whether the improvement will be of any significance. Looking forward
to respective patches, hoping that they will not complicate the code
too much (although we already have a struct for PLL parameters, so they
should not).

Best regards,
Tomasz
