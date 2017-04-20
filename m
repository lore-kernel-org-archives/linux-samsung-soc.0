From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC 0/4] Exynos DRM: add Picture Processor extension
Date: Thu, 20 Apr 2017 11:13:36 +0200
Message-ID: <1492679620-12792-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170420091406eucas1p24c50a0015545105081257d880727386c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13896 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942399AbdDTJOK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 05:14:10 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOP00FYMAZJ5X20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Apr 2017 10:14:07 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>

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

The proposed API is heavily inspired by atomic KMS approach - it is also
based on DRM objects and their properties. A new DRM object is introduced:
picture processor (called pp for convenience). Such objects have a set of
standard DRM properties, which describes the operation to be performed by
respective hardware module. In typical case those properties are a source
fb id and rectangle (x, y, width, height) and destination fb id and
rectangle. Optionally a rotation property can be also specified if
supported by the given hardware. To perform an operation on image data,
userspace provides a set of properties and their values for given fbproc
object in a similar way as object and properties are provided for
performing atomic page flip / mode setting.

The proposed API consists of the 3 new ioctls:
- DRM_IOCTL_EXYNOS_PP_GET_RESOURCES: to enumerate all available picture
  processors,
- DRM_IOCTL_EXYNOS_PP_GET: to query capabilities of given picture
  processor,
- DRM_IOCTL_EXYNOS_PP_COMMIT: to perform operation described by given
  property set.

The proposed API is extensible. Drivers can attach their own, custom
properties to add support for more advanced picture processing (for example
blending).

This proposal aims to replace Exynos DRM IPP (Image Post Processing)
subsystem. IPP API is over-engineered in general, but not really extensible
on the other side. It is also buggy, with significant design flaws - the
biggest issue is the fact that the API covers memory-2-memory picture
operations together with CRTC writeback and duplicating features, which
belongs to video plane. Comparing with IPP subsystem, the PP framework is
smaller (1807 vs 778 lines) and allows driver simplification (Exynos
rotator driver smaller by over 200 lines).

Open questions:
- How to expose pp capabilities and supported formats? Currently this is done
  with a drm_exynos_pp_get structure and DRM_IOCTL_EXYNOS_PP_GET ioctl.
  However one can try to use IMMUTABLE properties for capabilities and src/dst
  format set. Rationale: recently Rob Clark proposed to create a DRM property
  with supported pixelformats and modifiers:
  http://www.spinics.net/lists/dri-devel/msg137380.html
- Is it okay to use DRM objects and properties API (DRM_IOCTL_MODE_GETPROPERTY
  and DRM_IOCTL_MODE_OBJ_GETPROPERTIES ioctls) for this purpose?

TODO:
- convert remaining Exynos DRM IPP drivers (FIMC, GScaller)
- remove Exynos DRM IPP subsystem
- (optional) provide virtual V4L2 mem2mem device on top of Exynos PP framework

Patches were tested on Exynos 4412-based Odroid U3 board, on top of Linux
next-20170420 kernel.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:
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

Marek Szyprowski (4):
  drm: Export functions to create custom DRM objects
  drm: Add support for vendor specific DRM objects with custom
    properties
  drm/exynos: Add Picture Processor framework
  drm/exynos: Convert Exynos Rotator driver to Picture Processor
    interface

 drivers/gpu/drm/drm_crtc_internal.h         |   4 -
 drivers/gpu/drm/drm_mode_object.c           |  11 +-
 drivers/gpu/drm/drm_property.c              |   2 +-
 drivers/gpu/drm/exynos/Kconfig              |   1 -
 drivers/gpu/drm/exynos/Makefile             |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   9 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  15 +
 drivers/gpu/drm/exynos/exynos_drm_pp.c      | 775 ++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_pp.h      | 155 ++++++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 513 +++++-------------
 drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 -
 include/drm/drm_mode_object.h               |   6 +
 include/drm/drm_property.h                  |   7 +
 include/uapi/drm/drm_mode.h                 |   1 +
 include/uapi/drm/exynos_drm.h               |  62 +++
 15 files changed, 1166 insertions(+), 417 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_pp.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_pp.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h

-- 
1.9.1
