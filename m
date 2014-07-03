From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 00/12] drm/exynos/ipp: image post processing improvements,
 part three
Date: Thu, 03 Jul 2014 15:10:25 +0200
Message-ID: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40871 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752809AbaGCNKu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 09:10:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

This set of independent patches contains various improvement and fixes
for exynos_drm ipp framework.
The patchset is based on exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (12):
  drm/exynos/ipp: remove type casting
  drm/exynos/ipp: remove unused field from exynos_drm_ipp_private
  drm/exynos/ipp: remove struct exynos_drm_ipp_private
  drm/exynos/ipp: correct address type
  drm/exynos/ipp: remove temporary variable
  drm/exynos/ipp: remove incorrect checks of list_first_entry result
  drm/exynos/ipp: simplify memory check function
  drm/exynos/ipp: remove useless registration checks
  drm/exynos/ipp: simplify ipp_find_obj
  drm/exynos/ipp: remove redundant messages
  drm/exynos/ipp: simplify ipp_create_id
  drm/exynos/ipp: simplify ipp_find_driver

 drivers/gpu/drm/exynos/exynos_drm_drv.h |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 259 +++++++++-----------------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |   4 +-
 3 files changed, 73 insertions(+), 197 deletions(-)

-- 
1.9.1
