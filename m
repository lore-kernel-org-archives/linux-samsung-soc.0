From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 2/8] drm/exynos: remove unused exynos_crtc->win_enable() callback
Date: Thu, 26 Mar 2015 11:10:55 -0300
Message-ID: <1427379061-30621-3-git-send-email-gustavo@padovan.org>
References: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:36749 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752745AbbCZOLL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 10:11:11 -0400
Received: by ykcn8 with SMTP id n8so27972284ykc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2015 07:11:10 -0700 (PDT)
In-Reply-To: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

None of the exynos crtc drivers implements win_enable() so remove it for
better clarity of the code.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9afd390..4e8f0b0 100644
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
2.1.0
