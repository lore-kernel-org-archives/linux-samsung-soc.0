From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH RFC v2 07/10] exynos-gsc: Configure default image format at device open()
Date: Sat, 12 Oct 2013 14:31:57 +0200
Message-ID: <1381581120-26883-8-git-send-email-s.nawrocki@samsung.com>
References: <1381581120-26883-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1381581120-26883-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, pawel@osciak.com, javier.martin@vista-silicon.com, m.szyprowski@samsung.com, shaik.ameer@samsung.com, arun.kk@samsung.com, k.debski@samsung.com, p.zabel@pengutronix.de, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There should be always some valid image format set on a video device.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/media/platform/exynos-gsc/gsc-m2m.c |   34 ++++++++++++++++++++++++++-
 1 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index e576ff2..48e1c34 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -605,6 +605,32 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	return vb2_queue_init(dst_vq);
 }
 
+static int gsc_m2m_set_default_format(struct gsc_ctx *ctx)
+{
+	struct v4l2_pix_format_mplane pixm = {
+		.pixelformat	= V4L2_PIX_FMT_RGB32,
+		.width		= 800,
+		.height		= 600,
+		.plane_fmt[0]	= {
+			.bytesperline = 800 * 4,
+			.sizeimage = 800 * 4 * 600,
+		},
+	};
+	const struct gsc_fmt *fmt;
+
+	fmt = find_fmt(&pixm.pixelformat, NULL, 0);
+	if (!fmt)
+		return -EINVAL;
+
+	gsc_set_frame_size(&ctx->s_frame, pixm.width, pixm.height);
+	ctx->s_frame.payload[0] = pixm.plane_fmt[0].sizeimage;
+
+	gsc_set_frame_size(&ctx->d_frame, pixm.width, pixm.height);
+	ctx->d_frame.payload[0] = pixm.plane_fmt[0].sizeimage;
+
+	return 0;
+}
+
 static int gsc_m2m_open(struct file *file)
 {
 	struct gsc_dev *gsc = video_drvdata(file);
@@ -638,7 +664,7 @@ static int gsc_m2m_open(struct file *file)
 	ctx->d_frame.fmt = get_format(0);
 	/* Setup the device context for mem2mem mode. */
 	ctx->state = GSC_CTX_M2M;
-	ctx->flags = 0;
+	ctx->flags = GSC_PARAMS;
 	ctx->in_path = GSC_DMA;
 	ctx->out_path = GSC_DMA;
 
@@ -652,11 +678,17 @@ static int gsc_m2m_open(struct file *file)
 	if (gsc->m2m.refcnt++ == 0)
 		set_bit(ST_M2M_OPEN, &gsc->state);
 
+	ret = gsc_m2m_set_default_format(ctx);
+	if (ret)
+		goto error_m2m_rel;
+
 	pr_debug("gsc m2m driver is opened, ctx(0x%p)", ctx);
 
 	mutex_unlock(&gsc->lock);
 	return 0;
 
+error_m2m_rel:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 error_ctrls:
 	gsc_ctrls_delete(ctx);
 error_fh:
-- 
1.7.4.1
