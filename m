From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v5 00/12] drm/exynos: atomic modesetting support
Date: Thu, 21 May 2015 12:02:43 -0300
Message-ID: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:35382 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755001AbbEUPDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 11:03:05 -0400
Received: by qgew3 with SMTP id w3so41514669qge.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2015 08:03:05 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

Here goes the full support for atomic modesetting on exynos. I've
split the patches in the various phases of atomic support.

v2: fixes comments by Joonyoung
        - remove unused var in patch 09
        - use ->disable instead of outdated ->dpms in hdmi code
        - remove WARN_ON from crtc enable/disable

v3: fixes comment by Joonyoung
        - move the removal of drm_helper_disable_unused_functions() to
        separated patch

v4: add patches that remove unnecessary calls to disable_plane()

v5: fixes NULL CRTC crash on planes updates (reported by Inki and Tobias)

        Gustavo


Gustavo Padovan (12):
  drm/exynos: atomic phase 1: use drm_plane_helper_update()
  drm/exynos: atomic phase 1: use drm_plane_helper_disable()
  drm/exynos: atomic phase 1: add .mode_set_nofb() callback
  drm/exynos: atomic phase 2: wire up state reset(), duplicate() and
    destroy()
  drm/exynos: atomic phase 2: keep track of framebuffer pointer
  drm/exynos: atomic phase 3: atomic updates of planes
  drm/exynos: atomic phase 3: use atomic .set_config helper
  drm/exynos: atomic phase 3: convert page flips
  drm/exynos: remove exported functions from exynos_drm_plane
  drm/exynos: don't disable unused functions at init
  drm/exynos: atomic dpms support
  drm/exynos: remove unnecessary calls to disable_plane()

 drivers/gpu/drm/bridge/ps8622.c             |   6 +-
 drivers/gpu/drm/bridge/ptn3460.c            |   6 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 215 ++++++++--------------------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_encoder.c |  35 +----
 drivers/gpu/drm/exynos/exynos_drm_fb.c      |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |   3 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c   | 119 ++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.h   |  11 --
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |   6 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  10 +-
 15 files changed, 183 insertions(+), 264 deletions(-)

-- 
2.1.0
