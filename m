From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v3 00/15] drm/exynos: support LCD I80 interface display
Date: Mon, 02 Jun 2014 14:22:36 +0900
Message-ID: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10290 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796AbaFBFW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 01:22:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

Hi,

This series adds LCD I80 interface display support for Exynos DRM driver.
The FIMD(display controller) specification describes it as "LCD I80 interface"
and the DSI specification describes it as "Command mode interface".

This is based on exynos-drm-next branch.

The previous patches,
RFC: http://www.spinics.net/lists/dri-devel/msg58898.html
V1: http://www.spinics.net/lists/dri-devel/msg59291.html
V2: http://www.spinics.net/lists/dri-devel/msg59867.html

Changelog v2:
- Fixes typo and removes unnecessary error log (commented by Andrzej Hazda)
- Adds missed pendlig_flip flag clear points (commented by Daniel Kurtz)

Changelog v3:
- Removes generic command mode and command mode display timing interface.
- Moves I80 interface timings from panel DT to the FIMD(display controller) DT.

Patches 1 and 2 fix trivial bugs.

Patches 3, 4, 5, 6 and 7 implement FIMD(display controller) I80 interface.
The MIPI DSI command mode based panel generates Tearing Effect synchronization
signal between MCU and FB to display video image, and FIMD should trigger to
transfer video image at this signal.
So the panel should receive the TE IRQ and call TE handler chains to notify
it to the FIMD.

Patches 8 and 9 implement to use Exynos5420 SoC DSI driver which is different
from previous Exynos4 SoCs for some registers control.

Patches 10 and 11 introduce MIPI DSI command mode based Samsung S6E3FA0 AMOLED
5.7" LCD drm panel driver.

The ohters add DT property nodes to support MIPI DSI command mode.

I welcome any comments.

Thank you.
Best regards YJ

YoungJun Cho (15):
  drm/exynos: dsi: move the EoT packets configuration point
  drm/exynos: use wait_event_timeout() for safety usage
  ARM: dts: sysreg: add exynos5 compatible to DT bindings
  ARM: dts: samsung-fimd: add LCD I80 interface specific properties
  drm/exynos: add TE handler to support LCD I80 interface
  drm/exynos: dsi: add TE handler to support LCD I80 interface
  drm/exynos: fimd: support LCD I80 interface
  ARM: dts: exynos_dsim: add exynos5420 compatible to DT bindings
  drm/exynos: dsi: add driver data to support Exynos5420
  ARM: dts: s6e3fa0: add DT bindings
  drm/panel: add S6E3FA0 driver
  ARM: dts: exynos4: add system register node
  ARM: dts: exynos5: add system register support
  ARM: dts: exynos5420: add mipi-phy node
  ARM: dts: exynos5420: add dsi node

 .../devicetree/bindings/arm/samsung/sysreg.txt     |    1 +
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   46 ++
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
 .../devicetree/bindings/video/samsung-fimd.txt     |   28 +
 arch/arm/boot/dts/exynos4.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5.dtsi                     |    6 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   20 +
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   18 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    7 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  175 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  287 ++++++++--
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e3fa0.c              |  568 ++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |    8 +
 include/video/samsung_fimd.h                       |    3 +-
 18 files changed, 1113 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
 create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c

-- 
1.7.9.5
