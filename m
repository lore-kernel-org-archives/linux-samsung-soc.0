From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 01/15] tests/exynos: fimg2d: add a checkerboard test
Date: Tue,  3 Feb 2015 14:53:51 +0100
Message-ID: <1422971645-30621-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46001 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754017AbbBCNyU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:20 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This makes it easier to spot memory corruptions which don't become
visible when using a plain buffer filled with a solid color (so
corruptions that are just a permutation of the bytes in the buffer).

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 117 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index c6bd558..41fb869 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -55,6 +55,9 @@ struct fimg2d_test_case {
 	int (*blend)(struct exynos_device *dev,
 				struct exynos_bo *src, struct exynos_bo *dst,
 				enum e_g2d_buf_type);
+	int (*checkerboard)(struct exynos_device *dev,
+				struct exynos_bo *src, struct exynos_bo *dst,
+				enum e_g2d_buf_type);
 };
 
 struct connector {
@@ -207,6 +210,33 @@ static struct exynos_bo *exynos_create_buffer(struct exynos_device *dev,
 	return bo;
 }
 
+/* Allocate buffer and fill it with checkerboard pattern, where the tiles *
+ * have a random color. The caller has to free the buffer.                */
+void *create_checkerboard_pattern(unsigned int num_tiles_x,
+						unsigned int num_tiles_y, unsigned int tile_size)
+{
+	unsigned int *buf;
+	unsigned int x, y, i, j;
+	const unsigned int stride = num_tiles_x * tile_size;
+
+	if (posix_memalign((void*)&buf, 64, num_tiles_y * tile_size * stride * 4) != 0)
+		return NULL;
+
+	for (x = 0; x < num_tiles_x; ++x) {
+		for (y = 0; y < num_tiles_y; ++y) {
+			const unsigned int color = 0xff000000 + (random() & 0xffffff);
+
+			for (i = 0; i < tile_size; ++i) {
+				for (j = 0; j < tile_size; ++j) {
+					buf[x * tile_size + y * stride * tile_size + i + j * stride] = color;
+				}
+			}
+		}
+	}
+
+	return buf;
+}
+
 static void exynos_destroy_buffer(struct exynos_bo *bo)
 {
 	exynos_bo_destroy(bo);
@@ -533,11 +563,90 @@ err_free_userptr:
 	return 0;
 }
 
+static int g2d_checkerboard_test(struct exynos_device *dev,
+					struct exynos_bo *src,
+					struct exynos_bo *dst,
+					enum e_g2d_buf_type type)
+{
+	struct g2d_context *ctx;
+	struct g2d_image src_img = {0}, dst_img = {0};
+	unsigned int src_x, src_y, dst_x, dst_y, img_w, img_h;
+	void *checkerboard = NULL;
+	int ret;
+
+	ctx = g2d_init(dev->fd);
+	if (!ctx)
+		return -EFAULT;
+
+	dst_img.bo[0] = dst->handle;
+
+	src_x = 0;
+	src_y = 0;
+	dst_x = 0;
+	dst_y = 0;
+
+	checkerboard = create_checkerboard_pattern(screen_width / 32, screen_height / 32, 32);
+	if (checkerboard == NULL) {
+		ret = -1;
+		goto fail;
+	}
+
+	img_w = screen_width - (screen_width % 32);
+	img_h = screen_height - (screen_height % 32);
+
+	switch (type) {
+	case G2D_IMGBUF_GEM:
+		memcpy(src->vaddr, checkerboard, img_w * img_h * 4);
+		src_img.bo[0] = src->handle;
+		break;
+	case G2D_IMGBUF_USERPTR:
+		src_img.user_ptr[0].userptr = (unsigned long)checkerboard;
+		src_img.user_ptr[0].size = img_w * img_h * 4;
+		break;
+	default:
+		ret = -EFAULT;
+		goto fail;
+	}
+
+	printf("checkerboard test with %s.\n",
+			type == G2D_IMGBUF_GEM ? "gem" : "userptr");
+
+	src_img.width = img_w;
+	src_img.height = img_h;
+	src_img.stride = src_img.width * 4;
+	src_img.buf_type = type;
+	src_img.color_mode = G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB;
+
+	dst_img.width = screen_width;
+	dst_img.height = screen_height;
+	dst_img.stride = dst_img.width * 4;
+	dst_img.buf_type = G2D_IMGBUF_GEM;
+	dst_img.color_mode = G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB;
+	src_img.color = 0xff000000;
+	ret = g2d_solid_fill(ctx, &dst_img, src_x, src_y, screen_width, screen_height);
+	if (ret < 0)
+		goto fail;
+
+	ret = g2d_copy(ctx, &src_img, &dst_img, src_x, src_y, dst_x, dst_y,
+			img_w, img_h);
+	if (ret < 0)
+		goto fail;
+
+	g2d_exec(ctx);
+
+fail:
+	free(checkerboard);
+	g2d_fini(ctx);
+
+	return ret;
+}
+
 static struct fimg2d_test_case test_case = {
 	.solid_fill = &g2d_solid_fill_test,
 	.copy = &g2d_copy_test,
 	.copy_with_scale = &g2d_copy_with_scale_test,
 	.blend = &g2d_blend_test,
+	.checkerboard = &g2d_checkerboard_test,
 };
 
 static void usage(char *name)
@@ -671,6 +780,14 @@ int main(int argc, char **argv)
 
 	getchar();
 
+	ret = test_case.checkerboard(dev, src, bo, G2D_IMGBUF_GEM);
+	if (ret < 0) {
+		fprintf(stderr, "failed to issue checkerboard test.\n");
+		goto err_free_src;
+	}
+
+	getchar();
+
 	ret  = test_case.blend(dev, src, bo, G2D_IMGBUF_USERPTR);
 	if (ret < 0)
 		fprintf(stderr, "failed to test blend operation.\n");
-- 
2.0.5
