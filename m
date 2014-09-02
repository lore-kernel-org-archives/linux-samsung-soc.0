From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 17/17] drm/exynos/ipp: add file checks for ioctls
Date: Tue, 02 Sep 2014 14:56:21 +0200
Message-ID: <1409662581-30357-1-git-send-email-a.hajda@samsung.com>
References: <1409216861-12452-18-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1409216861-12452-18-git-send-email-a.hajda@samsung.com>
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

Process should not have access to ipp nodes created by another
process. The patch adds necessary checks.
It also simplifies lookup for command node.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v3:
- added file check from previous commit
- simplified c_node lookup
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 69 +++++++++++----------------------
 1 file changed, 22 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 9e9714a..4f36a9d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -318,44 +318,6 @@ static void ipp_print_property(struct drm_exynos_ipp_property *property,
 		sz->hsize, sz->vsize, config->flip, config->degree);
 }
 
-static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property)
-{
-	struct exynos_drm_ippdrv *ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node;
-	u32 prop_id = property->prop_id;
-
-	DRM_DEBUG_KMS("prop_id[%d]\n", prop_id);
-
-	ippdrv = ipp_find_drv_by_handle(prop_id);
-	if (IS_ERR(ippdrv)) {
-		DRM_ERROR("failed to get ipp driver.\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Find command node using command list in ippdrv.
-	 * when we find this command no using prop_id.
-	 * return property information set in this command node.
-	 */
-	mutex_lock(&ippdrv->cmd_lock);
-	list_for_each_entry(c_node, &ippdrv->cmd_list, list) {
-		if ((c_node->property.prop_id == prop_id) &&
-		    (c_node->state == IPP_STATE_STOP)) {
-			mutex_unlock(&ippdrv->cmd_lock);
-			DRM_DEBUG_KMS("found cmd[%d]ippdrv[0x%x]\n",
-				property->cmd, (int)ippdrv);
-
-			c_node->property = *property;
-			return 0;
-		}
-	}
-	mutex_unlock(&ippdrv->cmd_lock);
-
-	DRM_ERROR("failed to search property.\n");
-
-	return -EINVAL;
-}
-
 static struct drm_exynos_ipp_cmd_work *ipp_create_cmd_work(void)
 {
 	struct drm_exynos_ipp_cmd_work *cmd_work;
@@ -391,6 +353,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 	struct drm_exynos_ipp_property *property = data;
 	struct exynos_drm_ippdrv *ippdrv;
 	struct drm_exynos_ipp_cmd_node *c_node;
+	u32 prop_id;
 	int ret, i;
 
 	if (!ctx) {
@@ -403,6 +366,8 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	prop_id = property->prop_id;
+
 	/*
 	 * This is log print for user application property.
 	 * user application set various property.
@@ -411,14 +376,24 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		ipp_print_property(property, i);
 
 	/*
-	 * set property ioctl generated new prop_id.
-	 * but in this case already asigned prop_id using old set property.
-	 * e.g PAUSE state. this case supports find current prop_id and use it
-	 * instead of allocation.
+	 * In case prop_id is not zero try to set existing property.
 	 */
-	if (property->prop_id) {
-		DRM_DEBUG_KMS("prop_id[%d]\n", property->prop_id);
-		return ipp_find_and_set_property(property);
+	if (prop_id) {
+		c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock, prop_id);
+
+		if (!c_node || c_node->filp != file) {
+			DRM_DEBUG_KMS("prop_id[%d] not found\n", prop_id);
+			return -EINVAL;
+		}
+
+		if (c_node->state != IPP_STATE_STOP) {
+			DRM_DEBUG_KMS("prop_id[%d] not stopped\n", prop_id);
+			return -EINVAL;
+		}
+
+		c_node->property = *property;
+
+		return 0;
 	}
 
 	/* find ipp driver using ipp id */
@@ -897,7 +872,7 @@ int exynos_drm_ipp_queue_buf(struct drm_device *drm_dev, void *data,
 	/* find command node */
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		qbuf->prop_id);
-	if (!c_node) {
+	if (!c_node || c_node->filp != file) {
 		DRM_ERROR("failed to get command node.\n");
 		return -ENODEV;
 	}
@@ -1032,7 +1007,7 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		cmd_ctrl->prop_id);
-	if (!c_node) {
+	if (!c_node || c_node->filp != file) {
 		DRM_ERROR("invalid command node list.\n");
 		return -ENODEV;
 	}
-- 
1.9.1
