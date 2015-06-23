From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 16/23] drm/exynos: simplify calculation of possible CRTCs
Date: Tue, 23 Jun 2015 18:35:29 -0300
Message-ID: <1435095336-6196-17-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:34608 "EHLO
	mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933352AbbFWVgc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:32 -0400
Received: by qkeo142 with SMTP id o142so12233245qke.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:31 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

All CRTCs can only be LCD, HDMI or VIDI, so basically all CRTCs will be a
possible CRTCs. This patch removes an extra function with switch that was
only checking if the CRTC type was one of those three above.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 0aa4a58..7ba3a2d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -105,36 +105,17 @@ static struct drm_encoder_funcs exynos_encoder_funcs = {
 	.destroy = exynos_drm_encoder_destroy,
 };
 
-static unsigned int exynos_drm_encoder_clones(struct drm_encoder *encoder)
+void exynos_drm_encoder_setup(struct drm_device *dev)
 {
-	struct drm_encoder *clone;
-	struct drm_device *dev = encoder->dev;
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct exynos_drm_display *display = exynos_encoder->display;
+	struct drm_encoder *encoder;
 	unsigned int clone_mask = 0;
 	int cnt = 0;
 
-	list_for_each_entry(clone, &dev->mode_config.encoder_list, head) {
-		switch (display->type) {
-		case EXYNOS_DISPLAY_TYPE_LCD:
-		case EXYNOS_DISPLAY_TYPE_HDMI:
-		case EXYNOS_DISPLAY_TYPE_VIDI:
-			clone_mask |= (1 << (cnt++));
-			break;
-		default:
-			continue;
-		}
-	}
-
-	return clone_mask;
-}
-
-void exynos_drm_encoder_setup(struct drm_device *dev)
-{
-	struct drm_encoder *encoder;
+	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
+		clone_mask |= (1 << (cnt++));
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
-		encoder->possible_clones = exynos_drm_encoder_clones(encoder);
+		encoder->possible_clones = clone_mask;
 }
 
 struct drm_encoder *
-- 
2.1.0
