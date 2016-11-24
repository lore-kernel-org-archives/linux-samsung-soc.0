From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH] drm/exynos/gsc: fix the hardware limitations
Date: Thu, 24 Nov 2016 16:51:36 +0900
Message-ID: <1479973896-26902-1-git-send-email-hoegeun.kwon@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39013 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756809AbcKXHvm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 02:51:42 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OH400G5FZ64YK20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Nov 2016 16:51:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, hoegeun.kwon@samsung.com

The maximum size of input or output rotation is 2047 x 2047.
Fixed an error on limitations.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 11 +++++++++--
 include/uapi/drm/exynos_drm.h           |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index bef5798..36e05ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -71,6 +71,7 @@
 #define GSC_CROP_MIN	32
 #define GSC_SCALE_MAX	4224
 #define GSC_SCALE_MIN	32
+#define GSC_ROT_MAX	2047
 #define GSC_COEF_RATIO	7
 #define GSC_COEF_PHASE	9
 #define GSC_COEF_ATTR	16
@@ -1371,6 +1372,8 @@ static int gsc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 	prop_list->scale_max.vsize = GSC_SCALE_MAX;
 	prop_list->scale_min.hsize = GSC_SCALE_MIN;
 	prop_list->scale_min.vsize = GSC_SCALE_MIN;
+	prop_list->rot_max.hsize = GSC_ROT_MAX;
+	prop_list->rot_max.vsize = GSC_ROT_MAX;
 
 	return 0;
 }
@@ -1444,7 +1447,9 @@ static int gsc_ippdrv_check_property(struct device *dev,
 				if ((pos->h < pp->crop_min.hsize) ||
 					(sz->vsize > pp->crop_max.hsize) ||
 					(pos->w < pp->crop_min.vsize) ||
-					(sz->hsize > pp->crop_max.vsize)) {
+					(sz->hsize > pp->crop_max.vsize) ||
+					(pos->h > pp->rot_max.hsize) ||
+					(pos->w > pp->rot_max.vsize)) {
 					DRM_ERROR("out of crop size.\n");
 					goto err_property;
 				}
@@ -1465,7 +1470,9 @@ static int gsc_ippdrv_check_property(struct device *dev,
 				if ((pos->h < pp->scale_min.hsize) ||
 					(sz->vsize > pp->scale_max.hsize) ||
 					(pos->w < pp->scale_min.vsize) ||
-					(sz->hsize > pp->scale_max.vsize)) {
+					(sz->hsize > pp->scale_max.vsize) ||
+					(pos->h > pp->rot_max.hsize) ||
+					(pos->w > pp->rot_max.vsize)) {
 					DRM_ERROR("out of scale size.\n");
 					goto err_property;
 				}
diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index cb3e9f9..d5d5518 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -192,6 +192,7 @@ enum drm_exynos_planer {
  * @crop_max: crop max resolution.
  * @scale_min: scale min resolution.
  * @scale_max: scale max resolution.
+ * @rot_max: rotation max resolution.
  */
 struct drm_exynos_ipp_prop_list {
 	__u32	version;
@@ -210,6 +211,7 @@ struct drm_exynos_ipp_prop_list {
 	struct drm_exynos_sz	crop_max;
 	struct drm_exynos_sz	scale_min;
 	struct drm_exynos_sz	scale_max;
+	struct drm_exynos_sz	rot_max;
 };
 
 /**
-- 
1.9.1
