From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 00/11] drm/exynos: remove exynos_drm_display and exynos_drm_encoder
Date: Wed,  5 Aug 2015 20:24:11 -0300
Message-ID: <1438817060-22164-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:35740 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbbHEXY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Aug 2015 19:24:27 -0400
Received: by ykcq64 with SMTP id q64so44042937ykc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Aug 2015 16:24:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

This patchset is another important step in the exynos clean up, it removes
two exynos internal structs in favor of wider use of struct drm_encoder.

Structs exynos_drm_display and exynos_drm_encoder were doing exactly what
struct drm_encoder does so remove them makes the code cleaner, easier
to understand and less error prone.

Please review,

       Gustavo

---
v2:  - check ret value of hdmi_create_connector()
     - set dp->dpms_mode after enable/disable	

Gustavo Padovan (11):
  drm/exynos: split display's .dpms() into .enable() and .disable()
  drm/exynos: remove wrappers for phy_power_{on,off}
  drm/exynos: remove unused .remove() and .check_mode() ops from display
  drm/exynos: simplify calculation of possible CRTCs
  drm/exynos: remove struct exynos_drm_display
  drm/exynos: remove extra call to hdmi_commit()
  drm/exynos: remove extra call to exynos_dp_commit()
  drm/exynos: remove exynos_encoder's .commit() op
  drm/exynos: remove exynos_drm_create_enc_conn()
  drm/exynos: fold encoder setup into exynos_drm_load()
  drm/exynos: remove struct exynos_drm_encoder layer

 drivers/gpu/drm/exynos/Makefile             |   7 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  |  16 +--
 drivers/gpu/drm/exynos/exynos_dp_core.c     | 119 ++++++++++---------
 drivers/gpu/drm/exynos/exynos_dp_core.h     |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_core.c    |  36 ------
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h    |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  96 ++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |  13 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  65 ++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 130 ++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 174 ----------------------------
 drivers/gpu/drm/exynos/exynos_drm_encoder.h |  23 ----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  17 ++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  90 ++++++++------
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 160 ++++++++++++-------------
 16 files changed, 355 insertions(+), 599 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.h

-- 
2.1.0
