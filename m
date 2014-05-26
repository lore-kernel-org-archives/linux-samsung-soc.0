From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/9] drm/exynos: ipp: rearrange c_node->event_lock using
 routine
Date: Mon, 26 May 2014 10:17:21 +0200
Message-ID: <1401092243-25568-8-git-send-email-a.hajda@samsung.com>
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

The c_node->event_list should be protected with
c_node->event_lock.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Seong-Woo Kim <sw0312.kim@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Tested-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 4b5afd3..603a796 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -796,7 +796,9 @@ static int ipp_get_event(struct drm_device *drm_dev,
 	e->base.event = &e->event.base;
 	e->base.file_priv = file;
 	e->base.destroy = ipp_free_event;
+	mutex_lock(&c_node->event_lock);
 	list_add_tail(&e->base.link, &c_node->event_list);
+	mutex_unlock(&c_node->event_lock);
 
 	return 0;
 }
@@ -807,6 +809,7 @@ static void ipp_put_event(struct drm_exynos_ipp_cmd_node *c_node,
 	struct drm_exynos_ipp_send_event *e, *te;
 	int count = 0;
 
+	mutex_lock(&c_node->event_lock);
 	list_for_each_entry_safe(e, te, &c_node->event_list, base.link) {
 		DRM_DEBUG_KMS("count[%d]e[0x%x]\n", count++, (int)e);
 
@@ -827,9 +830,13 @@ static void ipp_put_event(struct drm_exynos_ipp_cmd_node *c_node,
 			/* delete list */
 			list_del(&e->base.link);
 			kfree(e);
-			return;
+			goto out_unlock;
 		}
 	}
+
+out_unlock:
+	mutex_unlock(&c_node->event_lock);
+	return;
 }
 
 static void ipp_handle_cmd_work(struct device *dev,
@@ -1515,9 +1522,11 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 		return -EINVAL;
 	}
 
+	mutex_lock(&c_node->event_lock);
 	if (list_empty(&c_node->event_list)) {
 		DRM_DEBUG_KMS("event list is empty.\n");
-		return 0;
+		ret = 0;
+		goto err_event_unlock;
 	}
 
 	mutex_lock(&c_node->mem_lock);
@@ -1609,11 +1618,6 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 	e = list_first_entry(&c_node->event_list,
 		struct drm_exynos_ipp_send_event, base.link);
 
-	if (!e) {
-		DRM_ERROR("empty event.\n");
-		return -EINVAL;
-	}
-
 	do_gettimeofday(&now);
 	DRM_DEBUG_KMS("tv_sec[%ld]tv_usec[%ld]\n", now.tv_sec, now.tv_usec);
 	e->event.tv_sec = now.tv_sec;
@@ -1628,6 +1632,7 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 	list_move_tail(&e->base.link, &e->base.file_priv->event_list);
 	wake_up_interruptible(&e->base.file_priv->event_wait);
 	spin_unlock_irqrestore(&drm_dev->event_lock, flags);
+	mutex_unlock(&c_node->event_lock);
 
 	DRM_DEBUG_KMS("done cmd[%d]prop_id[%d]buf_id[%d]\n",
 		property->cmd, property->prop_id, tbuf_id[EXYNOS_DRM_OPS_DST]);
@@ -1636,6 +1641,8 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 
 err_mem_unlock:
 	mutex_unlock(&c_node->mem_lock);
+err_event_unlock:
+	mutex_unlock(&c_node->event_lock);
 	return ret;
 }
 
@@ -1678,8 +1685,6 @@ void ipp_sched_event(struct work_struct *work)
 		goto err_completion;
 	}
 
-	mutex_lock(&c_node->event_lock);
-
 	ret = ipp_send_event(ippdrv, c_node, event_work->buf_id);
 	if (ret) {
 		DRM_ERROR("failed to send event.\n");
@@ -1689,8 +1694,6 @@ void ipp_sched_event(struct work_struct *work)
 err_completion:
 	if (ipp_is_m2m_cmd(c_node->property.cmd))
 		complete(&c_node->start_complete);
-
-	mutex_unlock(&c_node->event_lock);
 }
 
 static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
-- 
1.9.1
