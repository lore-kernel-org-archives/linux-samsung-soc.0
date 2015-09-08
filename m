From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 7/9] exynos/fimg2d: make g2d_add_cmd() less heavy
Date: Tue,  8 Sep 2015 17:22:32 +0200
Message-ID: <1441725754-27555-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34646 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754430AbbIHPYN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 11:24:13 -0400
In-Reply-To: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The function currently checks for each added command
if an overflow of the corresponding command buffers
occurs, but none of the callers ever checks the
return value.

Since all callers are now converted to use
g2d_check_space() simplify the function.

(1) The overflow checks become asserts, so they're only
    active for debug builds. This is fine since
    g2d_add_cmd() is not part of the public API.

(2) Switch the return value to void.

(3) Explicitly state that the caller has to check
    buffer space before calling g2d_add_cmd().

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index fbc77a3..5873fe7 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -18,6 +18,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <errno.h>
+#include <assert.h>
 
 #include <sys/mman.h>
 #include <linux/stddef.h>
@@ -172,8 +173,11 @@ static int g2d_validate_blending_op(
  * @ctx: a pointer to g2d_context structure.
  * @cmd: command data.
  * @value: value data.
+ *
+ * The caller has to make sure that the commands buffers have enough space
+ * left to hold the command. Use g2d_check_space() to ensure this.
  */
-static int g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
+static void g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
 			unsigned long value)
 {
 	switch (cmd & ~(G2D_BUF_USERPTR)) {
@@ -183,28 +187,20 @@ static int g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
 	case DST_PLANE2_BASE_ADDR_REG:
 	case PAT_BASE_ADDR_REG:
 	case MASK_BASE_ADDR_REG:
-		if (ctx->cmd_buf_nr >= G2D_MAX_GEM_CMD_NR) {
-			fprintf(stderr, "Overflow cmd_gem size.\n");
-			return -EINVAL;
-		}
+		assert(ctx->cmd_buf_nr < G2D_MAX_GEM_CMD_NR);
 
 		ctx->cmd_buf[ctx->cmd_buf_nr].offset = cmd;
 		ctx->cmd_buf[ctx->cmd_buf_nr].data = value;
 		ctx->cmd_buf_nr++;
 		break;
 	default:
-		if (ctx->cmd_nr >= G2D_MAX_CMD_NR) {
-			fprintf(stderr, "Overflow cmd size.\n");
-			return -EINVAL;
-		}
+		assert(ctx->cmd_nr < G2D_MAX_CMD_NR);
 
 		ctx->cmd[ctx->cmd_nr].offset = cmd;
 		ctx->cmd[ctx->cmd_nr].data = value;
 		ctx->cmd_nr++;
 		break;
 	}
-
-	return 0;
 }
 
 /*
-- 
2.0.5
