From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/9] drm/exynos: ipp: add ipp_remove_id()
Date: Mon, 26 May 2014 10:17:19 +0200
Message-ID: <1401092243-25568-6-git-send-email-a.hajda@samsung.com>
References: <1401092243-25568-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1401092243-25568-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: YoungJun Cho <yj44.cho@samsung.com>

This patch adds ipp_remove_id() for idr resource free.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Seong-Woo Kim <sw0312.kim@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Tested-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 42 ++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index b60ae54..f1c51b4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -167,6 +167,13 @@ static int ipp_create_id(struct idr *id_idr, struct mutex *lock, void *obj,
 	return 0;
 }
 
+static void ipp_remove_id(struct idr *id_idr, struct mutex *lock, u32 id)
+{
+	mutex_lock(lock);
+	idr_remove(id_idr, id);
+	mutex_unlock(lock);
+}
+
 static void *ipp_find_obj(struct idr *id_idr, struct mutex *lock, u32 id)
 {
 	void *obj;
@@ -501,7 +508,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 	c_node->start_work = ipp_create_cmd_work();
 	if (IS_ERR(c_node->start_work)) {
 		DRM_ERROR("failed to create start work.\n");
-		goto err_clear;
+		goto err_remove_id;
 	}
 
 	c_node->stop_work = ipp_create_cmd_work();
@@ -542,16 +549,22 @@ err_free_stop:
 	kfree(c_node->stop_work);
 err_free_start:
 	kfree(c_node->start_work);
+err_remove_id:
+	ipp_remove_id(&ctx->prop_idr, &ctx->prop_lock, property->prop_id);
 err_clear:
 	kfree(c_node);
 	return ret;
 }
 
-static void ipp_clean_cmd_node(struct drm_exynos_ipp_cmd_node *c_node)
+static void ipp_clean_cmd_node(struct ipp_context *ctx,
+				struct drm_exynos_ipp_cmd_node *c_node)
 {
 	/* delete list */
 	list_del(&c_node->list);
 
+	ipp_remove_id(&ctx->prop_idr, &ctx->prop_lock,
+			c_node->property.prop_id);
+
 	/* destroy mutex */
 	mutex_destroy(&c_node->lock);
 	mutex_destroy(&c_node->mem_lock);
@@ -1122,7 +1135,7 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 		c_node->state = IPP_STATE_STOP;
 		ippdrv->dedicated = false;
 		mutex_lock(&ippdrv->cmd_lock);
-		ipp_clean_cmd_node(c_node);
+		ipp_clean_cmd_node(ctx, c_node);
 
 		if (list_empty(&ippdrv->cmd_list))
 			pm_runtime_put_sync(ippdrv->dev);
@@ -1686,7 +1699,7 @@ static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 				    &ipp_id);
 		if (ret || ipp_id == 0) {
 			DRM_ERROR("failed to create id.\n");
-			goto err_idr;
+			goto err;
 		}
 
 		DRM_DEBUG_KMS("count[%d]ippdrv[0x%x]ipp_id[%d]\n",
@@ -1707,34 +1720,40 @@ static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 			ret = drm_iommu_attach_device(drm_dev, ippdrv->dev);
 			if (ret) {
 				DRM_ERROR("failed to activate iommu\n");
-				goto err_iommu;
+				goto err;
 			}
 		}
 	}
 
 	return 0;
 
-err_iommu:
+err:
 	/* get ipp driver entry */
-	list_for_each_entry_reverse(ippdrv, &exynos_drm_ippdrv_list, drv_list)
+	list_for_each_entry_continue_reverse(ippdrv, &exynos_drm_ippdrv_list,
+						drv_list) {
 		if (is_drm_iommu_supported(drm_dev))
 			drm_iommu_detach_device(drm_dev, ippdrv->dev);
 
-err_idr:
-	idr_destroy(&ctx->ipp_idr);
-	idr_destroy(&ctx->prop_idr);
+		ipp_remove_id(&ctx->ipp_idr, &ctx->ipp_lock,
+				ippdrv->prop_list.ipp_id);
+	}
+
 	return ret;
 }
 
 static void ipp_subdrv_remove(struct drm_device *drm_dev, struct device *dev)
 {
 	struct exynos_drm_ippdrv *ippdrv;
+	struct ipp_context *ctx = get_ipp_context(dev);
 
 	/* get ipp driver entry */
 	list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
 		if (is_drm_iommu_supported(drm_dev))
 			drm_iommu_detach_device(drm_dev, ippdrv->dev);
 
+		ipp_remove_id(&ctx->ipp_idr, &ctx->ipp_lock,
+				ippdrv->prop_list.ipp_id);
+
 		ippdrv->drm_dev = NULL;
 		exynos_drm_ippdrv_unregister(ippdrv);
 	}
@@ -1765,6 +1784,7 @@ static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
 	struct exynos_drm_ipp_private *priv = file_priv->ipp_priv;
 	struct exynos_drm_ippdrv *ippdrv = NULL;
+	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_cmd_node *c_node, *tc_node;
 	int count = 0;
 
@@ -1791,7 +1811,7 @@ static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 				}
 
 				ippdrv->dedicated = false;
-				ipp_clean_cmd_node(c_node);
+				ipp_clean_cmd_node(ctx, c_node);
 				if (list_empty(&ippdrv->cmd_list))
 					pm_runtime_put_sync(ippdrv->dev);
 			}
-- 
1.9.1
