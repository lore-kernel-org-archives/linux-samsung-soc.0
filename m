From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 3/4] drm/exynos: mixer: simplify loop in vp_win_reset()
Date: Thu, 22 Sep 2016 16:57:19 +0200
Message-ID: <1474556240-14055-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1474556240-14055-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55138 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756829AbcIVO7T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Sep 2016 10:59:19 -0400
In-Reply-To: <1474556240-14055-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, a.hajda@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

A simple while loop should do the same here.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index c3dad66..4f39d6b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -736,10 +736,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 static void vp_win_reset(struct mixer_context *ctx)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
-	int tries = 100;
+	unsigned int tries = 100;
 
 	vp_reg_write(res, VP_SRESET, VP_SRESET_PROCESSING);
-	for (tries = 100; tries; --tries) {
+	while (tries--) {
 		/* waiting until VP_SRESET_PROCESSING is 0 */
 		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
 			break;
-- 
2.7.3
