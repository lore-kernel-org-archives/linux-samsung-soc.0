From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4 4/9] exynos: fimg2d: add g2d_exec2
Date: Wed, 13 May 2015 19:34:48 +0200
Message-ID: <1431538493-11431-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55332 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934458AbbEMRgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 13:36:10 -0400
In-Reply-To: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This is a more 'flexible' version of g2d_exec allowing to pass
some flags which modify the behaviour of g2d_exec. Currently
only the 'async' operation flag is supported.

v2: Add g2d_exec2() to Exynos symbol test.
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos-symbol-check |  1 +
 exynos/exynos_fimg2d.c     | 15 +++++++++++++--
 exynos/exynos_fimg2d.h     |  6 ++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/exynos/exynos-symbol-check b/exynos/exynos-symbol-check
index bb12315..2bb7718 100755
--- a/exynos/exynos-symbol-check
+++ b/exynos/exynos-symbol-check
@@ -27,6 +27,7 @@ g2d_blend
 g2d_copy
 g2d_copy_with_scale
 g2d_exec
+g2d_exec2
 g2d_config_event
 g2d_fini
 g2d_init
diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 3a5f20a..b1fd0a5 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -288,13 +288,24 @@ void g2d_config_event(struct g2d_context *ctx, void *userdata)
  */
 int g2d_exec(struct g2d_context *ctx)
 {
-	struct drm_exynos_g2d_exec exec;
+	return g2d_exec2(ctx, G2D_EXEC_FLAG_NORMAL);
+}
+
+/**
+ * g2d_exec2 - same as 'g2d_exec' but allow to pass some flags.
+ *
+ * @ctx: a pointer to g2d_context structure.
+ */
+int g2d_exec2(struct g2d_context *ctx, unsigned int flags)
+{
+	struct drm_exynos_g2d_exec exec = {0};
 	int ret;
 
 	if (ctx->cmdlist_nr == 0)
 		return -EINVAL;
 
-	exec.async = 0;
+	if (flags & G2D_EXEC_FLAG_ASYNC)
+		exec.async = 1;
 
 	ret = drmIoctl(ctx->fd, DRM_IOCTL_EXYNOS_G2D_EXEC, &exec);
 	if (ret < 0) {
diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index 421249d..8f9ba23 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -187,6 +187,11 @@ enum e_g2d_acoeff_mode {
 	G2D_ACOEFF_MODE_MASK
 };
 
+enum e_g2d_exec_flag {
+	G2D_EXEC_FLAG_NORMAL = (0 << 0),
+	G2D_EXEC_FLAG_ASYNC = (1 << 0)
+};
+
 union g2d_point_val {
 	unsigned int val;
 	struct {
@@ -305,6 +310,7 @@ struct g2d_context *g2d_init(int fd);
 void g2d_fini(struct g2d_context *ctx);
 void g2d_config_event(struct g2d_context *ctx, void *userdata);
 int g2d_exec(struct g2d_context *ctx);
+int g2d_exec2(struct g2d_context *ctx, unsigned int flags);
 int g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 			unsigned int x, unsigned int y, unsigned int w,
 			unsigned int h);
-- 
2.0.5
