From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 00/13] drm/exynos: async G2D and g2d_move()
Date: Fri, 27 Nov 2015 13:47:09 +0000
Message-ID: <CACvgo50g0Q7PCi5WkyiSSVb=gZFBdjkUrmbX-96ChCoqg-kCLg@mail.gmail.com>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<CACvgo51z_t-4D8_QKo3tQngB5b=+c7ReDBM3h7ikTEuKt=+vMA@mail.gmail.com>
	<20151127111108.68b4c99a@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:38032 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484AbbK0NrK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Nov 2015 08:47:10 -0500
Received: by igbxm8 with SMTP id xm8so30920393igb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2015 05:47:09 -0800 (PST)
In-Reply-To: <20151127111108.68b4c99a@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>

On 27 November 2015 at 02:11, Hyungwon Hwang <human.hwang@samsung.com> wrote:
> Dear All,
>
> On Thu, 26 Nov 2015 16:35:29 +0000
> Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
>> Hi Tobias,
>>
>> On 22 November 2015 at 18:48, Tobias Jakobi
>> <tjakobi@math.uni-bielefeld.de> wrote:
>> > Hello,
>> >
>> > this series mostly touches G2D code. It introduces the following:
>> >
>> > (1) drmHandleEvent2() is added to enable processing of
>> > vendor-specific events. This will be used to expose asynchronous
>> > operation of the G2D. The necessary kernel infrastructure is
>> > already there since a lot of kernel versions. [This touches libdrm
>> > core code!]
>> >
>> Considering the shortage of input on this can you please respin the
>> series without it (and related work mentioned below). This way we can
>> pick merge the remaining work now and discuss (ping) about the rest.
>
> I am confused a little here. Did you mean that adding drmHandleEvent2()
> is not necessary, and the related code which uses drmHandleEvent2() must
> be re-implemented?
>
I mean that there has been no interest/collaboration from anyone else.
The shortage of userspace, doesn't help much either. Both of these can
be hand-waved, somewhat, if this was exynos only change, but it isn't
:-(

Thus in order to not stall the remaining patches, I'm suggesting that
we split this [and other patches that depend on it] into a
separate/parallel series.

>>
>> > (2) The necessary infrastructure to handle G2D events. This includes
>> >     adding g2d_config_event() and g2d_exec2() to the public API.
>> >     A test application is provided to ensure that everything works
>> >     as expected.
>> >
>> With above in mind the g2d event will need to be split out, although
>> g2d_exec2() should be ok (although of limited use), imho.
>>
>> > (3) A small performance test application which can be used to
>> > measure the speed of solid color clear operations. Interesting for
>> >     benchmarking and plotting colorful graphs (e.g. through
>> >     Mathematica).
>> >
>> > (4) g2d_move() which works similar to g2d_copy() but like the C
>> >     memmove() properly handles overlapping buffer copies.
>> >     Again a test application is present to check that this
>> >     indeed does what it should.
>> >
>> > (5) Various small changes. A framebuffer colorformat fix for the
>> >     general G2D test application. Moving the currently unused
>> >     g2d_reset() to the public API.
>> I am more of a "add API when it's needed" kind of person, although I
>> cannot see anything serious misuse that can arise from g2d_reset().
>>
>> > Adding a counterpart to
>> >     exynos_bo_map() to unmap buffers again.
>> >
>> The exynos bo map compatibility was broken a few times already so I'm
>> wondering if we really want this one. I guess that with the lack of
>> any (outside of tizen) user space things cannot go that wrong :-P
>>
>
> Yes. I agree that adding them at this time is not needed and it would
> be OK to add them, when the userspace using them comes.
>
You guys/gals are paving the way for exynos - so it's not my call to
decide. I was just pointing out some questionable bits from the past.

As I mentioned Tizen, do you plan on cleaning up your libdrm (and
other?) patches and sending them over ?


In case I haven't mentioned this before - feel free to come and join
us on IRC channel #dri-devel (at FreeNode). Many kernel and userspace
DRM developers hang out in there and you can poke, collaborate and
discuss things in real time :-) This invite includes youself, other
exynos DRM developers and everyone else interested.


Thanks for the picking up Tobias' work, Hyungwon!

Regards
Emil
