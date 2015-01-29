From: Alban Browaeys <alban.browaeys@gmail.com>
Subject: [PATCH] exynos/drm: fix no hdmi output
Date: Thu, 29 Jan 2015 22:18:40 +0100
Message-ID: <1422566320-6126-1-git-send-email-prahal@yahoo.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:50478 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754927AbbA2VTU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 16:19:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org, Alban Browaeys <prahal@yahoo.com>

The hdmi outputs black screen only even though under the hood Xorg and
framebuffer console  are fine : devices found and initialized, but
not a pixel out.

Commit 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
changed the call order of mixer_initialize with regards to
 exynos_drm_crtc_create.

This changes breaks hdmi out on Odroid U2 (linux-next with added
 Marek Szyprowski v4 hdmi patchset from linux-samsung-soc ML).

Restore the previous call ordering get hdmi to ouput proper pixels:
ie call mixer_initialize first then exynos_drm_crtc_create.

Fixes: 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
Signed-off-by: Alban Browaeys <prahal@yahoo.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index d8fd8e1..188f90f 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1258,18 +1258,19 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	struct drm_device *drm_dev = data;
 	int ret;
 
+	ret = mixer_initialize(ctx, drm_dev);
+	if (ret)
+		return ret;
+
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
 				     EXYNOS_DISPLAY_TYPE_HDMI,
 				     &mixer_crtc_ops, ctx);
 	if (IS_ERR(ctx->crtc)) {
+		mixer_ctx_remove(ctx);
 		ret = PTR_ERR(ctx->crtc);
 		goto free_ctx;
 	}
 
-	ret = mixer_initialize(ctx, drm_dev);
-	if (ret)
-		goto free_ctx;
-
 	return 0;
 
 free_ctx:
-- 
2.1.4
