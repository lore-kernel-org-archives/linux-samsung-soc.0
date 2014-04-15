From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC PATCH 00/14] drm/exynos: support MIPI DSI command mode display
Date: Tue, 15 Apr 2014 14:47:28 +0900
Message-ID: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49989 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950AbaDOFrv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 01:47:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

This patch series includes the following:
- FIMD I80 interface
- DSI command mode interface for Exynos5420
- S6E3FA0 command mode type panel driver
- Some bugs modification

The patch series is based on exynos-drm-next branch.

Thank you.
Best regards YJ

YoungJun Cho (14):
  drm/exynos: dsi: move the Eot packets configuration point
  drm/exynos: dsi: delay setting clocks after reset
  drm/exynos: use wait_event_timeout() for safety usage
  ARM: dts: add exynos5 compatible to sysreg
  ARM: dts: samsung-fimd: add I80 specific properties
  drm/exynos: support MIPI DSI command mode
  ARM: dts: exynos_dsim: add exynos5420 Soc compatible
  drm/exynos: dsi: add driver data to support Exynos5420
  ARM: dts: s6e3fa0: add DT bindings
  drm/panel: add S6E3FA0 driver
  ARM: dts: exynos4: add system register node
  ARM: dts: exynos5: add system register support
  ARM: dts: exynos5420: add mipi-phy node
  ARM: dts: exynos5420: add dsi node

 .../devicetree/bindings/arm/samsung/sysreg.txt     |    1 +
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   52 ++
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
 .../devicetree/bindings/video/samsung-fimd.txt     |    9 +
 arch/arm/boot/dts/exynos4.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5.dtsi                     |    6 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   20 +
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    2 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  121 ++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  280 ++++++++--
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e3fa0.c              |  544 ++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |    2 +
 include/video/samsung_fimd.h                       |    3 +-
 18 files changed, 1001 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
 create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c

-- 
1.7.9.5
