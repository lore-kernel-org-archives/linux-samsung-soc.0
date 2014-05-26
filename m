From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/9] drm/exynos: ipp: rename cmd_lock to lock
Date: Mon, 26 May 2014 10:17:17 +0200
Message-ID: <1401092243-25568-4-git-send-email-a.hajda@samsung.com>
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

The ippdrv->cmd_list requires cmd_lock.
So renames cmd_lock to lock for context.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Seong-Woo Kim <sw0312.kim@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Tested-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 12 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 0968777..0d85433 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -507,7 +507,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		goto err_free_stop;
 	}
 
-	mutex_init(&c_node->cmd_lock);
+	mutex_init(&c_node->lock);
 	mutex_init(&c_node->mem_lock);
 	mutex_init(&c_node->event_lock);
 
@@ -542,7 +542,7 @@ static void ipp_clean_cmd_node(struct drm_exynos_ipp_cmd_node *c_node)
 	list_del(&c_node->list);
 
 	/* destroy mutex */
-	mutex_destroy(&c_node->cmd_lock);
+	mutex_destroy(&c_node->lock);
 	mutex_destroy(&c_node->mem_lock);
 	mutex_destroy(&c_node->event_lock);
 
@@ -979,7 +979,7 @@ int exynos_drm_ipp_queue_buf(struct drm_device *drm_dev, void *data,
 		}
 		break;
 	case IPP_BUF_DEQUEUE:
-		mutex_lock(&c_node->cmd_lock);
+		mutex_lock(&c_node->lock);
 
 		/* put event for destination buffer */
 		if (qbuf->ops_id == EXYNOS_DRM_OPS_DST)
@@ -987,7 +987,7 @@ int exynos_drm_ipp_queue_buf(struct drm_device *drm_dev, void *data,
 
 		ipp_clean_queue_buf(drm_dev, c_node, qbuf);
 
-		mutex_unlock(&c_node->cmd_lock);
+		mutex_unlock(&c_node->lock);
 		break;
 	default:
 		DRM_ERROR("invalid buffer control.\n");
@@ -1412,7 +1412,7 @@ void ipp_sched_cmd(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&c_node->cmd_lock);
+	mutex_lock(&c_node->lock);
 
 	property = &c_node->property;
 
@@ -1460,7 +1460,7 @@ void ipp_sched_cmd(struct work_struct *work)
 	DRM_DEBUG_KMS("ctrl[%d] done.\n", cmd_work->ctrl);
 
 err_unlock:
-	mutex_unlock(&c_node->cmd_lock);
+	mutex_unlock(&c_node->lock);
 }
 
 static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index eea4db3..fbb80ac 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -52,7 +52,7 @@ struct drm_exynos_ipp_cmd_work {
  * @list: list head to command queue information.
  * @event_list: list head of event.
  * @mem_list: list head to source,destination memory queue information.
- * @cmd_lock: lock for synchronization of access to ioctl.
+ * @lock: lock for synchronization of access to ioctl.
  * @mem_lock: lock for synchronization of access to memory nodes.
  * @event_lock: lock for synchronization of access to scheduled event.
  * @start_complete: completion of start of command.
@@ -68,7 +68,7 @@ struct drm_exynos_ipp_cmd_node {
 	struct list_head	list;
 	struct list_head	event_list;
 	struct list_head	mem_list[EXYNOS_DRM_OPS_MAX];
-	struct mutex	cmd_lock;
+	struct mutex	lock;
 	struct mutex	mem_lock;
 	struct mutex	event_lock;
 	struct completion	start_complete;
-- 
1.9.1
