From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 0/6] drm/exynos: remove struct exynos_drm_manager
Date: Wed, 26 Nov 2014 19:08:59 -0200
Message-ID: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:58669 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaKZVJP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 16:09:15 -0500
Received: by mail-qc0-f178.google.com with SMTP id b13so3061863qcw.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 13:09:14 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Following the removal of struct exynos_drm_overlay we now remove the manager
one as well. This remove another abstrastraction layer from exynos drm.
We can now use known names like CRTC and Planes instead of manager and overlay.

This patchset along with the ones I sent before[0][1] also helps clear the path for
the upcoming atomic modesetting work.

The patchset is based on the other 2 patchset. So be sure to apply them first
or pick everything from here:

https://git.kernel.org/cgit/linux/kernel/git/padovan/drm-exynos.git/log/?h=cleanup-try2

[0] http://www.spinics.net/lists/linux-samsung-soc/msg39502.html
[1] http://www.spinics.net/lists/linux-samsung-soc/msg39614.html

Gustavo Padovan (6):
  drm/exynos: rename base object of struct exynos_drm_crtc to 'base'
  drm/exynos: add pipe param to exynos_drm_crtc_create()
  drm/exynos: remove pipe member of struct exynos_drm_manager
  drm/exynos: move 'type' from manager to crtc struct
  drm/exynos: remove drm_dev from struct exynos_drm_manager
  drm/exynos: remove struct exynos_drm_manager

 drivers/gpu/drm/exynos/exynos_drm_crtc.c  |  82 +++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h  |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  65 ++++++---------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 127 ++++++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  26 +++---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c  |  85 +++++++++-----------
 drivers/gpu/drm/exynos/exynos_mixer.c     | 109 ++++++++++++-------------
 7 files changed, 234 insertions(+), 266 deletions(-)

-- 
1.9.3
