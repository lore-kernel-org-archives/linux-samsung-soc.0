From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 17/17] exynos: fimg2d: whitespace fix in g2d_flush
Date: Tue, 24 Feb 2015 16:29:39 +0100
Message-ID: <1424791779-12016-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424791779-12016-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:48121 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752401AbbBXPaj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 10:30:39 -0500
In-Reply-To: <1424791779-12016-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 669fd5c..bde5df2 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -190,7 +190,7 @@ static int g2d_flush(struct g2d_context *ctx)
 	int ret;
 	struct drm_exynos_g2d_set_cmdlist cmdlist = {0};
 
-	if (ctx->cmd_nr  == 0 && ctx->cmd_buf_nr == 0)
+	if (ctx->cmd_nr == 0 && ctx->cmd_buf_nr == 0)
 		return -1;
 
 	if (ctx->cmdlist_nr >= G2D_MAX_CMD_LIST_NR) {
-- 
2.0.5
