From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/4] drm/exynos: introduce generic zpos property
Date: Tue, 05 Jan 2016 13:52:49 +0100
Message-ID: <1451998373-13708-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54941 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbcAEMxI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jan 2016 07:53:08 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0H00IP0D4H4J40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jan 2016 12:53:05 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Hello all,

This patch series is a continuation of rework of blending support in
Exynos DRM driver. Some background can be found here:
http://www.spinics.net/lists/dri-devel/msg96969.html

Daniel Vetter suggested that zpos property should be made generic, with
well-defined semantics. This patchset is my proposal for such generic
zpos property:
- added zpos properties to drm core and plane state structures,
- added helpers for normalizing zpos properties of given set of planes,
- well defined semantics: planes are sorted by zpos values and then plane
  id value if zpos equals.

Patches 2/4 and 3/4 are fixes for Exynos DRM driver, which are required
to properly implement generic zpos handling. However they can be also
merged regardless of the rest of the patches (if there is a need for
further discussion on the generic zpos property feature).

Patches are based on top of latest exynos-drm-next branch.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (4):
  drm: add generic zpos property
  drm/exynos: crtc: rework atomic_{begin,flush}
  drm/exynos: mixer: properly update all planes on the same vblank event
  drm/exynos: use generic code for managing zpos plane property

 Documentation/DocBook/gpu.tmpl                | 14 +++++-
 drivers/gpu/drm/drm_atomic.c                  |  4 ++
 drivers/gpu/drm/drm_atomic_helper.c           | 52 ++++++++++++++++++++
 drivers/gpu/drm/drm_crtc.c                    | 13 +++++
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 14 +++---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 14 +++---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 20 ++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       | 11 ++---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 14 +++---
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 68 +++++++--------------------
 drivers/gpu/drm/exynos/exynos_mixer.c         | 53 ++++++++++++++++-----
 include/drm/drm_atomic_helper.h               |  2 +
 include/drm/drm_crtc.h                        | 13 +++++
 13 files changed, 187 insertions(+), 105 deletions(-)

-- 
1.9.2
