From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/5] drm/exynos: rework vblank handling - fixes
Date: Tue, 14 Mar 2017 09:27:55 +0100
Message-ID: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170314082810eucas1p1d35344332eca5f780db4c6d5c983827a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56136 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbdCNI2P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 04:28:15 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMS00FVDQ6ZIY50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Mar 2017 08:28:11 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Inki,

According to you request, this is actual resend of my patchset v3
'drm/exynos: rework vblank handling' split into fixes and enhancements part.

This 'fixes' part is based on today's exynos-drm-fixes branch, original
patches applied without conflict.

The last patch does not really fit into vblank category,
but for sure it is a fix.

Regards
Andrzej


Andrzej Hajda (5):
  drm/exynos: move crtc event handling to drivers callbacks
  drm/exynos/decon5433: fix vblank event handling
  drm/exynos/decon5433: signal frame done interrupt at front porch
  drm/exynos/fimd: signal frame done interrupt at front porch
  drm/exynos/decon5433: fix software trigger mask

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 85 +++++++++++++++++++++++++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 29 +++++----
 drivers/gpu/drm/exynos/exynos_drm_crtc.h      |  2 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  1 +
 drivers/gpu/drm/exynos/exynos_mixer.c         |  1 +
 include/video/exynos5433_decon.h              | 12 ++++
 8 files changed, 117 insertions(+), 18 deletions(-)

-- 
2.7.4
