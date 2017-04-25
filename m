From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC 0/4] Exynos DRM: add Picture Processor extension
Date: Tue, 25 Apr 2017 08:59:12 +0200
Message-ID: <f5331d5a-8b31-da2b-0f90-a5f785282796@samsung.com>
References: <CGME20170420091406eucas1p24c50a0015545105081257d880727386c@eucas1p2.samsung.com>
 <1492679620-12792-1-git-send-email-m.szyprowski@samsung.com>
 <CAPM=9tz2_Fi_znFvejBH3QS_eXDZzwPH=L8Z+WsCN7718JtCrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20976 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1168453AbdDYG7S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Apr 2017 02:59:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOY00H6YE2R4O30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Apr 2017 07:59:15 +0100 (BST)
In-reply-to: <CAPM=9tz2_Fi_znFvejBH3QS_eXDZzwPH=L8Z+WsCN7718JtCrg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Dave,

On 2017-04-20 21:02, Dave Airlie wrote:
> On 20 April 2017 at 19:13, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> This is an updated proposal for extending EXYNOS DRM API with generic support
>> for hardware modules, which can be used for processing image data from the
>> one memory buffer to another. Typical memory-to-memory operations are:
>> rotation, scaling, colour space conversion or mix of them. This is
>> a follow-up of my previous proposal "[RFC 0/2] New feature: Framebuffer
>> processors", which has been rejected as "not really needed in the DRM core":
>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg146286.html
>>
>> In this proposal I moved all the code to Exynos DRM driver, so now this
>> will be specific only to Exynos DRM. I've also changed the name from
>> framebuffer processor (fbproc) to picture processor (pp) to avoid confusion
>> with fbdev API.
>>
>> Here is a bit more information what picture processors are:
>>
>> Embedded SoCs are known to have a number of hardware blocks, which perform
>> such operations. They can be used in paralel to the main GPU module to
>> offload CPU from processing grapics or video data. One of example use of
>> such modules is implementing video overlay, which usually requires color
>> space conversion from NV12 (or similar) to RGB32 color space and scaling to
>> target window size.
>>
>> The proposed API is heavily inspired by atomic KMS approach - it is also
>> based on DRM objects and their properties. A new DRM object is introduced:
>> picture processor (called pp for convenience). Such objects have a set of
>> standard DRM properties, which describes the operation to be performed by
>> respective hardware module. In typical case those properties are a source
>> fb id and rectangle (x, y, width, height) and destination fb id and
>> rectangle. Optionally a rotation property can be also specified if
>> supported by the given hardware. To perform an operation on image data,
>> userspace provides a set of properties and their values for given fbproc
>> object in a similar way as object and properties are provided for
>> performing atomic page flip / mode setting.
>>
>> The proposed API consists of the 3 new ioctls:
>> - DRM_IOCTL_EXYNOS_PP_GET_RESOURCES: to enumerate all available picture
>>    processors,
>> - DRM_IOCTL_EXYNOS_PP_GET: to query capabilities of given picture
>>    processor,
>> - DRM_IOCTL_EXYNOS_PP_COMMIT: to perform operation described by given
>>    property set.
>>
>> The proposed API is extensible. Drivers can attach their own, custom
>> properties to add support for more advanced picture processing (for example
>> blending).
> So this looks more like a command submission API like we have for other drivers.
>
> Is there an overarching reason why it needs to reuse the core drm
> object tracking
> and properties, or was that just a nice to have, vs something like
> amdgpu chunks.

Thanks for your comment.

DRM objects and properties were my first choice when designing this new api,
but I'm still a bit new to DRM at all. I was also a bit fascinated by the
atomic KMS approach, though. I selected them simply to reuse the code for
managing objects and enumerating their properties from userspace. If this is
not the preferred approach, I will rewrite the code to use something custom.
I didn't know about amdgpu chunks, but from the quick look they are just a
structure to store a set of ids and data for them. Maybe there is no need to
use strings for enumerating the properties and limiting the API to the known
set of IDs will be more than enough in this case.

> My worry about exposing objects and properties to the drivers is I'm
> sure someone
> could get quite inventive and end up with a forked atomic API that we don't see,
> or undocumented things.

Okay. I will try different approach then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
