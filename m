From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/5] drm/exynos: more cleanup with component framework
Date: Thu, 17 Apr 2014 14:50:24 +0900
Message-ID: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13910 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161054AbaDQFur (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 01:50:47 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4500F1IUW79730@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Apr 2014 14:50:31 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Inki Dae <inki.dae@samsung.com>

This patch series cleans up exynos drm framework and kms sub drivers
using the component framework[1].

And also this separates super device support from previous cleanup patch
series[2] for more discussion. So the patch series for super node support
will be posted later.

[1] http://lists.freedesktop.org/archives/dri-devel/2014-January/051249.html
[2]http://www.spinics.net/lists/dri-devel/msg57401.html

Thanks,
Ink Dae


Andrzej Hajda (1):
  drm/exynos: separate dpi from fimd

Inki Dae (4):
  drm/exynos: modify goto labels to meaningful names
  drm/exynos: add component framework support
  drm/exynos: dpi: fix hotplug fail issue
  drm/exynos: fix comment to exynos_drm_device_subdrv_prove call

 drivers/gpu/drm/exynos/exynos_dp_core.c  |   45 ++--
 drivers/gpu/drm/exynos/exynos_drm_core.c |  216 ++++---------------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |   17 ++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h |    4 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  |   51 +++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |  339 +++++++++++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   80 ++++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |  110 ++++++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   74 +++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |  101 +++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     |   59 ++++--
 drivers/gpu/drm/exynos/exynos_mixer.c    |   54 ++++-
 12 files changed, 649 insertions(+), 501 deletions(-)

-- 
1.7.9.5
