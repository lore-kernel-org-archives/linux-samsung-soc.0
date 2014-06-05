From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 0/8] drm: exynos: few patches to enhance bridge chip support
Date: Fri, 06 Jun 2014 00:40:44 +0530
Message-ID: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26927 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405AbaFETMi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 15:12:38 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6P008LYMP0LU40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jun 2014 04:12:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, jg1.han@samsung.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

I have tested this after adding few DT changes for exynos5250-snow,
exynos5420-peach-pit and exynos5800-peach-pi boards.

This patchset also consolidates various inputs from the drm community
regarding the bridge chaining concept:
(1) [RFC V2 0/3] drm/bridge: panel and chaining
	http://www.spinics.net/lists/linux-samsung-soc/msg30160.html
(2) [RFC V3 0/3] drm/bridge: panel and chaining
	http://www.spinics.net/lists/linux-samsung-soc/msg30507.html

Changes since V2:
	-- Address comments from Jingoo Han for ps8622 driver
	-- Address comments from Daniel, Rob and Thierry regarding
	   bridge chaining
	-- Address comments from Thierry regarding the names for
	   new drm_panel functions

Ajay Kumar (6):
  [PATCH V3 1/8] drm/bridge: add helper functions to support bridge chain
  [PATCH V3 2/8] drm/panel: add prepare and unprepare routines
  [PATCH V3 3/8] drm/bridge: Add a driver which binds drm_bridge with drm_panel
  [PATCH V3 4/8] drm/bridge: ptn3460: Support bridge chaining
  [PATCH V3 5/8] drm/panel: Add driver for lvds/edp based panels
  [PATCH V3 6/8] drm/exynos: dp: Modify driver to support bridge chaining

Vincent Palatin (1):
  [PATCH V3 7/8] drm/bridge: Add ps8622/ps8625 bridge driver

Rahul Sharma (1):
  [PATCH V3 8/8] drm/exynos: Add ps8622 lvds bridge discovery to DP driver

 .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 +
 .../devicetree/bindings/panel/panel-lvds.txt       |   50 +++
 .../devicetree/bindings/video/exynos_dp.txt        |    2 +
 drivers/gpu/drm/bridge/Kconfig                     |   15 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/panel_binder.c              |  196 ++++++++
 drivers/gpu/drm/bridge/ps8622.c                    |  475 ++++++++++++++++++++
 drivers/gpu/drm/bridge/ptn3460.c                   |  136 +-----
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   58 ++-
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
 drivers/gpu/drm/panel/Kconfig                      |   18 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-lvds.c                 |  262 +++++++++++
 include/drm/bridge/panel_binder.h                  |   42 ++
 include/drm/bridge/ps8622.h                        |   41 ++
 include/drm/bridge/ptn3460.h                       |   15 +-
 include/drm/drm_crtc.h                             |   72 +++
 include/drm/drm_panel.h                            |   18 +
 19 files changed, 1291 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8622.txt
 create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
 create mode 100644 drivers/gpu/drm/bridge/panel_binder.c
 create mode 100644 drivers/gpu/drm/bridge/ps8622.c
 create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
 create mode 100644 include/drm/bridge/panel_binder.h
 create mode 100644 include/drm/bridge/ps8622.h

-- 
1.7.9.5
