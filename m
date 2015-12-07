From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: decon: remove unused variables
Date: Mon, 07 Dec 2015 21:55:39 +0900
Message-ID: <1449492939-20120-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36682 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753586AbbLGMzm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 07:55:42 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYZ01W04NWTHZ10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Dec 2015 21:55:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch just removes unused variables, i and ret.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index edfd6e3..2ac1d4d 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -377,8 +377,6 @@ static void decon_swreset(struct decon_context *ctx)
 static void decon_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	int ret;
-	int i;
 
 	if (!test_and_clear_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
-- 
1.9.1
