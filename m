From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 0/7] drm/exynos: rework layer blending
Date: Wed, 16 Dec 2015 13:21:41 +0100
Message-ID: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11635 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413AbbLPMWO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 07:22:14 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZG00DVIAD0LE80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2015 12:22:12 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Hello all,

This is a continuation of the work started by Tobias Jakobi. The goal of
this patch set is to remove hardcoded blending setup from Exynos Mixer
driver. This patch also enables other Exynos DRM CRTC drivers to use the
configurable plane zpos feature, however patches for FIMD or Decon are
not yet ready.

The initial patches prepared by Tobias are available here:
http://lists.freedesktop.org/archives/dri-devel/2015-November/095080.html

Main changes in v3:
- added patches for changing zpos property and layer priority
  configuration
- simplified blending setup, removed special configuration for the bottom
  layer, removed layer cache
- significantly simplified the code
- rebased on top of exynos-drm-next branch

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (5):
  drm/exynos: rename zpos to index
  drm/exynos: make zpos property configurable
  drm/exynos: mixer: set window priority based on zpos
  drm/exynos: mixer: refactor layer setup
  drm/exynos: mixer: unify a check for video-processor window

Tobias Jakobi (2):
  drm/exynos: mixer: remove all static blending setup
  drm/exynos: mixer: also allow ARGB1555 and ARGB4444

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  10 +--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  10 +--
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  10 +--
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  55 ++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |   2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         | 123 ++++++++++++++++----------
 drivers/gpu/drm/exynos/regs-mixer.h           |   4 +
 9 files changed, 150 insertions(+), 74 deletions(-)

-- 
1.9.2
