From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Mon, 14 Oct 2013 21:08:38 -0700
Message-ID: <CAD=FV=WDN0S5atj7aqCw7iL0zTwFxvkxMwHR9-DXOAexxr5ngQ@mail.gmail.com>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
	<2947491.pJZ8F0UW5m@amdn883>
	<CAD=FV=V-RqREqsR-g-2=Rv5UMzwbJFbn7t5xhDp6qBkuGrJVvg@mail.gmail.com>
	<2464757.WeV77WxV9T@amdn883>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f41.google.com ([209.85.212.41]:62322 "EHLO
	mail-vb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab3JOEIj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 00:08:39 -0400
Received: by mail-vb0-f41.google.com with SMTP id g17so5051813vbg.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Oct 2013 21:08:38 -0700 (PDT)
In-Reply-To: <2464757.WeV77WxV9T@amdn883>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Arun Kumar K <arunkk.samsung@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Sonny Rao <sonnyrao@chromium.org>

Tomasz,

On Fri, Oct 11, 2013 at 7:06 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Well, it's some kind of difference indeed. However, how often can
> a frequency transition happen?
>
> I believe that ondemand allows minimum sampling period of
> 100 * transition latency, so even without considering the PLL lock time,
> we would have at most a single delay of ~400 us every ~40 ms, during
> which remaining CPUs are operating normally, because of switching to
> MPLL temporarily.
>
> A bit more interesting case would be the Android interactive governor,
> which scales up the CPU on any wake-up event, but I don't believe any
> user would notice the extra 17,5 us from touching the screen to seeing
> a menu animation, for example.

OK.  You've clearly looked at this more than I.  :)  I was merely
recalling conversations that others had over a year ago and
remembering some of our engineers being concerned about latencies even
at this level, but I'm not sure if they had hard data.  I added Sonny
to see if he might remember more, though I don't think he was the one
pushing for optimizations in the past.

Note that we actually are using the Interactive governor in our
systems, and it is the interactive "time to spin up on user input"
that I'm most worried about.  ...but you're right that I think the
user perceivable values are in the 10s of milliseconds and not in the
10s of microseconds.


> Please correct me if I'm missing something here.
>
>> Anyway, when it's something as simple as passing in a parameter to get
>> it right, it seems worth doing.
>
> Sure, any patches improving things are welcome, I was just wondering
> whether the improvement will be of any significance. Looking forward
> to respective patches, hoping that they will not complicate the code
> too much (although we already have a struct for PLL parameters, so they
> should not).

I'd still love to see the change land that allows this to be right.
17.5us may not matter much, but with the PLL parameter struct it
should be pretty easy / clean.  ...and it also allows us to map the
number back the user manual, which can make it easier to understand
(there's currently nothing documenting why the number is 270, not 250
or 200).

-Doug
