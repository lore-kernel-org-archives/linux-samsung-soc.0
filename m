From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 00/10] drm/exynos: Add atomic modesetting support
Date: Thu,  2 Apr 2015 11:17:02 -0300
Message-ID: <1427984231-7007-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:36048 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753146AbbDBORQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 10:17:16 -0400
Received: by qgeb100 with SMTP id b100so29743442qge.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Apr 2015 07:17:16 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

Here goes the full support for atomic modesetting on exynos. I've
split the patches in the various phases of atomic support.

These patches sits on top of the clean up patches I've sent yesterday
to this mailing list[1].

v2: fixes comments by Joonyoung
	- remove unused var in patch 09
	- use ->disable instead of outdated ->dpms in hdmi code
	- remove WARN_ON from crtc enable/disable

	Gustavo

[1] http://lists.freedesktop.org/archives/dri-devel/2015-April/080449.html

Gustavo Padovan (10):
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
  drm/exynos: atomic dpms support

 drivers/gpu/drm/bridge/ptn3460.c              |   4 +
 drivers/gpu/drm/exynos/exynos_dp_core.c       |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_connector.c |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 226 ++++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |   2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_encoder.c   |  27 +--
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |   3 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 113 +++++++------
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |  11 --
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |   6 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  10 +-
 15 files changed, 187 insertions(+), 255 deletions(-)

-- 
2.1.0
