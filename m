From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 00/17] drm/exynos: atomic modesetting support
Date: Mon,  1 Jun 2015 12:04:38 -0300
Message-ID: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f42.google.com ([209.85.216.42]:34008 "EHLO
	mail-vn0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751487AbbFAPFD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:03 -0400
Received: by vnbf129 with SMTP id f129so16479862vnb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:02 -0700 (PDT)
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

v6: rebase on latest exynos_drm_next

v7: fix comments by Joonyoung
        - fix two checkpatch errors
        - remove extra crtc->commit() call
        - check for null fb on exynos_check_plane()

v8: fix comments by Joonyoung
        - fix merge error
        - move drm_crtc_vblank_get to the commit that introduces atomic pageflip
        - remove .prepare() in the apropiated patch
        - add a new patch to move exynos_drm_crtc_disable()

v9:  * fix comments by Joonyoung
        - also remove encoder .prepare()
        - do not shift exynos_update_plane() parameters
        - remove unused .mode_set() and .mode_set_base()
     * add specific exynos .atomic_commit()
     * add split of exynos_crtc->ops->dpms() into enable() and disable()
     * add other atomic clean ups

v10: * fix comments by Joonyoung
	- add more comments on exynos_atomic_commit()
	- make exynos_crtc's .enable and .disable void


	Gustavo

---
Gustavo Padovan (15):
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
  drm/exynos: move exynos_drm_crtc_disable()
  drm/exynos: add exynos specific .atomic_commit()
  drm/exynos: atomic dpms support
  drm/exynos: remove unnecessary calls to disable_plane()
  drm/exynos: split exynos_crtc->dpms in enable() and disable()

Joonyoung Shim (2):
  drm/exynos: fix source data argument for plane
  drm/exynos: use adjusted_mode of crtc_state instead of mode

 drivers/gpu/drm/bridge/ps8622.c             |   6 +-
 drivers/gpu/drm/bridge/ptn3460.c            |   6 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  |  91 +++----------
 drivers/gpu/drm/exynos/exynos_dp_core.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 201 ++++++----------------------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  10 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_encoder.c |  35 +----
 drivers/gpu/drm/exynos/exynos_drm_fb.c      |  41 ++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |   3 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  71 +++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.c   | 137 ++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_plane.h   |  11 --
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  59 ++++----
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  10 +-
 drivers/gpu/drm/exynos/exynos_mixer.c       |  26 +---
 18 files changed, 269 insertions(+), 458 deletions(-)

-- 
2.1.0
