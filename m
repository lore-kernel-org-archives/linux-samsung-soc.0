From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 0/9] drm: exynos: few patches to enhance bridge chip support
Date: Tue, 22 Apr 2014 04:09:09 +0530
Message-ID: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60518 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754527AbaDUWjv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:39:51 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00HN3KAE1Z20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:39:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next-todo branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

This set of drm patches are needed to support bridge chips and
eDP/LVDS panels with exynos_dp.

Bridge chip driver for parade DP to LVDS converter is also added.

For testing, I have used exynos5250-snow, and exynos5420-peach-pit boards
along with a few local arch side patches.

Andrew Bresticker (1):
  [PATCH 1/9] drm/exynos: dp: support hotplug detection via GPIO

Ajay Kumar (7):
  [PATCH 2/9] drm/panel: add pre_enable and post_disable routines
  [PATCH 3/9] drm/panel: Add driver for exynos_dp based panels
  [PATCH 4/9] drm/exynos: add exynos_dp_panel driver registration to drm driver
  [PATCH 5/9] drm/exynos: dp: modify driver to support drm_panel
  [PATCH 7/9] drm/bridge: ptn3460: add drm_panel controls
  [PATCH 8/9] drm/bridge: Add PS8622 bridge driver
  [PATCH 9/9] drm/exynos: Add ps8622 lvds bridge discovery to DP driver

Rahul Sharma (1):
  [PATCH 6/9] drm/bridge: ptn3460: enable polling based detection

Major changes since V1:
	Add post_disable callback and add bridge chip driver for parade DP
	to LVDS converter

 .../devicetree/bindings/panel/exynos-dp-panel.txt  |   45 ++
 .../devicetree/bindings/video/exynos_dp.txt        |    4 +
 drivers/gpu/drm/bridge/Kconfig                     |    8 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ps8622.c                    |  566 ++++++++++++++++++++
 drivers/gpu/drm/bridge/ptn3460.c                   |   21 +-
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   75 ++-
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    2 +
 drivers/gpu/drm/exynos/exynos_dp_reg.c             |   44 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   15 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    1 +
 drivers/gpu/drm/panel/Kconfig                      |    9 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-exynos-dp.c            |  251 +++++++++
 include/drm/bridge/ps8622.h                        |   42 ++
 include/drm/bridge/ptn3460.h                       |    6 +-
 include/drm/drm_panel.h                            |   18 +
 18 files changed, 1088 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
 create mode 100644 drivers/gpu/drm/bridge/ps8622.c
 create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c
 create mode 100644 include/drm/bridge/ps8622.h

-- 
1.7.9.5
