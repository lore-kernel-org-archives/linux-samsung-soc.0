From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: vidi: remove unused varables
Date: Wed, 03 Jun 2015 11:29:13 +0900
Message-ID: <1433298553-930-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57019 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654AbbFCC3Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 22:29:16 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPC01OKBK8PWQ00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Jun 2015 11:29:13 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch removes unnsed varables in vidi_disable function.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index abe4ee0..16dc68c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -179,8 +179,6 @@ static void vidi_enable(struct exynos_drm_crtc *crtc)
 static void vidi_disable(struct exynos_drm_crtc *crtc)
 {
 	struct vidi_context *ctx = crtc->ctx;
-	struct exynos_drm_plane *plane;
-	int i;
 
 	mutex_lock(&ctx->lock);
 
-- 
1.7.9.5
