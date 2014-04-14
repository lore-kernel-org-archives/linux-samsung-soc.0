From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 0/9] drm/exynos: more cleanup with super device support
Date: Mon, 14 Apr 2014 15:09:45 +0900
Message-ID: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17604 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbaDNGJ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 02:09:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

This patch series cleans up exynos drm framework and kms sub drivers
using the component framework[1]

[1] http://lists.freedesktop.org/archives/dri-devel/2014-January/051249.html

Previous patches,
RFC: http://comments.gmane.org/gmane.comp.video.dri.devel/101200
v1: http://lists.freedesktop.org/archives/dri-devel/2014-March/056387.html
v2: http://www.spinics.net/lists/dri-devel/msg56372.html

Changelog v3:
- Add a patch for separating dpi from fimd
- Add legacy dt binding support
- Add more cleanup patches

Thanks,
Inki Dae


Andrzej Hajda (1):
  drm/exynos: separate dpi from fimd

Inki Dae (8):
  drm/exynos: add super device support
  drm/exynos: dpi: fix hotplug fail issue
  ARM: dts: exynos4210-universal: add super device node for exynos drm
  ARM: dts: exynos4210-trats: add super device node for exynos drm
  ARM: dts: exynos4412-trats2: add super device node for exynos drm
  exynos/drm: add DT bindings
  drm/exynos: fix comment to exynos_drm_device_subdrv_prove call
  drm/exynos: modify goto labels to meaningful names

 .../bindings/drm/exynos/samsung-exynos-drm.txt     |   32 ++
 arch/arm/boot/dts/exynos4210-trats.dts             |    5 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |    5 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |    5 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   45 +--
 drivers/gpu/drm/exynos/exynos_drm_core.c           |  216 +++-----------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   17 ++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    4 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   51 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |  313 +++++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   69 ++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  110 ++++---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   74 +++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  101 +++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   59 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c              |   54 +++-
 16 files changed, 675 insertions(+), 485 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt

-- 
1.7.9.5
