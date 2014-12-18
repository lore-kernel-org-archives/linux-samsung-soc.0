From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 21/29] drm/exynos: remove mode_set() ops from exynos_crtc
Date: Thu, 18 Dec 2014 11:58:47 -0200
Message-ID: <1418911135-5207-22-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:55589 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbaLROA2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 09:00:28 -0500
Received: by mail-qc0-f177.google.com with SMTP id x3so855350qcv.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 06:00:28 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

It is no longer used anywhere.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4c930d0..d490b49 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -167,7 +167,6 @@ struct exynos_drm_display {
  *
  * @dpms: control device power.
  * @mode_fixup: fix mode data before applying it
- * @mode_set: set the given mode to the manager
  * @commit: set current hw specific display mode to hw.
  * @enable_vblank: specific driver callback for enabling vblank interrupt.
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
@@ -186,8 +185,6 @@ struct exynos_drm_crtc_ops {
 	bool (*mode_fixup)(struct exynos_drm_crtc *crtc,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
-	void (*mode_set)(struct exynos_drm_crtc *crtc,
-				const struct drm_display_mode *mode);
 	void (*commit)(struct exynos_drm_crtc *crtc);
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
-- 
1.9.3
