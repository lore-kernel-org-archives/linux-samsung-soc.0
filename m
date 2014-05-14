From: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 00/18] drm/exynos: support MIPI DSI command mode display
Date: Wed, 14 May 2014 15:26:47 +0900
Message-ID: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This series is for the Exynos DRM driver to support MIPI DSI command mode
display and based on exynos-drm-next branch.

The previous patches,
RFC: http://www.spinics.net/lists/dri-devel/msg58898.html

Patches 1 and 2 fix trivial bugs.

Patches 3 and 4 introduce command mode and command mode display timing.
These are based on video mode and (video mode) display timing.
The MIPI DSI command mode interface panel does not require (video mode) display
timing, but it requires signal timings to distinguish command data and video
data so command mode and command mode display timing are used for it.

Patch 5 converts command mode to drm display mode.

Patches 6, 7, 8, 9 and 10 implement FIMD(display controller) I80 interface.
The MIPI DSI command mode interface panel generates Tearing Effect
synchronization signal between MCU and FB to display video image,
and FIMD should trigger to transfer video image at this signal.
So the panel should receive the TE IRQ then calls TE handler chains to notify
it to the FIMD.

Patches 11 and 12 implement to use Exynos5420 SoC DSI driver which is different
from previous Exynos4 SoCs for some registers control.

Patches 13 and 14 introduce MIPI DSI command interface Samsung S6E3FA0 AMOLED
5.7" LCD panel driver.

Patch 15 is device tree source file for Exynos4 SoCs to support MIPI DSI
command mode.

The others are device tree source files for Exynos5420 to support MIPI DSI
(command mode) driver.

I welcome any comments.

Thank you.
Best regards YJ

YoungJun Cho (18):
  drm/exynos: dsi: move the EoT packets configuration point
  drm/exynos: use wait_event_timeout() for safety usage
  ARM: dts: video: add command mode display timing DT bindings
  video: add command mode and command mode display timing
  drm_modes: add command mode helpers
  ARM: dts: sysreg: add exynos5 compatible to DT bindings
  ARM: dts: samsung-fimd: add I80 specific properties
  drm/exynos: add TE handler to support MIPI DSI command mode interface
  drm/exynos: dsi: add TE handler to support command mode interface
  drm/exynos: fimd: support I80 interface
  ARM: dts: exynos_dsim: add exynos5420 compatible to DT bindings
  drm/exynos: dsi: add driver data to support Exynos5420
  ARM: dts: s6e3fa0: add DT bindings
  drm/panel: add S6E3FA0 driver
  ARM: dts: exynos4: add system register node
  ARM: dts: exynos5: add system register support
  ARM: dts: exynos5420: add mipi-phy node
  ARM: dts: exynos5420: add dsi node

 .../devicetree/bindings/arm/samsung/sysreg.txt     |    1 +
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++
 .../bindings/video/cmdmode-display-timing.txt      |   64 +++
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +-
 .../devicetree/bindings/video/samsung-fimd.txt     |    2 +
 arch/arm/boot/dts/exynos4.dtsi                     |    1 +
 arch/arm/boot/dts/exynos5.dtsi                     |    6 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   20 +
 drivers/gpu/drm/drm_modes.c                        |   59 ++
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    7 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  175 +++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  277 ++++++++--
 drivers/gpu/drm/panel/Kconfig                      |    7 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-s6e3fa0.c              |  570 ++++++++++++++++++++
 drivers/video/Kconfig                              |    3 +
 drivers/video/Makefile                             |    2 +
 drivers/video/cmdmode.c                            |   42 ++
 drivers/video/cmdmode_display_timing.c             |   26 +
 drivers/video/of_cmdmode.c                         |   55 ++
 drivers/video/of_cmdmode_display_timing.c          |  212 ++++++++
 include/drm/drm_mipi_dsi.h                         |    8 +
 include/drm/drm_modes.h                            |   12 +
 include/video/cmdmode.h                            |   67 +++
 include/video/cmdmode_display_timing.h             |   59 ++
 include/video/of_cmdmode.h                         |   19 +
 include/video/of_cmdmode_display_timing.h          |   26 +
 include/video/samsung_fimd.h                       |    3 +-
 31 files changed, 1722 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
 create mode 100644 Documentation/devicetree/bindings/video/cmdmode-display-timing.txt
 create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c
 create mode 100644 drivers/video/cmdmode.c
 create mode 100644 drivers/video/cmdmode_display_timing.c
 create mode 100644 drivers/video/of_cmdmode.c
 create mode 100644 drivers/video/of_cmdmode_display_timing.c
 create mode 100644 include/video/cmdmode.h
 create mode 100644 include/video/cmdmode_display_timing.h
 create mode 100644 include/video/of_cmdmode.h
 create mode 100644 include/video/of_cmdmode_display_timing.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
