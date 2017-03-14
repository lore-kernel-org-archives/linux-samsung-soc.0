From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/5] drm/exynos/decon5433: fix software trigger mask
Date: Tue, 14 Mar 2017 09:28:00 +0100
Message-ID: <1489480080-25633-6-git-send-email-a.hajda@samsung.com>
References: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
 <CGME20170314082812eucas1p2c56602a1f88814a4b0f5e4a7ee74b6ed@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59659 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751017AbdCNI2Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 04:28:16 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMS00DYUQ71SS50@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Mar 2017 08:28:14 +0000 (GMT)
In-reply-to: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

The patch fixes copy/paste bug introduced during code refactoring.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: b93c2e8b5d9d ("drm/exynos/decon5433: configure sysreg in case of hardware trigger")Fixes:
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index a43d0fa..c0e8d33 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -172,8 +172,8 @@ static void decon_setup_trigger(struct decon_context *ctx)
 		return;
 
 	if (!(ctx->out_type & I80_HW_TRG)) {
-		writel(TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
-		       | TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN,
+		writel(TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
+		       TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN,
 		       ctx->addr + DECON_TRIGCON);
 		return;
 	}
-- 
2.7.4
