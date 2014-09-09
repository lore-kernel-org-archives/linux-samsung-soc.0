From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/9] drm/exynos: initialization/deinitialization fixes
Date: Tue, 09 Sep 2014 15:16:04 +0200
Message-ID: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38620 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbaIINQ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 09:16:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

This set of patches contains fixes of initialization and deinitialization
code of exynos_drm core and components.
It is based on exynos-drm-next branch.

Patchset has been tested on trats and universal_c210 platforms.

Regards
Andrzej


Andrzej Hajda (9):
  drm/exynos/ipp: traverse ipp drivers list safely
  drm/exynos: fix drm driver de-initialization order
  drm/exynos/fbdev: fix fbdev gem object cleanup
  drm/exynos/fb: free exynos framebuffer on error
  drm/exynos/crtc: fix framebuffer reference sequence
  drm/exynos/dsi: unregister connector on removal
  drm/exynos/dpi: unregister connector and panel on removal
  drm/exynos/dp: unregister connector on removal
  drm/exynos/hdmi: unregister connector on removal

 drivers/gpu/drm/exynos/exynos_dp_core.c   | 4 +++-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 6 ++++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c   | 6 +++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c   | 9 ++++++---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 3 ---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c   | 4 ++--
 drivers/gpu/drm/exynos/exynos_hdmi.c      | 4 +++-
 9 files changed, 30 insertions(+), 15 deletions(-)

-- 
1.9.1
