From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip support
Date: Sat, 26 Jul 2014 00:52:02 +0530
Message-ID: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48586 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336AbaGYTZR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

I have tested this after adding few DT changes for exynos5250-snow,
exynos5420-peach-pit and exynos5800-peach-pi boards.

The V4 series of this particular patchset was also tested by:
Rahul Sharma <rahul.sharma@samsung.com>
Javier Martinez Canillas <javier@dowhile0.org>

Changes since V2:
	-- Address comments from Jingoo Han for ps8622 driver
	-- Address comments from Daniel, Rob and Thierry regarding
	   bridge chaining
	-- Address comments from Thierry regarding the names for
	   new drm_panel functions

Changes since V3:
	-- Remove hotplug based initialization of exynos_dp
	-- Make exynos_dp work directly with drm_panel, remove
	   dependency on panel_binder
	-- Minor cleanups in panel_binder and panel_lvds driver

Changes since V4:
	-- Use gpiod interface for panel-lvds and ps8622 drivers.
	-- Address comments from Javier.
	-- Fix compilation issues when PANEL_BINDER is selected as module.
	-- Split Documentation patches from driver patches.
	-- Rebase on top of the tree.

Changes since V5:
	-- Modify bridge drivers to support driver model.
	-- Drop the concept of bridge chain(sincle there are no 2 real bridges)
	   Hence drop bridge-panel_binder layer.
	-- Drop panel-lvds driver and accomodate the required changes in
	   panel-simple driver.
	-- Use gpiod interface in ptn3460 driver.
	-- Address all comments by Thierry Reding for V5 series.
	-- Address comments from Sean Paul for exynos_dp_commit issue.

Ajay Kumar (6):
  [PATCH V6 1/8] drm/panel: Add prepare, unprepare and get_modes routines
  [PATCH V6 2/8] drm/panel: Add support for prepare and unprepare routines
  [PATCH V6 3/8] drm/panel: simple: Add support for auo_b133htn01 panel
  [PATCH V6 4/8] drm/exynos: Move DP setup into commit()
  [PATCH V6 5/8] drm/exynos: dp: Modify driver to support drm_panel
  [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support driver model

Sean Paul (1):
  [PATCH V6 7/8] drm/bridge: Add i2c based driver for ptn3460 bridge

Vincent Palatin (1):
  [PATCH V6 8/8] drm/bridge: Add i2c based driver for ps8622/ps8625 bridge

 .../devicetree/bindings/drm/bridge/ptn3460.txt     |   27 -
 .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 .../devicetree/bindings/video/bridge/ps8622.txt    |   19 +
 .../devicetree/bindings/video/bridge/ptn3460.txt   |   27 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/bridge/Kconfig                     |   32 +-
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ps8622.c                    |  602 ++++++++++++++++++++
 drivers/gpu/drm/bridge/ptn3460.c                   |  212 ++++---
 drivers/gpu/drm/drm_bridge.c                       |   89 +++
 drivers/gpu/drm/drm_crtc.c                         |    9 +-
 drivers/gpu/drm/exynos/Kconfig                     |    4 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c            |  165 ++++--
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    7 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +-
 drivers/gpu/drm/panel/panel-ld9040.c               |   18 +-
 drivers/gpu/drm/panel/panel-s6e8aa0.c              |   18 +-
 drivers/gpu/drm/panel/panel-simple.c               |   96 +++-
 drivers/gpu/drm/tegra/output.c                     |    2 +
 include/drm/bridge/ptn3460.h                       |   37 --
 include/drm/drm_crtc.h                             |   16 +-
 include/drm/drm_panel.h                            |   26 +
 25 files changed, 1206 insertions(+), 225 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
 create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01.txt
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ptn3460.txt
 create mode 100644 drivers/gpu/drm/bridge/ps8622.c
 create mode 100644 drivers/gpu/drm/drm_bridge.c
 delete mode 100644 include/drm/bridge/ptn3460.h

-- 
1.7.9.5
