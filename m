From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v4 0/8] drm/exynos: clean up patches (preparing for atomic)
Date: Wed,  1 Apr 2015 13:02:04 -0300
Message-ID: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33812 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846AbbDAQCS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 12:02:18 -0400
Received: by qgep97 with SMTP id p97so46471734qge.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 09:02:17 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

Here goes some clean ups to the exynos drivers. The main clean ups is
the presetting and zpos making the property immutable and the removal
of *_win_data structures.

v2 contains a extra patch to fix alpha setting for planes in fimd, so
now fimd works fine even after the removal of struct fimd_win_data.

v3 removes a leftover var in the first commit and address the comment from
Joonyoung about checking the return value of exynos_plane_init()

v4 rebases on top of Daniel Stone patch, currently only applied to
exynos-drm-fixes

Gustavo Padovan (7):
  drm/exynos: fimd: fix alpha setting for XR24 pixel format
  drm/exynos: remove unused exynos_crtc->win_enable() callback
  drm/exynos: remove struct *_win_data abstraction on planes
  drm/exynos: preset zpos value for overlay planes
  drm/exynos: make zpos property immutable
  drm/exynos: remove exynos_plane_destroy()
  drm/exynos: remove leftover functions declarations

Mandeep Singh Baines (1):
  drm/exynos: track vblank events on a per crtc basis

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 178 ++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c   | 101 ++++++-------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c    |  27 ----
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  20 +--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 230 ++++++++++++-----------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c  |  66 ++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.h  |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 136 +++++------------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 221 ++++++++++-----------------
 include/video/samsung_fimd.h               |   5 +
 11 files changed, 345 insertions(+), 653 deletions(-)

-- 
2.1.0
