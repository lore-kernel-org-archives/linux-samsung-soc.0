From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/6] drm/exynos: add pipeline clock support
Date: Wed, 23 Mar 2016 14:25:56 +0100
Message-ID: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36740 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754652AbcCWN0R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:26:17 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00D1JUNQ5UA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:26:14 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Hi Inki,

In case of some pipielines there is need to set clock in one component
by driver of another component, for example:
1. Decon and Mixer driver must enable HDMI-PHY clock before configuration.
2. DP driver must enable DP clock provided by FIMD.

This set of patches provide more generic solution for such problem
than currently present clock_enable callback. More details in particular
patches. The patchset is based on recently sent patchset with HDMI/DECON
path fixes[1].

[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/149714

Regards
Andrzej


Andrzej Hajda (6):
  drm/exynos: add helper to get crtc from pipe
  drm/exynos: add support for pipeline clock to the framework
  drm/exynos/hdmi: expose HDMI-PHY clock as pipeline clock
  drm/exynos/decon5433: enable HDMI-PHY before configuring DECON
  drm/exynos/mixer: enable HDMI-PHY before configuring MIXER
  drm/exynos: convert clock_enable crtc callback to pipeline clock

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  4 ++
 drivers/gpu/drm/exynos/exynos_dp_core.c       |  8 +---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 10 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.h       | 25 ++++++++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 27 ++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 67 +++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_mixer.c         |  4 ++
 7 files changed, 95 insertions(+), 50 deletions(-)

-- 
1.9.1
