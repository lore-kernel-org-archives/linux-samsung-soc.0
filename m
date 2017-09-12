From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/6] Exynos DRM: rewrite IPP subsystem and userspace API
Date: Tue, 12 Sep 2017 10:08:52 +0200
Message-ID: <1505203739-29747-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170912080909eucas1p1942c418e6e4e2621bb977ecb5ae588be@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45133 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751332AbdILIJN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 04:09:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Dear all,

This patchset performs complete rewrite of Exynos DRM IPP subsystem and
its userspace API.

Why such rewrite is needed? Exynos DRM IPP API is over-engineered in
general, but not really extensible on the other side. It is also buggy,
with significant design flaws:
- Userspace API covers memory-2-memory picture operations together with
  CRTC writeback and duplicating features, which belongs to video plane.
- Lack of support of the all required image formats (for example NV12
  Samsung-tiled cannot be used due to lack of pixel format modifier
  support).
- Userspace API designed only to mimic hardware behaviour, not easy to
  understand.
- Lack of proper input validation in the core, drivers also didn't do that
  correctly, so it was possible to set incorrect parameters and easil
  trigger IOMMU fault or memory trash.
- Drivers were partially disfunctional or supported only a subset of modes.

Due to the above limitations and issues the Exynos DRM IPP API was not
used by any of the open-source projects. I assume that it is safe to remove
this broken API without any damage to open-source community. All remaining
users (mainly Tizen project related) will be updated to the new version.

This patchset changes Exynos DRM IPP subsystem to something useful. The
userspace API is much simpler, state-less and easy to understand. Also
the code of the core and driver is significantly smaller and easier to
understand.

Patches were tested on Exynos4412 based Odroid U3 and Exynos5422
Odroid XU3 boards, on top of Linux next-20170911 kernel.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


My previous works in this area:

"[RFC v2 0/2] Exynos DRM: add Picture Processor extension"
https://www.spinics.net/lists/dri-devel/msg140669.html
- removed usage of DRM objects and properties - replaced them with simple
  list of parameters with predefined IDs

"[RFC 0/4] Exynos DRM: add Picture Processor extension"
https://www.spinics.net/lists/linux-samsung-soc/msg59323.html
- moved this feature from DRM core to Exynos DRM driver
- changed name from framebuffer processor to picture processor
- simplified code to cover only things needed by Exynos drivers
- implemented simple fifo task scheduler
- cleaned up rotator driver conversion (removed IPP remainings)

"[RFC 0/2] New feature: Framebuffer processors"
https://www.spinics.net/lists/linux-samsung-soc/msg54810.html
- generic approach implemented in DRM core, rejected


Patch summary:

Marek Szyprowski (6):
  drm/exynos: ipp: Remove Exynos DRM IPP subsystem
  drm/exynos: ipp: Add IPP v2 framework
  drm/exynos: rotator: Convert driver to IPP v2 core API
  drm/exynos: gsc: Convert driver to IPP v2 core API
  drm/exynos: Add generic support for devices shared with V4L2 subsystem
  drm/exynos: fimc: Convert driver to IPP v2 core API

 drivers/gpu/drm/exynos/Kconfig              |   12 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   33 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  893 +++--------
 drivers/gpu/drm/exynos/exynos_drm_fimc.h    |   23 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  853 +++-------
 drivers/gpu/drm/exynos/exynos_drm_gsc.h     |   24 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 2239 ++++++++-------------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h     |  352 ++---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |  735 ++-------
 drivers/gpu/drm/exynos/exynos_drm_rotator.h |   19 -
 include/uapi/drm/exynos_drm.h               |  315 ++--
 12 files changed, 1627 insertions(+), 3875 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h

-- 
1.9.1
