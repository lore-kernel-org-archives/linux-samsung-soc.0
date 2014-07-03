From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 03/12] drm/exynos/ipp: remove struct exynos_drm_ipp_private
Date: Thu, 03 Jul 2014 15:10:28 +0200
Message-ID: <1404393037-17299-4-git-send-email-a.hajda@samsung.com>
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

struct exynos_drm_ipp_private contains only one pointer so all occurrences
of the struct can be replaced by the pointer itself.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  6 +-----
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 30 +++++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |  4 ++--
 3 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 651f37a..5f027f2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -236,13 +236,9 @@ struct exynos_drm_g2d_private {
 	struct list_head	userptr_list;
 };
 
-struct exynos_drm_ipp_private {
-	struct device	*dev;
-};
-
 struct drm_exynos_file_private {
 	struct exynos_drm_g2d_private	*g2d_priv;
-	struct exynos_drm_ipp_private	*ipp_priv;
+	struct device			*ipp_dev;
 	struct file			*anon_filp;
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 5fb89c02..34d185c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -308,8 +308,7 @@ int exynos_drm_ipp_get_property(struct drm_device *drm_dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
-	struct exynos_drm_ipp_private *priv = file_priv->ipp_priv;
-	struct device *dev = priv->dev;
+	struct device *dev = file_priv->ipp_dev;
 	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_prop_list *prop_list = data;
 	struct exynos_drm_ippdrv *ippdrv;
@@ -441,8 +440,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
-	struct exynos_drm_ipp_private *priv = file_priv->ipp_priv;
-	struct device *dev = priv->dev;
+	struct device *dev = file_priv->ipp_dev;
 	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_property *property = data;
 	struct exynos_drm_ippdrv *ippdrv;
@@ -501,7 +499,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		property->prop_id, property->cmd, (int)ippdrv);
 
 	/* stored property information and ippdrv in private data */
-	c_node->priv = priv;
+	c_node->dev = dev;
 	c_node->property = *property;
 	c_node->state = IPP_STATE_IDLE;
 
@@ -929,8 +927,7 @@ int exynos_drm_ipp_queue_buf(struct drm_device *drm_dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
-	struct exynos_drm_ipp_private *priv = file_priv->ipp_priv;
-	struct device *dev = priv->dev;
+	struct device *dev = file_priv->ipp_dev;
 	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_queue_buf *qbuf = data;
 	struct drm_exynos_ipp_cmd_node *c_node;
@@ -1061,9 +1058,8 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
-	struct exynos_drm_ipp_private *priv = file_priv->ipp_priv;
 	struct exynos_drm_ippdrv *ippdrv = NULL;
-	struct device *dev = priv->dev;
+	struct device *dev = file_priv->ipp_dev;
 	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_cmd_ctrl *cmd_ctrl = data;
 	struct drm_exynos_ipp_cmd_work *cmd_work;
@@ -1775,16 +1771,10 @@ static int ipp_subdrv_open(struct drm_device *drm_dev, struct device *dev,
 		struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
-	struct exynos_drm_ipp_private *priv;
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-	priv->dev = dev;
-	file_priv->ipp_priv = priv;
 
+	file_priv->ipp_dev = dev;
 
-	DRM_DEBUG_KMS("done priv[0x%x]\n", (int)priv);
+	DRM_DEBUG_KMS("done priv[0x%x]\n", (int)dev);
 
 	return 0;
 }
@@ -1793,13 +1783,12 @@ static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 		struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
-	struct exynos_drm_ipp_private *priv = file_priv->ipp_priv;
 	struct exynos_drm_ippdrv *ippdrv = NULL;
 	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_cmd_node *c_node, *tc_node;
 	int count = 0;
 
-	DRM_DEBUG_KMS("for priv[0x%x]\n", (int)priv);
+	DRM_DEBUG_KMS("for priv[0x%x]\n", (int)file_priv->ipp_dev);
 
 	list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
 		mutex_lock(&ippdrv->cmd_lock);
@@ -1808,7 +1797,7 @@ static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 			DRM_DEBUG_KMS("count[%d]ippdrv[0x%x]\n",
 				count++, (int)ippdrv);
 
-			if (c_node->priv == priv) {
+			if (c_node->dev == file_priv->ipp_dev) {
 				/*
 				 * userland goto unnormal state. process killed.
 				 * and close the file.
@@ -1830,7 +1819,6 @@ static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 		mutex_unlock(&ippdrv->cmd_lock);
 	}
 
-	kfree(priv);
 	return;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 7aaeaae..6f48d62 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -48,7 +48,7 @@ struct drm_exynos_ipp_cmd_work {
 /*
  * A structure of command node.
  *
- * @priv: IPP private information.
+ * @dev: IPP device.
  * @list: list head to command queue information.
  * @event_list: list head of event.
  * @mem_list: list head to source,destination memory queue information.
@@ -64,7 +64,7 @@ struct drm_exynos_ipp_cmd_work {
  * @state: state of command node.
  */
 struct drm_exynos_ipp_cmd_node {
-	struct exynos_drm_ipp_private *priv;
+	struct device		*dev;
 	struct list_head	list;
 	struct list_head	event_list;
 	struct list_head	mem_list[EXYNOS_DRM_OPS_MAX];
-- 
1.9.1
