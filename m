From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 00/10] drm/exynos: add pm_runtime support
Date: Fri,  4 Sep 2015 17:15:42 -0300
Message-ID: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:34526 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760474AbbIDUP7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:15:59 -0400
Received: by ykcm128 with SMTP id m128so2769249ykc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:15:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

This series adds proper runtime PM suport to CRTCs and Encoders, so
now instead of relying on 'suspended' or 'enabled' flags to track when
the CRTC or Encoder is enabled we let the pm_runtime subsystem do it for us
and remove all the flags. This is a important step to the atomic suspend/resume
support that will land in drm anytime soon.

Please review!

	Gustavo

Gustavo Padovan (10):
  drm/exynos: do not start enabling DP at bind() phase
  drm/exynos: add pm_runtime to DP
  drm/exynos: add pm_runtime to HDMI
  drm/exynos: add pm_runtime to Mixer
  drm/exynos: remove exynos_crtc commit() callback
  drm/exynos: Remove exynos_crtc commit() callback
  drm/exynos: add pm_runtime to FIMD
  drm/exynos: Enable DP clock directly from FIMD
  drm/exynos: add pm_runtime to DECON 5433
  drm/exynos: add pm_runtime to DECON 7

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  90 ++++++++----------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 126 +++++++++++--------------
 drivers/gpu/drm/exynos/exynos_dp_core.c       |  57 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  10 --
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |   7 --
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 129 ++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  56 +++++++----
 drivers/gpu/drm/exynos/exynos_mixer.c         | 125 ++++++++++++-------------
 8 files changed, 275 insertions(+), 325 deletions(-)

-- 
2.1.0
