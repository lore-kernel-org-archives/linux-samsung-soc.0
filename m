From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC 0/2] New feature: Framebuffer processors
Date: Mon, 22 Aug 2016 11:44:33 +0200
Message-ID: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17062 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752440AbcHVJo6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 05:44:58 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OCB00BS51QVSK40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2016 10:44:56 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Stone <daniel@fooishbar.org>, Enrico Weigelt <enrico.weigelt@gr13.net>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>

Dear all,

This is the initial proposal for extending DRM API with generic support for
hardware modules, which can be used for processing image data from the one
memory buffer to another. Typical memory-to-memory operations are:
rotation, scaling, colour space conversion or mix of them. In this proposal
I named such hardware modules a framebuffer processors.

Embedded SoCs are known to have a number of hardware blocks, which perform
such operations. They can be used in paralel to the main GPU module to
offload CPU from processing grapics or video data. One of example use of
such modules is implementing video overlay, which usually requires color
space conversion from NV12 (or similar) to RGB32 color space and scaling to
target window size.

Till now there was no generic, hardware independent API for performing such
operations. Exynos DRM driver has its own custom extension called IPP
(Image Post Processing), but frankly speaking, it is over-engineered and not
really used in open-source. I didn't indentify similar API in other DRM
drivers, besides those which expose complete support for the whole GPU.

However, the need for commmon API has been already mentioned on the mailing
list. Here are some example threads:
1. "RFC: hardware accelerated bitblt using dma engine"
http://www.spinics.net/lists/dri-devel/msg114250.html
2. "[PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing) subsystem"
https://lists.freedesktop.org/archives/dri-devel/2015-November/094115.html
https://lists.freedesktop.org/archives/dri-devel/2015-November/094533.html

The proposed API is heavily inspired by atomic KMS approach - it is also
based on DRM objects and their properties. A new DRM object is introduced:
framebuffer processor (called fbproc for convenience). Such fbproc objects
have a set of standard DRM properties, which describes the operation to be
performed by respective hardware module. In typical case those properties
are a source fb id and rectangle (x, y, width, height) and destination fb
id and rectangle. Optionally a rotation property can be also specified if
supported by the given hardware. To perform an operation on image data,
userspace provides a set of properties and their values for given fbproc
object in a similar way as object and properties are provided for
performing atomic page flip / mode setting.

The proposed API consists of the 3 new ioctls:
- DRM_IOCTL_MODE_GETFBPROCRESOURCES: to enumerate all available fbproc
  objects,
- DRM_IOCTL_MODE_GETFBPROC: to query capabilities of given fbproc object,
- DRM_IOCTL_MODE_FBPROC: to perform operation described by given property
  set.

The proposed API is extensible. Drivers can attach their own, custom
properties to add support for more advanced picture processing (for example
blending).

Please note that this API is intended to be used for simple memory-to-memory
image processing hardware not the full-blown GPU blitters, which usually
have more features. Typically blitters provides much more operations beside
simple pixel copying and operate best if its command queue is controlled from
respective dedicated code in userspace.

The patchset consist of 4 parts:
1. generic code for DRM core for handling fbproc objects and ioctls
2. example, quick conversion of Exynos Rotator driver to fbproc API
3. libdrm extensions for handling fbproc objects
4. simple example of userspace code for performing 180 degree rotation of the
   framebuffer

Patches were tested on Exynos 4412-based Odroid U3 board, on top
of Linux v4.8-rc1 kernel.

TODO:
1. agree on the API shape
2. add more documentation, especially to the kernel docs
3. add more userspace examples

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (2):
  drm: add support for framebuffer processor objects
  drm/exynos: register rotator as fbproc instead of custom ipp framework

 drivers/gpu/drm/Makefile                    |   3 +-
 drivers/gpu/drm/drm_atomic.c                |   5 +
 drivers/gpu/drm/drm_crtc.c                  |   6 +
 drivers/gpu/drm/drm_crtc_internal.h         |  12 +
 drivers/gpu/drm/drm_fbproc.c                | 754 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c                 |   3 +
 drivers/gpu/drm/exynos/Kconfig              |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 353 +++++++------
 drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 -
 include/drm/drmP.h                          |  10 +
 include/drm/drm_crtc.h                      | 211 ++++++++
 include/drm/drm_irq.h                       |  14 +
 include/uapi/drm/drm.h                      |  13 +
 include/uapi/drm/drm_mode.h                 |  39 ++
 15 files changed, 1263 insertions(+), 183 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbproc.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h

-- 
1.9.1
