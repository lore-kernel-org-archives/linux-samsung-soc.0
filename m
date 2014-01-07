From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] drm/exynos: Fix build after removal of DRM_HZ
Date: Tue,  7 Jan 2014 13:59:11 +0000
Message-ID: <1389103152-21877-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48290 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415AbaAGOXQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 09:23:16 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Commit bfd8303af0c46 (drm: Kill DRM_HZ) removed the definition of DRM_HZ
but did not remove its use in the Exynos DRM driver causing it to fail to
build. Fix that.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 267aca91b70d..bdfe31fb731b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -347,7 +347,7 @@ static void fimd_wait_for_vblank(struct device *dev)
 	 */
 	if (!wait_event_timeout(ctx->wait_vsync_queue,
 				!atomic_read(&ctx->wait_vsync_event),
-				DRM_HZ/20))
+				HZ / 20))
 		DRM_DEBUG_KMS("vblank wait timed out.\n");
 }
 
-- 
1.8.5.2
