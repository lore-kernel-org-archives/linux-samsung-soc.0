From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 03/11] drm/exynos: remove unused .remove() and .check_mode() ops from display
Date: Wed,  5 Aug 2015 20:24:14 -0300
Message-ID: <1438817060-22164-4-git-send-email-gustavo@padovan.org>
References: <1438817060-22164-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:34221 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbbHEXYh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Aug 2015 19:24:37 -0400
Received: by ykax123 with SMTP id x123so49200383yka.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Aug 2015 16:24:36 -0700 (PDT)
In-Reply-To: <1438817060-22164-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

These two display_ops are not used anywhere, remove them.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 5c55606..47ea400 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -81,11 +81,9 @@ struct exynos_drm_plane {
  *	- this structure is common to analog tv, digital tv and lcd panel.
  *
  * @create_connector: initialize and register a new connector
- * @remove: cleans up the display for removal
  * @mode_fixup: fix mode data comparing to hw specific display mode.
  * @mode_set: convert drm_display_mode to hw specific display mode and
  *	      would be called by encoder->mode_set().
- * @check_mode: check if mode is valid or not.
  * @enable: display device on.
  * @disable: display device off.
  * @commit: apply changes to hw
@@ -94,15 +92,12 @@ struct exynos_drm_display;
 struct exynos_drm_display_ops {
 	int (*create_connector)(struct exynos_drm_display *display,
 				struct drm_encoder *encoder);
-	void (*remove)(struct exynos_drm_display *display);
 	void (*mode_fixup)(struct exynos_drm_display *display,
 				struct drm_connector *connector,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 	void (*mode_set)(struct exynos_drm_display *display,
 				struct drm_display_mode *mode);
-	int (*check_mode)(struct exynos_drm_display *display,
-				struct drm_display_mode *mode);
 	void (*enable)(struct exynos_drm_display *display);
 	void (*disable)(struct exynos_drm_display *display);
 	void (*commit)(struct exynos_drm_display *display);
-- 
2.1.0
