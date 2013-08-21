From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/3] drm/exynos: fimd: get signal polarities from device tree
Date: Wed, 21 Aug 2013 16:22:00 +0200
Message-ID: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16310 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065Ab3HUOWa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 10:22:30 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRV00M5HX96VTC0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Aug 2013 15:22:28 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, t.figa@samsung.com, s.nawrocki@samsung.com

Hi,

This patch series adds signal polarities parsing from display-timings
devicetree node. To do it efficiently struct fb_videomode is replaced
with struct videomode and some additional code cleaning is performed.

The patches are for drm-exynos/exynos-drm-next branch.

Regards
Andrzej Hajda

Andrzej Hajda (3):
  drm/exynos: fimd: replace struct fb_videomode with videomode
  drm/exynos: fimd: get signal polarities from device tree
  drm/exynos: fimd: move platform data parsing to separate function

 drivers/gpu/drm/exynos/exynos_drm_connector.c |  33 +----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 189 +++++++++++++-------------
 include/drm/exynos_drm.h                      |   3 +-
 3 files changed, 103 insertions(+), 122 deletions(-)

-- 
1.8.1.2
