From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 0/3] drm/exynos: Allow module to be autoloaded
Date: Fri, 18 Jul 2014 22:36:38 +0200
Message-ID: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:36877 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761952AbaGRUhP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 16:37:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

The exynos DRM module currently is not automatically loaded when build as a
module. This is due to the simple fact that it doesn't have any
MODULE_DEVICE_TABLE entries whatsoever... Most of these were removed previously
as it wasn't possible at the time to have multiple calls to MODULE_DEVICE_TABLE
in one module, however commit 21bdd17b21b45ea solved that.

The first two patches revert the previous removals of MODULE_DEVICE_TABLE
calls, while the last one adds calls for the remaining OF match tables without a
MODULE_DEVICE_TABLE call.

Sjoerd Simons (3):
  Revert "drm/exynos: fix module build error"
  Revert "drm/exynos: remove MODULE_DEVICE_TABLE definitions"
  drm/exynos: Add MODULE_DEVICE_TABLE entries for various components

 drivers/gpu/drm/exynos/exynos_dp_core.c     | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 +
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 +
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 1 +
 drivers/gpu/drm/exynos/exynos_mixer.c       | 1 +
 8 files changed, 8 insertions(+)

-- 
2.0.1
