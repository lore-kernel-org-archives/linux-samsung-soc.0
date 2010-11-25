From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/6] [media] s5p-fimc: Convert m2m driver to unlocked_ioctl
Date: Thu, 25 Nov 2010 16:05:10 +0100
Message-ID: <1290697512-30563-5-git-send-email-s.nawrocki@samsung.com>
References: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.c |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index f45970d..fa82a2a 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -983,6 +983,7 @@ int fimc_vidioc_queryctrl(struct file *file, void *priv,
 {
 	struct fimc_ctx *ctx = priv;
 	struct v4l2_queryctrl *c;
+	int ret = -EINVAL;
 
 	c = get_ctrl(qc->id);
 	if (c) {
@@ -990,10 +991,14 @@ int fimc_vidioc_queryctrl(struct file *file, void *priv,
 		return 0;
 	}
 
-	if (ctx->state & FIMC_CTX_CAP)
-		return v4l2_subdev_call(ctx->fimc_dev->vid_cap.sd,
+	if (ctx->state & FIMC_CTX_CAP) {
+		if (mutex_lock_interruptible(&ctx->fimc_dev->lock))
+			return -ERESTARTSYS;
+		ret = v4l2_subdev_call(ctx->fimc_dev->vid_cap.sd,
 					core, queryctrl, qc);
-	return -EINVAL;
+		mutex_unlock(&ctx->fimc_dev->lock);
+	}
+	return ret;
 }
 
 int fimc_vidioc_g_ctrl(struct file *file, void *priv,
@@ -1233,6 +1238,9 @@ static int fimc_m2m_s_crop(struct file *file, void *fh, struct v4l2_crop *cr)
 	f = (cr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ?
 		&ctx->s_frame : &ctx->d_frame;
 
+	if (mutex_lock_interruptible(&fimc->lock))
+		return -ERESTARTSYS;
+
 	spin_lock_irqsave(&ctx->slock, flags);
 	if (~ctx->state & (FIMC_SRC_FMT | FIMC_DST_FMT)) {
 		/* Check to see if scaling ratio is within supported range */
@@ -1241,9 +1249,9 @@ static int fimc_m2m_s_crop(struct file *file, void *fh, struct v4l2_crop *cr)
 		else
 			ret = fimc_check_scaler_ratio(&cr->c, &ctx->s_frame);
 		if (ret) {
-			spin_unlock_irqrestore(&ctx->slock, flags);
 			v4l2_err(&fimc->m2m.v4l2_dev, "Out of scaler range");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto scr_unlock;
 		}
 	}
 	ctx->state |= FIMC_PARAMS;
@@ -1253,7 +1261,9 @@ static int fimc_m2m_s_crop(struct file *file, void *fh, struct v4l2_crop *cr)
 	f->width  = cr->c.width;
 	f->height = cr->c.height;
 
+scr_unlock:
 	spin_unlock_irqrestore(&ctx->slock, flags);
+	mutex_unlock(&fimc->lock);
 	return 0;
 }
 
@@ -1396,7 +1406,7 @@ static const struct v4l2_file_operations fimc_m2m_fops = {
 	.open		= fimc_m2m_open,
 	.release	= fimc_m2m_release,
 	.poll		= fimc_m2m_poll,
-	.ioctl		= video_ioctl2,
+	.unlocked_ioctl	= video_ioctl2,
 	.mmap		= fimc_m2m_mmap,
 };
 
-- 
1.7.1
