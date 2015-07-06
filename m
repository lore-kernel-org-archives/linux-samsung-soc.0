From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 01/23] drm/exynos: pass the correct pipe number
Date: Mon,  6 Jul 2015 11:20:02 -0300
Message-ID: <1436192424-18194-2-git-send-email-gustavo@padovan.org>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:35688 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753047AbbGFOUg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 10:20:36 -0400
Received: by qkbp125 with SMTP id p125so117823341qkb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2015 07:20:35 -0700 (PDT)
In-Reply-To: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

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
