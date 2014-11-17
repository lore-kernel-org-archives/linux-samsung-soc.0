From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 7/9] drm/exynos: use irq_flags instead of triggering
Date: Mon, 17 Nov 2014 22:00:14 +0900
Message-ID: <1416229216-32018-8-git-send-email-yj44.cho@samsung.com>
References: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35157 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632AbaKQNA2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:28 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF600HBIPGL1R80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:21 +0900 (KST)
In-reply-to: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

From: Joonyoung Shim <jy0922.shim@samsung.com>

The drm_handle_vblank should be called whenever be vsync, te interrupt
means vsync on i80 interface.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e488b80..a8ab3ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1014,7 +1014,7 @@ static void fimd_te_handler(struct exynos_drm_manager *mgr)
 		wake_up(&ctx->wait_vsync_queue);
 	}
 
-	if (!atomic_read(&ctx->triggering))
+	if (test_bit(0, &ctx->irq_flags))
 		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
 }
 
@@ -1052,13 +1052,15 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 	if (ctx->pipe < 0 || !ctx->drm_dev)
 		goto out;
 
-	drm_handle_vblank(ctx->drm_dev, ctx->pipe);
-	exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
-
 	if (ctx->i80_if) {
+		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+
 		/* Exits triggering mode */
 		atomic_set(&ctx->triggering, 0);
 	} else {
+		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+
 		/* set wait vsync event to zero and wake up queue. */
 		if (atomic_read(&ctx->wait_vsync_event)) {
 			atomic_set(&ctx->wait_vsync_event, 0);
-- 
1.9.0
