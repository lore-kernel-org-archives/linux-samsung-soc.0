From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 7/7] s5p-fimc: Fix G_FMT ioctl handler
Date: Thu, 24 Feb 2011 15:33:54 +0100
Message-ID: <1298558034-10768-8-git-send-email-s.nawrocki@samsung.com>
References: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Use pix_mp member of struct v4l2_format to return a format
description rather than pix. Also fill in the plane_fmt array.
This is a missing bit of conversion to the multiplanar API.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.c |   23 +++++++++++++++++++----
 1 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index 1ad9bc6..3e3b365 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -805,15 +805,29 @@ int fimc_vidioc_g_fmt_mplane(struct file *file, void *priv,
 {
 	struct fimc_ctx *ctx = priv;
 	struct fimc_frame *frame;
+	struct v4l2_pix_format_mplane *pixm;
+	int i;
 
 	frame = ctx_get_frame(ctx, f->type);
 	if (IS_ERR(frame))
 		return PTR_ERR(frame);
 
-	f->fmt.pix.width	= frame->width;
-	f->fmt.pix.height	= frame->height;
-	f->fmt.pix.field	= V4L2_FIELD_NONE;
-	f->fmt.pix.pixelformat	= frame->fmt->fourcc;
+	pixm = &f->fmt.pix_mp;
+
+	pixm->width		= frame->width;
+	pixm->height		= frame->height;
+	pixm->field		= V4L2_FIELD_NONE;
+	pixm->pixelformat	= frame->fmt->fourcc;
+	pixm->colorspace	= V4L2_COLORSPACE_JPEG;
+	pixm->num_planes	= frame->fmt->memplanes;
+
+	for (i = 0; i < pixm->num_planes; ++i) {
+		pixm->plane_fmt[i].bytesperline = (frame->f_width *
+			frame->fmt->depth[i]) / 8;
+
+		pixm->plane_fmt[i].sizeimage =
+			pixm->plane_fmt[i].bytesperline * frame->height;
+	}
 
 	return 0;
 }
@@ -908,6 +922,7 @@ int fimc_vidioc_try_fmt_mplane(struct file *file, void *priv,
 		&pix->height, 8, variant->pix_limit->scaler_dis_w, mod_y, 0);
 
 	pix->num_planes = fmt->memplanes;
+	pix->colorspace	= V4L2_COLORSPACE_JPEG;
 
 	for (i = 0; i < pix->num_planes; ++i) {
 		int bpl = pix->plane_fmt[i].bytesperline;
-- 
1.7.4.1
