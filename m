From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 00/29] drm/exynos: clean up + atomic phases 1 and 2
Date: Thu, 18 Dec 2014 11:58:26 -0200
Message-ID: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:59416 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435AbaLRN7G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:06 -0500
Received: by mail-qc0-f169.google.com with SMTP id w7so873153qcr.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

In this series:

 - fix to FIMD pageflips, only finish pageflips if START == START_S.

 - remove struct exynos_drm_overlay and struct exynos_drm_manager.
 exynos_drm_overlay was merged with exynos_drm_plane and exynos_drm_manager
 with exynos_drm_crtc removing two extra and unnecessary abstractions levels
 from the exynos code. It also makes understanding of the code easier since
 now we talk using known names like CRTC and Planes instead of manager and
 overlay.

 - remove DPMS operations from places where it is not need, e.g., updating
 planes. Only full modesets should use DPMS operations.

 - unify plane update on exynos_update_plane(). Now all pieces of code that
 wants to update a plane should be using this function.

 - atomic phase 1 and 2: set all the helpers and new callbacks needed to port
 drm-exynos to atomic. pahse 3 is a work in progress.

There are also some smalls fixes and clean ups.

This is rebased on dri-devel/drm-next to benefit from the lastests atomic
changes.

	Gustavo

---
The following changes since commit 4e0cd68115620bc3236ff4e58e4c073948629b41:

  drm: sti: fix module compilation issue (2014-12-15 17:07:57 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/padovan/drm-exynos.git for-drm-next

for you to fetch changes up to 26d5e29b5613fb466b3cb04ddbdef371aa3f1596:

  drm/exynos: atomic phase 2: keep track of framebuffer pointer (2014-12-18 11:30:16 -0200)

Daniel Kurtz (1):
  drm/exynos/fimd: only finish pageflip if START == START_S

Gustavo Padovan (28):
  drm/exynos: move to_exynos_crtc() macro to main header
  drm/exynos: expose struct exynos_drm_crtc
  drm/exynos: remove exynos_drm_crtc_plane_* wrappers
  drm/exynos: remove struct exynos_drm_overlay
  drm/exynos/fimd: don't initialize 'ret' variable in fimd_probe()
  drm/exynos/vidi: remove useless ops->commit()
  drm/exynos: Don't touch DPMS when updating overlay planes
  drm/exynos: don't do any DPMS operation while updating planes
  drm/exynos: remove exynos_plane_commit() wrapper
  drm/exynos: unify plane update on exynos_update_plane()
  drm/exynos: call exynos_update_plane() directly on page flips
  drm/exynos: remove exynos_drm_crtc_mode_set_commit()
  drm/exynos: rename base object of struct exynos_drm_crtc to 'base'
  drm/exynos: add pipe param to exynos_drm_crtc_create()
  drm/exynos: remove pipe member of struct exynos_drm_manager
  drm/exynos: move 'type' from manager to crtc struct
  drm/exynos: remove drm_dev from struct exynos_drm_manager
  drm/exynos: remove struct exynos_drm_manager
  drm/exynos: don't duplicate drm_display_mode in fimd context
  drm/exynos: remove mode_set() ops from exynos_crtc
  drm/exynos: create exynos_check_plane()
  drm/exynos: atomic phase 1: use drm_plane_helper_update()
  drm/exynos: make exynos_plane_mode_set() static
  drm/exynos: atomic phase 1: use drm_plane_helper_disable()
  drm/exynos: atomic phase 1: add atomic_begin()/atomic_flush()
  drm/exynos: atomic phase 1: add .mode_set_nofb() callback
  drm/exynos: atomic phase 2: wire up state reset(), duplicate() and
    destroy()
  drm/exynos: atomic phase 2: keep track of framebuffer pointer

 drivers/gpu/drm/bridge/ptn3460.c              |   4 +
 drivers/gpu/drm/exynos/exynos_dp_core.c       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_connector.c |   4 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 273 ++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h      |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |   2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  87 +++++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 263 ++++++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 196 ++++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 139 ++++++-------
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   4 +
 drivers/gpu/drm/exynos/exynos_mixer.c         | 159 ++++++++-------
 include/video/samsung_fimd.h                  |   1 +
 17 files changed, 601 insertions(+), 565 deletions(-)

-- 
1.9.3
