From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] drm/exynos/mixer: replace direct cross-driver call with
 drm mode validation
Date: Mon, 26 Oct 2015 13:03:40 +0100
Message-ID: <1445861025-23266-3-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40362 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753529AbbJZMED (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:03 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT00D86TINZI20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:03:59 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

HDMI driver called directly function from MIXER driver to invalidate modes
not supported by MIXER. The patch replaces the hack with proper .atomic_check
callback.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  |  5 -----
 drivers/gpu/drm/exynos/exynos_mixer.c |  6 ++++--
 drivers/gpu/drm/exynos/exynos_mixer.h | 20 --------------------
 3 files changed, 4 insertions(+), 27 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_mixer.h

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b0f5ff4..57b6755 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -44,7 +44,6 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
-#include "exynos_mixer.h"
 
 #define HOTPLUG_DEBOUNCE_MS		1100
 
@@ -1017,10 +1016,6 @@ static int hdmi_mode_valid(struct drm_connector *connector,
 		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
 		false, mode->clock * 1000);
 
-	ret = mixer_check_mode(mode);
-	if (ret)
-		return MODE_BAD;
-
 	ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
 	if (ret < 0)
 		return MODE_BAD;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 3f9f072..d09f8f9 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -39,7 +39,6 @@
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_plane.h"
 #include "exynos_drm_iommu.h"
-#include "exynos_mixer.h"
 
 #define MIXER_WIN_NR		3
 #define VP_DEFAULT_WIN		2
@@ -1096,8 +1095,10 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 }
 
 /* Only valid for Mixer version 16.0.33.0 */
-int mixer_check_mode(struct drm_display_mode *mode)
+static int mixer_atomic_check(struct exynos_drm_crtc *crtc,
+		       struct drm_crtc_state *state)
 {
+	struct drm_display_mode *mode = &state->adjusted_mode;
 	u32 w, h;
 
 	w = mode->hdisplay;
@@ -1123,6 +1124,7 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.wait_for_vblank	= mixer_wait_for_vblank,
 	.update_plane		= mixer_update_plane,
 	.disable_plane		= mixer_disable_plane,
+	.atomic_check		= mixer_atomic_check,
 };
 
 static struct mixer_drv_data exynos5420_mxr_drv_data = {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.h b/drivers/gpu/drm/exynos/exynos_mixer.h
deleted file mode 100644
index 3811e41..0000000
--- a/drivers/gpu/drm/exynos/exynos_mixer.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- * Copyright (C) 2013 Google, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef _EXYNOS_MIXER_H_
-#define _EXYNOS_MIXER_H_
-
-/* This function returns 0 if the given timing is valid for the mixer */
-int mixer_check_mode(struct drm_display_mode *mode);
-
-#endif
-- 
1.9.1
