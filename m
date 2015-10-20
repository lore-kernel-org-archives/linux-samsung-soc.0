From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 08/10] drm/exynos/decon5433: remove duplicated initialization
Date: Tue, 20 Oct 2015 11:22:39 +0200
Message-ID: <1445332961-25419-9-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38215 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751657AbbJTJXb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 05:23:31 -0400
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

Field .commit is already initialized few lines above.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 265a77f..3c9aa4e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -448,7 +448,6 @@ static struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.commit			= decon_commit,
 	.enable_vblank		= decon_enable_vblank,
 	.disable_vblank		= decon_disable_vblank,
-	.commit			= decon_commit,
 	.atomic_begin		= decon_atomic_begin,
 	.update_plane		= decon_update_plane,
 	.disable_plane		= decon_disable_plane,
-- 
1.9.1
