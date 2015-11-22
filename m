From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 12/13] exynos/fimg2d: add g2d_reset() to public API
Date: Sun, 22 Nov 2015 19:48:42 +0100
Message-ID: <1448218123-21292-13-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45824 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752136AbbKVSzM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 13:55:12 -0500
In-Reply-To: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, inki.dae@samsung.com, human.hwang@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

After the rewrite of the command buffer submission
handling g2d_reset() is no longer called internally.

Still the user might want to reset the G2D
context so expose this call.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos-symbol-check |  1 +
 exynos/exynos_fimg2d.c     | 28 ++++++++++++++--------------
 exynos/exynos_fimg2d.h     |  1 +
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/exynos/exynos-symbol-check b/exynos/exynos-symbol-check
index 2e4ba56..57dd684 100755
--- a/exynos/exynos-symbol-check
+++ b/exynos/exynos-symbol-check
@@ -32,6 +32,7 @@ g2d_exec2
 g2d_config_event
 g2d_fini
 g2d_init
+g2d_reset
 g2d_scale_and_blend
 g2d_solid_fill
 EOF
diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 25426a2..2def209 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -255,20 +255,6 @@ static void g2d_set_direction(struct g2d_context *ctx,
 }
 
 /*
- * g2d_reset - reset fimg2d hardware.
- *
- * @ctx: a pointer to g2d_context structure.
- *
- */
-static void g2d_reset(struct g2d_context *ctx)
-{
-	ctx->cmd_nr = 0;
-	ctx->cmd_buf_nr = 0;
-
-	g2d_add_cmd(ctx, SOFT_RESET_REG, 0x01);
-}
-
-/*
  * g2d_flush - submit all commands and values in user side command buffer
  *		to command queue aware of fimg2d dma.
  *
@@ -356,6 +342,20 @@ void g2d_fini(struct g2d_context *ctx)
 	free(ctx);
 }
 
+/*
+ * g2d_reset - reset fimg2d hardware.
+ *
+ * @ctx: a pointer to g2d_context structure.
+ *
+ */
+void g2d_reset(struct g2d_context *ctx)
+{
+	ctx->cmd_nr = 0;
+	ctx->cmd_buf_nr = 0;
+
+	g2d_add_cmd(ctx, SOFT_RESET_REG, 0x01);
+}
+
 /**
  * g2d_config_event - setup userdata configuration for a g2d event.
  *		The next invocation of a g2d call (e.g. g2d_solid_fill) is
diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index 2700686..03391c1 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -333,6 +333,7 @@ struct g2d_context;
 
 struct g2d_context *g2d_init(int fd);
 void g2d_fini(struct g2d_context *ctx);
+void g2d_reset(struct g2d_context *ctx);
 void g2d_config_event(struct g2d_context *ctx, void *userdata);
 int g2d_exec(struct g2d_context *ctx);
 int g2d_exec2(struct g2d_context *ctx, unsigned int flags);
-- 
2.4.9
