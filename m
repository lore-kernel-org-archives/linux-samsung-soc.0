From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 01/14] exynos/fimg2d: fix empty buffer handling in g2d_flush()
Date: Mon, 24 Aug 2015 16:13:56 +0200
Message-ID: <1440425649-9768-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50063 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754332AbbHXOO2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:14:28 -0400
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Empty command buffers are no error, we just don't have
anything to do for flushing then.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 24a06d0..4a88e0c 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -191,7 +191,7 @@ static int g2d_flush(struct g2d_context *ctx)
 	struct drm_exynos_g2d_set_cmdlist cmdlist = {0};
 
 	if (ctx->cmd_nr == 0 && ctx->cmd_buf_nr == 0)
-		return -1;
+		return 0;
 
 	if (ctx->cmdlist_nr >= G2D_MAX_CMD_LIST_NR) {
 		fprintf(stderr, "Overflow cmdlist.\n");
-- 
2.0.5
