From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/8] drm/exynos: misc fixes and more
Date: Wed,  9 Aug 2017 13:48:49 +0200
Message-ID: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55062 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752260AbdHILtc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 07:49:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this is basically a resend of [1] with some minor changes to the commit
messages, the RFC tag removed, and a rebase on vanilla 4.13-rc4.

Summary:
(a) Enables support for NV12MT in the mixer.
(b) Sanitizes buffer pitch for HW with restrictions.
(c) Misc fixes

With best wishes,
Tobias


[1] https://lists.freedesktop.org/archives/dri-devel/2017-April/138040.html

Tobias Jakobi (8):
  drm/exynos: mixer: fix chroma comment in vp_video_buffer()
  drm/exynos: mixer: enable NV12MT support for the video plane
  drm/exynos: mixer: simplify {vp_video,mixer_graph}_buffer()
  drm/exynos: mixer: remove src offset from mixer_graph_buffer()
  drm/exynos: introduce BYTE_PITCH capability
  drm/exynos: add BYTE_PITCH cap for all supported planes
  drm/exynos: consistent use of cpp
  drm/exynos: simplify set_pixfmt() in DECON and FIMD drivers

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 17 +++++------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 13 +++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 17 ++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 37 ++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_mixer.c         | 44 ++++++++-------------------
 7 files changed, 71 insertions(+), 61 deletions(-)

-- 
2.13.0
