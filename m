From: Sonny Rao <sonnyrao@chromium.org>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Tue, 15 Oct 2013 09:46:06 -0700
Message-ID: <CAPz6YkXr_eENi+K6zF5_E8w8jEHV0JcRjxwaUG108vFhaAo_dA@mail.gmail.com>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
 <2947491.pJZ8F0UW5m@amdn883> <CAD=FV=V-RqREqsR-g-2=Rv5UMzwbJFbn7t5xhDp6qBkuGrJVvg@mail.gmail.com>
 <2464757.WeV77WxV9T@amdn883> <CAD=FV=WDN0S5atj7aqCw7iL0zTwFxvkxMwHR9-DXOAexxr5ngQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:39744 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932228Ab3JOQq2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 12:46:28 -0400
Received: by mail-qa0-f45.google.com with SMTP id ii20so3358285qab.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Oct 2013 09:46:27 -0700 (PDT)
In-Reply-To: <CAD=FV=WDN0S5atj7aqCw7iL0zTwFxvkxMwHR9-DXOAexxr5ngQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Arun Kumar K <arunkk.samsung@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Andrew Bresticker <abrestic@chromium.org>

On Mon, Oct 14, 2013 at 9:08 PM, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> On Fri, Oct 11, 2013 at 7:06 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Well, it's some kind of difference indeed. However, how often can
>> a frequency transition happen?
>>
>> I believe that ondemand allows minimum sampling period of
>> 100 * transition latency, so even without considering the PLL lock time,
>> we would have at most a single delay of ~400 us every ~40 ms, during
>> which remaining CPUs are operating normally, because of switching to
>> MPLL temporarily.
>>
>> A bit more interesting case would be the Android interactive governor,
>> which scales up the CPU on any wake-up event, but I don't believe any
>> user would notice the extra 17,5 us from touching the screen to seeing
>> a menu animation, for example.
>
> OK.  You've clearly looked at this more than I.  :)  I was merely
> recalling conversations that others had over a year ago and
> remembering some of our engineers being concerned about latencies even
> at this level, but I'm not sure if they had hard data.  I added Sonny
> to see if he might remember more, though I don't think he was the one
> pushing for optimizations in the past.
>
>
> Note that we actually are using the Interactive governor in our
> systems, and it is the interactive "time to spin up on user input"
> that I'm most worried about.  ...but you're right that I think the
> user perceivable values are in the 10s of milliseconds and not in the
> 10s of microseconds.


Yeah, we're using interactive, and we're typically running on the
slowest clock frequency when a user uses an input device that causes a
boost to happen, and I think the initial measurements (last year) of
how long it took to complete just the voltage transition on Snow were
something like 1 millisecond mostly because of how udelay worked by
using a fixed number of loops.  That seemed pretty long but wasn't
considered terrible because after we got up to a higher speed it
wouldn't take as long to make further transitions, and I also didn't
expect us to make that transition often enough that it would be a
significant impact on CPU usage, and 1ms probably isn't quite enough
for a user to notice.

>
>
>> Please correct me if I'm missing something here.
>>
>>> Anyway, when it's something as simple as passing in a parameter to get
>>> it right, it seems worth doing.
>>
>> Sure, any patches improving things are welcome, I was just wondering
>> whether the improvement will be of any significance. Looking forward
>> to respective patches, hoping that they will not complicate the code
>> too much (although we already have a struct for PLL parameters, so they
>> should not).
>
> I'd still love to see the change land that allows this to be right.
> 17.5us may not matter much, but with the PLL parameter struct it
> should be pretty easy / clean.  ...and it also allows us to map the
> number back the user manual, which can make it easier to understand
> (there's currently nothing documenting why the number is 270, not 250
> or 200).
>
> -Doug
