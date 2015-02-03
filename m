From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 00/14] drm/exynos: cleanups + atomic phases 1 and 2
Date: Tue,  3 Feb 2015 17:14:17 -0200
Message-ID: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:61115 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966250AbbBCTQh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 14:16:37 -0500
Received: by mail-qg0-f41.google.com with SMTP id q108so53912521qgd.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Feb 2015 11:16:36 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

This series clean ups a few more paths from exynos-drm with the most important
being the removal of the global page flip queue and the removal in driver
internal data (struct *_win_data) that was replicating plane data.

Following these patches comes the first step torwards atomic modesetting
support on exynos.

This series is applied on top of 3 patches[0][1][2] that were sent recently to
dri-devel.

	Gustavo

---
[0] http://www.spinics.net/lists/linux-samsung-soc/msg41867.html
[1] http://lists.freedesktop.org/archives/dri-devel/2015-January/076504.html
[2] http://lists.freedesktop.org/archives/dri-devel/2015-January/076505.html


Daniel Kurtz (1):
  drm/exynos: do not copy adjusted mode into mode during crtc mode_set

Gustavo Padovan (12):
  drm/exynos: Remove exynos_plane_dpms() call with no effect
  drm/exynos: remove leftover functions declarations
  drm/exynos: remove struct *_win_data abstraction on planes
  drm/exynos: atomic phase 1: use drm_plane_helper_update()
  drm/exynos: atomic phase 1: use drm_plane_helper_disable()
  drm/exynos: atomic phase 1: add atomic_begin()/atomic_flush()
  drm/exynos: atomic phase 1: add .mode_set_nofb() callback
  drm/exynos: atomic phase 2: wire up state reset(), duplicate() and
    destroy()
  drm/exynos: atomic phase 2: keep track of framebuffer pointer
  drm/exynos: make exynos_plane_mode_set() static
  drm/exynos: use correct pipe number on vblank event
  drm/exynos: remove exynos_disable_plane()

Mandeep Singh Baines (1):
  drm/exynos: track vblank events on a per crtc basis

 drivers/gpu/drm/bridge/ptn3460.c              |   4 +
 drivers/gpu/drm/exynos/exynos_dp_core.c       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_connector.c |   4 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 203 +++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h      |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  29 +---
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  15 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 235 ++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  99 ++++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |  13 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 127 ++++----------
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   4 +
 drivers/gpu/drm/exynos/exynos_mixer.c         | 212 ++++++++---------------
 16 files changed, 408 insertions(+), 558 deletions(-)

-- 
1.9.3
