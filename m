From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 09/15] exynos: use structure initialization instead of memset
Date: Tue,  3 Feb 2015 14:53:59 +0100
Message-ID: <1422971645-30621-10-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46045 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965526AbbBCNyb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:31 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Keeps the code cleaner, since the structs have to be initialized
once anyway.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c            |  4 +---
 tests/exynos/exynos_fimg2d_test.c | 15 ++++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 7b76eb6..c609053 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -180,7 +180,7 @@ static void g2d_reset(struct g2d_context *ctx)
 static int g2d_flush(struct g2d_context *ctx)
 {
 	int ret;
-	struct drm_exynos_g2d_set_cmdlist cmdlist;
+	struct drm_exynos_g2d_set_cmdlist cmdlist = {0};
 
 	if (ctx->cmd_nr  == 0 && ctx->cmd_buf_nr == 0)
 		return FALSE;
@@ -190,8 +190,6 @@ static int g2d_flush(struct g2d_context *ctx)
 		return -EINVAL;
 	}
 
-	memset(&cmdlist, 0, sizeof(struct drm_exynos_g2d_set_cmdlist));
-
 	cmdlist.cmd = (uint64_t)(uintptr_t)&ctx->cmd[0];
 	cmdlist.cmd_buf = (uint64_t)(uintptr_t)&ctx->cmd_buf[0];
 	cmdlist.cmd_nr = ctx->cmd_nr;
diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 20b8e9d..cb021ac 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -257,7 +257,7 @@ static void exynos_destroy_buffer(struct exynos_bo *bo)
 static int g2d_solid_fill_test(struct exynos_device *dev, struct exynos_bo *dst)
 {
 	struct g2d_context *ctx;
-	struct g2d_image img;
+	struct g2d_image img = {0};
 	unsigned int count, img_w, img_h;
 	int ret = 0;
 
@@ -265,7 +265,6 @@ static int g2d_solid_fill_test(struct exynos_device *dev, struct exynos_bo *dst)
 	if (!ctx)
 		return -EFAULT;
 
-	memset(&img, 0, sizeof(struct g2d_image));
 	img.bo[0] = dst->handle;
 
 	printf("solid fill test.\n");
@@ -308,7 +307,7 @@ static int g2d_copy_test(struct exynos_device *dev, struct exynos_bo *src,
 				enum e_g2d_buf_type type)
 {
 	struct g2d_context *ctx;
-	struct g2d_image src_img, dst_img;
+	struct g2d_image src_img = {0}, dst_img = {0};
 	unsigned int count;
 	unsigned int src_x, src_y, dst_x, dst_y, img_w, img_h;
 	unsigned long userptr, size;
@@ -318,8 +317,6 @@ static int g2d_copy_test(struct exynos_device *dev, struct exynos_bo *src,
 	if (!ctx)
 		return -EFAULT;
 
-	memset(&src_img, 0, sizeof(struct g2d_image));
-	memset(&dst_img, 0, sizeof(struct g2d_image));
 	dst_img.bo[0] = dst->handle;
 
 	src_x = 0;
@@ -392,7 +389,7 @@ static int g2d_copy_with_scale_test(struct exynos_device *dev,
 					enum e_g2d_buf_type type)
 {
 	struct g2d_context *ctx;
-	struct g2d_image src_img, dst_img;
+	struct g2d_image src_img = {0}, dst_img = {0};
 	unsigned int count;
 	unsigned int src_x, src_y, dst_x, dst_y, img_w, img_h;
 	unsigned long userptr, size;
@@ -402,8 +399,6 @@ static int g2d_copy_with_scale_test(struct exynos_device *dev,
 	if (!ctx)
 		return -EFAULT;
 
-	memset(&src_img, 0, sizeof(struct g2d_image));
-	memset(&dst_img, 0, sizeof(struct g2d_image));
 	dst_img.bo[0] = dst->handle;
 
 	src_x = 0;
@@ -481,7 +476,7 @@ static int g2d_blend_test(struct exynos_device *dev,
 					enum e_g2d_buf_type type)
 {
 	struct g2d_context *ctx;
-	struct g2d_image src_img, dst_img;
+	struct g2d_image src_img = {0}, dst_img = {0};
 	unsigned int count;
 	unsigned int src_x, src_y, dst_x, dst_y, img_w, img_h;
 	unsigned long userptr, size;
@@ -491,8 +486,6 @@ static int g2d_blend_test(struct exynos_device *dev,
 	if (!ctx)
 		return -EFAULT;
 
-	memset(&src_img, 0, sizeof(struct g2d_image));
-	memset(&dst_img, 0, sizeof(struct g2d_image));
 	dst_img.bo[0] = dst->handle;
 
 	src_x = 0;
-- 
2.0.5
