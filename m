From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Tue, 03 Nov 2015 19:47:02 +0900
Message-ID: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47728 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbbKCKrP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2015 05:47:15 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NX8030SPJANSL30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Nov 2015 19:47:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch series adds pm runtime support for Exynos drm.

Originally, this patch was posted by Gustavo but there was no any
answer about some comments. So I rebased this patch series on top of
exynos-drm-next, removed unnecessary patches and modified wrong macro.

Changelog v2:
- Remove patch 5 and 6.
  . commit callback are already removed so isn't required anymore.
- Remove patch 8 which makes dp clock enabled directly from FIMD.
  . Really not mendatory for FIMD uses DP, and it could be different
    according to Board.
- Modified CONFIG_PM_SLEEP to CONFIG_PM.
  . In case of runtime pm, CONFIG_PM macro should be used instead of
    CONFIG_PM_SLEEP.

Gustavo Padovan (7):
  drm/exynos: do not start enabling DP at bind() phase
  drm/exynos: add pm_runtime to DP
  drm/exynos: add pm_runtime to HDMI
  drm/exynos: add pm_runtime to Mixer
  drm/exynos: add pm_runtime to FIMD
  drm/exynos: add pm_runtime to DECON 5433
  drm/exynos: add pm_runtime to DECON 7

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  54 ++++++---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 125 +++++++++----------
 drivers/gpu/drm/exynos/exynos_dp_core.c       | 165 +++++++++++++++++++-------
 drivers/gpu/drm/exynos/exynos_dp_core.h       |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  91 ++++++--------
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  56 ++++++---
 drivers/gpu/drm/exynos/exynos_mixer.c         | 125 ++++++++++---------
 7 files changed, 352 insertions(+), 265 deletions(-)

-- 
1.9.1
