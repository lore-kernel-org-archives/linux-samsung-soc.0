From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] Exynos DRM: fix suspend/resume support
Date: Thu, 14 Sep 2017 14:00:59 +0200
Message-ID: <1505390461-14211-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170914120116eucas1p2081e2bc3d1417319a4a379d3610a7041@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36375 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751537AbdINMBU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 08:01:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi!

Recently I noticed that suspend/resume support in Exynos DRM driver is
broken since v4.13-rc1. After some investigation I found that there are 2
patches causing this problem. First one is specific to v4.13
kernel release (first patch fixes it). The second one is caused by a
patch queued to linux-next for v4.14-rc1 merge window (second patch fixes
it). Please queue both patches to v4.14-rcX fixes merge.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Marek Szyprowski (2):
  drm/exynos: Fix locking in the suspend/resume paths
  drm/exynos: Fix suspend/resume support

 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 36 +++++++++++--------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 +++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h | 10 +++++++++
 4 files changed, 43 insertions(+), 24 deletions(-)

-- 
1.9.1
