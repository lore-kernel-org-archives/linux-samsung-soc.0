From: Sonny Rao <sonnyrao@chromium.org>
Subject: Re: [PATCH] arm: dts: exynos5: Remove multi core timer
Date: Thu, 15 May 2014 17:31:05 -0700
Message-ID: <CAPz6YkU8GDrLj8UkqEQXxxqxWF5_p427wKSDgAp+QPR7WE7Ujg@mail.gmail.com>
References: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
 <53752E25.9060604@gmail.com> <CAD=FV=WKOtZaUyzTWNqR=vi_L=U-Q1dct2U_oCYi3ZJv6401Hg@mail.gmail.com>
 <53753443.8010303@gmail.com> <CAD=FV=V8UZoeOqEwfx_E015pLM+amTt51LrUa+dk7mTdn=vKgA@mail.gmail.com>
 <53753C17.1090002@gmail.com> <CAD=FV=WGa7j_As_NpySxU7OEd_SzuGWK6oxU6UeiJ-4HsoWvvg@mail.gmail.com>
 <CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com>
 <CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com>
 <53754CE2.3000905@gmail.com> <CAD=FV=UMoL7i9rg_QtBAqPwisSQyRqRmk8wQhneMXAiLBjTT1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:35619 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbaEPAb0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 20:31:26 -0400
Received: by mail-qc0-f170.google.com with SMTP id i8so3161806qcq.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 17:31:25 -0700 (PDT)
In-Reply-To: <CAD=FV=UMoL7i9rg_QtBAqPwisSQyRqRmk8wQhneMXAiLBjTT1A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, David Riley <davidriley@google.com>, Chirantan Ekbote <chirantan@chromium.org>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thu, May 15, 2014 at 4:43 PM, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> On Thu, May 15, 2014 at 4:25 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> On 16.05.2014 01:18, David Riley wrote:
>>> On Thu, May 15, 2014 at 4:03 PM, Chirantan Ekbote
>>> <chirantan@chromium.org> wrote:
>>>> Hi Tomasz,
>>>>
>>>> On Thu, May 15, 2014 at 3:44 PM, Doug Anderson <dianders@chromium.org> wrote:
>>>>> Tomasz,
>>>>>
>>>>> On Thu, May 15, 2014 at 3:13 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>>>>>> NOTE: if for some reason we need to keep the MCT around, we're
>>>>>>> definitely going to need to account for the fact that tweaking it
>>>>>>> affects the arch timer.  ...and having the arch timer is really nice
>>>>>>> since:
>>>>>>
>>>>>> [Let me reorder the points below to make it easier to comment:]
>>>>>>
>>>>>>> * it's faster to access.
>>>>>>> * it is accessible from userspace for really fast access.
>>>>>>
>>>>>> Do you have some data on whether it is a significant difference,
>>>>>> especially considering real use cases?
>>>>>
>>>>> I know that Chrome makes _a lot_ of calls to gettimeofday() for
>>>>> profiling purposes, enough that it showed up on benchmarks.  In fact,
>>>>> we made a change to the MCT to make accesses faster and there's a
>>>>> small mention of the benchmarking that was done at:
>>>>>
>>>>> https://chromium-review.googlesource.com/#/c/32190/
>>>>>
>>>>> ...that change probably should be sent upstream, actually.
>>>>>
>>>>> I'll let Chirantan comment on how much faster arch timers were.
>>>>> ...and I think David Riley (also CCed now) may be able to comment on
>>>>> the benefits of userspace timers.
>>>>>
>>>>
>>>> When I profiled gettimeofday() calls, they were about 50 - 60% faster
>>>> with the arch timers compared to the mct.
>>>
>>> When I profiled gettimeofday(), the standard systems call version took
>>> about 2.5x longer than through a vDSO interface.
>>
>> Sounds like we should invent a new kind of jokes, starting with "When I
>> profiled gettimeofday()". ;)
>>
>> Just kidding.
>>
>> The raw improvement looks quite good, but what I'm more concerned about
>> is whether this has any significant effect on real use cases. As Doug
>> mentioned, Chrome makes a lot of calls to gettimeofday(), but he also
>> mentioned that this is for profiling purposes. Is performance of
>> gettimeofday() really that crucial in this case? Are there any other use
>> cases when this improvement is significant?
>
> I guess I should restate.  Chrome is always profiling to some extent.
> I think that the Javascript engine, for instance, uses gettimeofday()
> to figure out how much time it's spending in various places.
>
> Sonny just sent me some recent benchmarks using perf.  On this
> particular benchmark it shows 1.85% of the time was spent in
> exynos_frc_read.  If we can half that then we'll get a ~1% speedup in
> the system, which is nothing to sneeze at.  If getting rid of the
> system call overead makes this several times faster again, then we
> roughly eliminate the overhead totally.

To clarify, that data wasn't a benchmark -- It's field data, so
actually much better than a benchmark.

>
>
>> Anyway, I'm by no means opposed to switching to arch timers. They
>> provide a well designed, generic interface and drivers shared by
>> multiple platforms, which means more code sharing and possibly more eyes
>> looking at the code, which is always good. However if they don't support
>> low power states correctly, we can't just remove MCT.
>
> I think low power states aren't in mainline (right?).
>
> One solution that might work could be to leave the device tree entry
> alone but change the MCT init code to simply act as a no-op if it sees
> an arch timer is in the device tree and enabled.  Then when/if someone
> got the low power states enabled we could just change source code
> rather than dts files.
>
> -Doug
