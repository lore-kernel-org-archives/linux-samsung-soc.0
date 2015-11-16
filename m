From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing)
 subsystem
Date: Mon, 16 Nov 2015 12:35:45 +0100
Message-ID: <5649BF91.5030901@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <CAPj87rNz6vYrcjgV1fdSgE-ZCHnFFNfJKqskTsu2C1+KkmW_gQ@mail.gmail.com>
 <564489A9.5040709@math.uni-bielefeld.de>
 <CAPj87rNOH59fssu2CTJEt6MEn-zhGEE=5VxiscCWiRjtTwH-wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52887 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbbKPLft (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Nov 2015 06:35:49 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXW00EV4O7NE030@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Nov 2015 11:35:47 +0000 (GMT)
In-reply-to: <CAPj87rNOH59fssu2CTJEt6MEn-zhGEE=5VxiscCWiRjtTwH-wQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>

Hello,

On 2015-11-12 15:46, Daniel Stone wrote:
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
> Hmm, from my reading of the patches, this didn't affect page-flip
> timings. In the sync case, it would block until the buffer was
> actually displayed, and in the async case, the event would still be
> delivered at the right time. But you're right that it does introduce
> hugely variable timings, which can be a problem for userspace which
> tries to be intelligent. And even then potentially misleading from a
> performance point of view: if userspace can rotate natively (e.g. as
> part of a composition blit, or when rendering buffers in the first
> place), then we can skip the extra work from G2D.

Page flip events are delivered to userspace at the right time. You are right
that there will be some delay between scheduling a buffer for display 
and the
moment it gets displayed by hardware, but imho good application should sync
audio/video to the vblank events not the moment of scheduling a buffer. So
this delay should not influence on the final quality of displayed

The only problem I see, especially when color space conversion will be 
added,
is how to tell generic application that some modes are preferred / not
preferred, so application would prefer native modes which are faster. On the
other hand application should be aware of the fact that hw scaling is 
usually
faster / less power demanding than cpu scaling, so it is better to use such
mode with additional processing instead of doing that work with the cpu.

On the other hand Exynos hardware also provides so called LOCAL PATH feature
for image processing, in case of which no temporary buffer is needed. This
mode should not introduce a delay. Implementing it is on my TODO list.

>> My problem here is that this abstraction would take too much control
>> from the user.
>>
>> Correct me if I have this wrong!
> I believe that was the concern previously, yeah. :) That, and encoding
> these semantics in a user-visible way could potentially be dangerous.

I believe that having this feature is quite beneficial for generic 
applications
(like weston for example). It is especially very useful for video overlay
display, where scaling, rotation and colorspace conversion are typical
use-cases. An alternative would be to introduce some generic API for a frame
buffer conversions.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
