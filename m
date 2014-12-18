From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 12/29] drm/exynos: call exynos_update_plane() directly on page flips
Date: Thu, 18 Dec 2014 11:58:38 -0200
Message-ID: <1418911135-5207-13-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:49645 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLRN7r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:47 -0500
Received: by mail-qa0-f54.google.com with SMTP id k15so819237qaq.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:46 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Avoid an extra call to exynos_drm_crtc_mode_set_commit() that only calls
exynos_update_plane().

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 4c8bd4d..185dabe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -176,6 +176,7 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 	struct exynos_drm_private *dev_priv = dev->dev_private;
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_framebuffer *old_fb = crtc->primary->fb;
+	unsigned int crtc_w, crtc_h;
 	int ret = -EINVAL;
 
 	/* when the page flip is requested, crtc's dpms should be on */
@@ -207,8 +208,11 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 		spin_unlock_irq(&dev->event_lock);
 
 		crtc->primary->fb = fb;
-		ret = exynos_drm_crtc_mode_set_commit(crtc, crtc->x, crtc->y,
-						    NULL);
+		crtc_w = fb->width - crtc->x;
+		crtc_h = fb->height - crtc->y;
+		ret = exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
+					  crtc_w, crtc_h, crtc->x, crtc->y,
+					  crtc_w, crtc_h);
 		if (ret) {
 			crtc->primary->fb = old_fb;
 
-- 
1.9.3
