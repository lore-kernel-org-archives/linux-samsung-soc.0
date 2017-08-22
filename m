From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 0/9] drm/exynos: misc fixes and more
Date: Tue, 22 Aug 2017 16:19:35 +0200
Message-ID: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55844 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932510AbdHVOT5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 10:19:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this is the second iteration of [1], with the following changes:
- split patch 3/8 (suggested by Inki)
- zero init registers in patch 4/8 (suggested by Inki)
- rephrased commit description of patch 5/8 to make it more
  clear that this behaviour depends on the hw
- replace zero with linear modifier in patch 2/8


Summary:
(a) Enables support for NV12MT in the mixer.
(b) Sanitizes buffer pitch for HW with restrictions.
(c) Misc fixes

With best wishes,
Tobias

[1] https://www.spinics.net/lists/linux-samsung-soc/msg60235.html


Tobias Jakobi (9):
  drm/exynos: mixer: fix chroma comment in vp_video_buffer()
  drm/exynos: mixer: enable NV12MT support for the video plane
  drm/exynos: mixer: simplify vp_video_buffer()
  drm/exynos: mixer: simplify mixer_graph_buffer()
  drm/exynos: mixer: remove src offset from mixer_graph_buffer()
  drm/exynos: introduce BYTE_PITCH capability
  drm/exynos: add BYTE_PITCH cap for all supported planes
  drm/exynos: consistent use of cpp
  drm/exynos: simplify set_pixfmt() in DECON and FIMD drivers

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 17 +++++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 13 +++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 17 ++++------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 37 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_mixer.c         | 48 +++++++++------------------
 7 files changed, 75 insertions(+), 61 deletions(-)

-- 
2.13.0
