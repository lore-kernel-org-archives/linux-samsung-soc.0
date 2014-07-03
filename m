From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 09/12] drm/exynos/ipp: simplify ipp_find_obj
Date: Thu, 03 Jul 2014 15:10:34 +0200
Message-ID: <1404393037-17299-10-git-send-email-a.hajda@samsung.com>
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

The patch simplifies ipp_find_obj and removes debug messages.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 26c8a2c..c7ea047 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -172,18 +172,8 @@ static void *ipp_find_obj(struct idr *id_idr, struct mutex *lock, u32 id)
 {
 	void *obj;
 
-	DRM_DEBUG_KMS("id[%d]\n", id);
-
 	mutex_lock(lock);
-
-	/* find object using handle */
 	obj = idr_find(id_idr, id);
-	if (!obj) {
-		DRM_ERROR("failed to find object.\n");
-		mutex_unlock(lock);
-		return ERR_PTR(-ENODEV);
-	}
-
 	mutex_unlock(lock);
 
 	return obj;
@@ -215,9 +205,9 @@ static struct exynos_drm_ippdrv *ipp_find_driver(struct ipp_context *ctx,
 		/* find ipp driver using idr */
 		ippdrv = ipp_find_obj(&ctx->ipp_idr, &ctx->ipp_lock,
 			ipp_id);
-		if (IS_ERR(ippdrv)) {
+		if (!ippdrv) {
 			DRM_ERROR("not found ipp%d driver.\n", ipp_id);
-			return ippdrv;
+			return ERR_PTR(-ENODEV);
 		}
 
 		/*
@@ -339,10 +329,10 @@ int exynos_drm_ipp_get_property(struct drm_device *drm_dev, void *data,
 		 */
 		ippdrv = ipp_find_obj(&ctx->ipp_idr, &ctx->ipp_lock,
 						prop_list->ipp_id);
-		if (IS_ERR(ippdrv)) {
+		if (!ippdrv) {
 			DRM_ERROR("not found ipp%d driver.\n",
 					prop_list->ipp_id);
-			return PTR_ERR(ippdrv);
+			return -ENODEV;
 		}
 
 		*prop_list = ippdrv->prop_list;
@@ -920,9 +910,9 @@ int exynos_drm_ipp_queue_buf(struct drm_device *drm_dev, void *data,
 	/* find command node */
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		qbuf->prop_id);
-	if (IS_ERR(c_node)) {
+	if (!c_node) {
 		DRM_ERROR("failed to get command node.\n");
-		return PTR_ERR(c_node);
+		return -ENODEV;
 	}
 
 	/* buffer control */
@@ -1055,9 +1045,9 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		cmd_ctrl->prop_id);
-	if (IS_ERR(c_node)) {
+	if (!c_node) {
 		DRM_ERROR("invalid command node list.\n");
-		return PTR_ERR(c_node);
+		return -ENODEV;
 	}
 
 	if (!exynos_drm_ipp_check_valid(ippdrv->dev, cmd_ctrl->ctrl,
-- 
1.9.1
