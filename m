From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 00/22] Exynos DRM: new life of IPP (Image Post Processing)
 subsystem
Date: Mon, 30 Nov 2015 14:53:15 +0100
Message-ID: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53289 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754033AbbK3Nxr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:47 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM00BTXRXJ7RB0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:44 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Dear All,

This patch series introduces a new life into Exynos IPP (Image Post
Processing) subsystem by integrating it (transparently for userspace
applications) with Exynos DRM core plane management. This means that all
CRTC drivers transparently get support for standard features of IPP
subsystem like rotation, scaling and color space conversion.

Support for features not supported natively by CRTC drivers is
implemented with a help of temporary framebuffers, where image data is
processed by IPP subsystem before performing the scanout by a CRTC driver.

This is second version of this patchset. The initial version is available
here:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/49743

The main change since v1 is support for color space conversion and minor
fixes in the preparation patches (added support for native scaling in
Exynos Video Processor module).

This feature is 'experimental'. From the initial discussion I see that
there is no consensus if this feature should be integrated seamplessly
in Exynos DRM core or provided by a separate API. This will be further
discussed.

However, I would like to ask for merging patches 1-15, which are pure
bugfixes and code cleanups. The patches are based on top of current
exynos-drm-next branch.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (17):
  drm/exynos: rotator: convert to common clock framework
  drm/exynos: exynos7-decon: remove excessive check
  drm/exynos: move dma_addr attribute from exynos plane to exynos fb
  drm/exynos: introduce exynos_drm_plane_state structure
  drm/exynos: mixer: use crtc->state->adjusted_mode instead of
    crtc->mode
  drm/exynos: mixer: enable video overlay plane only when VP is
    available
  drm/exynos: introduce exynos_drm_plane_config structure
  drm/exynos: add generic check for plane state
  drm/exynos: mixer: use ratio precalculated in exynos_state
  drm/exynos: fix clipping when scaling is enabled
  drm/exynos: fimd: fix dma burst size setting for small plane size
  drm/exynos: gem: remove old unused prototypes
  drm/exynos: add fb pointer to exynos_drm_plane_state
  drm/exynos: gem: set default alignment for dumb GEM buffers
  drm/exynos: gem: simplify access to exynos gem object
  drm/exynos: ipp: make framework context global
  drm/exynos: add support for plane rotation, scalling and colospace
    convesion

Seung-Woo Kim (5):
  drm/exynos: gsc: prepare and unprepare gsc clock
  drm/exynos: gsc: fix wrong pm_runtime state
  drm/exynos: gsc: add device tree support and remove usage of static
    mappings
  drm/exynos: fix to calculate offset of each plane for ipp fimc
  drm/exynos: fix to calculate offset of each plane for ipp gsc

 .../devicetree/bindings/media/exynos5-gsc.txt      |   4 +
 drivers/gpu/drm/exynos/Kconfig                     |  10 +-
 drivers/gpu/drm/exynos/Makefile                    |   1 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |  48 ++-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |  68 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |  96 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |  16 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.h             |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 106 ++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  88 ++---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |  48 ++-
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |  54 +--
 drivers/gpu/drm/exynos/exynos_drm_gem.h            |  51 +--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 151 ++++++++-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 240 +++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_ipp.h            |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          | 237 ++++++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.h          |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c      | 369 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h      |  73 ++++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  30 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              | 129 ++++---
 drivers/gpu/drm/exynos/regs-gsc.h                  |   4 +-
 24 files changed, 1375 insertions(+), 470 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h

-- 
1.9.2
