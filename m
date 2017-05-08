From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC v2 0/2] Exynos DRM: add Picture Processor extension
Date: Mon, 08 May 2017 11:11:37 +0200
Message-ID: <1494234699-23843-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170508091205eucas1p277086174c1d02695555200fab0e20211@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33660 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753712AbdEHJMK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2017 05:12:10 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OPM002O9MW7GF70@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 May 2017 10:12:07 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>

Dear all,

This is an updated proposal for extending EXYNOS DRM API with generic support
for hardware modules, which can be used for processing image data from the
one memory buffer to another. Typical memory-to-memory operations are:
rotation, scaling, colour space conversion or mix of them. This is
a follow-up of my previous proposal "[RFC 0/2] New feature: Framebuffer
processors", which has been rejected as "not really needed in the DRM core":
http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg146286.html

In this proposal I moved all the code to Exynos DRM driver, so now this
will be specific only to Exynos DRM. I've also changed the name from
framebuffer processor (fbproc) to picture processor (pp) to avoid confusion
with fbdev API.

Here is a bit more information what picture processors are:

Embedded SoCs are known to have a number of hardware blocks, which perform
such operations. They can be used in paralel to the main GPU module to
offload CPU from processing grapics or video data. One of example use of
such modules is implementing video overlay, which usually requires color
space conversion from NV12 (or similar) to RGB32 color space and scaling to
target window size.

The proposed API is ispired a bit by atomic KMS approach. Each picture
processor has a number of parameters, which describe operation to be
performed by respective hardware module. The list is open and can be
extended in the future. In typical case those parameters are a source fb
id and rectangle (x, y, width, height) and destination fb id and
rectangle as well as a rotation property. Parameters are provided by
their predefined IDs. To perform an operation on image data, userspace
provides a set of parameters and their values for given picture processor.

The proposed API consists of the 3 new ioctls:
- DRM_IOCTL_EXYNOS_PP_GET_RESOURCES: to enumerate all available picture
  processors,
- DRM_IOCTL_EXYNOS_PP_GET: to query capabilities of given picture
  processor,
- DRM_IOCTL_EXYNOS_PP_COMMIT: to perform operation described by given
  property set.

The proposed userspace API is extensible. Drivers can add their own,
custom parameters to add support for more advanced picture processing (for
example blending).

This proposal aims to replace Exynos DRM IPP (Image Post Processing)
subsystem. IPP API is over-engineered in general, but not really extensible
on the other side. It is also buggy, with significant design flaws - the
biggest issue is the fact that the API covers memory-2-memory picture
operations together with CRTC writeback and duplicating features, which
belongs to video plane. Comparing with IPP subsystem, the PP framework is
smaller (1807 vs 646 lines) and allows driver simplification (Exynos
rotator driver smaller by over 200 lines).

Open questions:
- How to expose supported pixel formats/modifiers? Currently this is done
  by the arrays of supported fourcc codes in the drm_exynos_pp_get structure
  and DRM_IOCTL_EXYNOS_PP_GET ioctl.
  I would like to switch to a structure similar to recently discussed
  format/modifier blob to avoid reinventing wheel:
  https://www.spinics.net/lists/intel-gfx/msg127094.html
- How to expose the range of the supported parameters (min/max width,
  rotation values)? Is it really needed?


TODO:
- convert remaining Exynos DRM IPP drivers (FIMC, GScaller)
- remove Exynos DRM IPP subsystem
- (optional) provide virtual V4L2 mem2mem device on top of Exynos PP framework

Patches were tested on Exynos 4412-based Odroid U3 board, on top of Linux v4.11
kernel.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:
v2:
- removed usage of DRM objects and properties - replaced them with simple list
  of parameters with predefined IDs

v1:
- moved this feature from DRM core to Exynos DRM driver
- changed name from framebuffer processor to picture processor
- simplified code to cover only things needed by Exynos drivers
- implemented simple fifo task scheduler
- cleaned up rotator driver conversion (removed IPP remainings)


v0: http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg146286.html
- initial post of "[RFC 0/2] New feature: Framebuffer processors"
- generic approach implemented in DRM core, rejected


Patch summary:

Marek Szyprowski (2):
  drm/exynos: Add Picture Processor framework
  drm/exynos: Convert Exynos Rotator driver to Picture Processor
    interface

 drivers/gpu/drm/exynos/Kconfig              |   1 -
 drivers/gpu/drm/exynos/Makefile             |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   9 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |   4 +
 drivers/gpu/drm/exynos/exynos_drm_pp.c      | 645 ++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_pp.h      | 153 +++++++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 493 +++++----------------
 drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 -
 include/uapi/drm/exynos_drm.h               |  76 ++++
 9 files changed, 1006 insertions(+), 397 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_pp.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_pp.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h

-- 
1.9.1
