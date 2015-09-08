From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 8/9] exynos/fimg2d: add message prefix
Date: Tue,  8 Sep 2015 17:22:33 +0200
Message-ID: <1441725754-27555-9-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34653 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755048AbbIHPYo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 11:24:44 -0400
In-Reply-To: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Add a prefix to the messages printed to the console via
printf() and fprintf() so that one can easily see where
the message comes from.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 5873fe7..9746c21 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -42,6 +42,8 @@
 
 #define MIN(a, b)	((a) < (b) ? (a) : (b))
 
+#define MSG_PREFIX "exynos/fimg2d: "
+
 enum g2d_base_addr_reg {
 	g2d_dst = 0,
 	g2d_src
@@ -255,7 +257,7 @@ static int g2d_flush(struct g2d_context *ctx)
 		return 0;
 
 	if (ctx->cmdlist_nr >= G2D_MAX_CMD_LIST_NR) {
-		fprintf(stderr, "Overflow cmdlist.\n");
+		fprintf(stderr, MSG_PREFIX "command list overflow.\n");
 		return -EINVAL;
 	}
 
@@ -271,7 +273,7 @@ static int g2d_flush(struct g2d_context *ctx)
 
 	ret = drmIoctl(ctx->fd, DRM_IOCTL_EXYNOS_G2D_SET_CMDLIST, &cmdlist);
 	if (ret < 0) {
-		fprintf(stderr, "failed to set cmdlist.\n");
+		fprintf(stderr, MSG_PREFIX "failed to set cmdlist.\n");
 		return ret;
 	}
 
@@ -293,7 +295,7 @@ struct g2d_context *g2d_init(int fd)
 
 	ctx = calloc(1, sizeof(*ctx));
 	if (!ctx) {
-		fprintf(stderr, "failed to allocate context.\n");
+		fprintf(stderr, MSG_PREFIX "failed to allocate context.\n");
 		return NULL;
 	}
 
@@ -301,7 +303,7 @@ struct g2d_context *g2d_init(int fd)
 
 	ret = drmIoctl(fd, DRM_IOCTL_EXYNOS_G2D_GET_VER, &ver);
 	if (ret < 0) {
-		fprintf(stderr, "failed to get version.\n");
+		fprintf(stderr, MSG_PREFIX "failed to get version.\n");
 		free(ctx);
 		return NULL;
 	}
@@ -309,7 +311,7 @@ struct g2d_context *g2d_init(int fd)
 	ctx->major = ver.major;
 	ctx->minor = ver.minor;
 
-	printf("g2d version(%d.%d).\n", ctx->major, ctx->minor);
+	printf(MSG_PREFIX "G2D version (%d.%d).\n", ctx->major, ctx->minor);
 	return ctx;
 }
 
@@ -335,7 +337,7 @@ int g2d_exec(struct g2d_context *ctx)
 
 	ret = drmIoctl(ctx->fd, DRM_IOCTL_EXYNOS_G2D_EXEC, &exec);
 	if (ret < 0) {
-		fprintf(stderr, "failed to execute.\n");
+		fprintf(stderr, MSG_PREFIX "failed to execute.\n");
 		return ret;
 	}
 
@@ -436,7 +438,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 	h = MIN(src_h, dst_h);
 
 	if (w <= 0 || h <= 0) {
-		fprintf(stderr, "invalid width or height.\n");
+		fprintf(stderr, MSG_PREFIX "invalid width or height.\n");
 		return -EINVAL;
 	}
 
@@ -532,7 +534,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 		dst_h = dst->height - dst_y;
 
 	if (src_w <= 0 || src_h <= 0 || dst_w <= 0 || dst_h <= 0) {
-		fprintf(stderr, "invalid width or height.\n");
+		fprintf(stderr, MSG_PREFIX "invalid width or height.\n");
 		return -EINVAL;
 	}
 
@@ -633,17 +635,17 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 	h = MIN(src_h, dst_h);
 
 	if (w <= 0 || h <= 0) {
-		fprintf(stderr, "invalid width or height.\n");
+		fprintf(stderr, MSG_PREFIX "invalid width or height.\n");
 		return -EINVAL;
 	}
 
 	if (!g2d_validate_select_mode(src->select_mode)) {
-		fprintf(stderr , "invalid select mode for source.\n");
+		fprintf(stderr , MSG_PREFIX "invalid select mode for source.\n");
 		return -EINVAL;
 	}
 
 	if (!g2d_validate_blending_op(op)) {
-		fprintf(stderr , "unsupported blending operation.\n");
+		fprintf(stderr , MSG_PREFIX "unsupported blending operation.\n");
 		return -EINVAL;
 	}
 
@@ -752,17 +754,17 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 		dst_h = dst->height - dst_y;
 
 	if (src_w <= 0 || src_h <= 0 || dst_w <= 0 || dst_h <= 0) {
-		fprintf(stderr, "invalid width or height.\n");
+		fprintf(stderr, MSG_PREFIX "invalid width or height.\n");
 		return -EINVAL;
 	}
 
 	if (!g2d_validate_select_mode(src->select_mode)) {
-		fprintf(stderr , "invalid select mode for source.\n");
+		fprintf(stderr , MSG_PREFIX "invalid select mode for source.\n");
 		return -EINVAL;
 	}
 
 	if (!g2d_validate_blending_op(op)) {
-		fprintf(stderr , "unsupported blending operation.\n");
+		fprintf(stderr , MSG_PREFIX "unsupported blending operation.\n");
 		return -EINVAL;
 	}
 
-- 
2.0.5
