From: Thibault Saunier <thibault.saunier@osg.samsung.com>
Subject: [PATCH 2/4] [media] exynos-gsc: Respect userspace colorspace setting
Date: Thu,  9 Feb 2017 16:43:12 -0300
Message-ID: <20170209194314.5908-3-thibault.saunier@osg.samsung.com>
References: <20170209194314.5908-1-thibault.saunier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170209194314.5908-1-thibault.saunier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Inki Dae <inki.dae@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thibault Saunier <thibault.saunier@osg.samsung.com>, linux-media@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

If the colorspace is specified by userspace we should respect
it and not reset it ourself if we can support it.

Signed-off-by: Thibault Saunier <thibault.saunier@osg.samsung.com>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index 2beb43401987..63bb4577827d 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -445,10 +445,14 @@ int gsc_try_fmt_mplane(struct gsc_ctx *ctx, struct v4l2_format *f)
 
 	pix_mp->num_planes = fmt->num_planes;
 
-	if (pix_mp->width > 720 && pix_mp->height > 576) /* HD */
-		pix_mp->colorspace = V4L2_COLORSPACE_REC709;
-	else /* SD */
-		pix_mp->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	if (pix_mp->colorspace != V4L2_COLORSPACE_REC709 &&
+		pix_mp->colorspace != V4L2_COLORSPACE_SMPTE170M &&
+		pix_mp->colorspace != V4L2_COLORSPACE_DEFAULT) {
+		if (pix_mp->width > 720 && pix_mp->height > 576) /* HD */
+		  pix_mp->colorspace = V4L2_COLORSPACE_REC709;
+		else /* SD */
+		  pix_mp->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	  }
 
 	for (i = 0; i < pix_mp->num_planes; ++i) {
 		struct v4l2_plane_pix_format *plane_fmt = &pix_mp->plane_fmt[i];
@@ -492,12 +496,17 @@ int gsc_g_fmt_mplane(struct gsc_ctx *ctx, struct v4l2_format *f)
 	pix_mp->height		= frame->f_height;
 	pix_mp->field		= V4L2_FIELD_NONE;
 	pix_mp->pixelformat	= frame->fmt->pixelformat;
-	if (pix_mp->width > 720 && pix_mp->height > 576) /* HD */
-		pix_mp->colorspace = V4L2_COLORSPACE_REC709;
-	else /* SD */
-		pix_mp->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	pix_mp->num_planes	= frame->fmt->num_planes;
 
+	if (pix_mp->colorspace != V4L2_COLORSPACE_REC709 &&
+		pix_mp->colorspace != V4L2_COLORSPACE_SMPTE170M &&
+		pix_mp->colorspace != V4L2_COLORSPACE_DEFAULT) {
+		if (pix_mp->width > 720 && pix_mp->height > 576) /* HD */
+		  pix_mp->colorspace = V4L2_COLORSPACE_REC709;
+		else /* SD */
+		  pix_mp->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	  }
+
 	for (i = 0; i < pix_mp->num_planes; ++i) {
 		pix_mp->plane_fmt[i].bytesperline = (frame->f_width *
 			frame->fmt->depth[i]) / 8;
-- 
2.11.1
