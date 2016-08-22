From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC 0/2] New feature: Framebuffer processors
Date: Mon, 22 Aug 2016 16:59:52 +0200
Message-ID: <20160822145952.GG24290@phenom.ffwll.local>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
 <925c67f8-4990-04c6-ec2e-c6c01e283258@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33595 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752299AbcHVO75 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:59:57 -0400
Received: by mail-wm0-f68.google.com with SMTP id o80so13908586wme.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2016 07:59:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <925c67f8-4990-04c6-ec2e-c6c01e283258@amd.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Seung-Woo Kim <sw0312.kim@samsung.com>, Enrico Weigelt <enrico.weigelt@gr13.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Aug 22, 2016 at 11:59:24AM +0200, Christian König wrote:
> Am 22.08.2016 um 11:44 schrieb Marek Szyprowski:
> > Dear all,
> > 
> > This is the initial proposal for extending DRM API with generic support for
> > hardware modules, which can be used for processing image data from the one
> > memory buffer to another. Typical memory-to-memory operations are:
> > rotation, scaling, colour space conversion or mix of them. In this proposal
> > I named such hardware modules a framebuffer processors.
> > 
> > Embedded SoCs are known to have a number of hardware blocks, which perform
> > such operations. They can be used in paralel to the main GPU module to
> > offload CPU from processing grapics or video data. One of example use of
> > such modules is implementing video overlay, which usually requires color
> > space conversion from NV12 (or similar) to RGB32 color space and scaling to
> > target window size.
> > 
> > Till now there was no generic, hardware independent API for performing such
> > operations. Exynos DRM driver has its own custom extension called IPP
> > (Image Post Processing), but frankly speaking, it is over-engineered and not
> > really used in open-source. I didn't indentify similar API in other DRM
> > drivers, besides those which expose complete support for the whole GPU.
> 
> Well there are good reasons why we don't have hardware independent command
> submission.
> 
> We already tried approaches like this and they didn't worked very well and
> are generally a pain to get right.
> 
> So my feeling goes into the direction of a NAK, especially since you didn't
> explained in this mail why there is need for a common API.

We've had an earlier RFC thread, and I made it clear there already that
this will face a steep uphill battle. I don't really see any explanation
here why this is not an exact copy of the ideas we've shown to not work
10+ years ago, hence I concur on this NACK.

Make this a driver private thing, operating on gem objects (and yes that
means you get to reinvent the metdata, which is imo a good thing since it
avoids encumbering kms with this blitter use-case). And then that
interface proves indeed useful for multiple blitter IP blocks we can use
it for that in generic fashion. And if it shows up in different
display/render/gpu blocks we can reuse the driver using dma-buf/prime
sharing. So there's really downside, except that your ioctl won't be
blessed as official in any way, which imo is a Good Thing.

Or this all turns out as a mistake (which I expect it to be) and we can
quitely burry it again since it's just a little driver.

Trying to push this will lead to 1+ years of frustration and most likely
still not succeed.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > However, the need for commmon API has been already mentioned on the mailing
> > list. Here are some example threads:
> > 1. "RFC: hardware accelerated bitblt using dma engine"
> > http://www.spinics.net/lists/dri-devel/msg114250.html
> > 2. "[PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing) subsystem"
> > https://lists.freedesktop.org/archives/dri-devel/2015-November/094115.html
> > https://lists.freedesktop.org/archives/dri-devel/2015-November/094533.html
> > 
> > The proposed API is heavily inspired by atomic KMS approach - it is also
> > based on DRM objects and their properties. A new DRM object is introduced:
> > framebuffer processor (called fbproc for convenience). Such fbproc objects
> > have a set of standard DRM properties, which describes the operation to be
> > performed by respective hardware module. In typical case those properties
> > are a source fb id and rectangle (x, y, width, height) and destination fb
> > id and rectangle. Optionally a rotation property can be also specified if
> > supported by the given hardware. To perform an operation on image data,
> > userspace provides a set of properties and their values for given fbproc
> > object in a similar way as object and properties are provided for
> > performing atomic page flip / mode setting.
> > 
> > The proposed API consists of the 3 new ioctls:
> > - DRM_IOCTL_MODE_GETFBPROCRESOURCES: to enumerate all available fbproc
> >    objects,
> > - DRM_IOCTL_MODE_GETFBPROC: to query capabilities of given fbproc object,
> > - DRM_IOCTL_MODE_FBPROC: to perform operation described by given property
> >    set.
> > 
> > The proposed API is extensible. Drivers can attach their own, custom
> > properties to add support for more advanced picture processing (for example
> > blending).
> > 
> > Please note that this API is intended to be used for simple memory-to-memory
> > image processing hardware not the full-blown GPU blitters, which usually
> > have more features. Typically blitters provides much more operations beside
> > simple pixel copying and operate best if its command queue is controlled from
> > respective dedicated code in userspace.
> > 
> > The patchset consist of 4 parts:
> > 1. generic code for DRM core for handling fbproc objects and ioctls
> > 2. example, quick conversion of Exynos Rotator driver to fbproc API
> > 3. libdrm extensions for handling fbproc objects
> > 4. simple example of userspace code for performing 180 degree rotation of the
> >     framebuffer
> > 
> > Patches were tested on Exynos 4412-based Odroid U3 board, on top
> > of Linux v4.8-rc1 kernel.
> > 
> > TODO:
> > 1. agree on the API shape
> > 2. add more documentation, especially to the kernel docs
> > 3. add more userspace examples
> > 
> > Best regards
> > Marek Szyprowski
> > Samsung R&D Institute Poland
> > 
> > 
> > Marek Szyprowski (2):
> >    drm: add support for framebuffer processor objects
> >    drm/exynos: register rotator as fbproc instead of custom ipp framework
> > 
> >   drivers/gpu/drm/Makefile                    |   3 +-
> >   drivers/gpu/drm/drm_atomic.c                |   5 +
> >   drivers/gpu/drm/drm_crtc.c                  |   6 +
> >   drivers/gpu/drm/drm_crtc_internal.h         |  12 +
> >   drivers/gpu/drm/drm_fbproc.c                | 754 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/drm_ioctl.c                 |   3 +
> >   drivers/gpu/drm/exynos/Kconfig              |   1 -
> >   drivers/gpu/drm/exynos/exynos_drm_drv.c     |   3 +-
> >   drivers/gpu/drm/exynos/exynos_drm_rotator.c | 353 +++++++------
> >   drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 -
> >   include/drm/drmP.h                          |  10 +
> >   include/drm/drm_crtc.h                      | 211 ++++++++
> >   include/drm/drm_irq.h                       |  14 +
> >   include/uapi/drm/drm.h                      |  13 +
> >   include/uapi/drm/drm_mode.h                 |  39 ++
> >   15 files changed, 1263 insertions(+), 183 deletions(-)
> >   create mode 100644 drivers/gpu/drm/drm_fbproc.c
> >   delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
