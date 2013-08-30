From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Fri, 30 Aug 2013 12:29:27 +0530
Message-ID: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30924 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754478Ab3H3Ghr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Aug 2013 02:37:47 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSB000NRZPUFU40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Aug 2013 15:37:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Currently, exynos hdmiphy operations and configs are kept
inside the hdmi driver. Hdmiphy related code is tightly
coupled with hdmi IP driver.

This series also removes hdmiphy dummy clock for hdmiphy
and replace it with Phy PMU Control from the hdmiphy driver.

At the end, support for exynos5420 hdmiphy is added to the
hdmiphy driver which is a platform device.

Drm related paches are based on exynos-drm-next branch at
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Arch patches are dependent on 
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg22195.html

Rahul Sharma (7):
  drm/exynos: move hdmiphy related code to hdmiphy driver
  drm/exynos: remove dummy hdmiphy clock
  drm/exynos: add hdmiphy pmu bit control in hdmiphy driver
  drm/exynos: add support for exynos5420 hdmiphy
  exynos/drm: fix ddc i2c device probe failure
  ARM: dts: update hdmiphy dt node for exynos5250
  ARM: dts: update hdmiphy dt node for exynos5420

 .../devicetree/bindings/video/exynos_hdmi.txt      |    2 +
 .../devicetree/bindings/video/exynos_hdmiphy.txt   |    6 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    9 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |   12 +
 drivers/gpu/drm/exynos/exynos_ddc.c                |    5 +
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h           |   13 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  353 ++--------
 drivers/gpu/drm/exynos/exynos_hdmiphy.c            |  738 +++++++++++++++++++-
 drivers/gpu/drm/exynos/regs-hdmiphy.h              |   35 +
 9 files changed, 868 insertions(+), 305 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h

-- 
1.7.10.4
