From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing) subsystem
Date: Mon, 16 Nov 2015 11:52:07 +0000
Message-ID: <CAPj87rNS2GFrfZKF6_RaizFW_PM1vGAPVwRGWt3GogDvbwrPgA@mail.gmail.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
	<CAPj87rNz6vYrcjgV1fdSgE-ZCHnFFNfJKqskTsu2C1+KkmW_gQ@mail.gmail.com>
	<564489A9.5040709@math.uni-bielefeld.de>
	<CAPj87rNOH59fssu2CTJEt6MEn-zhGEE=5VxiscCWiRjtTwH-wQ@mail.gmail.com>
	<5649BF91.5030901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38552 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751628AbbKPLwI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Nov 2015 06:52:08 -0500
Received: by wmec201 with SMTP id c201so115899661wme.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2015 03:52:07 -0800 (PST)
In-Reply-To: <5649BF91.5030901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>

Hi Marek,

On 16 November 2015 at 11:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 2015-11-12 15:46, Daniel Stone wrote:
>> On 12 November 2015 at 12:44, Tobias Jakobi
>> <tjakobi@math.uni-bielefeld.de> wrote:
>>> I wonder how this interacts with page flipping. If I queue a pageflip
>>> event with a buffer that needs to go through the IPP for display, where
>>> does the delay caused by the operation factor it? If I understand this
>>> correctly drmModePageFlip() still is going to return immediately, but I
>>> might miss the next vblank period because the FIMC is still working on
>>> the buffer.
>>
>> Hmm, from my reading of the patches, this didn't affect page-flip
>> timings. In the sync case, it would block until the buffer was
>> actually displayed, and in the async case, the event would still be
>> delivered at the right time. But you're right that it does introduce
>> hugely variable timings, which can be a problem for userspace which
>> tries to be intelligent. And even then potentially misleading from a
>> performance point of view: if userspace can rotate natively (e.g. as
>> part of a composition blit, or when rendering buffers in the first
>> place), then we can skip the extra work from G2D.
>
>
> Page flip events are delivered to userspace at the right time. You are right
> that there will be some delay between scheduling a buffer for display and
> the
> moment it gets displayed by hardware, but imho good application should sync
> audio/video to the vblank events not the moment of scheduling a buffer. So
> this delay should not influence on the final quality of displayed

Yes, of course: Weston does that as well. But the problem is that it
introduces a delay into the very last part of the pipeline: if I
submit a pageflip 8ms before vblank is due, I no longer have a
guarantee that it will land in time for the next frame.

> The only problem I see, especially when color space conversion will be
> added,
> is how to tell generic application that some modes are preferred / not
> preferred, so application would prefer native modes which are faster. On the
> other hand application should be aware of the fact that hw scaling is
> usually
> faster / less power demanding than cpu scaling, so it is better to use such
> mode with additional processing instead of doing that work with the cpu.

Of course, yes. The alternative is usually the GPU rather than CPU: if
you tried to do it in CPU you wouldn't come anywhere close to native
framerate.

>>> My problem here is that this abstraction would take too much control
>>> from the user.
>>>
>>> Correct me if I have this wrong!
>>
>> I believe that was the concern previously, yeah. :) That, and encoding
>> these semantics in a user-visible way could potentially be dangerous.
>
> I believe that having this feature is quite beneficial for generic
> applications
> (like weston for example). It is especially very useful for video overlay
> display, where scaling, rotation and colorspace conversion are typical
> use-cases. An alternative would be to introduce some generic API for a frame
> buffer conversions.

Well, it depends really. Weston is aware of rotation and passes this
information down to the clients, which are able to provide pre-rotated
buffers, so from a pure performance/profiling point of view, really
the clients should be doing this. In the case of V4L2/media clients,
if they fed the buffer into IPP themselves and scheduled the rotation,
this would push the performance hit earlier in the pipeline, when you
have more parallelism and buffering, rather than at the very last
point where it's quite serialised. In the case of GL/GPU clients, they
could perform the rotation as part of their rendering pipeline, and in
fact get the transformation for free.

The objection isn't to the functionality itself - which is very
useful! - but that it's done in a way that makes it very opaque. It is
quite clever, but having this as part of the semantics of core
functionality is problematic in a lot of ways. When this was
previously proposed, e.g. for VC4, the conclusion seemed to be that
for these reasons, any memory-to-memory buffer processing should be
performed in a separate step with a new API.

Cheers,
Daniel
