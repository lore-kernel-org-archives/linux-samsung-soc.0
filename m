From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH] [media] exynos-gsc: Handle ctx job finish when aborted
Date: Fri, 20 Sep 2013 11:56:17 +0530
Message-ID: <1379658378-31163-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, posciak@google.com, shaik.ameer@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

When the current context is running,
1] If release() or streamoff() is called on the current context,
   it waits until the job is aborted or finished.
2] If the job is finished, driver will call the v4l2_m2m_job_finish().
3] If the job is aborted inside device_run callback, then driver
   has to inform the v4l2 mem2mem framework about the same by calling
   v4l2_m2m_job_finish() with VB2_BUF_STATE_ERROR.

The current code doesn't call v4l2_m2m_job_finish() in the case, where
the job is aborted from the device_run callback. This scenerio is
producing a hang as the other queued contexts are not getting scheduled.

By adding the ABORT state, driver can understand the current job
is aborted and not finished. By checking this flag, driver can call
v4l2_m2m_job_finish() with VB2_BUF_STATE_ERROR.

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
Signed-off-by: avnd kiran <avnd.kiran@samsung.com>
---
 drivers/media/platform/exynos-gsc/gsc-core.h |    1 +
 drivers/media/platform/exynos-gsc/gsc-m2m.c  |   29 ++++++++++++++------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.h b/drivers/media/platform/exynos-gsc/gsc-core.h
index 76435d3..ef0a656 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/exynos-gsc/gsc-core.h
@@ -45,6 +45,7 @@
 #define GSC_DST_FMT			(1 << 2)
 #define GSC_CTX_M2M			(1 << 3)
 #define GSC_CTX_STOP_REQ		(1 << 6)
+#define	GSC_CTX_ABORT			(1 << 7)
 
 enum gsc_dev_flags {
 	/* for global */
diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index e576ff2..810c3e1 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -46,6 +46,17 @@ static int gsc_m2m_ctx_stop_req(struct gsc_ctx *ctx)
 	return ret == 0 ? -ETIMEDOUT : ret;
 }
 
+static void __gsc_m2m_job_abort(struct gsc_ctx *ctx)
+{
+	int ret;
+
+	ret = gsc_m2m_ctx_stop_req(ctx);
+	if ((ret == -ETIMEDOUT) || (ctx->state & GSC_CTX_ABORT)) {
+		gsc_ctx_state_lock_clear(GSC_CTX_STOP_REQ | GSC_CTX_ABORT, ctx);
+		gsc_m2m_job_finish(ctx, VB2_BUF_STATE_ERROR);
+	}
+}
+
 static int gsc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct gsc_ctx *ctx = q->drv_priv;
@@ -58,11 +69,8 @@ static int gsc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 static int gsc_m2m_stop_streaming(struct vb2_queue *q)
 {
 	struct gsc_ctx *ctx = q->drv_priv;
-	int ret;
 
-	ret = gsc_m2m_ctx_stop_req(ctx);
-	if (ret == -ETIMEDOUT)
-		gsc_m2m_job_finish(ctx, VB2_BUF_STATE_ERROR);
+	__gsc_m2m_job_abort(ctx);
 
 	pm_runtime_put(&ctx->gsc_dev->pdev->dev);
 
@@ -91,15 +99,9 @@ void gsc_m2m_job_finish(struct gsc_ctx *ctx, int vb_state)
 	}
 }
 
-
 static void gsc_m2m_job_abort(void *priv)
 {
-	struct gsc_ctx *ctx = priv;
-	int ret;
-
-	ret = gsc_m2m_ctx_stop_req(ctx);
-	if (ret == -ETIMEDOUT)
-		gsc_m2m_job_finish(ctx, VB2_BUF_STATE_ERROR);
+	__gsc_m2m_job_abort((struct gsc_ctx *)priv);
 }
 
 static int gsc_get_bufs(struct gsc_ctx *ctx)
@@ -150,9 +152,10 @@ static void gsc_m2m_device_run(void *priv)
 		gsc->m2m.ctx = ctx;
 	}
 
-	is_set = (ctx->state & GSC_CTX_STOP_REQ) ? 1 : 0;
-	ctx->state &= ~GSC_CTX_STOP_REQ;
+	is_set = ctx->state & GSC_CTX_STOP_REQ;
 	if (is_set) {
+		ctx->state &= ~GSC_CTX_STOP_REQ;
+		ctx->state |= GSC_CTX_ABORT;
 		wake_up(&gsc->irq_queue);
 		goto put_device;
 	}
-- 
1.7.9.5
