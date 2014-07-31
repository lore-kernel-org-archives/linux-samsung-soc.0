From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 00/15] drm/panel: Add prepare and unprepare routines
Date: Thu, 31 Jul 2014 23:11:59 +0530
Message-ID: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42244 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134AbaGaRp2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

This is originally a part of the bridge chip series:
http://www.spinics.net/lists/linux-samsung-soc/msg34826.html

But, since we can handle panel and bridge chips seperately,
I thought of seperating them.

This patchset basically extends the drm panel framework
to accomodate wider range of panels with strict timing
sequence for enabling panel power, backlight enable, etc.

I have tested this patchset on exynos5800-peach-pi board.

Thierry:
	As discussed, I have seperated patches such that they
	won't break the compilation in between. Also, I have
	incorporated all the comments given by you for panel patches.
	I assume you have already taken [PATCH 01/15] and hence
	it can be dropped from this patchset.

Ajay Kumar (15):
  [PATCH 01/15] drm/panel: add prepare and unprepare routines
  [PATCH 02/15] drm/panel: Add get_modes helper
  [PATCH 03/15] drm/panel: ld9040: Add dummy prepare and unprepare routines
  [PATCH 04/15] drm/panel: s6e8aa0: Add dummy prepare and unprepare routines
  [PATCH 05/15] drm/panel: simple: Add dummy prepare and unprepare routines
  [PATCH 06/15] drm/exynos: dpi: Add support for panel prepare and unprepare routines
  [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare and unprepare routines
  [PATCH 08/15] drm/tegra: Add support for panel prepare and unprepare routines
  [PATCH 09/15] drm/panel: ld9040: Add proper definition for prepare and unprepare
  [PATCH 10/15] drm/panel: s6e8aa0: Add proper definition for prepare and unprepare
  [PATCH 11/15] drm/panel: simple: Add proper definition for prepare and unprepare
  [PATCH 12/15] drm/panel: simple: Support usage of delays in panel functions
  [PATCH 13/15] drm/panel: simple: Add support for auo_b133htn01 panel
  [PATCH 14/15] drm/exynos: Move DP setup into commit()
  [PATCH 15/15] drm/exynos: dp: Modify driver to support drm_panel

 .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 ++
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |  112 +++++++++++++++-----
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   12 ++-
 drivers/gpu/drm/panel/panel-ld9040.c               |   16 ++-
 drivers/gpu/drm/panel/panel-s6e8aa0.c              |   16 ++-
 drivers/gpu/drm/panel/panel-simple.c               |   96 ++++++++++++++++-
 drivers/gpu/drm/tegra/output.c                     |    2 +
 include/drm/drm_panel.h                            |   26 +++++
 11 files changed, 262 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01.txt

-- 
1.7.9.5
