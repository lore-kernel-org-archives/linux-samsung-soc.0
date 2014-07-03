From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 11/12] drm/exynos/ipp: simplify ipp_create_id
Date: Thu, 03 Jul 2014 15:10:36 +0200
Message-ID: <1404393037-17299-12-git-send-email-a.hajda@samsung.com>
References: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There is no gain in passing id by pointer to be filled.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 0552f62..ae75a1d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -145,20 +145,15 @@ int exynos_drm_ippdrv_unregister(struct exynos_drm_ippdrv *ippdrv)
 	return 0;
 }
 
-static int ipp_create_id(struct idr *id_idr, struct mutex *lock, void *obj,
-		u32 *idp)
+static int ipp_create_id(struct idr *id_idr, struct mutex *lock, void *obj)
 {
 	int ret;
 
-	/* do the allocation under our mutexlock */
 	mutex_lock(lock);
 	ret = idr_alloc(id_idr, obj, 1, 0, GFP_KERNEL);
 	mutex_unlock(lock);
-	if (ret < 0)
-		return ret;
 
-	*idp = ret;
-	return 0;
+	return ret;
 }
 
 static void ipp_remove_id(struct idr *id_idr, struct mutex *lock, u32 id)
@@ -471,13 +466,12 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 	if (!c_node)
 		return -ENOMEM;
 
-	/* create property id */
-	ret = ipp_create_id(&ctx->prop_idr, &ctx->prop_lock, c_node,
-		&property->prop_id);
-	if (ret) {
+	ret = ipp_create_id(&ctx->prop_idr, &ctx->prop_lock, c_node);
+	if (ret < 0) {
 		DRM_ERROR("failed to create id.\n");
 		goto err_clear;
 	}
+	property->prop_id = ret;
 
 	DRM_DEBUG_KMS("created prop_id[%d]cmd[%d]ippdrv[0x%x]\n",
 		property->prop_id, property->cmd, (int)ippdrv);
@@ -1636,21 +1630,17 @@ static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 
 	/* get ipp driver entry */
 	list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
-		u32 ipp_id;
-
 		ippdrv->drm_dev = drm_dev;
 
-		ret = ipp_create_id(&ctx->ipp_idr, &ctx->ipp_lock, ippdrv,
-				    &ipp_id);
-		if (ret || ipp_id == 0) {
+		ret = ipp_create_id(&ctx->ipp_idr, &ctx->ipp_lock, ippdrv);
+		if (ret < 0) {
 			DRM_ERROR("failed to create id.\n");
 			goto err;
 		}
+		ippdrv->prop_list.ipp_id = ret;
 
 		DRM_DEBUG_KMS("count[%d]ippdrv[0x%x]ipp_id[%d]\n",
-			count++, (int)ippdrv, ipp_id);
-
-		ippdrv->prop_list.ipp_id = ipp_id;
+			count++, (int)ippdrv, ret);
 
 		/* store parent device for node */
 		ippdrv->parent_dev = dev;
-- 
1.9.1
