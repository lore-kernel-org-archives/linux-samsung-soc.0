From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 14/15] drm/exynos/fimc: simplify buffer queuing
Date: Fri, 22 Aug 2014 09:52:25 +0200
Message-ID: <1408693946-15456-15-git-send-email-a.hajda@samsung.com>
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

The patch removes redundant checks, redundant HW reads
and simplifies code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 64 ++++++++------------------------
 1 file changed, 15 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index bd6628d..b20078e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1124,67 +1124,34 @@ static int fimc_dst_set_size(struct device *dev, int swap,
 	return 0;
 }
 
-static int fimc_dst_get_buf_count(struct fimc_context *ctx)
-{
-	u32 cfg, buf_num;
-
-	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
-
-	buf_num = hweight32(cfg);
-
-	DRM_DEBUG_KMS("buf_num[%d]\n", buf_num);
-
-	return buf_num;
-}
-
-static int fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
+static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 		enum drm_exynos_ipp_buf_type buf_type)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	bool enable;
-	u32 cfg;
-	u32 mask = 0x00000001 << buf_id;
-	int ret = 0;
 	unsigned long flags;
+	u32 buf_num;
+	u32 cfg;
 
 	DRM_DEBUG_KMS("buf_id[%d]buf_type[%d]\n", buf_id, buf_type);
 
 	spin_lock_irqsave(&ctx->lock, flags);
 
-	/* mask register set */
 	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
 
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		enable = true;
-		break;
-	case IPP_BUF_DEQUEUE:
-		enable = false;
-		break;
-	default:
-		dev_err(ippdrv->dev, "invalid buf ctrl parameter.\n");
-		ret =  -EINVAL;
-		goto err_unlock;
-	}
+	if (buf_type == IPP_BUF_ENQUEUE)
+		cfg |= (1 << buf_id);
+	else
+		cfg &= (1 << buf_id);
 
-	/* sequence id */
-	cfg &= ~mask;
-	cfg |= (enable << buf_id);
 	fimc_write(ctx, cfg, EXYNOS_CIFCNTSEQ);
 
-	/* interrupt enable */
-	if (buf_type == IPP_BUF_ENQUEUE &&
-	    fimc_dst_get_buf_count(ctx) >= FIMC_BUF_START)
-		fimc_mask_irq(ctx, true);
+	buf_num = hweight32(cfg);
 
-	/* interrupt disable */
-	if (buf_type == IPP_BUF_DEQUEUE &&
-	    fimc_dst_get_buf_count(ctx) <= FIMC_BUF_STOP)
+	if (buf_type == IPP_BUF_ENQUEUE && buf_num >= FIMC_BUF_START)
+		fimc_mask_irq(ctx, true);
+	else if (buf_type == IPP_BUF_DEQUEUE && buf_num <= FIMC_BUF_STOP)
 		fimc_mask_irq(ctx, false);
 
-err_unlock:
 	spin_unlock_irqrestore(&ctx->lock, flags);
-	return ret;
 }
 
 static int fimc_dst_set_addr(struct device *dev,
@@ -1242,7 +1209,9 @@ static int fimc_dst_set_addr(struct device *dev,
 		break;
 	}
 
-	return fimc_dst_set_buf_seq(ctx, buf_id, buf_type);
+	fimc_dst_set_buf_seq(ctx, buf_id, buf_type);
+
+	return 0;
 }
 
 static struct exynos_drm_ipp_ops fimc_dst_ops = {
@@ -1297,10 +1266,7 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 
 	DRM_DEBUG_KMS("buf_id[%d]\n", buf_id);
 
-	if (fimc_dst_set_buf_seq(ctx, buf_id, IPP_BUF_DEQUEUE) < 0) {
-		DRM_ERROR("failed to dequeue.\n");
-		return IRQ_HANDLED;
-	}
+	fimc_dst_set_buf_seq(ctx, buf_id, IPP_BUF_DEQUEUE);
 
 	event_work->ippdrv = ippdrv;
 	event_work->buf_id[EXYNOS_DRM_OPS_DST] = buf_id;
-- 
1.9.1
