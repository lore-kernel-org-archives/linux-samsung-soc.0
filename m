From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 01/14] drm/exynos: remove unused exynos_crtc->win_enable() callback
Date: Fri,  6 Feb 2015 17:37:45 -0200
Message-ID: <1423251478-17043-2-git-send-email-gustavo@padovan.org>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:37525 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbBFTkG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 14:40:06 -0500
Received: by mail-qg0-f52.google.com with SMTP id h3so8959339qgf.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 11:40:05 -0800 (PST)
In-Reply-To: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

None of the exynos crtc drivers implements win_enable() so remove it for
better clarity of the code.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 1aceafc..66f4a06 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -174,7 +174,6 @@ struct exynos_drm_display {
  *	hardware overlay is updated.
  * @win_mode_set: copy drm overlay info to hw specific overlay info.
  * @win_commit: apply hardware specific overlay data to registers.
- * @win_enable: enable hardware specific overlay.
  * @win_disable: disable hardware specific overlay.
  * @te_handler: trigger to transfer video image at the tearing effect
  *	synchronization signal if there is a page flip request.
@@ -192,7 +191,6 @@ struct exynos_drm_crtc_ops {
 	void (*win_mode_set)(struct exynos_drm_crtc *crtc,
 				struct exynos_drm_plane *plane);
 	void (*win_commit)(struct exynos_drm_crtc *crtc, int zpos);
-	void (*win_enable)(struct exynos_drm_crtc *crtc, int zpos);
 	void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
 };
-- 
1.9.3
