From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 00/14] drm/exynos: embed exynos-drm framework objects into
 driver private context
Date: Mon, 17 Nov 2014 09:54:13 +0100
Message-ID: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35019 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435AbaKQIyx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 03:54:53 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF600MH8E897I40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 08:57:45 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

Hi Inki,

This patchset embed all remaining exynos_drm framework objects into driver private
context, thanks to this global variables can be removed and the code can be simplified.
It continues refactoring started by dsi related patchset [1].

I have tested it on trats and universal boards with following pipelines:
- fimd - dpi,
- fimd - dsi,
- mixer - hdmi.

The patchset is based on exynos-drm-next-todo + hdmi fixes patchset [2].

[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/115960
[2]: http://permalink.gmane.org/gmane.comp.video.dri.devel/118257

Regards
Andrzej


Andrzej Hajda (14):
  drm/exynos/mixer: embed manager into private context
  drm/exynos/mixer: stop using manager->ctx pointer
  drm/exynos/vidi: embed manager into private context
  drm/exynos/vidi: stop using manager->ctx pointer
  drm/exynos/fimd: embed manager into private context
  drm/exynos/fimd: stop using manager->ctx pointer
  drm/exynos/hdmi: embed display into private context
  drm/exynos/hdmi: stop using display->ctx pointer
  drm/exynos/vidi: embed display into private context
  drm/exynos/vidi: stop using display->ctx pointer
  drm/exynos/dp: embed display into private context
  drm/exynos/dp: stop using display->ctx pointer
  drm/exynos/dpi: embed display into private context
  drm/exynos/dpi: stop using display->ctx pointer

 drivers/gpu/drm/exynos/exynos_dp_core.c  |  58 ++++++++--------
 drivers/gpu/drm/exynos/exynos_dp_core.h  |   3 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  |  42 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 102 +++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |  89 ++++++++++++------------
 drivers/gpu/drm/exynos/exynos_hdmi.c     |  65 ++++++++----------
 drivers/gpu/drm/exynos/exynos_mixer.c    | 114 +++++++++++++++----------------
 8 files changed, 236 insertions(+), 241 deletions(-)

-- 
1.9.1
