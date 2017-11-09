From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 0/8] Exynos DRM: rewrite IPP subsystem and userspace API
Date: Thu, 09 Nov 2017 09:11:48 +0100
Message-ID: <20171109081156.7111-1-m.szyprowski@samsung.com>
References: <CGME20171109081211eucas1p1c91ab42c56aff38b1217324e7e9e617f@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44899 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753103AbdKIIMQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 03:12:16 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

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
understand. A new driver to Exynos Scaler hardware module available in
Exynos5420 and newer SoCs is also added on top of the provided changes.

Patches were tested on Exynos4412 based Odroid U3, Exynos5422
Odroid XU3 and Exynos5433 TM2 boards, on top of Linux next-20171109 kernel.

A simple userspace test tool has been sent together with v1 of this
patchset:
https://www.spinics.net/lists/linux-samsung-soc/msg60498.html

Tobias Jakobi has added support for this new API to his fork of libdrm and
mpv video player:
https://github.com/tobiasjakobi/libdrm/tree/ippv2
https://github.com/tobiasjakobi/mpv

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:

v6:
- fixed most checkpatch.pl warnings, only some debug messages exceeds 80
  characters line boundary to avoid breaking strings

v5: https://www.spinics.net/lists/linux-samsung-soc/msg61171.html
- fixed and reworked items pointed by Inki Dae:
  * formats and limits arrays are no longer NULL terminated, all functions
    accessing them require explicit array size argument
  * fixed return value for functions in GScaler, FIMC and Rotator drivers
  * simplified exynos_drm_ipp_task_set() function (removed temporary
    buffer)
  * reworked FIMC driver sharing with V4L2 subsystem, now user can specify
    mask of devices assigned to DRM driver (defaults to fimc.2 and fimc.3)
  * removed drivers specific task check (not used anymore)
- fixed issue pointed by Arnd Bergmann and Tobias Jakobi:
  * removed usage of timeval structures
- removed more dead-code from GScaler and FIMC drivers
- fixed IOMMU page fault caused by FIMC operation in 90 degree rotation
  mode
- added Ack from Rob Herring for Scaler driver
- generated patches with -B/40% to make Rotator, GScaler and FIMC patches
  easier to read (forced complete rewrite)

v4: https://www.spinics.net/lists/linux-samsung-soc/msg61066.html
- fixed Exynos GSC limits (alignment) and operation in 90 degree rotation
  mode
- fixed some style issues in Scaler driver (thanks to Andrzej)
- fixed copy/paste typos in commit messages
- improved debug messages, especially if provided parameters exceeds
  hardwave limits

v3: https://www.spinics.net/lists/linux-samsung-soc/msg60981.html
- fixed minor issues and added features pointed by other developers:
  * fixed missing ipp_unregister (Hoegeun)
  * added missing limits to FIMC and GSC driver (Hoegeun)
  * added more specific compatible strings to GSC driver (Hoegeun)
  * added Exynos5433 support to GSC driver (Hoegeun)
  * added autosuspend runtime PM to all IPP drivers (Tobias)
- added Exynos5433 support to Scaler driver (thanks to Andrzej)
- dropped Exynos5420 clk patch, which has been alredy merged

v2: https://www.spinics.net/lists/dri-devel/msg153418.html
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
  ARM: dts: exynos: Add mem-2-mem Scaler devices
  ARM64: dts: exynos: Add mem-2-mem Scaler devices

Marek Szyprowski (5):
  drm/exynos: ipp: Remove Exynos DRM IPP subsystem
  drm/exynos: ipp: Add IPP v2 framework
  drm/exynos: rotator: Convert driver to IPP v2 core API
  drm/exynos: gsc: Convert driver to IPP v2 core API
  drm/exynos: fimc: Convert driver to IPP v2 core API

 .../devicetree/bindings/gpu/samsung-scaler.txt     |   27 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   35 +
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   42 +
 drivers/gpu/drm/exynos/Kconfig                     |   17 +-
 drivers/gpu/drm/exynos/Makefile                    |    1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   28 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   12 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 3171 +++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_fimc.h           |   23 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 3199 +++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_gsc.h            |   24 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 2704 ++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h            |  427 ++-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        | 1274 +++-----
 drivers/gpu/drm/exynos/exynos_drm_rotator.h        |   19 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |  694 +++++
 drivers/gpu/drm/exynos/regs-scaler.h               |  426 +++
 include/uapi/drm/exynos_drm.h                      |  798 ++---
 18 files changed, 5977 insertions(+), 6944 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
 rewrite drivers/gpu/drm/exynos/exynos_drm_fimc.c (47%)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h
 rewrite drivers/gpu/drm/exynos/exynos_drm_gsc.c (43%)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h
 rewrite drivers/gpu/drm/exynos/exynos_drm_ipp.c (96%)
 rewrite drivers/gpu/drm/exynos/exynos_drm_ipp.h (93%)
 rewrite drivers/gpu/drm/exynos/exynos_drm_rotator.c (72%)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_scaler.c
 create mode 100644 drivers/gpu/drm/exynos/regs-scaler.h
 rewrite include/uapi/drm/exynos_drm.h (44%)

-- 
2.14.2
