From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 09/15] drm/exynos/ipp: replace work_struct casting with better
 constructs
Date: Fri, 22 Aug 2014 09:52:20 +0200
Message-ID: <1408693946-15456-10-git-send-email-a.hajda@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
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

Type casting should be avoided if possible. In case of
work_struct it can be simply replaced by reference to member field.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 3 +--
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 6 +++---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 3 +--
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 35db665..3264ed3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1307,7 +1307,7 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 
 	event_work->ippdrv = ippdrv;
 	event_work->buf_id[EXYNOS_DRM_OPS_DST] = buf_id;
-	queue_work(ippdrv->event_workq, (struct work_struct *)event_work);
+	queue_work(ippdrv->event_workq, &event_work->work);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 9e3ff16..c6a013f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1326,8 +1326,7 @@ static irqreturn_t gsc_irq_handler(int irq, void *dev_id)
 			buf_id[EXYNOS_DRM_OPS_SRC];
 		event_work->buf_id[EXYNOS_DRM_OPS_DST] =
 			buf_id[EXYNOS_DRM_OPS_DST];
-		queue_work(ippdrv->event_workq,
-			(struct work_struct *)event_work);
+		queue_work(ippdrv->event_workq, &event_work->work);
 	}
 
 	return IRQ_HANDLED;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 6ab6190..c72d8d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -791,7 +791,7 @@ static void ipp_handle_cmd_work(struct device *dev,
 
 	cmd_work->ippdrv = ippdrv;
 	cmd_work->c_node = c_node;
-	queue_work(ctx->cmd_workq, (struct work_struct *)cmd_work);
+	queue_work(ctx->cmd_workq, &cmd_work->work);
 }
 
 static int ipp_queue_buf_with_run(struct device *dev,
@@ -1319,7 +1319,7 @@ err_clear:
 void ipp_sched_cmd(struct work_struct *work)
 {
 	struct drm_exynos_ipp_cmd_work *cmd_work =
-		(struct drm_exynos_ipp_cmd_work *)work;
+		container_of(work, struct drm_exynos_ipp_cmd_work, work);
 	struct exynos_drm_ippdrv *ippdrv;
 	struct drm_exynos_ipp_cmd_node *c_node;
 	struct drm_exynos_ipp_property *property;
@@ -1532,7 +1532,7 @@ err_event_unlock:
 void ipp_sched_event(struct work_struct *work)
 {
 	struct drm_exynos_ipp_event_work *event_work =
-		(struct drm_exynos_ipp_event_work *)work;
+		container_of(work, struct drm_exynos_ipp_event_work, work);
 	struct exynos_drm_ippdrv *ippdrv;
 	struct drm_exynos_ipp_cmd_node *c_node;
 	int ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 55af6b4..b6a37d4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -156,8 +156,7 @@ static irqreturn_t rotator_irq_handler(int irq, void *arg)
 		event_work->ippdrv = ippdrv;
 		event_work->buf_id[EXYNOS_DRM_OPS_DST] =
 			rot->cur_buf_id[EXYNOS_DRM_OPS_DST];
-		queue_work(ippdrv->event_workq,
-			(struct work_struct *)event_work);
+		queue_work(ippdrv->event_workq, &event_work->work);
 	} else {
 		DRM_ERROR("the SFR is set illegally\n");
 	}
-- 
1.9.1
