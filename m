From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 00/11] drm/exynos: improve atomic modesetting
Date: Sat, 15 Aug 2015 13:26:09 -0300
Message-ID: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:34086 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbbHOQ02 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:28 -0400
Received: by ykel23 with SMTP id l23so2888442yke.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

This patchset adds a couple of changes to improve atomic modesetting:

 * add check for the START shadow register for FIMD to only finish the update
 when the screen was actually updated.
 * add asynchronous atomic commit, so now page flips can be run asynchronously.
 It also add infrastructure to serialize commits for the same CRTC and wait all
 plane updates to finish.
 * enable the DRIVER_ATOMIC feature to enable userspace to use atomic IOCTL with
 exynos.

Please review.

	Gustavo

---
Gustavo Padovan (11):
  drm/exynos: don't track enabled state at exynos_crtc
  drm/exynos: fimd: unify call to exynos_drm_crtc_finish_pageflip()
  drm/exynos: add prepare and cleanup phases for planes
  drm/exynos: fimd: move window protect code to prepare/cleanup_plane
  drm/exynos: check for pending fb before finish update
  drm/exynos: add macro to get the address of START_S reg
  drm/exynos: fimd: only finish update if START == START_S
  drm/exynos: add atomic asynchronous commit
  drm/exynos: wait all planes updates to finish
  drm/exynos: remove wait queue for pending page flip
  drm/exynos: Enable atomic modesetting feature

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  10 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  10 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  69 +++++------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h      |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 158 +++++++++++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  24 +++-
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  35 ------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  81 ++++++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |   2 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  10 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         |  10 +-
 include/video/samsung_fimd.h                  |   1 +
 12 files changed, 309 insertions(+), 105 deletions(-)

-- 
2.1.0
