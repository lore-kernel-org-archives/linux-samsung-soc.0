From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4 3/9] exynos/fimg2d: add g2d_config_event
Date: Wed, 13 May 2015 19:34:47 +0200
Message-ID: <1431538493-11431-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55324 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934458AbbEMRfV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 13:35:21 -0400
In-Reply-To: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This enables us to pass command buffers to the kernel which
trigger an event on the DRM fd upon completion.
The final goal is to enable asynchronous operation of the
G2D engine, similar to async page flips.

Passing the event userdata pointer through the G2D context
was chosen to not change the current API (e.g. by adding
a userdata argument to each public functions).

v2: Add g2d_config_event() to Exynos symbol test.
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos-symbol-check |  1 +
 exynos/exynos_fimg2d.c     | 27 +++++++++++++++++++++++++--
 exynos/exynos_fimg2d.h     |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/exynos/exynos-symbol-check b/exynos/exynos-symbol-check
index c3ddbe4..bb12315 100755
--- a/exynos/exynos-symbol-check
+++ b/exynos/exynos-symbol-check
@@ -27,6 +27,7 @@ g2d_blend
 g2d_copy
 g2d_copy_with_scale
 g2d_exec
+g2d_config_event
 g2d_fini
 g2d_init
 g2d_scale_and_blend
diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 86ae898..3a5f20a 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -202,8 +202,15 @@ static int g2d_flush(struct g2d_context *ctx)
 	cmdlist.cmd_buf = (uint64_t)(uintptr_t)&ctx->cmd_buf[0];
 	cmdlist.cmd_nr = ctx->cmd_nr;
 	cmdlist.cmd_buf_nr = ctx->cmd_buf_nr;
-	cmdlist.event_type = G2D_EVENT_NOT;
-	cmdlist.user_data = 0;
+
+	if (ctx->event_userdata) {
+		cmdlist.event_type = G2D_EVENT_NONSTOP;
+		cmdlist.user_data = (uint64_t)(uintptr_t)(ctx->event_userdata);
+		ctx->event_userdata = NULL;
+	} else {
+		cmdlist.event_type = G2D_EVENT_NOT;
+		cmdlist.user_data = 0;
+	}
 
 	ctx->cmd_nr = 0;
 	ctx->cmd_buf_nr = 0;
@@ -259,6 +266,22 @@ void g2d_fini(struct g2d_context *ctx)
 }
 
 /**
+ * g2d_config_event - setup userdata configuration for a g2d event.
+ *		The next invocation of a g2d call (e.g. g2d_solid_fill) is
+ *		then going to flag the command buffer as 'nonstop'.
+ *		Completion of the command buffer execution can then be
+ *		determined by using drmHandleEvent on the DRM fd.
+ *		The userdata is 'consumed' in the process.
+ *
+ * @ctx: a pointer to g2d_context structure.
+ * @userdata: a pointer to the user data
+ */
+void g2d_config_event(struct g2d_context *ctx, void *userdata)
+{
+	ctx->event_userdata = userdata;
+}
+
+/**
  * g2d_exec - start the dma to process all commands summited by g2d_flush().
  *
  * @ctx: a pointer to g2d_context structure.
diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index 9db0c88..421249d 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -298,10 +298,12 @@ struct g2d_context {
 	unsigned int			cmd_nr;
 	unsigned int			cmd_buf_nr;
 	unsigned int			cmdlist_nr;
+	void				*event_userdata;
 };
 
 struct g2d_context *g2d_init(int fd);
 void g2d_fini(struct g2d_context *ctx);
+void g2d_config_event(struct g2d_context *ctx, void *userdata);
 int g2d_exec(struct g2d_context *ctx);
 int g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 			unsigned int x, unsigned int y, unsigned int w,
-- 
2.0.5
