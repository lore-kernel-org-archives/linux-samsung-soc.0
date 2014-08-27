From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 00/12] drm/exynos: few patches to enhance bridge chip support
Date: Wed, 27 Aug 2014 19:59:34 +0530
Message-ID: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18181 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933802AbaH0Oeo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:34:44 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY00IRNZ5UOV70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:34:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on master branch of Linus tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

I have tested this after adding few DT changes for exynos5250-snow and
exynos5420-peach-pit boards.

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

Changes since V6:
	-- Panel patches were seperated and they are merged already.
	-- Fix few issues with ptn3460, before modifying the bridge core.
	-- Modify drm_bridge as per Thierry's comments for V6 series.
	-- Add drm_bridge changes minimally without breaking existing code.
	-- Add new features for ptn3460, step-by-step.
	-- Address comments from Thierry and Andreas for ptn3460 and ps8622.
	-- Split documentation patches from driver patches.

"[PATCH V7 5/12] drm/exynos: dp: support drm_bridge" introduces following
Kconfig error:
drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
drivers/video/fbdev/Kconfig:5:	symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:39:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:33:	symbol DRM_KMS_HELPER is selected by DRM_BRIDGE
drivers/gpu/drm/bridge/Kconfig:1:	symbol DRM_BRIDGE is selected by DRM_EXYNOS_DP
drivers/gpu/drm/exynos/Kconfig:53:	symbol DRM_EXYNOS_DP depends on DRM_EXYNOS_FIMD
drivers/gpu/drm/exynos/Kconfig:28:	symbol DRM_EXYNOS_FIMD depends on FB_S3C
drivers/video/fbdev/Kconfig:2038:	symbol FB_S3C depends on FB

What's the best way to fix the above ambiguity?

Ajay Kumar (11):
  [PATCH V7 1/12] drm/bridge: ptn3460: Few trivial cleanups
  [PATCH V7 2/12] drm/bridge: do not pass drm_bridge_funcs to drm_bridge_init
  [PATCH V7 3/12] drm/bridge: Add helper functions for drm_bridge
  [PATCH V7 4/12] drm/bridge: ptn3460: convert to i2c driver model
  [PATCH V7 5/12] drm/exynos: dp: support drm_bridge
  [PATCH V7 6/12] drm/bridge: ptn3460: support drm_panel
  [PATCH V7 7/12] drm/bridge: ptn3460: probe connector at the end of bridge attach
  [PATCH V7 8/12] drm/bridge: ptn3460: use gpiod interface
  [PATCH V7 9/12] Documentation: drm: bridge: move to video/bridge
  [PATCH V7 10/12] Documentation: devicetree: Add vendor prefix for parade
  [PATCH V7 11/12] Documentation: bridge: Add documentation for ps8622 DT properties

Vincent Palatin (1):
  [PATCH V7 12/12] drm/bridge: Add i2c based driver for ps8622/ps8625 bridge

 .../devicetree/bindings/drm/bridge/ptn3460.txt     |   27 -
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 .../devicetree/bindings/video/bridge/ps8622.txt    |   20 +
 .../devicetree/bindings/video/bridge/ptn3460.txt   |   27 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/bridge/Kconfig                     |   30 +-
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ps8622.c                    |  681 ++++++++++++++++++++
 drivers/gpu/drm/bridge/ptn3460.c                   |  302 +++++----
 drivers/gpu/drm/drm_bridge.c                       |  102 +++
 drivers/gpu/drm/drm_crtc.c                         |    9 +-
 drivers/gpu/drm/exynos/Kconfig                     |    3 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   54 +-
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    7 +-
 drivers/gpu/drm/sti/sti_hda.c                      |    3 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    3 +-
 include/drm/drm_crtc.h                             |   15 +-
 18 files changed, 1098 insertions(+), 189 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ptn3460.txt
 create mode 100644 drivers/gpu/drm/bridge/ps8622.c
 create mode 100644 drivers/gpu/drm/drm_bridge.c

-- 
1.7.9.5
