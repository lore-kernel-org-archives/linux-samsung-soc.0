From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [RFC 0/2] New feature: Framebuffer processors
Date: Mon, 22 Aug 2016 17:30:04 +0200
Message-ID: <CA+M3ks5OKnH0HpRYkjZixgWnfpqePTCbw_rnpX8e-dY6CWSukA@mail.gmail.com>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
 <925c67f8-4990-04c6-ec2e-c6c01e283258@amd.com> <CAF6AEGtHeSKoQcVbTuucy-KdA8V=LLtC7uTEDmup3_5tz0HZMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34166 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755370AbcHVPaF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 11:30:05 -0400
Received: by mail-oi0-f47.google.com with SMTP id l203so156204296oib.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2016 08:30:05 -0700 (PDT)
In-Reply-To: <CAF6AEGtHeSKoQcVbTuucy-KdA8V=LLtC7uTEDmup3_5tz0HZMg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Enrico Weigelt <enrico.weigelt@gr13.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>

In STM SoC we have hardware block doing scaling/colorspace conversion,
we have decide to use v4l2 mem2mem API for it:
https://linuxtv.org/downloads/v4l-dvb-apis/selection-api.html

the code is here:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/driver=
s/media/platform/sti/bdisp?id=3Drefs/tags/v4.8-rc3

Regards,
Benjamin


2016-08-22 17:23 GMT+02:00 Rob Clark <robdclark@gmail.com>:
> On Mon, Aug 22, 2016 at 5:59 AM, Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
>> Am 22.08.2016 um 11:44 schrieb Marek Szyprowski:
>>>
>>> Dear all,
>>>
>>> This is the initial proposal for extending DRM API with generic support
>>> for
>>> hardware modules, which can be used for processing image data from the =
one
>>> memory buffer to another. Typical memory-to-memory operations are:
>>> rotation, scaling, colour space conversion or mix of them. In this
>>> proposal
>>> I named such hardware modules a framebuffer processors.
>>>
>>> Embedded SoCs are known to have a number of hardware blocks, which perf=
orm
>>> such operations. They can be used in paralel to the main GPU module to
>>> offload CPU from processing grapics or video data. One of example use o=
f
>>> such modules is implementing video overlay, which usually requires colo=
r
>>> space conversion from NV12 (or similar) to RGB32 color space and scalin=
g
>>> to
>>> target window size.
>>>
>>> Till now there was no generic, hardware independent API for performing
>>> such
>>> operations. Exynos DRM driver has its own custom extension called IPP
>>> (Image Post Processing), but frankly speaking, it is over-engineered an=
d
>>> not
>>> really used in open-source. I didn't indentify similar API in other DRM
>>> drivers, besides those which expose complete support for the whole GPU.
>>
>>
>> Well there are good reasons why we don't have hardware independent comma=
nd
>> submission.
>>
>> We already tried approaches like this and they didn't worked very well a=
nd
>> are generally a pain to get right.
>>
>> So my feeling goes into the direction of a NAK, especially since you did=
n't
>> explained in this mail why there is need for a common API.
>
> I guess a lot comes down to 'how long before hw designers bolt a CP to
> the thing'..  at that point, I think you especially don't want a
> per-blit kernel interface.
>
> But either way, if userspace needs/wants a generic 2d blitter API, it
> is probably best to start out with defining a common userspace level
> API.  That gets you a lot more flexibility to throw it away and start
> again once you realize you've painted yourself into a corner.  And it
> is something that could be implemented on top of real gpu's in
> addition to things that look more like a mem2mem crtc.
>
> Given the length of time kernel uapi must be supported, vs how fast hw
> evolves, I'm leaning towards NAK as well.
>
> BR,
> -R
>
>
>> Regards,
>> Christian.
>>
>>
>>>
>>> However, the need for commmon API has been already mentioned on the
>>> mailing
>>> list. Here are some example threads:
>>> 1. "RFC: hardware accelerated bitblt using dma engine"
>>> http://www.spinics.net/lists/dri-devel/msg114250.html
>>> 2. "[PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing)
>>> subsystem"
>>> https://lists.freedesktop.org/archives/dri-devel/2015-November/094115.h=
tml
>>> https://lists.freedesktop.org/archives/dri-devel/2015-November/094533.h=
tml
>>>
>>> The proposed API is heavily inspired by atomic KMS approach - it is als=
o
>>> based on DRM objects and their properties. A new DRM object is introduc=
ed:
>>> framebuffer processor (called fbproc for convenience). Such fbproc obje=
cts
>>> have a set of standard DRM properties, which describes the operation to=
 be
