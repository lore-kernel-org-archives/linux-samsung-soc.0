From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/5] drm/exynos: allow mulitple layer updates per vsync for
 mixer
Date: Wed, 18 Jun 2014 17:04:51 +0530
Message-ID: <1403091293-15058-4-git-send-email-rahul.sharma@samsung.com>
References: <1403091293-15058-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31371 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933617AbaFRLiE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 07:38:04 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7D00DUM4BE8G70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jun 2014 20:38:02 +0900 (KST)
In-reply-to: <1403091293-15058-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Allowing only one layer update per vsync can cause issues
while there are update available for both layers. There is
a good amount of possibility to loose updates if we allow
single update per vsync.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index d359501..6773b03 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -511,13 +511,8 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 static void mixer_layer_update(struct mixer_context *ctx)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
-	u32 val;
-
-	val = mixer_reg_read(res, MXR_CFG);
 
-	/* allow one update per vsync only */
-	if (!(val & MXR_CFG_LAYER_UPDATE_COUNT_MASK))
-		mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
+	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
 }
 
 static void mixer_graph_buffer(struct mixer_context *ctx, int win)
-- 
1.7.9.5
