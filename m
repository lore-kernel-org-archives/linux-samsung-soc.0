From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/4] s5p-fimc: Fix bytesperline and plane payload setup
Date: Mon, 11 Apr 2011 11:07:44 +0200
Message-ID: <1302512865-20379-4-git-send-email-s.nawrocki@samsung.com>
References: <1302512865-20379-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1302512865-20379-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Make sure the sizeimage for 3-planar color formats is
width * height * 3/2 and the bytesperline is same for each
plane in case of a multi-planar format.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-capture.c |    6 +++-
 drivers/media/video/s5p-fimc/fimc-core.c    |   30 ++++++++++++++------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
index 00c561c..d142b40 100644
--- a/drivers/media/video/s5p-fimc/fimc-capture.c
+++ b/drivers/media/video/s5p-fimc/fimc-capture.c
@@ -539,8 +539,10 @@ static int fimc_cap_s_fmt_mplane(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	for (i = 0; i < frame->fmt->colplanes; i++)
-		frame->payload[i] = pix->plane_fmt[i].bytesperline * pix->height;
+	for (i = 0; i < frame->fmt->colplanes; i++) {
+		frame->payload[i] =
+			(pix->width * pix->height * frame->fmt->depth[i]) >> 3;
+	}
 
 	/* Output DMA frame pixel size and offsets. */
 	frame->f_width = pix->plane_fmt[0].bytesperline * 8
diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index 115a1e0..ef4e3f6 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -927,23 +927,23 @@ int fimc_vidioc_try_fmt_mplane(struct file *file, void *priv,
 	pix->num_planes = fmt->memplanes;
 	pix->colorspace	= V4L2_COLORSPACE_JPEG;
 
-	for (i = 0; i < pix->num_planes; ++i) {
-		int bpl = pix->plane_fmt[i].bytesperline;
 
-		dbg("[%d] bpl: %d, depth: %d, w: %d, h: %d",
-		    i, bpl, fmt->depth[i], pix->width, pix->height);
+	for (i = 0; i < pix->num_planes; ++i) {
+		u32 bpl = pix->plane_fmt[i].bytesperline;
+		u32 *sizeimage = &pix->plane_fmt[i].sizeimage;
 
-		if (!bpl || (bpl * 8 / fmt->depth[i]) > pix->width)
-			bpl = (pix->width * fmt->depth[0]) >> 3;
+		if (fmt->colplanes > 1 && (bpl == 0 || bpl < pix->width))
+			bpl = pix->width; /* Planar */
 
-		if (!pix->plane_fmt[i].sizeimage)
-			pix->plane_fmt[i].sizeimage = pix->height * bpl;
+		if (fmt->colplanes == 1 && /* Packed */
+		    (bpl == 0 || ((bpl * 8) / fmt->depth[i]) < pix->width))
+			bpl = (pix->width * fmt->depth[0]) / 8;
 
-		pix->plane_fmt[i].bytesperline = bpl;
+		if (i == 0) /* Same bytesperline for each plane. */
+			mod_x = bpl;
 
-		dbg("[%d]: bpl: %d, sizeimage: %d",
-		    i, pix->plane_fmt[i].bytesperline,
-		    pix->plane_fmt[i].sizeimage);
+		pix->plane_fmt[i].bytesperline = mod_x;
+		*sizeimage = (pix->width * pix->height * fmt->depth[i]) / 8;
 	}
 
 	return 0;
@@ -985,8 +985,10 @@ static int fimc_m2m_s_fmt_mplane(struct file *file, void *priv,
 	if (!frame->fmt)
 		return -EINVAL;
 
-	for (i = 0; i < frame->fmt->colplanes; i++)
-		frame->payload[i] = pix->plane_fmt[i].bytesperline * pix->height;
+	for (i = 0; i < frame->fmt->colplanes; i++) {
+		frame->payload[i] =
+			(pix->width * pix->height * frame->fmt->depth[i]) / 8;
+	}
 
 	frame->f_width	= pix->plane_fmt[0].bytesperline * 8 /
 		frame->fmt->depth[0];
-- 
1.7.4.3
