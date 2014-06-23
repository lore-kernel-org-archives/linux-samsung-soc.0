From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/5 v2] drm/exynos: allow mulitple layer updates per vsync for
 mixer
Date: Mon, 23 Jun 2014 11:02:23 +0530
Message-ID: <1403501545-16482-4-git-send-email-rahul.sharma@samsung.com>
References: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42839 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751166AbaFWFd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 01:33:28 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7L00KG5WRREOD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jun 2014 14:33:27 +0900 (KST)
In-reply-to: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
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
