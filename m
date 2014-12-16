From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/13] drm/bochs: Store correct CRTC index in events
Date: Tue, 16 Dec 2014 17:53:24 +0100
Message-ID: <1418748815-15434-2-git-send-email-thierry.reding@gmail.com>
References: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:56740 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981AbaLPQxo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 11:53:44 -0500
Received: by mail-pa0-f54.google.com with SMTP id fb1so14506677pad.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2014 08:53:44 -0800 (PST)
In-Reply-To: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, Gerd Hoffmann <kraxel@redhat.com>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Previously a negative pipe caused a special case to be triggered for
drivers that didn't have proper VBLANK support. The trigger for this
special case is now independent of the pipe, so the correct CRTC index
can now be stored in events.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 26bcd03a8cb6..c219c1de3722 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -113,13 +113,14 @@ static int bochs_crtc_page_flip(struct drm_crtc *crtc,
 	struct bochs_device *bochs =
 		container_of(crtc, struct bochs_device, crtc);
 	struct drm_framebuffer *old_fb = crtc->primary->fb;
+	unsigned int pipe = drm_crtc_index(crtc);
 	unsigned long irqflags;
 
 	crtc->primary->fb = fb;
 	bochs_crtc_mode_set_base(crtc, 0, 0, old_fb);
 	if (event) {
 		spin_lock_irqsave(&bochs->dev->event_lock, irqflags);
-		drm_send_vblank_event(bochs->dev, -1, event);
+		drm_send_vblank_event(bochs->dev, pipe, event);
 		spin_unlock_irqrestore(&bochs->dev->event_lock, irqflags);
 	}
 	return 0;
-- 
2.1.3
