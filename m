From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 0/7] drm/exynos: clean up patches (preparing for atomic)
Date: Mon, 23 Mar 2015 17:37:55 -0300
Message-ID: <1427143082-4257-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:34641 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753432AbbCWUiP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 16:38:15 -0400
Received: by qgep97 with SMTP id p97so34985366qge.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2015 13:38:14 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

Here goes some clean ups to the exynos drivers. The main clean ups is
the presetting and zpos making the property immutable and the removal
of *_win_data structures.

Gustavo Padovan (6):
  drm/exynos: remove unused exynos_crtc->win_enable() callback
  drm/exynos: remove struct *_win_data abstraction on planes
  drm/exynos: preset zpos value for overlay planes
  drm/exynos: make zpos property immutable
  drm/exynos: remove exynos_plane_destroy()
  drm/exynos: remove leftover functions declarations

Mandeep Singh Baines (1):
  drm/exynos: track vblank events on a per crtc basis

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 176 ++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c   | 101 ++++++-------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c    |  27 ----
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  20 +--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 205 ++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c  |  66 ++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.h  |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 144 ++++++------------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 228 +++++++++++------------------
 10 files changed, 339 insertions(+), 642 deletions(-)

-- 
2.1.0
