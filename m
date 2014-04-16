From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/7] drm: exynos: few patches to enhance bridge chip support
Date: Wed, 16 Apr 2014 20:02:59 +0530
Message-ID: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39984 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161072AbaDPOde (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:33:34 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4400HO4OFXB510@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 23:33:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, a.hajda@samsung.com, treding@nvidia.com, kyungmin.park@samsung.com, seanpaul@google.com, abrestic@chromium.org, rahul.sharma@samsung.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next-todo branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

This set of drm patches are needed to support bridge chips and
eDP/LVDS panels with exynos_dp.
For testing, I have used exynos5250-snow board along with a few local
arch side patches.

This patchset tries to create a simple exynos_dp panel framework
to control power up/down sequence of the eDP/eDP-LVDS panel, and
the same is used to control the panel power sequence for the
LVDS panel on snow.

Andrew Bresticker (1):
  [PATCH 1/7] drm/exynos: dp: support hotplug detection via GPIO

Ajay Kumar (5):
  [PATCH 2/7] drm/panel: add pre_enable routine to drm panel
  [PATCH 3/7] drm/panel: Add driver for exynos_dp based panels
  [PATCH 4/7] drm/exynos: add exynos_dp_panel driver registration to drm driver
  [PATCH 5/7] drm/exynos: dp: modify driver to support drm_panel
  [PATCH 7/7] drm/bridge: ptn3460: add drm_panel controls

Rahul Sharma (1):
  [PATCH 6/7] drm/bridge: ptn3460: enable polling based detection

 .../devicetree/bindings/panel/exynos-dp-panel.txt  |  32 ++++
 .../devicetree/bindings/video/exynos_dp.txt        |   4 +
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/bridge/ptn3460.c                   |  18 +-
 drivers/gpu/drm/exynos/Kconfig                     |   1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |  66 ++++++-
 drivers/gpu/drm/exynos/exynos_dp_core.h            |   2 +
 drivers/gpu/drm/exynos/exynos_dp_reg.c             |  26 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |  11 ++
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-exynos-dp.c            | 213 +++++++++++++++++++++
 include/drm/bridge/ptn3460.h                       |   6 +-
 include/drm/drm_panel.h                            |   9 +
 15 files changed, 387 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
 create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c

-- 
1.8.1.2
