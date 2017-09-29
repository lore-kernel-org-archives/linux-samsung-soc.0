From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/9] Exynos DRM: rewrite IPP subsystem and userspace API
Date: Fri, 29 Sep 2017 09:32:45 +0200
Message-ID: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170929073300eucas1p29f75848701e8181d1482ce4e202c4b6e@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58916 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750847AbdI2HdE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 03:33:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>

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
Odroid XU3 boards, on top of Linux next-20170928 kernel.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:

v2:
- fixed minor issues pointed by other developers:
  * fixed possible null pointer dereferrence (Tobias)
  * changed limits_size to limits_count (Tobias)
  * renamed struct exynos_drm_ipp_format to drm_exynos_ipp_format (Andrzej)
  * added proper return value from exynos_drm_ipp_get_res_ioctl when no IPP
    driver is present (Andrzej)
  * properly aligned all uapi structures to be 32/64 bit safe (Emil)
  * properly initialize all strucutres
- added new Exynos Scaler driver from Andrzej Pietrasiewicz

v1: https://www.spinics.net/lists/linux-samsung-soc/msg60492.html
- initial version of IPP v2

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

Andrzej Pietrasiewicz (3):
  drm/exynos: Add driver for Exynos Scaler module
  drivers: clk: samsung: Fix m2m scaler clock on Exynos542x
  ARM: dts: exynos: Add mem-2-mem Scaler devices

Marek Szyprowski (6):
  drm/exynos: ipp: Remove Exynos DRM IPP subsystem
  drm/exynos: ipp: Add IPP v2 framework
  drm/exynos: rotator: Convert driver to IPP v2 core API
  drm/exynos: gsc: Convert driver to IPP v2 core API
  drm/exynos: Add generic support for devices shared with V4L2 subsystem
  drm/exynos: fimc: Convert driver to IPP v2 core API

 .../devicetree/bindings/gpu/samsung-scaler.txt     |   25 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   35 +
 drivers/clk/samsung/clk-exynos5420.c               |    2 +-
 drivers/gpu/drm/exynos/Kconfig                     |   18 +-
 drivers/gpu/drm/exynos/Makefile                    |    1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   36 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |  893 +++-----
 drivers/gpu/drm/exynos/exynos_drm_fimc.h           |   23 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |  853 ++------
 drivers/gpu/drm/exynos/exynos_drm_gsc.h            |   24 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 2240 ++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h            |  357 ++--
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  735 ++-----
 drivers/gpu/drm/exynos/exynos_drm_rotator.h        |   19 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |  675 ++++++
 drivers/gpu/drm/exynos/regs-scaler.h               |  426 ++++
 include/uapi/drm/exynos_drm.h                      |  326 +--
 18 files changed, 2818 insertions(+), 3875 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_scaler.c
 create mode 100644 drivers/gpu/drm/exynos/regs-scaler.h

-- 
1.9.1
