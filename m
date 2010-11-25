From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/6] [media] s5p-fimc: Fix vidioc_g_crop/cropcap on camera
 sensor
Date: Thu, 25 Nov 2010 16:05:08 +0100
Message-ID: <1290697512-30563-3-git-send-email-s.nawrocki@samsung.com>
References: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42456 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752815Ab0KYPFa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 10:05:30 -0500
In-reply-to: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

Create separate vidioc_g_crop/vidioc_s_crop handlers for capture
video node and so image cropping parameters are properly queried
at FIMC input (image sensor) and not at FIMC output.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-capture.c |   48 +++++++++++++++++++++++++-
 drivers/media/video/s5p-fimc/fimc-core.c    |   26 +++++++-------
 drivers/media/video/s5p-fimc/fimc-core.h    |    4 --
 3 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
index 4c70fba..c020bf6 100644
--- a/drivers/media/video/s5p-fimc/fimc-capture.c
+++ b/drivers/media/video/s5p-fimc/fimc-capture.c
@@ -652,6 +652,50 @@ static int fimc_cap_s_ctrl(struct file *file, void *priv,
 	return ret;
 }
 
+static int fimc_cap_cropcap(struct file *file, void *fh,
+			    struct v4l2_cropcap *cr)
+{
+	struct fimc_frame *f;
+	struct fimc_ctx *ctx = fh;
+	struct fimc_dev *fimc = ctx->fimc_dev;
+
+	if (cr->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (mutex_lock_interruptible(&fimc->lock))
+		return -ERESTARTSYS;
+
+	f = &ctx->s_frame;
+	cr->bounds.left		= 0;
+	cr->bounds.top		= 0;
+	cr->bounds.width	= f->o_width;
+	cr->bounds.height	= f->o_height;
+	cr->defrect		= cr->bounds;
+
+	mutex_unlock(&fimc->lock);
+	return 0;
+}
+
+static int fimc_cap_g_crop(struct file *file, void *fh, struct v4l2_crop *cr)
+{
+	struct fimc_frame *f;
+	struct fimc_ctx *ctx = file->private_data;
+	struct fimc_dev *fimc = ctx->fimc_dev;
+
+
+	if (mutex_lock_interruptible(&fimc->lock))
+		return -ERESTARTSYS;
+
+	f = &ctx->s_frame;
+	cr->c.left	= f->offs_h;
+	cr->c.top	= f->offs_v;
+	cr->c.width	= f->width;
+	cr->c.height	= f->height;
+
+	mutex_unlock(&fimc->lock);
+	return 0;
+}
+
 static int fimc_cap_s_crop(struct file *file, void *fh,
 			       struct v4l2_crop *cr)
 {
@@ -716,9 +760,9 @@ static const struct v4l2_ioctl_ops fimc_capture_ioctl_ops = {
 	.vidioc_g_ctrl			= fimc_vidioc_g_ctrl,
 	.vidioc_s_ctrl			= fimc_cap_s_ctrl,
 
-	.vidioc_g_crop			= fimc_vidioc_g_crop,
+	.vidioc_g_crop			= fimc_cap_g_crop,
 	.vidioc_s_crop			= fimc_cap_s_crop,
-	.vidioc_cropcap			= fimc_vidioc_cropcap,
+	.vidioc_cropcap			= fimc_cap_cropcap,
 
 	.vidioc_enum_input		= fimc_cap_enum_input,
 	.vidioc_s_input			= fimc_cap_s_input,
diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index 2e7c547..f45970d 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -1115,7 +1115,7 @@ static int fimc_m2m_s_ctrl(struct file *file, void *priv,
 	return 0;
 }
 
-int fimc_vidioc_cropcap(struct file *file, void *fh,
+static int fimc_m2m_cropcap(struct file *file, void *fh,
 			struct v4l2_cropcap *cr)
 {
 	struct fimc_frame *frame;
@@ -1139,7 +1139,7 @@ int fimc_vidioc_cropcap(struct file *file, void *fh,
 	return 0;
 }
 
-int fimc_vidioc_g_crop(struct file *file, void *fh, struct v4l2_crop *cr)
+static int fimc_m2m_g_crop(struct file *file, void *fh, struct v4l2_crop *cr)
 {
 	struct fimc_frame *frame;
 	struct fimc_ctx *ctx = file->private_data;
@@ -1167,22 +1167,22 @@ int fimc_try_crop(struct fimc_ctx *ctx, struct v4l2_crop *cr)
 	struct fimc_frame *f;
 	u32 min_size, halign;
 
-	f = (cr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ?
-		&ctx->s_frame : &ctx->d_frame;
-
 	if (cr->c.top < 0 || cr->c.left < 0) {
 		v4l2_err(&fimc->m2m.v4l2_dev,
 			"doesn't support negative values for top & left\n");
 		return -EINVAL;
 	}
 
-	f = ctx_get_frame(ctx, cr->type);
-	if (IS_ERR(f))
-		return PTR_ERR(f);
+	if (cr->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		f = (ctx->state & FIMC_CTX_CAP) ? &ctx->s_frame : &ctx->d_frame;
+	else if (cr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+		 ctx->state & FIMC_CTX_M2M)
+		f = &ctx->s_frame;
+	else
+		return -EINVAL;
 
-	min_size = (cr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
-		? fimc->variant->min_inp_pixsize
-		: fimc->variant->min_out_pixsize;
+	min_size = (f == &ctx->s_frame) ?
+		fimc->variant->min_inp_pixsize : fimc->variant->min_out_pixsize;
 
 	if (ctx->state & FIMC_CTX_M2M) {
 		if (fimc->id == 1 && fimc->variant->pix_hoff)
@@ -1285,9 +1285,9 @@ static const struct v4l2_ioctl_ops fimc_m2m_ioctl_ops = {
 	.vidioc_g_ctrl			= fimc_vidioc_g_ctrl,
 	.vidioc_s_ctrl			= fimc_m2m_s_ctrl,
 
-	.vidioc_g_crop			= fimc_vidioc_g_crop,
+	.vidioc_g_crop			= fimc_m2m_g_crop,
 	.vidioc_s_crop			= fimc_m2m_s_crop,
-	.vidioc_cropcap			= fimc_vidioc_cropcap
+	.vidioc_cropcap			= fimc_m2m_cropcap
 
 };
 
diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media/video/s5p-fimc/fimc-core.h
index 3e10785..afafebc 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.h
+++ b/drivers/media/video/s5p-fimc/fimc-core.h
@@ -594,10 +594,6 @@ int fimc_vidioc_g_fmt(struct file *file, void *priv,
 		      struct v4l2_format *f);
 int fimc_vidioc_try_fmt(struct file *file, void *priv,
 			struct v4l2_format *f);
-int fimc_vidioc_g_crop(struct file *file, void *fh,
-		       struct v4l2_crop *cr);
-int fimc_vidioc_cropcap(struct file *file, void *fh,
-			struct v4l2_cropcap *cr);
 int fimc_vidioc_queryctrl(struct file *file, void *priv,
 			  struct v4l2_queryctrl *qc);
 int fimc_vidioc_g_ctrl(struct file *file, void *priv,
-- 
1.7.1
