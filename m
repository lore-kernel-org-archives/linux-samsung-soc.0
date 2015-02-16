From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 03/15] tests/exynos: fix typos and change wording
Date: Mon, 16 Feb 2015 14:46:33 +0100
Message-ID: <1424094405-6314-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55408 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755193AbbBPNq6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 08:46:58 -0500
In-Reply-To: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

No functional changes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c            | 8 ++++----
 tests/exynos/exynos_fimg2d_test.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 037021a..8b1a0ff 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -146,13 +146,13 @@ static void g2d_reset(struct g2d_context *ctx)
 }
 
 /*
- * g2d_flush - summit all commands and values in user side command buffer
+ * g2d_flush - submit all commands and values in user side command buffer
  *		to command queue aware of fimg2d dma.
  *
  * @ctx: a pointer to g2d_context structure.
  *
  * This function should be called after all commands and values to user
- * side command buffer is set to summit that buffer to kernel side driver.
+ * side command buffer are set. It submits that buffer to the kernel side driver.
  */
 static int g2d_flush(struct g2d_context *ctx)
 {
@@ -193,7 +193,7 @@ static int g2d_flush(struct g2d_context *ctx)
 /**
  * g2d_init - create a new g2d context and get hardware version.
  *
- * fd: a file descriptor to drm device driver opened.
+ * fd: a file descriptor to an opened drm device.
  */
 drm_public struct g2d_context *g2d_init(int fd)
 {
@@ -525,7 +525,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 }
 
 /**
- * g2d_blend - blend image data in source and destion buffers
+ * g2d_blend - blend image data in source and destination buffers.
  *
  * @ctx: a pointer to g2d_context structure.
  * @src: a pointer to g2d_image structure including image and buffer
diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 41fb869..aa140e5 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -39,7 +39,7 @@ static unsigned int screen_width, screen_height;
 /*
  * A structure to test fimg2d hw.
  *
- * @solid_fild: fill given color data to source buffer.
+ * @solid_fill: fill given color data to source buffer.
  * @copy: copy source to destination buffer.
  * @copy_with_scale: copy source to destination buffer scaling up or
  *	down properly.
@@ -256,7 +256,7 @@ static int g2d_solid_fill_test(struct exynos_device *dev, struct exynos_bo *dst)
 	memset(&img, 0, sizeof(struct g2d_image));
 	img.bo[0] = dst->handle;
 
-	printf("soild fill test.\n");
+	printf("solid fill test.\n");
 
 	srand(time(NULL));
 	img_w = screen_width;
-- 
2.0.5
