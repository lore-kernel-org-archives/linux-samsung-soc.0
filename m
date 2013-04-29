From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/4] drm/exynos: hdmi: move hdmiphy related code to hdmiphy
 driver
Date: Mon, 29 Apr 2013 20:20:49 +0530
Message-ID: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35003 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab3D2O1V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 10:27:21 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MM000KV8THJ0G20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Apr 2013 23:27:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Right now hdmiphy operations and configs are kept inside hdmi driver. hdmiphy
related code is tightly coupled with hdmi ip driver. Physicaly they are
different devices and should be instantiated independently.

In terms of versions/mapping/configurations Hdmi and hdmiphy are independent
of each other. It seems logical to isolate them and maintained independently.

This implementation is tested for:
1) Resolutions supported by exynos4 and 5 hdmi.
2) Runtime PM and S2R scenarions for exynos5.

This patch set is dependent on the patch, posted at
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg17905.html

This series is based on exynos-drm-next branch at
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Rahul Sharma (4):
  drm/exynos: hdmi: move hdmi subsystem registration to drm common hdmi
  drm/exynos: hdmi: register hdmiphy driver from common drm hdmi
  drm/exynos: hdmi: move hdmiphy callbacks to hdmiphy driver
  ARM: EXYNOS: remove parent device for hdmiphy clock

 arch/arm/mach-exynos/clock-exynos4.c     |    1 -
 arch/arm/mach-exynos/clock-exynos5.c     |    1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |   25 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   14 +-
 drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  107 +++++-
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h |   20 +
 drivers/gpu/drm/exynos/exynos_hdmi.c     |  371 ++-----------------
 drivers/gpu/drm/exynos/exynos_hdmi.h     |    1 -
 drivers/gpu/drm/exynos/exynos_hdmiphy.c  |  585 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/exynos/regs-hdmiphy.h    |   61 ++++
 10 files changed, 780 insertions(+), 406 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h

-- 
1.7.10.4
