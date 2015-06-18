From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 3/3] drm/exynos: pass the correct pipe number
Date: Thu, 18 Jun 2015 12:24:01 -0300
Message-ID: <1434641041-17833-4-git-send-email-gustavo@padovan.org>
References: <1434641041-17833-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:34014 "EHLO
	mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756000AbbFRPYS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jun 2015 11:24:18 -0400
Received: by qkeo142 with SMTP id o142so28665728qke.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jun 2015 08:24:16 -0700 (PDT)
In-Reply-To: <1434641041-17833-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Instead of giving -1 to as arg to  drm_send_vblank_event() pass the
correct pipe number to it.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 644b4b7..22b9ca0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -203,7 +203,7 @@ void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (exynos_crtc->event) {
 
-		drm_send_vblank_event(dev, -1, exynos_crtc->event);
+		drm_send_vblank_event(dev, pipe, exynos_crtc->event);
 		drm_vblank_put(dev, pipe);
 		wake_up(&exynos_crtc->pending_flip_queue);
 
-- 
2.1.0
