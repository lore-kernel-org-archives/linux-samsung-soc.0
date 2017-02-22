From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/4] drm/exynos: rework vblank handling
Date: Wed, 22 Feb 2017 17:05:01 +0100
Message-ID: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170222160515eucas1p207f5f7b3a956b56405f547befd4daf63@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63980 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753699AbdBVQFU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 11:05:20 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OLS00BZJA0TAU80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2017 16:05:17 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Inki,

This patchset fixes long standing issue with occassional page faults
or vblank event timeouts on TM2 targets due to delayed vblank handling.
DECON driver should now handle properly all scenarios described in drm
docs [1][2], at least it was my intention.

I have successfully tested it on TM2 panel, TV and both.

[1]: https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html?highlight=drm_crtc_state#c.drm_crtc_arm_vblank_event
[2]: https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html?highlight=drm_crtc_state#c.drm_crtc_state

Regards
Andrzej


Andrzej Hajda (4):
  drm/exynos: move crtc event handling to drivers callbacks
  drm/exynos: simplify completion event handling
  drm/exynos/decon5433: fix vblank event handling
  drm/exynos/decon5433: signal frame done interrupt at VSYNC

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 63 +++++++++++++++++++++++++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 32 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h      |  2 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  2 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  1 +
 drivers/gpu/drm/exynos/exynos_mixer.c         |  1 +
 include/video/exynos5433_decon.h              | 13 ++++++
 8 files changed, 96 insertions(+), 19 deletions(-)

-- 
2.7.4
