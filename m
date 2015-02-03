From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 13/14] drm/exynos: use correct pipe number on vblank event
Date: Tue,  3 Feb 2015 17:14:30 -0200
Message-ID: <1422990871-21355-14-git-send-email-gustavo@padovan.org>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:46806 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966015AbbBCTRI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 14:17:08 -0500
Received: by mail-qc0-f179.google.com with SMTP id w7so36827814qcr.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Feb 2015 11:17:07 -0800 (PST)
In-Reply-To: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Use the pipe var received instead of using always -1 as pipe value.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 2edc73c..0f2b789 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -382,7 +382,7 @@ void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (exynos_crtc->event) {
 
-		drm_send_vblank_event(dev, -1, exynos_crtc->event);
+		drm_send_vblank_event(dev, pipe, exynos_crtc->event);
 		drm_vblank_put(dev, pipe);
 		wake_up(&exynos_crtc->pending_flip_queue);
 
-- 
1.9.3
