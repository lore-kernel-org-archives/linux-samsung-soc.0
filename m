From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 00/15] drm/exynos/ipp: image post processing fixes and
 improvements, part four
Date: Fri, 22 Aug 2014 09:52:11 +0200
Message-ID: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34637 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753381AbaHVHxV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 03:53:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

This set of patches contains various improvement and fixes
for exynos_drm ipp framework.
The patchset is based on exynos-drm-next branch.

IPP framework was tested for regressions on exynos4210-trats target.

Regards
Andrzej


Andrzej Hajda (15):
  drm/exynos/ipp: remove fake pm callbacks
  drm/exynos/ipp: cancel works before command node clean
  drm/exynos/ipp: move file reference from memory to command node
  drm/exynos/ipp: remove only related commands on file close
  drm/exynos/ipp: remove unused field in command node
  drm/exynos/ipp: free partially allocated resources on error
  drm/exynos/ipp: move nodes cleaning to separate function
  drm/exynos/ipp: clean memory nodes on command node cleaning
  drm/exynos/ipp: replace work_struct casting with better constructs
  drm/exynos/ipp: stop hardware before freeing memory
  drm/exynos/ipp: remove events during command cleaning
  drm/exynos/fimc: avoid clearing overflow bits
  drm/exynos/fimc: do not enable fimc twice
  drm/exynos/fimc: simplify buffer queuing
  drm/exynos/fimc: fix source buffer registers

 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  90 ++-----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 369 ++++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h     |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   3 +-
 5 files changed, 180 insertions(+), 289 deletions(-)

-- 
1.9.1
