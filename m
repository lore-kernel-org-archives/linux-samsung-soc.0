From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/2] drm/exynos: fimd: check error status for
 drm_iommu_attach_device
Date: Sun, 07 Dec 2014 17:34:35 +0530
Message-ID: <1417953876-28266-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1417953876-28266-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51571 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752056AbaLGMLQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Dec 2014 07:11:16 -0500
In-reply-to: <1417953876-28266-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com
Cc: jy0922.shim@samsung.com, jg1.han@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

check error status for drm_iommu_attach_device() and make sure
it propagates till the caller.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 157f4dd..a53d35b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -294,6 +294,8 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 {
 	struct fimd_context *ctx = mgr_to_fimd(mgr);
 	struct exynos_drm_private *priv;
+	int ret;
+
 	priv = drm_dev->dev_private;
 
 	mgr->drm_dev = drm_dev;
@@ -306,7 +308,12 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 		 * a PAGE FAULT when enabled. So clear any channel if enabled.
 		 */
 		fimd_clear_channel(mgr);
-		drm_iommu_attach_device(mgr->drm_dev, ctx->dev);
+
+		ret = drm_iommu_attach_device(mgr->drm_dev, ctx->dev);
+		if (ret) {
+			DRM_ERROR("drm_iommu_attach failed.\n");
+			return ret;
+		}
 	}
 
 	return 0;
@@ -1074,8 +1081,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	int ret;
+
+	ret = fimd_mgr_initialize(&ctx->manager, drm_dev);
+	if (ret) {
+		DRM_ERROR("fimd_mgr_initialize failed.\n");
+		return ret;
+	}
 
-	fimd_mgr_initialize(&ctx->manager, drm_dev);
 	exynos_drm_crtc_create(&ctx->manager);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
-- 
1.7.9.5
