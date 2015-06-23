From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 00/23] drm/exynos: atomic improvements + exynos_encoder removal
Date: Tue, 23 Jun 2015 18:35:13 -0300
Message-ID: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35354 "EHLO
	mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932116AbbFWVfo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:35:44 -0400
Received: by qkbp125 with SMTP id p125so12198759qkb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:35:43 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

This set improves exynos in a number of ways. The first five patches are
general clean up/fixes.

Patches 06 to 12 are improvements on top of the newly added atomic modesetting
support.

Patches 13-23 are a big journey to completely remove the internal
exynos_drm_encoder struct. Now exynos encoders register themselves directly
with the drm core.

Please review!

	Gustavo

Gustavo Padovan (23):
  drm/exynos: pass the correct pipe number
  drm/exynos: calculate vrefresh instead of use a fixed value
  drm/exynos: use KMS version of DRM vblanks functions
  drm/exynos: remove duplicated check for suspend
  drm/exynos: Kconfig: select DP if FIMD or DECON are selected
  drm/exynos: add atomic asynchronous commit
  drm/exynos: rename win_commit/disable to atomic-like names
  drm/exynos: pass struct exynos_drm_plane in update/enable
  drm/exynos: use drm atomic state directly
  drm/exynos: remove unused fields from struct exynos_drm_plane
  drm/exynos: unify exynos_drm_plane names with drm core
  drm/exynos: don't track enabled state at exynos_crtc
  drm/exynos: split display's .dpms() into .enable() and .disable()
  drm/exynos: remove wrappers for phy_power_{on,off}
  drm/exynos: remove unused .remove() and .check_mode() ops from display
  drm/exynos: simplify calculation of possible CRTCs
  drm/exynos: remove struct exynos_drm_display
  drm/exynos: remove extra call to hdmi_commit()
  drm/exynos: remove extra call to exynos_dp_commit()
  drm/exynos: remove exynos_encoder's .commit() op
  drm/exynos: remove exynos_drm_create_enc_conn()
  drm/exynos: fold encoder setup into exynos_drm_load()
  drm/exynos: remove struct exynos_drm_encoder layer

 drivers/gpu/drm/exynos/Kconfig              |   4 +-
 drivers/gpu/drm/exynos/Makefile             |   7 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  |  86 +++++++-------
 drivers/gpu/drm/exynos/exynos_dp_core.c     | 122 +++++++++----------
 drivers/gpu/drm/exynos/exynos_dp_core.h     |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_core.c    |  36 ------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    |  33 ++----
 drivers/gpu/drm/exynos/exynos_drm_crtc.h    |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  96 ++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |  19 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h     | 115 +++++-------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 129 ++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 174 ----------------------------
 drivers/gpu/drm/exynos/exynos_drm_encoder.h |  23 ----
 drivers/gpu/drm/exynos/exynos_drm_fb.c      |  51 ++++++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  99 +++++++---------
 drivers/gpu/drm/exynos/exynos_drm_plane.c   |  31 ++---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 107 +++++++++--------
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 168 +++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_mixer.c       | 111 +++++++++---------
 20 files changed, 572 insertions(+), 846 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.h

-- 
2.1.0
