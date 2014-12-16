From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/13] drm/irq: Remove negative CRTC index special-case
Date: Tue, 16 Dec 2014 17:53:23 +0100
Message-ID: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:42341 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950AbaLPQxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 11:53:40 -0500
Received: by mail-pd0-f175.google.com with SMTP id g10so12279170pdj.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2014 08:53:40 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, Gerd Hoffmann <kraxel@redhat.com>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The drm_send_vblank_event() function treats negative CRTC indices as
meaning that a driver doesn't have proper VBLANK handling. This is the
only place where DRM needs negative CRTC indices, so in order to enable
subsequent cleanup, remove this special case and replace it by the more
obvious check for whether or not VBLANK support was initialized.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 75647e7f012b..a24658162284 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -934,7 +934,7 @@ void drm_send_vblank_event(struct drm_device *dev, int crtc,
 	struct timeval now;
 	unsigned int seq;
 
-	if (crtc >= 0) {
+	if (dev->num_crtcs > 0) {
 		seq = drm_vblank_count_and_time(dev, crtc, &now);
 	} else {
 		seq = 0;
-- 
2.1.3
