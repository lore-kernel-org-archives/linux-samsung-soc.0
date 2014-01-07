From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] drm/exynos: Fix build after removal of DRM_WAKUP
Date: Tue,  7 Jan 2014 13:59:12 +0000
Message-ID: <1389103152-21877-2-git-send-email-broonie@kernel.org>
References: <1389103152-21877-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48296 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911AbaAGOX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 09:23:29 -0500
In-Reply-To: <1389103152-21877-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Commit 57ed0f7b4375 (drm: Kill DRM_WAKUP and DRM_INIT_WAITQUEUE) removed
the definition of DRM_WAKUP but did not remove the use of it in the Exynos
DRM driver causing it to fail to build. Fix that.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bdfe31fb731b..05b72b07a134 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -706,7 +706,7 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 	/* set wait vsync event to zero and wake up queue. */
 	if (atomic_read(&ctx->wait_vsync_event)) {
 		atomic_set(&ctx->wait_vsync_event, 0);
-		DRM_WAKEUP(&ctx->wait_vsync_queue);
+		wake_up(&ctx->wait_vsync_queue);
 	}
 out:
 	return IRQ_HANDLED;
-- 
1.8.5.2