>>> performed by respective hardware module. In typical case those properti=
es
>>> are a source fb id and rectangle (x, y, width, height) and destination =
fb
>>> id and rectangle. Optionally a rotation property can be also specified =
if
>>> supported by the given hardware. To perform an operation on image data,
>>> userspace provides a set of properties and their values for given fbpro=
c
>>> object in a similar way as object and properties are provided for
>>> performing atomic page flip / mode setting.
>>>
>>> The proposed API consists of the 3 new ioctls:
>>> - DRM_IOCTL_MODE_GETFBPROCRESOURCES: to enumerate all available fbproc
>>>    objects,
>>> - DRM_IOCTL_MODE_GETFBPROC: to query capabilities of given fbproc objec=
t,
>>> - DRM_IOCTL_MODE_FBPROC: to perform operation described by given proper=
ty
>>>    set.
>>>
>>> The proposed API is extensible. Drivers can attach their own, custom
>>> properties to add support for more advanced picture processing (for
>>> example
>>> blending).
>>>
>>> Please note that this API is intended to be used for simple
>>> memory-to-memory
>>> image processing hardware not the full-blown GPU blitters, which usuall=
y
>>> have more features. Typically blitters provides much more operations
>>> beside
>>> simple pixel copying and operate best if its command queue is controlle=
d
>>> from
>>> respective dedicated code in userspace.
>>>
>>> The patchset consist of 4 parts:
>>> 1. generic code for DRM core for handling fbproc objects and ioctls
>>> 2. example, quick conversion of Exynos Rotator driver to fbproc API
>>> 3. libdrm extensions for handling fbproc objects
>>> 4. simple example of userspace code for performing 180 degree rotation =
of
>>> the
>>>     framebuffer
>>>
>>> Patches were tested on Exynos 4412-based Odroid U3 board, on top
>>> of Linux v4.8-rc1 kernel.
>>>
>>> TODO:
>>> 1. agree on the API shape
>>> 2. add more documentation, especially to the kernel docs
>>> 3. add more userspace examples
>>>
>>> Best regards
>>> Marek Szyprowski
>>> Samsung R&D Institute Poland
>>>
>>>
>>> Marek Szyprowski (2):
>>>    drm: add support for framebuffer processor objects
>>>    drm/exynos: register rotator as fbproc instead of custom ipp framewo=
rk
>>>
>>>   drivers/gpu/drm/Makefile                    |   3 +-
>>>   drivers/gpu/drm/drm_atomic.c                |   5 +
>>>   drivers/gpu/drm/drm_crtc.c                  |   6 +
>>>   drivers/gpu/drm/drm_crtc_internal.h         |  12 +
>>>   drivers/gpu/drm/drm_fbproc.c                | 754
>>> ++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/drm_ioctl.c                 |   3 +
>>>   drivers/gpu/drm/exynos/Kconfig              |   1 -
>>>   drivers/gpu/drm/exynos/exynos_drm_drv.c     |   3 +-
>>>   drivers/gpu/drm/exynos/exynos_drm_rotator.c | 353 +++++++------
>>>   drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 -
>>>   include/drm/drmP.h                          |  10 +
>>>   include/drm/drm_crtc.h                      | 211 ++++++++
>>>   include/drm/drm_irq.h                       |  14 +
>>>   include/uapi/drm/drm.h                      |  13 +
>>>   include/uapi/drm/drm_mode.h                 |  39 ++
>>>   15 files changed, 1263 insertions(+), 183 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/drm_fbproc.c
>>>   delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
