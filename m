From: Inki Dae <inki.dae@samsung.com>
Subject: [RFC PATCH 0/3] drm/exynos: add full modularity support to sub drivers
Date: Wed, 19 Nov 2014 00:26:41 +0900
Message-ID: <1416324404-28153-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13145 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757204AbaKRP0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 10:26:47 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF8006PPQWLBU00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 00:26:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

Hi all,

   This patch set adds full modularity to sub drivers, kms and
   non kms drivers.

   For this, this patch sets consists into three patches.
   first patch modularizes kms drivers, second patch for non
   kms drivers, and third patch for vidi driver.

   I hope we could resolve infinite loop issue and kernel lockup
   reported by other people. This patch set is RFC so there might
   be my missing points. Welcome to any comments.

   This patch set is based on top of exynos-drm-next branch.

   Thanks,
   Inki Dae

Inki Dae (3):
  drm/exynos: make kms drivers to be independent modules
  drm/exynos: make non kms drivers to be indenpendent modules
  drm/exynos: make vidi driver to be independent module

 drivers/gpu/drm/exynos/Kconfig              |    8 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c     |   13 +++
 drivers/gpu/drm/exynos/exynos_drm_core.c    |  166 +++++++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |  105 +----------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |   42 ++-----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   13 +++
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |   13 +++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |   13 +++
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |   34 ++++++
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |   12 ++
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |   39 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   13 +++
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |   81 ++++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c        |   13 +++
 drivers/gpu/drm/exynos/exynos_mixer.c       |   13 +++
 15 files changed, 391 insertions(+), 187 deletions(-)

-- 
1.7.9.5
