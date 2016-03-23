From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/6] drm/exynos: add helper to get crtc from pipe
Date: Wed, 23 Mar 2016 14:25:57 +0100
Message-ID: <1458739562-32327-2-git-send-email-a.hajda@samsung.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38220 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754859AbcCWN0R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:26:17 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00G2WUNQ2NA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:26:14 +0000 (GMT)
In-reply-to: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

The helper abstracts out conversion from pipeline
to crtc. Currently it is used in two places, but
there will be more uses in next patches.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 10 ++++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  8 ++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index e36579c..50dd33d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -157,9 +157,8 @@ err_crtc:
 
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
 {
-	struct exynos_drm_private *private = dev->dev_private;
-	struct exynos_drm_crtc *exynos_crtc =
-		to_exynos_crtc(private->crtc[pipe]);
+	struct exynos_drm_crtc *exynos_crtc = exynos_drm_crtc_from_pipe(dev,
+									pipe);
 
 	if (exynos_crtc->ops->enable_vblank)
 		return exynos_crtc->ops->enable_vblank(exynos_crtc);
@@ -169,9 +168,8 @@ int exynos_drm_crtc_enable_vblank(struct drm_device *dev, unsigned int pipe)
 
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, unsigned int pipe)
 {
-	struct exynos_drm_private *private = dev->dev_private;
-	struct exynos_drm_crtc *exynos_crtc =
-		to_exynos_crtc(private->crtc[pipe]);
+	struct exynos_drm_crtc *exynos_crtc = exynos_drm_crtc_from_pipe(dev,
+									pipe);
 
 	if (exynos_crtc->ops->disable_vblank)
 		exynos_crtc->ops->disable_vblank(exynos_crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 3f170ce..fcea940 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -232,6 +232,14 @@ struct exynos_drm_private {
 	wait_queue_head_t	wait;
 };
 
+static inline struct exynos_drm_crtc *
+exynos_drm_crtc_from_pipe(struct drm_device *dev, int pipe)
+{
+	struct exynos_drm_private *private = dev->dev_private;
+
+	return to_exynos_crtc(private->crtc[pipe]);
+}
+
 static inline struct device *to_dma_dev(struct drm_device *dev)
 {
 	struct exynos_drm_private *priv = dev->dev_private;
-- 
1.9.1
