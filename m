From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/3] exynos_drm initialization fix
Date: Mon, 08 Jun 2015 12:15:39 +0200
Message-ID: <1433758542-9843-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48325 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbbFHKQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 06:16:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPM000E5F7BJO90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Jun 2015 11:16:23 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Inki,

Those patches fixes issue of exynos_drm initialization with more than one pipeline,
which is present in exynos_drm drivers for long time.
On most platforms at least two of three following pipelines are present:
1. VIDI.
2. FIMD/DECON -> DSI/DPI -> Panel.
3. MIXER/DECON -> HDMI -> TV.
In case we want use two or three pipelines simultaneously and one of KMS drivers
defers probing only some drivers will be bound to drm driver and usually only one
pipeline will be available. This patchset fixes it.

Beside bugfixing the patchset significantly simplifies and clears the code - about
300 lines removed.

The patchset is based on exynos-drm-next branch.
The patchset was tested on universal_c210 board.

Regards
Andrzej


Andrzej Hajda (3):
  drm/exynos: consolidate driver/device initialization code
  drm/exynos: fix broken component binding in case of multiple pipelines
  drm/exynos: remove SoC checking code

 drivers/gpu/drm/exynos/exynos7_drm_decon.c |  14 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c    |  13 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c    |  20 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c    | 427 +++++++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  17 --
 drivers/gpu/drm/exynos/exynos_drm_dsi.c    |  29 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   |  28 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c    |  27 --
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   |  53 +---
 drivers/gpu/drm/exynos/exynos_hdmi.c       |  22 +-
 drivers/gpu/drm/exynos/exynos_mixer.c      |  14 +-
 11 files changed, 187 insertions(+), 477 deletions(-)

-- 
1.9.1
