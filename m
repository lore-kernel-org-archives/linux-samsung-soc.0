From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: vidi: fix build warning
Date: Wed, 08 Oct 2014 00:18:34 +0900
Message-ID: <1412695114-1883-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50066 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753478AbaJGPSh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 11:18:37 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ND200L6OYIZ4KD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Oct 2014 00:18:35 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

encoder object isn't used anymore so remove it.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 9395e85..50faf91 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -630,7 +630,6 @@ static int vidi_remove(struct platform_device *pdev)
 {
 	struct exynos_drm_manager *mgr = platform_get_drvdata(pdev);
 	struct vidi_context *ctx = mgr->ctx;
-	struct drm_encoder *encoder = ctx->encoder;
 
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
-- 
1.7.9.5
