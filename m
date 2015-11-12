From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing)
 subsystem
Date: Thu, 12 Nov 2015 16:10:11 +0100
Message-ID: <5644ABD3.3010407@math.uni-bielefeld.de>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <CAPj87rNz6vYrcjgV1fdSgE-ZCHnFFNfJKqskTsu2C1+KkmW_gQ@mail.gmail.com>
 <564489A9.5040709@math.uni-bielefeld.de>
 <CAPj87rNOH59fssu2CTJEt6MEn-zhGEE=5VxiscCWiRjtTwH-wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59139 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753597AbbKLPKO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 10:10:14 -0500
In-Reply-To: <CAPj87rNOH59fssu2CTJEt6MEn-zhGEE=5VxiscCWiRjtTwH-wQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>

Hey Daniel,


Daniel Stone wrote:
> Hi,
> 
> On 12 November 2015 at 12:44, Tobias Jakobi
> <tjakobi@math.uni-bielefeld.de> wrote:
>> Daniel Stone wrote:
>>> On 10 November 2015 at 13:23, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> This patch series introduces a new life into Exynos IPP (Image Post
>>>> Processing) subsystem by integrating it (transparently for userspace
>>>> applications) with Exynos DRM core plane management. This means that all
>>>> CRTC drivers transparently get support for standard features of IPP
>>>> subsystem like rotation and scaling.
>>>>
>>>> Support for features not supported natively by CRTC drivers is
>>>> implemented with a help of temporary framebuffers, where image data is
>>>> processed by IPP subsystem before performing the scanout by a CRTC driver.
>>>
>>> Hm, interesting. The RPi has a similar setup - VC4 can work either
>>> online (realtime scanout) or offline (mem2mem). Once the scene crosses
>>> a certain complexity boundary, it can no longer be composed in
>>> realtime and must fall back to mem2mem before it can be displayed.
>>>
>>> There was talk of having the fallback handled transparently in KMS for
>>> VC4 - similar to this - but the conclusion seemed to be that it was an
>>> inappropriate level of hidden complexity for KMS, and instead would
>>> best be handled by something like HWComposer directing it. Using HWC
>>> would then let you more intelligently split the scene from userspace
>>> (e.g. flatten some components but retain others as active planes).
>> I would be intererested in the performance implications of this
>> abstraction as well.
>>
>> I'd like to use the Exynos FIMC for CSC and scaling, but this operation
>> of course takes some time.
>>
>> I wonder how this interacts with page flipping. If I queue a pageflip
>> event with a buffer that needs to go through the IPP for display, where
>> does the delay caused by the operation factor it? If I understand this
>> correctly drmModePageFlip() still is going to return immediately, but I
>> might miss the next vblank period because the FIMC is still working on
>> the buffer.
> 
> Hmm, from my reading of the patches, this didn't affect page-flip
> timings. In the sync case, it would block until the buffer was
> actually displayed, and in the async case, the event would still be
> delivered at the right time. But you're right that it does introduce
> hugely variable timings, which can be a problem for userspace which
> tries to be intelligent.
I guess this is an issue then, since the FIMC is mainly used in the
context of converting video frames. And a good video player probably
wants to have tight control over the presentation of video frames, to
control A/V sychronization and so on.



> And even then potentially misleading from a
> performance point of view: if userspace can rotate natively (e.g. as
> part of a composition blit, or when rendering buffers in the first
> place), then we can skip the extra work from G2D.
> 
>> My problem here is that this abstraction would take too much control
>> from the user.
>>
>> Correct me if I have this wrong!
> 
> I believe that was the concern previously, yeah. :) That, and encoding
> these semantics in a user-visible way could potentially be dangerous.
I guess the local path transfers would still make sense though, but if I
understand this correctly this would affect FIMD.


With best wishes,
Tobias



> 
> Cheers,
> Daniel
> 
