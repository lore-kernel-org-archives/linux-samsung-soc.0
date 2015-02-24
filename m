From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 12/17] exynos: fimg2d: remove TRUE/FALSE from header
Date: Tue, 24 Feb 2015 15:20:50 +0100
Message-ID: <1424787655-10739-13-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47980 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751407AbbBXO12 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:27:28 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The fimg2d header was defining TRUE and FALSE, but actually
these defines are just used once. Remove them, since they
don't make the code better readable/understandable.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 4 ++--
 exynos/exynos_fimg2d.h | 7 -------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index c37670c..974ee64 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -135,7 +135,7 @@ static int g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
 		break;
 	}
 
-	return TRUE;
+	return 0;
 }
 
 /*
@@ -187,7 +187,7 @@ static int g2d_flush(struct g2d_context *ctx)
 	struct drm_exynos_g2d_set_cmdlist cmdlist = {0};
 
 	if (ctx->cmd_nr  == 0 && ctx->cmd_buf_nr == 0)
-		return FALSE;
+		return -1;
 
 	if (ctx->cmdlist_nr >= G2D_MAX_CMD_LIST_NR) {
 		fprintf(stderr, "Overflow cmdlist.\n");
diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index bd116cf..dbcb764 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -13,13 +13,6 @@
 #ifndef _FIMG2D_H_
 #define _FIMG2D_H_
 
-#ifndef TRUE
-#define TRUE 0
-#endif
-#ifndef FALSE
-#define FALSE -1
-#endif
-
 #define G2D_MAX_CMD_NR		64
 #define G2D_MAX_GEM_CMD_NR	64
 #define G2D_MAX_CMD_LIST_NR	64
-- 
2.0.5
