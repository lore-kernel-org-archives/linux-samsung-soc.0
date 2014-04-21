From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v2 PATCH 00/14] drm/exynos: support MIPI DSI command mode display
Date: Mon, 21 Apr 2014 21:28:27 +0900
Message-ID: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45201 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349AbaDUM2q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 08:28:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, laurent.pinchart@ideasonboard.com, sachin.kamat@linaro.org

This patch series includes the followings:
- FIMD I80 interface
- DSI command mode interface for Exynos5420 SoC
- S6E3FA0 command mode type panel driver
- Some bugs modification

The patch series is based on exynos-drm-next branch.

Previous patch set,
RFC v1: http://www.spinics.net/lists/dri-devel/msg57513.html

Changelog v2:
- Moves panel delays and size DT properties to panel probe routine.
- Moves CPU timings relevant DT properties from FIMD to panel DT.

Thank you.
Best regards YJ

YoungJun Cho (14):
  drm/exynos: dsi: move the Eot packets configuration point
  drm/exynos: dsi: delay setting clocks after reset
  drm/exynos: use wait_event_timeout() for safety usage
  ARM: dts: sysreg: add exynos5 compatible to DT bindings
  ARM: dts: samsung-fimd: add I80 specific properties
  drm/exynos: support MIPI DSI command mode
  ARM: dts: exynos_dsim: add exynos5420 compatible to DT bindings
  drm/exynos: dsi: add driver data to support Exynos5420
  ARM: dts: s6e3fa0: add DT bindings
  drm/panel: add S6E3FA0 driver
  ARM: dts: exynos4: add system register node
  ARM: dts: exynos5: add system register support
  ARM: dts: exynos5420: add mipi-phy node
  ARM: dts: exynos5420: add dsi node

 .../devicetree/bindings/arm/samsung/sysreg.txt     |    1 +
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   63 +++
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
 .../devicetree/bindings/video/samsung-fimd.txt     |    2 +
 arch/arm/boot/dts/exynos4.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5.dtsi                     |    6 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   21 +
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    2 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  121 ++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  280 ++++++++--
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e3fa0.c              |  569 ++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |    2 +
 include/drm/drm_panel.h                            |    7 +
 include/video/samsung_fimd.h                       |    3 +-
 19 files changed, 1038 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
 create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c

-- 
1.7.9.5
