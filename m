From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 0/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Tue, 22 Oct 2013 15:41:01 +0530
Message-ID: <1382436668-15813-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12503 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320Ab3JVJuo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 05:50:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Currently, exynos hdmiphy operations and configs are kept
inside the hdmi driver. Hdmiphy related code is very tightly
coupled with hdmi IP driver. With these patches, hdmiphy
related stuff is moved to hdmiphy i2c driver for exynos4 and
exynos5250 socs. hdmi driver, being the phy controller, calls
exynos hdmiphy interfaces.

This series also removes hdmiphy dummy clock for hdmiphy
and replace it with Phy PMU Control from the hdmiphy driver.

At the end, support for exynos5420 hdmiphy is added to the
hdmiphy platform driver.

Drm related paches are based on exynos-drm-next branch at
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Arch related paches are based on for-next branch at
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (7):
  drm/exynos: move hdmiphy code to hdmiphy i2c driver
  drm/exynos: remove dummy hdmiphy clock
  drm/exynos: add hdmiphy platform driver for exynos5420
  drm/exynos: add hdmiphy pmu bit control in hdmiphy drivers
  exynos/drm: fix ddc i2c device probe failure
  ARM: dts: update hdmiphy dt node for exynos5250
  ARM: dts: update hdmiphy dt node for exynos5420

 .../devicetree/bindings/video/exynos_hdmi.txt      |    2 +
 .../devicetree/bindings/video/exynos_hdmiphy.txt   |    8 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    9 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |   14 +-
 drivers/gpu/drm/exynos/Makefile                    |    3 +-
 drivers/gpu/drm/exynos/exynos_ddc.c                |    5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  407 +++++-----------
 drivers/gpu/drm/exynos/exynos_hdmiphy.c            |   65 ---
 drivers/gpu/drm/exynos/exynos_hdmiphy.h            |   46 ++
 drivers/gpu/drm/exynos/exynos_hdmiphy_i2c.c        |  484 ++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmiphy_platform.c   |  418 +++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmiphy_priv.h       |   36 ++
 drivers/gpu/drm/exynos/regs-hdmiphy.h              |   37 ++
 13 files changed, 1174 insertions(+), 360 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy_i2c.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy_platform.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_hdmiphy_priv.h
 create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h

-- 
1.7.10.4
