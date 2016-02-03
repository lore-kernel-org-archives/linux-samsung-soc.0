From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 09/10] drm/exynos: exynos5433_decon: fix wrong state assignment
 in decon_enable
Date: Wed, 03 Feb 2016 13:42:53 +0100
Message-ID: <1454503374-16382-10-git-send-email-m.szyprowski@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38159 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933682AbcBCMnU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Feb 2016 07:43:20 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1Z003IL2026O90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Feb 2016 12:43:14 +0000 (GMT)
In-reply-to: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Patch ebf3fd403b79ba6561bd1a4bb5a7cacc99da08e5 ("drm/exynos: add
pm_runtime to DECON 5433") removed some code from decon_enable()
function, but it left set_bit(BIT_SUSPENDED, &ctx->flags) call, which
was earlier called only in error path. This patch removes it, what
finally lets driver to go out of suspended state.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1bf6a21..c793316 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -402,8 +402,6 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 		decon_enable_vblank(ctx->crtc);
 
 	decon_commit(ctx->crtc);
-
-	set_bit(BIT_SUSPENDED, &ctx->flags);
 }
 
 static void decon_disable(struct exynos_drm_crtc *crtc)
-- 
1.9.2
