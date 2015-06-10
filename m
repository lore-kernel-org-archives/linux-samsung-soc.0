From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 6/9] tests/exynos: remove struct fimg2d_test_case
Date: Wed, 10 Jun 2015 15:42:25 +0200
Message-ID: <1433943748-15849-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33640 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933655AbbFJNrr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 09:47:47 -0400
In-Reply-To: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

It doesn't make sense to keep this structure, since we
can just call all tests directly.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 42 +++++----------------------------------
 1 file changed, 5 insertions(+), 37 deletions(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 080d178..de6a2b7 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -37,30 +37,6 @@
 
 static unsigned int screen_width, screen_height;
 
-/*
- * A structure to test fimg2d hw.
- *
- * @solid_fill: fill given color data to source buffer.
- * @copy: copy source to destination buffer.
- * @copy_with_scale: copy source to destination buffer scaling up or
- *	down properly.
- * @blend: blend source to destination buffer.
- */
-struct fimg2d_test_case {
-	int (*solid_fill)(struct exynos_device *dev, struct exynos_bo *dst);
-	int (*copy)(struct exynos_device *dev, struct exynos_bo *src,
-			struct exynos_bo *dst, enum e_g2d_buf_type);
-	int (*copy_with_scale)(struct exynos_device *dev,
-				struct exynos_bo *src, struct exynos_bo *dst,
-				enum e_g2d_buf_type);
-	int (*blend)(struct exynos_device *dev,
-				struct exynos_bo *src, struct exynos_bo *dst,
-				enum e_g2d_buf_type);
-	int (*checkerboard)(struct exynos_device *dev,
-				struct exynos_bo *src, struct exynos_bo *dst,
-				enum e_g2d_buf_type);
-};
-
 struct connector {
 	uint32_t id;
 	char mode_str[64];
@@ -630,14 +606,6 @@ fail:
 	return ret;
 }
 
-static struct fimg2d_test_case test_case = {
-	.solid_fill = &g2d_solid_fill_test,
-	.copy = &g2d_copy_test,
-	.copy_with_scale = &g2d_copy_with_scale_test,
-	.blend = &g2d_blend_test,
-	.checkerboard = &g2d_checkerboard_test,
-};
-
 static void usage(char *name)
 {
 	fprintf(stderr, "usage: %s [-s]\n", name);
@@ -747,7 +715,7 @@ int main(int argc, char **argv)
 	if (ret < 0)
 		goto err_rm_fb;
 
-	ret = test_case.solid_fill(dev, bo);
+	ret = g2d_solid_fill_test(dev, bo);
 	if (ret < 0) {
 		fprintf(stderr, "failed to solid fill operation.\n");
 		goto err_rm_fb;
@@ -761,7 +729,7 @@ int main(int argc, char **argv)
 		goto err_rm_fb;
 	}
 
-	ret = test_case.copy(dev, src, bo, G2D_IMGBUF_GEM);
+	ret = g2d_copy_test(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
 		fprintf(stderr, "failed to test copy operation.\n");
 		goto err_free_src;
@@ -769,7 +737,7 @@ int main(int argc, char **argv)
 
 	wait_for_user_input(0);
 
-	ret = test_case.copy_with_scale(dev, src, bo, G2D_IMGBUF_GEM);
+	ret = g2d_copy_with_scale_test(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
 		fprintf(stderr, "failed to test copy and scale operation.\n");
 		goto err_free_src;
@@ -777,7 +745,7 @@ int main(int argc, char **argv)
 
 	wait_for_user_input(0);
 
-	ret = test_case.checkerboard(dev, src, bo, G2D_IMGBUF_GEM);
+	ret = g2d_checkerboard_test(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
 		fprintf(stderr, "failed to issue checkerboard test.\n");
 		goto err_free_src;
@@ -794,7 +762,7 @@ int main(int argc, char **argv)
 	 * Disable the test for now, until the kernel code has been sanitized.
 	 */
 #if 0
-	ret  = test_case.blend(dev, src, bo, G2D_IMGBUF_USERPTR);
+	ret  = g2d_blend_test(dev, src, bo, G2D_IMGBUF_USERPTR);
 	if (ret < 0)
 		fprintf(stderr, "failed to test blend operation.\n");
 
-- 
2.0.5
