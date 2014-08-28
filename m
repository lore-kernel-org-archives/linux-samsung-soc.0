From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 06/17] drm/exynos/ipp: free partially allocated resources on
 error
Date: Thu, 28 Aug 2014 11:07:30 +0200
Message-ID: <1409216861-12452-7-git-send-email-a.hajda@samsung.com>
References: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
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

In case of allocation errors some already allocated buffers
were not freed. The patch fixes it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 67 ++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 060a198..ab7b74c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -599,6 +599,35 @@ static int ipp_set_mem_node(struct exynos_drm_ippdrv *ippdrv,
 	return ret;
 }
 
+static int ipp_put_mem_node(struct drm_device *drm_dev,
+		struct drm_exynos_ipp_cmd_node *c_node,
+		struct drm_exynos_ipp_mem_node *m_node)
+{
+	int i;
+
+	DRM_DEBUG_KMS("node[0x%x]\n", (int)m_node);
+
+	if (!m_node) {
+		DRM_ERROR("invalid dequeue node.\n");
+		return -EFAULT;
+	}
+
+	DRM_DEBUG_KMS("ops_id[%d]\n", m_node->ops_id);
+
+	/* put gem buffer */
+	for_each_ipp_planar(i) {
+		unsigned long handle = m_node->buf_info.handles[i];
+		if (handle)
+			exynos_drm_gem_put_dma_addr(drm_dev, handle,
+							c_node->filp);
+	}
+
+	list_del(&m_node->list);
+	kfree(m_node);
+
+	return 0;
+}
+
 static struct drm_exynos_ipp_mem_node
 		*ipp_get_mem_node(struct drm_device *drm_dev,
 		struct drm_file *file,
@@ -619,6 +648,7 @@ static struct drm_exynos_ipp_mem_node
 	m_node->ops_id = qbuf->ops_id;
 	m_node->prop_id = qbuf->prop_id;
 	m_node->buf_id = qbuf->buf_id;
+	INIT_LIST_HEAD(&m_node->list);
 
 	DRM_DEBUG_KMS("m_node[0x%x]ops_id[%d]\n", (int)m_node, qbuf->ops_id);
 	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]\n", qbuf->prop_id, m_node->buf_id);
@@ -634,7 +664,8 @@ static struct drm_exynos_ipp_mem_node
 					qbuf->handle[i], file);
 			if (IS_ERR(addr)) {
 				DRM_ERROR("failed to get addr.\n");
-				goto err_clear;
+				ipp_put_mem_node(drm_dev, c_node, m_node);
+				return ERR_PTR(-EFAULT);
 			}
 
 			buf_info->handles[i] = qbuf->handle[i];
@@ -649,40 +680,6 @@ static struct drm_exynos_ipp_mem_node
 	mutex_unlock(&c_node->mem_lock);
 
 	return m_node;
-
-err_clear:
-	kfree(m_node);
-	return ERR_PTR(-EFAULT);
-}
-
-static int ipp_put_mem_node(struct drm_device *drm_dev,
-		struct drm_exynos_ipp_cmd_node *c_node,
-		struct drm_exynos_ipp_mem_node *m_node)
-{
-	int i;
-
-	DRM_DEBUG_KMS("node[0x%x]\n", (int)m_node);
-
-	if (!m_node) {
-		DRM_ERROR("invalid dequeue node.\n");
-		return -EFAULT;
-	}
-
-	DRM_DEBUG_KMS("ops_id[%d]\n", m_node->ops_id);
-
-	/* put gem buffer */
-	for_each_ipp_planar(i) {
-		unsigned long handle = m_node->buf_info.handles[i];
-		if (handle)
-			exynos_drm_gem_put_dma_addr(drm_dev, handle,
-							c_node->filp);
-	}
-
-	/* delete list in queue */
-	list_del(&m_node->list);
-	kfree(m_node);
-
-	return 0;
 }
 
 static void ipp_free_event(struct drm_pending_event *event)
-- 
1.9.1
