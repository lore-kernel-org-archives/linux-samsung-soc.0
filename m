From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Fri, 11 Oct 2013 08:14:03 -0700
Message-ID: <CAD=FV=V-RqREqsR-g-2=Rv5UMzwbJFbn7t5xhDp6qBkuGrJVvg@mail.gmail.com>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
	<CAD=FV=WcKpO947DgF6xwWALpVMYPOaZ=G_1+iRmFjac2bQGAMw@mail.gmail.com>
	<CALt3h78Lt2epHFmKeQ90839-L4XSQL+rDUTHGj681S2sTG=Jeg@mail.gmail.com>
	<2947491.pJZ8F0UW5m@amdn883>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f43.google.com ([209.85.212.43]:38404 "EHLO
	mail-vb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752608Ab3JKPOF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 11:14:05 -0400
Received: by mail-vb0-f43.google.com with SMTP id h11so2869348vbh.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Oct 2013 08:14:04 -0700 (PDT)
In-Reply-To: <2947491.pJZ8F0UW5m@amdn883>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Arun Kumar K <arunkk.samsung@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Andrew Bresticker <abrestic@chromium.org>

Tomasz,

On Wed, Oct 9, 2013 at 10:20 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> > I don't think this is right.  I believe that it needs to be passed in
>> > by the SoC.  On exynos5250 I see 250 in both the manual and in our
>> > code.  On exynos5420 manual I actually see 200 now.  I'm not actually
>> > sure where the 270 came from, now that I search for it.
>>
>> The manual I referred gives 250 for both 5250 and 5420 and thats why I
>> concluded on this fix. I will check other versions of the manual to see if
>> the value is changing.
>
> 270 is the value taken from Exynos 4412 User's Manual rev. 1.1.
>
> I believe we don't have to extend this to support per SoC value, because it
> should be always safe to take the value of SoC that requires the longest
> locking period. The differences are small enough to be insignificant, so there
> should be no practical performance penalty.

It's not _that_ small for something like APLL which can be changing
constantly in DVFS.

24MHz input clock, right?  ...and I see some P values of up to 6.

That means with 270 lock time is 67.5 us, right?
...and with 200 lock time is 50 us, right?

...so that's a 17.5 us difference by using the correct multiplier.
Overall DVFS switch time was measured recently at ~350us, so that
would give us a 5% speedup on DVFS switching.

We've had debates in-house in the past about how critical DVFS
switching time is.  In the past there have been some who have
advocated that it's very important, since it affects responsiveness
(how fast can you spin up when you suddenly have something to do).


Anyway, when it's something as simple as passing in a parameter to get
it right, it seems worth doing.

-Doug
